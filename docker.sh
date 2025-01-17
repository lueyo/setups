#!/bin/bash

# Actualizar el índice de paquetes
sudo apt-get update

# Instalar paquetes necesarios
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Añadir la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Configurar el repositorio estable de Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar el índice de paquetes nuevamente
sudo apt-get update

# Instalar Docker Engine
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Verificar que Docker se haya instalado correctamente
sudo docker --version