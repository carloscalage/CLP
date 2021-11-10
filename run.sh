#!/bin/bash

echo "Compilar arquivos? [s|n]"
read OPTION

if [ $OPTION == "s" ];
   then
      cd NPB && make suite
fi

echo -e "\nInsira o nome do arquivo sem extensão"
read NAME

echo -e "Classe S\n" >> NPB/logs/$NAME.txt

for value in {1..30}
    do
        valgrind --tool=cachegrind ./NPB/bin/$NAME.S &>> NPB/logs/$NAME.txt
        echo -e " \n" >> NPB/logs/$NAME.txt
    done

rm -f cachegrind*

echo -e "\nClasse W\n" >> NPB/logs/$NAME.txt

for value in {1..30}
    do
        valgrind --tool=cachegrind ./NPB/bin/$NAME.W &>> NPB/logs/$NAME.txt
        echo -e " \n" >> NPB/logs/$NAME.txt
    done

rm -f cachegrind*