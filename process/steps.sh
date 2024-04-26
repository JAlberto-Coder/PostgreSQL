# Permisos 
chmod +x task_dump.sh
bash ./task_dump.sh
chmod 600 ~/.pgpass

# En caso de aplicar, corregir saltos
sed -i 's/\r//g' task_dump.sh

# Descarga de posgresql 16
wget https://ftp.postgresql.org/pub/source/v16.2/postgresql-16.2.tar.gz

tar -xzf postgresql-16.2.tar.gz
cd postgresql-16.2

sudo apt-get install build-essential libreadline-dev zlib1g-dev

./configure --prefix=$HOME/postgresql
make
make install

echo "export PATH=\$HOME/postgresql/bin:\$PATH" >> $HOME/.bashrc
source $HOME/.bashrc

pg_dump --version


# Configuración en el crontab
crontab -e
0 19 * * * /ruta/task_dump.sh