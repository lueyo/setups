#!/bin/bash

# comprueba si estas en un directorio con un package.json y luego instala boostrap con npm en su ultima version con popper y jquery

if [ -f package.json ]; then
  npm install bootstrap@latest popper.js jquery
else
  echo "No se encontro un package.json"
fi

