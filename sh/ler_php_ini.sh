#!/bin/bash

ler_php_ini() {
    if [ -z "$1" ]; then
        cat $(php --ini | grep Loaded | awk -F ' ' '{print $NF}')
    else
        cat $(php --ini | grep Loaded | awk -F ' ' '{print $NF}') | grep "$1"
    fi
}

ler_php_ini "$@"

# Utilizando  :
# Permissões (executar a primeira vez após criação do arquivo):
# chmod +x ler_php_ini.sh

# Exemplos de uso :
# sh ler_php_ini.sh -- busca todo o conteúdo do seu php.ini

# sh ler_php_ini.sh session -- ['usa um nome buscado para ser seu filtro ex : session, oci , gd'] ;
