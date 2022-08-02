# #############################################
# 02-08-2022 | JAlberto-Coder | Generación de backup y respaldos
# #############################################

# Generación de backups
pg_dump -U usrdeveloper -W -Fc developers > developers_20222606.dump

# Restauración de bases de datos
pg_restore -C -d developers developers_20222606.dump
pg_restore -U usrdeveloper -d developers -v "developers_20222606.dump"