# Descargar el paquete .deb más reciente de Visual Studio Code
wget -qO- https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb

# Instalar el paquete .deb
sudo apt install ./vscode.deb

# Eliminar el archivo .deb descargado
rm vscode.deb