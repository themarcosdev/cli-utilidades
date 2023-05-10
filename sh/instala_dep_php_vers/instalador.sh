#!/bin/bash

# Lê o arquivo "extensoes-php-para-instalar.txt" e percorre sobre cada linha
while read extensao; do
  # Substitui "$versao" pelo número da versão atual do PHP (php -v)
  extensao=$(echo $extensao | sed "s/\$versao/$(php -v | grep -o -E 'PHP [0-9]+\.[0-9]+' | cut -d' ' -f2)/g")
  # Instala a extensão PHP usando o comando "sudo apt install"
  sudo apt install $extensao -y
done < extensoes-php-para-instalar.txt
