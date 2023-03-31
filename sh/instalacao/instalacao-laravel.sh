#!/bin/bash
#Pergunta para o usuário qual a fonte de instalação do Laravel
while true; do
echo "----- Instalação do Laravel ----- \nQual a fonte de instalação do Laravel : "
read  -p "[1] - começar do zero | [2] - clonar projeto git " fonte
case $fonte in
1)
# Se a fonte for 1, pergunta qual o nome do projeto
read -p "Qual o nome do projeto ? " nome_projeto
# Se a fonte for 1, pergunta qual a versao do projeto
read -p "Qual a versão do projeto ? [4]-[5]...[9]-[10] " versao_projeto
echo "Criando projeto ..."
composer create-project laravel/laravel:^$versao_projeto.0 $nome_projeto &&
cd $nome_projeto &&
composer install &&
composer update &&
php artisan serve 
break
;;
2)
# Se a fonte for 2, pergunta onde o usuário quer clonar o projeto ex : /home/$USER ou /mnt/c/Users/$USER/Documents/bitbucket/
read -p "Qual o local da sua máquina onde você gostaria de clonar o projeto ? " local_projeto_git
cd $local_projeto_git
# Exemplo de endereço : https://github.com/$USER/$USER.git
read -p "Qual o endereço do repositório git ? " rep_git
git clone $rep_git &&
cd $(basename $rep_git .git) &&
composer install &&
composer update &&
php artisan serve &&
break
;;
*) echo "Por favor, responda com 1 ou 2.";;
esac
done
