DO $$
DECLARE
    r RECORD;
    texto_a_buscar TEXT := 'Dsperdicio';
BEGIN
    FOR r IN (
        SELECT c.table_schema
        	, c.table_name
        	, c.column_name
        FROM information_schema.columns c
        JOIN information_schema.tables t 
        	ON t.table_schema = c.table_schema AND t.table_name = c.table_name
        WHERE t.table_type = 'BASE TABLE'
            AND c.data_type IN ('character varying', 'text') -- Limita la búsqueda a columnas de tipo texto
    )
    LOOP
		EXECUTE format('SELECT EXISTS(SELECT 1 FROM %I.%I WHERE %I::text ILIKE %L)', r.table_schema, r.table_name, r.column_name, texto_a_buscar) 
       	INTO strict found;
        
		IF found THEN
            RAISE NOTICE 'El texto "%s" fue encontrado en "%.%.%"', texto_a_buscar, r.table_schema, r.table_name, r.column_name;
        END IF;
    END LOOP;
END $$;