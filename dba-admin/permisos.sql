-- ==================================================
-- 02-08-2022 | JAlberto-Coder | Instalación de PostgreSQL en Linux
-- ==================================================

-- PERMISOS PARA UN USUARIO
GRANT CONNECT ON DATABASE developer to usrdeveloper;
ALTER ROLE usrdeveloper SET search_path TO developer;
-- CONSIDERAR SI EXISTEN MÁS ESQUEMAS
GRANT USAGE ON SCHEMA public TO usrdeveloper;
GRANT ALL PRIVILEGES ON DATABASE developer TO usrdeveloper;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO usrdeveloper;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO usrdeveloper;
GRANT ALL ON ALL TABLES IN SCHEMA public TO usrdeveloper;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO usrdeveloper;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usrdeveloper;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO usrdeveloper;

-- PRIVILEGIOS AL ESQUEMA information_schema
GRANT USAGE ON SCHEMA information_schema TO usrdeveloper;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA information_schema TO usrdeveloper;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA information_schema TO usrdeveloper;
GRANT ALL ON ALL TABLES IN SCHEMA information_schema TO usrdeveloper;
GRANT SELECT ON ALL TABLES IN SCHEMA information_schema TO usrdeveloper;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA information_schema TO usrdeveloper;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA information_schema TO usrdeveloper;