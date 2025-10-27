#!/bin/bash

# Pour créer une boucle, on va utiliser la syntaxe while <condition>; do...done
count=1
while [[ $count -lt 5 ]]; do
    echo "Le compteur est de $count"
    (( count++ ))
done

# incrémentation/décrémentation
count=0
echo "$((count++))"
echo "$((count))"
echo "$((++count))"
echo "$((count))"

echo "$((count--))"
echo "$((count))"

choix=""
while [[ $choix != "o" ]]; do
    read -p "Veut-tu arreter ? o/N : " choix
    echo "Choix vaut : $choix"
done

count=0
while [[ true ]]; do
    (( count++ ))

    if (( $count == 5 )); then
        continue
    fi

    if (( $count == 7 )); then 
        break
    fi

    echo "$count"
done

# Si l'on veut itérer sur un ensemble de valeurs (séparé par IFS) 
# Syntaxe: for nom_variable in <ensemble>; do...done
for iter_value in 1 2 3 4 5; do
    echo "iteration : $iter_value"
done

for iter_value in {1..10}; do
    echo "iteration : $iter_value"
done

echo "IFS : $IFS"

IFS=','
liste_nombre="1,2,3,4,5"

for iter_value in $liste_nombre; do
    echo "iteration : $iter_value"
done

IFS=$OLD_IFS