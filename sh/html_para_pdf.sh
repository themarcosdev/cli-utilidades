#!/bin/bash

#Verifica se o wkhtmltopdf está instalado
if ! [ -x "$(command -v wkhtmltopdf)" ]; then
  echo "wkhtmltopdf não está instalado. Por favor, instale-o antes de executar o script." >&2
  exit 1
fi

# Nome do arquivo HTML
htmlFile=$1

# Nome do arquivo PDF
pdfFile="${htmlFile%.*}.pdf"

# Converte o HTML em PDF
wkhtmltopdf $htmlFile $pdfFile

# Verifica se a conversão foi bem-sucedida
if [ $? -eq 0 ]; then
  echo "O arquivo HTML foi convertido com sucesso para PDF: $pdfFile"
else
  echo "A conversão falhou." >&2
  exit 1
fi
