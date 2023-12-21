#!/bin/bash

# Adicionar o repositório do VSCode Server
echo "deb [arch=amd64] http://packages.microsoft.com/repos/code/ stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# Importar a chave GPG do repositório
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Atualizar o cache de pacotes
sudo apt update

# Instalar o VSCode Server
sudo apt install code-server

# Instalar as dependências do projeto (por exemplo, Node.js)
### sudo apt install nodejs

# Outras dependências podem ser instaladas da mesma forma

