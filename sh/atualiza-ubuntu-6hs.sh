#!/bin/bash

# Lê o conteúdo do arquivo ultima_att_ubuntu.txt
ultima_att=$(cat atualizacao_ubuntu/ultima_att_ubuntu.txt)

# Converte o conteúdo do arquivo para o formato de data/hora
ultima_att_timestamp=$(date -d "$ultima_att" +%s)

# Obtém a data/hora atual
agora=$(date +%s)

# Calcula a diferença entre a data/hora atual e a data/hora do último upgrade
diferenca=$((agora - ultima_att_timestamp))

# Verifica se a diferença é maior que 6 horas (6 horas em segundos é 21600)
if [ $diferenca -gt 21600 ]; then
  echo 'Atualize seu ubuntu : '
  # Executa o upgrade
  sudo apt update
  sudo apt upgrade
  # Cria o arquivo ultima_att_ubuntu.txt ou atualiza seu conteúdo
  echo $(date +"%Y/%m/%d %T") > atualizacao_ubuntu/ultima_att_ubuntu.txt
fi
