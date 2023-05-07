#!/bin/bash

# Verifica se o número de parâmetros é válido
if [ $# -ne 3 ]; then
  echo "Informe o arquivo e o texto "
  exit 1
fi

# Atribui os parâmetros a variáveis
arquivo=$1
texto=$2
comentario=$3

# Verifica se o arquivo e o texto foram informados
if [ -z "$arquivo" ]; then
  echo "Informe o arquivo"
  exit 1
fi

if [ -z "$texto" ]; then
  echo "Informe o texto"
  exit 1
fi

# Escreve o comentário e o texto no arquivo
echo "#$comentario" >> $arquivo
echo "$texto" >> $arquivo
