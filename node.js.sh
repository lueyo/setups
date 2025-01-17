#!/bin/bash

# Instalar fnm (Fast Node Manager)
curl -fsSL https://fnm.vercel.app/install | bash

# Agregar fnm al PATH
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env)"

# Instalar la última versión LTS de Node.js
fnm install --lts

# Usar la versión LTS instalada
fnm use --lts

# Verificar la instalación
node -v
npm -v