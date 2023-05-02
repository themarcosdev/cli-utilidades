#!/bin/bash

# Lê o arquivo comandos.txt e armazena cada comando em uma variável
while read comando; do
  comandos+=("$comando")
done < /home/$USER/validador_comandos/comandos.txt

# Função que verifica se o comando executado está na lista de comandos permitidos
detecta_comandos() {
  for cmd in "${comandos[@]}"; do
    if [[ $BASH_COMMAND == "$cmd"* ]]; then
      # Exibe uma mensagem de aviso
      echo -e "\033[31mATENÇÃO: Você está prestes a executar um comando perigoso!\033[0m Comando: \033[34m$BASH_COMMAND\033[0m"
      # Pergunta ao usuário se deseja continuar com a execução
      while true; do
        read -p "Deseja continuar? Pressione (y/Y) para continuar ou control+c para cancelar a execução de $BASH_COMMAND " choice
        case "$choice" in
          y|Y ) echo -e "\033[32mContinuando com a execução do comando...\033[0m"; break;;
          # n|N ) echo "Execução do comando cancelada."; return 0;;
          * ) echo "Opção inválida.";;
        esac
      done
      # Verifica o valor de retorno do case
      if [ $? -eq 0 ]; then
        # Interrompe a execução do comando perigoso
        return 0
      fi
    fi
  done
}

# Registra a função detecta_comandos para ser executada antes de cada comando
trap detecta_comandos DEBUG
