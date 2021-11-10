#!/bin/bash

echo "Insira o nome do arquivo sem extensão"
read NAME

echo -e "Classe S\n" >> logs/$NAME.txt

for value in {1..3}
    do
        valgrind --tool=cachegrind ./bin/$NAME.S &>> logs/$NAME.txt
        echo -e " \n" >> logs/$NAME.txt
    done

rm -f cachegrind*

echo -e "\nClasse W\n" >> logs/$NAME.txt

for value in {1..3}
    do
        valgrind --tool=cachegrind ./bin/$NAME.W &>> logs/$NAME.txt
        echo -e " \n" >> logs/$NAME.txt
    done

rm -f cachegrind*
