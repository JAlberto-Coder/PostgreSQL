# #############################################
# 02-08-2022 | JAlberto-Coder | Creación de un servidor vinculado
# #############################################

# Es necesario instalar la extensión
CREATE EXTENSION postgres_fdw;

# Se crea la vinculación
CREATE SERVER s_developers 
FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host 'localhost', dbname 'developers', port '5432');

# Se crea un mapeo de usuario para el servidor vinculado
CREATE USER MAPPING FOR usrdevelopers
SERVER s_developers 
OPTIONS (user 'usrdevelopers', password 'Qwerty123456$');