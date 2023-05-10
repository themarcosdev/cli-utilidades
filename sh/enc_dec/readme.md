### Encriptador / decriptador de strings usando salt 

- comandos pós-install : 
chmod +x enc_dec.sh

- comandos uso : 
-- exemplo 1 : # Printando a string "marcos" encriptada pelo salt "marcos123"
   echo | ./enc_dec.sh "marcos" "marcos123" "codificar"
-- exemplo 2 : # Printando a string "marcos" encriptada pelo salt "marcos123" e salvando no arquivo "arquivo_tst.txt"
   echo | ./enc_dec.sh "marcos" "marcos123" "codificar" > arquivo_tst.txt
-- exemplo 3 : # Decriptando string : 
    echo | ./enc_dec.sh "U2FsdGVkX184mSdMLkJXgP0XUe8V4XowmNKLHHx6f5o=" "marcos123" "decodificar"
  
