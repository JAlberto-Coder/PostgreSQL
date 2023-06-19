-- ========================================
-- Versión: 1.0
-- ========================================
-- 16-06-2023 | JAlberto-Coder
-- ========================================
DO $$
DECLARE
	v_usuario VARCHAR(60);    
	r_schema RECORD;
    r_table RECORD;
    r_sequence RECORD;
    r_routine RECORD;
BEGIN
    FOR v_usuario IN SELECT unnest(
        ARRAY['usrasuarez',
              'usraislas',
              'usrdlugo',
              'usrkcolin',
              'usrlaguilar',
              'usrmhernandez',
              'usrogarcia',
              'usrrrodolfo',
              'usrsgomez']
    )
    LOOP
        EXECUTE 'REVOKE ALL PRIVILEGES ON DATABASE ebdimobile FROM ' || v_usuario || ';'; 
        -- Revocar todos los privilegios en las tablas de la base de datos	
        FOR r_schema IN (SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT LIKE 'pg_%' AND schema_name != 'information_schema')
        LOOP
            EXECUTE 'REVOKE ALL PRIVILEGES ON SCHEMA ' || quote_ident(r_schema.schema_name) || ' FROM ' || v_usuario || ';';
        END LOOP;
       
        FOR r_table IN (SELECT table_schema, table_name FROM information_schema.tables WHERE table_schema NOT LIKE 'pg_%' AND table_schema != 'information_schema')
        LOOP
            EXECUTE 'REVOKE ALL PRIVILEGES ON TABLE ' || quote_ident(r_table.table_schema) || '.' || quote_ident(r_table.table_name) || ' FROM ' || v_usuario || ';';
        END LOOP;
       
        -- Revocar todos los privilegios en las secuencias de la base de datos
        FOR r_sequence IN (SELECT sequence_schema, sequence_name FROM information_schema.sequences WHERE sequence_schema NOT LIKE 'pg_%' AND sequence_schema != 'information_schema')
        LOOP
            EXECUTE 'REVOKE ALL PRIVILEGES ON SEQUENCE ' || quote_ident(r_sequence.sequence_schema) || '.' || quote_ident(r_sequence.sequence_name) || ' FROM ' || v_usuario || ';';
        END LOOP;
       
        FOR r_routine IN (SELECT routine_schema, routine_name FROM information_schema.routines WHERE routine_schema NOT LIKE 'pg_%' AND routine_schema != 'information_schema')
        LOOP
            EXECUTE 'REVOKE ALL PRIVILEGES ON FUNCTION ' || quote_ident(r_routine.routine_schema) || '.' || quote_ident(r_routine.routine_name) || ' FROM ' || v_usuario || ';';
        END LOOP;
    END LOOP;
END
$$;
