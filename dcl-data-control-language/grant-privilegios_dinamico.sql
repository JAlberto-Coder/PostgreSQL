-- ========================================
-- Versión: 1.0
-- ========================================
-- 16-06-2023 | JAlberto-Coder
-- ========================================
DO $$
DECLARE 
	v_usuario TEXT;
	v_base_dato TEXT;
	v_esquema TEXT;
BEGIN
	FOR v_usuario IN SELECT unnest(ARRAY['user_developer'])
	LOOP
		FOR v_base_dato IN SELECT unnest(ARRAY['developers'])
		LOOP
			FOR v_esquema IN SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT LIKE 'pg%' AND schema_name NOT LIKE 'information_schema'
			LOOP
				RAISE NOTICE 'Usuario: % | Base: % | Esquema: %', v_usuario, v_base_dato, v_esquema;
				EXECUTE format('GRANT ALL PRIVILEGES ON DATABASE %I TO %I', v_base_dato, v_usuario);
				EXECUTE format('GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA %I TO %I', v_esquema, v_usuario);
				EXECUTE format('GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA %I TO %I', v_esquema, v_usuario);
				EXECUTE format('GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA %I TO %I', v_esquema, v_usuario);
				EXECUTE format('GRANT USAGE ON SCHEMA %I TO %I', v_esquema, v_usuario);
			END LOOP;
		END LOOP;
	END LOOP;
END;
$$ LANGUAGE plpgsql;
