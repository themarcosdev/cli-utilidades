#!/bin/bash

arquivo_valida_atualizacao="/home/$USER/atualizacao_ubuntu/ultima_att_ubuntu.txt"

# Lê o conteúdo do arquivo arquivo_valida_atualizacao
if [ -f $arquivo_valida_atualizacao ]; then
    ## caso o arquivo exista 
    ultima_att=$(cat $arquivo_valida_atualizacao)
else
  ## caso o arquivo não exista, pegar o momento agora e gravar no arquivo
  ultima_att=$(date +"%Y/%m/%d %T")
  echo $ultima_att > $arquivo_valida_atualizacao
fi

## echo "Ultima verificacao de atualizacao: $ultima_att"

# Converte o conteúdo do arquivo para o formato de data/hora para timestamp
ultima_att_timestamp=$(date -d "$ultima_att" +%s)

# Obtém a data/hora atual em timestamp
agora=$(date +%s)

# Calcula a diferença entre a data/hora atual e a data/hora do último upgrade
diferenca=$((agora - ultima_att_timestamp))

# Verifica se a diferença é maior que 6 horas (6 horas em segundos é 21600)
if [ $diferenca -gt 21600 ]; then
  echo 'Atualize seu ubuntu : '
  # Executa o update & upgrade
  sudo apt update -y
  sudo apt upgrade -y
  # Cria o arquivo arquivo_valida_atualizacao ou atualiza seu conteúdo
  echo $(date +"%Y/%m/%d %T") > $arquivo_valida_atualizacao
fi
