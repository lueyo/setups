#!/bin/bash

# Verificar si el archivo package.json existe en el directorio actual
if [ -f "package.json" ]; then
  echo "package.json encontrado. Instalando express.js..."
  
  # Instalar express.js en la última versión sin el símbolo ^
  npm install express@latest --save-exact
else
  echo "No se encontró package.json en el directorio actual. Creando package.json..."
  
  # Crear package.json con -y
  npm init -y
  
  # Instalar express.js en la última versión sin el símbolo ^
  npm install express@latest --save-exact
  
  # Instalar nodemon como herramienta de desarrollo
  npm install nodemon --save-dev
fi