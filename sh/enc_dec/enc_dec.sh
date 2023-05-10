#!/bin/bash

# Verifica se a biblioteca OpenSSL está instalada
#if ! command -v openssl &> /dev/null
#then
#    echo "A biblioteca OpenSSL não está instalada. Por favor, instale-a antes de usar este script."
#    exit
#fi

# Parâmetros
string=$1
salt=$2
codificar_decodificar=$3

# Codificar / Decodificar
if [ "$codificar_decodificar" = "codificar" ]; then
  echo $string | openssl enc -aes-256-cbc -a -salt -pbkdf2 -pass pass:$salt
elif [ "$codificar_decodificar" = "decodificar" ]; then
  echo $string | openssl enc -aes-256-cbc -a -d -salt -pbkdf2 -pass pass:$salt
else
  echo "Parâmetro inválido. Use 'codificar' ou 'decodificar'."
fi
