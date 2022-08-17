CREATE OR REPLACE PROCEDURE sis.usp_columnas_auditoria
(
	tabla_in character VARYING
	, esquema_in character varying DEFAULT 'public'::character VARYING
)
LANGUAGE plpgsql
AS $procedure$
-- ==================================================
-- 16-08-2022 | JAlberto-Coder | Creación de procedimiento para la generación de columnas de auditoria sobre una tabla
-- ==================================================
DECLARE
	v_tsentencia TEXT;
BEGIN
	
	tabla_in := LOWER(tabla_in);
	esquema_in := esquema_in;
	
	IF NOT EXISTS(SELECT * FROM information_schema.schemata WHERE LOWER(schema_name) = esquema_in LIMIT 1) THEN
		RAISE NOTICE 'El esquema %, no existe en la base de datos', esquema_in;
		RETURN;
	END IF;

	IF NOT EXISTS(SELECT * FROM information_schema."tables" WHERE LOWER(table_schema) = esquema_in AND LOWER(table_name) = tabla_in LIMIT 1) THEN
		RAISE NOTICE 'La tabla %, no existe en la base de datos', tabla_in;
		RETURN;
	END IF;
	
	IF NOT EXISTS(SELECT * FROM information_schema."columns" WHERE LOWER(table_schema) = esquema_in AND LOWER(table_name) = tabla_in AND LOWER(column_name) = 'fg' LIMIT 1) THEN
		v_tsentencia := 'ALTER TABLE ' || esquema_in || '.' || tabla_in || ' ADD fg TIMESTAMP NOT NULL DEFAULT(CURRENT_TIMESTAMP);'; 
		EXECUTE (v_tsentencia);
		v_tsentencia := 'COMMENT ON COLUMN ' || esquema_in || '.' || tabla_in || '.fg IS ''Fecha de inserción del registro;''';
		EXECUTE (v_tsentencia);
	END IF;

	IF NOT EXISTS(SELECT * FROM information_schema."columns" WHERE LOWER(table_schema) = esquema_in AND LOWER(table_name) = tabla_in AND LOWER(column_name) = 'ug' LIMIT 1) THEN
		v_tsentencia := 'ALTER TABLE ' || esquema_in || '.' || tabla_in || ' ADD ug VARCHAR(60) NOT NULL DEFAULT(''DEFAULT_USER'');'; 
		EXECUTE (v_tsentencia);
		v_tsentencia := 'COMMENT ON COLUMN ' || esquema_in || '.' || tabla_in || '.ug IS ''Cuenta de usuario que insertó el registro'';';
		EXECUTE (v_tsentencia);
	END IF;

	IF NOT EXISTS(SELECT * FROM information_schema."columns" WHERE LOWER(table_schema) = esquema_in AND LOWER(table_name) = tabla_in AND LOWER(column_name) = 'fm' LIMIT 1) THEN
		v_tsentencia := 'ALTER TABLE ' || esquema_in || '.' || tabla_in || ' ADD fm TIMESTAMP NULL;'; 
		EXECUTE (v_tsentencia);
		v_tsentencia := 'COMMENT ON COLUMN ' || esquema_in || '.' || tabla_in || '.fm IS ''Última fecha de modificación del registro'';';
		EXECUTE (v_tsentencia);
	END IF;

	IF NOT EXISTS(SELECT * FROM information_schema."columns" WHERE LOWER(table_schema) = esquema_in AND LOWER(table_name) = tabla_in AND LOWER(column_name) = 'um' LIMIT 1) THEN
		v_tsentencia := 'ALTER TABLE ' || esquema_in || '.' || tabla_in || ' ADD um VARCHAR(60) NULL;'; 
		EXECUTE (v_tsentencia);
		v_tsentencia := 'COMMENT ON COLUMN ' || esquema_in || '.' || tabla_in || '.um IS ''Cuenta de usuario que modifica el registro'';';
		EXECUTE (v_tsentencia);
	END IF;

	IF NOT EXISTS(SELECT * FROM information_schema."columns" WHERE LOWER(table_schema) = esquema_in AND LOWER(table_name) = tabla_in AND LOWER(column_name) = 'fb' LIMIT 1) THEN
		v_tsentencia := 'ALTER TABLE ' || esquema_in || '.' || tabla_in || ' ADD fb TIMESTAMP;'; 
		EXECUTE (v_tsentencia);
		v_tsentencia := 'COMMENT ON COLUMN ' || esquema_in || '.' || tabla_in || '.fb IS ''Fecha de baja del registro'';';
		EXECUTE (v_tsentencia);
	END IF;

	IF NOT EXISTS(SELECT * FROM information_schema."columns" WHERE LOWER(table_schema) = esquema_in AND LOWER(table_name) = tabla_in AND LOWER(column_name) = 'ub' LIMIT 1) THEN
		v_tsentencia := 'ALTER TABLE ' || esquema_in || '.' || tabla_in || ' ADD ub VARCHAR(60) NULL;'; 
		EXECUTE (v_tsentencia);
		v_tsentencia := 'COMMENT ON COLUMN ' || esquema_in || '.' || tabla_in || '.ub IS ''Cuenta de usuario que da de baja el registro'';';
		EXECUTE (v_tsentencia);
	END IF;

	IF NOT EXISTS(SELECT * FROM information_schema."columns" WHERE LOWER(table_schema) = esquema_in AND LOWER(table_name) = tabla_in AND LOWER(column_name) = 'st' LIMIT 1) THEN
		v_tsentencia := 'ALTER TABLE ' || esquema_in || '.' || tabla_in || ' ADD st BOOLEAN NOT NULL DEFAULT(true);'; 
		EXECUTE (v_tsentencia);
		v_tsentencia := 'COMMENT ON COLUMN ' || esquema_in || '.' || tabla_in || '.st IS ''Estatus del registro ( Activo = 1 , Inactivo = 0 )'';';
		EXECUTE (v_tsentencia);
	END IF;
		
END;
$procedure$
;
