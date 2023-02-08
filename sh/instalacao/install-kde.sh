#!/bin/bash

# Atualiza o repositório
sudo apt update

# Instala o gerenciador de pacotes aptitude
sudo apt install aptitude

# Instala o KDE
sudo aptitude install kde-plasma-desktop

# Configura o gerenciador de inicialização para inicializar o KDE
sudo update-alternatives --config x-session-manager
