-- ==================================================
-- 16-08-2022 | JAlberto-Coder | Esquemas utiles para segmentación de BD
-- ==================================================
CREATE SCHEMA IF NOT EXISTS cat; -- Para catálogos
CREATE SCHEMA IF NOT EXISTS cfg; -- Para configuraciones
CREATE SCHEMA IF NOT EXISTS hco; -- Para historicos
CREATE SCHEMA IF NOT EXISTS tmp; -- Para temporales
CREATE SCHEMA IF NOT EXISTS sis; -- Para sistema
-- Se recomienda el uso del esquema public, para tablas que utilicen el negocio
-- ==================================================
-- Consulta de los esquema
-- ==================================================
SELECT *
FROM information_schema.schemata ;