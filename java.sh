#!/bin/bash

# Actualizar la lista de paquetes
sudo apt update

# Instalar dependencias necesarias
sudo apt install -y wget apt-transport-https gnupg

# Agregar el repositorio de AdoptOpenJDK
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/

# Actualizar la lista de paquetes nuevamente
sudo apt update

# Instalar JDK 21
sudo apt install -y adoptopenjdk-21-hotspot

# Verificar la instalación de JDK
java -version

# Instalar Maven
sudo apt install -y maven

# Verificar la instalación de Maven
mvn -version

echo "Instalación completada: JDK 21 y Maven están instalados."