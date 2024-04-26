#!/bin/bash

# Configuración de variables
HOST="10.168.100.8"
PORT="8885"
USERNAME="dbaalbert"
FORMAT="d"
NO_PRIVILEGES="--no-privileges"
SCHEMA_NAME="public"
DATE=$(date +%Y%m%d%H%M) 

DATABASE_NAME="developers"
OUTPUT_DIR="/home/dba/dumps/${DATABASE_NAME}"
OUTPUT_FILE="${OUTPUT_DIR}/dump-${DATABASE_NAME}-${DATE}"
# Crear el directorio si no existe
mkdir -p ${OUTPUT_DIR}
# Comando pg_dump
pg_dump --verbose --host=${HOST} --port=${PORT} --username=${USERNAME} --format=${FORMAT} ${NO_PRIVILEGES} --file=${OUTPUT_FILE} -n "${SCHEMA_NAME}" ${DATABASE_NAME}

echo "Backup completed successfully."
