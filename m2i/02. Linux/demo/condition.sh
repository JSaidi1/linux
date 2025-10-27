#!/bin/bash

read -p "Veuillez entrer un nombre : " ma_variable

# if <resultat booléen> ; then
#   instructions
# elif <resultat booléen>; then
#   instuctions sinon si
# else
#   instructions sinon
# fi 

# Les opérateurs de comparaison avec [[ ]]
# -gt : plus grand
# -ge : plus grand ou égal
# -eq : egal
# -ne : différent
# -le : plus petit ou égal
# -lt : plut petit

if [[ ma_variable -gt 5 ]]; then
    echo "$ma_variable est plus grand que 5"
elif [[ ma_variable -lt 5 ]]; then
    echo "$ma_variable est plus petit que 5"
else
    echo "$ma_variable est égal à 5"
fi

# Les opérateurs de comparaison avec (( ))
# > : plus grand
# >= : plus grand ou égal
# == : egal
# != : différent
# <= : plus petit ou égal
# < : plut petit

if (( $ma_variable % 2 == 0 )); then
    echo "$ma_variable est pair"
else
    echo "$ma_variable est impair"
fi

# Les opérateurs logiques [[ ]] (( ))
# && ET
# || OU

if (( $ma_variable >= 10 || $ma_variable <= -10 )); then
    echo "$ma_variable est un nombre"
else
    echo "$ma_variable est un chiffre"
fi

echo "=== Test Mon Nombre ==="
[[ $ma_variable -gt 5 ]] && echo "$ma_variable > 5 "
[[ $ma_variable -ge 5 ]] && echo "$ma_variable >= 5 "
[[ $ma_variable -lt 5 ]] && echo "$ma_variable < 5 "
[[ $ma_variable -le 5 ]] && echo "$ma_variable <= 5 "
[[ $ma_variable -eq 5 ]] && echo "$ma_variable == 5 "
[[ $ma_variable -ne 5 ]] && echo "$ma_variable != 5 "

# Pour éviter les multiplications de if...elif...elif...à l'infini, on privilégie la syntaxe avec un switch case
# Pour cela, on utilise : 
# case $nom_variable in 
#   cas_un) ....;;
#   cas_deux) ....;;
#   *) ....;;
# esac

case $ma_variable in
    1)
        echo "Vous avez entrée 1"
        ;;
    2|3)
        echo "Vous avez entrée 2 ou 3"
        ;;
    [4-9])
        echo "Vous avez entrée un chiffre entre 4 et 9 (inclus)"
        ;;
    *)
        echo "Vous avez entrée un nombre supérieur ou égal à 10"
        ;;
esac


if [[ -z fichier ]]; then
    echo "Element inexistant"
elif [[ -v fichier ]]; then
    echo "Element vide"
elif [[ -f fichier ]]; then
    echo "C'est un fichier"
else
    echo "C'est autre chose"
fi