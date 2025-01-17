#!/bin/bash

# Actualizar los paquetes
sudo apt-get update

# Instalar MySQL server y client
sudo apt-get install -y mysql-server mysql-client

# Iniciar el servicio de MySQL
sudo systemctl start mysql

# Asegurarse de que el servicio de MySQL se inicie al arrancar
sudo systemctl enable mysql

# Crear el usuario y otorgarle todos los privilegios
sudo mysql -e "CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost' WITH GRANT OPTION;"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "MySQL client y server instalados, usuario 'user' creado con todos los privilegios."