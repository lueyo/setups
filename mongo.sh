#!/bin/bash

# Variables
MONGO_VERSION="5.0.6"
MONGO_TAR="mongodb-linux-x86_64-ubuntu2004-$MONGO_VERSION.tgz"
MONGO_URL="https://fastdl.mongodb.org/linux/$MONGO_TAR"
INSTALL_DIR="/usr/local/mongodb"
DATA_DIR="/var/lib/mongo"
LOG_DIR="/var/log/mongodb"
SERVICE_FILE="/etc/systemd/system/mongodb.service"

# Descargar MongoDB
echo "Descargando MongoDB..."
wget $MONGO_URL -O /tmp/$MONGO_TAR

# Extraer MongoDB
echo "Extrayendo MongoDB..."
tar -zxvf /tmp/$MONGO_TAR -C /tmp

# Mover MongoDB a la carpeta de instalación
echo "Instalando MongoDB..."
sudo mkdir -p $INSTALL_DIR
sudo mv /tmp/mongodb-linux-x86_64-ubuntu2004-$MONGO_VERSION/* $INSTALL_DIR

# Crear directorios de datos y logs
echo "Creando directorios de datos y logs..."
sudo mkdir -p $DATA_DIR
sudo mkdir -p $LOG_DIR
sudo chown -R `whoami` $DATA_DIR
sudo chown -R `whoami` $LOG_DIR

# Crear archivo de servicio para systemd
echo "Creando archivo de servicio para systemd..."
sudo bash -c "cat > $SERVICE_FILE <<EOF
[Unit]
Description=MongoDB Database Server
Documentation=https://docs.mongodb.org/manual
After=network.target

[Service]
User=`whoami`
ExecStart=$INSTALL_DIR/bin/mongod --dbpath $DATA_DIR --logpath $LOG_DIR/mongod.log --fork
ExecReload=/bin/kill -HUP \$MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF"

# Recargar systemd y habilitar el servicio
echo "Habilitando y arrancando el servicio MongoDB..."
sudo systemctl daemon-reload
sudo systemctl enable mongodb
sudo systemctl start mongodb

echo "MongoDB instalado y configurado para iniciarse automáticamente."