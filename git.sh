#!/bin/bash

# Actualizar la lista de paquetes
sudo apt update

# Instalar Git
sudo apt install -y git

# Descargar el archivo .gitconfig
curl -o ~/.gitconfig https://raw.githubusercontent.com/lueyo/dotfiles/refs/heads/main/.gitconfig

echo "Git ha sido instalado y el archivo .gitconfig ha sido configurado."