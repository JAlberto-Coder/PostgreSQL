# #############################################
# 02-08-2022 | JAlberto-Coder | Instalación de PostgreSQL en Linux
# #############################################

# Pasos siguientes
apt-get update
apt-get upgrade
apt-get install postgresql

# Ver servicios instalados de postgres
dpkg -l | grep postgresql

# Desinstalar postgres
dpkg -l | grep postgresql
sudo apt-get --purge remove #(nombre servicio)

# revisión de servicio de postgresql si esta existente
sudo systemctl status postrgesql
sudo service postgresql stop

# Modificación de contraseña del usuario postgres
sudo -i -u postgres
psql
ALTER ROLE postgres PASSWORD 'Qwerty123456$';

# Creación de base de datos
CREATE DATABASE developers;

# Creación de un esquema
CREATE SCHEMA sis;

# Creación de un usuario de base de datos para el uso de aplicaciones
CREATE USER usraplicaciones WITH PASSWORD 'Qwerty123456$';
GRANT ALL PRIVILEGES ON DATABASE developers TO usraplicaciones;

\q

# EXTENSIONES
# Sentencia para implementar uuid_generate_v4();
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
# Buqueda difusa
CREATE EXTENSION pg_trgm;