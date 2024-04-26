CREATE OR REPLACE PROCEDURE usp_dcl_developer_user(
    p_username TEXT,
    p_password TEXT,
    p_database TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Intenta crear el usuario, captura la excepción si el usuario ya existe
    BEGIN
        EXECUTE format('CREATE USER %I WITH PASSWORD %L', p_username, p_password);
        RAISE NOTICE 'Usuario % creado.', p_username;
    EXCEPTION WHEN duplicate_object THEN
        RAISE NOTICE 'El usuario % ya existe. No se creará de nuevo.', p_username;
    END;
    
    -- Conectar a la base de datos
    EXECUTE format('GRANT CONNECT ON DATABASE %I TO %I', p_database, p_username);
    
    -- Uso del esquema público
    EXECUTE format('GRANT USAGE ON SCHEMA public TO %I', p_username);
    
    -- Permisos sobre las tablas
    EXECUTE format('GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO %I', p_username);
   
    -- Establecer permisos por defecto para nuevas tablas
    EXECUTE format('ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO %I', p_username);
    
    -- Otorgar todos los privilegios en la base de datos
    EXECUTE format('GRANT ALL PRIVILEGES ON DATABASE %I TO %I', p_database, p_username);
    
    -- Otorgar todos los privilegios en todas las tablas del esquema público
    EXECUTE format('GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO %I', p_username);
    
    -- Otorgar todos los privilegios en todas las secuencias del esquema público
    EXECUTE format('GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO %I', p_username);
    
    -- Otorgar todos los privilegios en todas las funciones del esquema público
    EXECUTE format('GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO %I', p_username);

   	EXECUTE format('GRANT CREATE ON DATABASE %I TO %I', p_database, p_username);
	
    EXECUTE format('GRANT CREATE ON SCHEMA public TO %I', p_username);
    -- Notificación de operación completada
    RAISE NOTICE 'Permisos configurados correctamente para el usuario %.', p_username;
END;
$$;
