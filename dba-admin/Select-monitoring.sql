-- ============================================
-- Versión: 1.0
-- ============================================
-- 02-05-2023 | JAlberto-Coder | Monitorear la BD
-- ============================================
SELECT *
FROM pg_stat_activity;

SELECT *
FROM pg_stat_database;

SELECT pg_terminate_backend(pid);