# INSTALACIÓN POSTGRESQL

- Pasos siguientes

apt-get update
apt-get upgrade
apt-get install postgresql-14

- Ver servicios instalados de postgres
dpkg -l | grep postgresql

- Desinstalar postgres
dpkg -l | grep postgresql
sudo apt-get --purge remove (nombre servicio)

- revisión de servicio de postgresql si esta existente
sudo systemctl status postrgesql
sudo service postgresql stop

- Modificación de contraseña del usuario postgres

sudo -i -u postgres
psql
ALTER ROLE postgres PASSWORD 'ServiEmpleo123456$';
\q

- Creación de base de datos

CREATE DATABASE serviempleo;
CREATE DATABASE ecore;

- Creación de un usuario de base de datos para el uso de aplicaciones

CREATE USER usrserviempleo WITH PASSWORD 'Servi123$';
GRANT ALL PRIVILEGES ON DATABASE serviempleo TO usrserviempleo;
GRANT ALL PRIVILEGES ON DATABASE ecore TO usrserviempleo;

yum install -y postgresql10-contrib $

- Generación de backups

pg_dump -U usrserviempleo -W -Fc ecore > ecore_20222606.dump
pg_dump -U usrserviempleo -W -Fc serviempleo > serviempleo_20222606.dump

- Restauración de base de datos por comandos
pg_restore -C -d ecore ecore.dump
pg_restore -U postgres -d ecore -v "ecore_20222606.dump"
pg_restore -U postgres -d serviempleo -v "serviempleo_20222606.dump"

CREATE DATABASE ecore;

- EXTENSIONES

# Sentencia para implementar uuid_generate_v4();
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

# Buqueda difusa
CREATE EXTENSION pg_trgm;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE SCHEMA sis;

# Linked
CREATE EXTENSION postgres_fdw;

CREATE SERVER ecoreserver 
FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host 'localhost', dbname 'ecore', port '5432');

CREATE USER MAPPING FOR usrserviempleo
SERVER ecoreserver 
OPTIONS (user 'usrserviempleo', password 'Qwerty123456$');

# Para tipos de datos jerarquicos
CREATE EXTENSION ltree;

usrgestiona
EngineCore12345$

# Otorgación de permisos a usuarios
CREATE ROLE usryuhu WITH LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT NOREPLICATION CONNECTION LIMIT -1; 
ALTER USER usryuhu WITH PASSWORD '23V$OYlb7xu9B5!2S';
GRANT CONNECT ON DATABASE yuhu to usryuhu;
GRANT USAGE ON SCHEMA public TO usryuhu;
ALTER ROLE usryuhu SET search_path TO public;
GRANT ALL ON ALL TABLES IN SCHEMA public TO usryuhu;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO usryuhu;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usryuhu;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO usryuhu;

# Generación de respaldos
pg_dump -U usrserviempleo -W -Fc yuhu > yuhu_20220930.dump

Autentificarse:
postgres
psql -U postgres

CREATE DATABASE yuhu;

\q

pg_restore -U usrgestiona -d yuhu -v "yuhu_2022091.dump"

aws_prod
