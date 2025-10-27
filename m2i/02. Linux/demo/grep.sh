#!/bin/bash

# Caractere de bases pour la regex
# . => N'importe quel caractere
# ^ => Début de ligne
# $ => Fin de lgine
# * => 0 ou plus d'occurence
# + => 1 ou plus d'occurence
# ? => 1 ou pas d'occurence
# {3} => 3 occurence
# {1, 3} => 1 à 3 occurence
# [abcde] => N'importe quel caractere dans l'ensemble précisé
# [a-zA-Z] => N'importe quel caratere alphabétique
# [^abc] => N'importe quel caractere que ne se trouve pas dans l'ensemble précisé
# | => Ou logique
# () => Groupement de condition
# \. => précisé l'utilsation d'un point

NOM_FICHIER="$HOME/fichier.txt"

cat > $NOM_FICHIER << EOF
Fraise Fruits 4.29
Banane Fruits 2.99
Raisin Fruits 1.99
Lait ProduitLaitier 1.99
Pain Boulangerie 1.20
Croissant Boulangerie 1.10
EOF

echo "=== Fichier initial ==="
cat $NOM_FICHIER

echo
echo "=== Lignes avec 'Fruits' ==="
grep 'Fruits' $NOM_FICHIER

echo
echo "=== Lignes avec 'Boulangerie' avec numéro de lignes ==="
grep -n 'Boulangerie' $NOM_FICHIER

echo
echo "=== Lignes avec 'Boulangerie' (insensible à la casse) ==="
grep -i 'boulAngErie' $NOM_FICHIER

echo
echo "=== Lignes sans 'Fruits' ==="
grep -v 'Fruits' $NOM_FICHIER

echo
echo "=== Compter les lignes avec 'Fruits' ==="
grep -c 'Fruits' $NOM_FICHIER

echo
echo "=== Lignes avec 'Fruits ou Croissant' ==="
grep -E 'Fruits|Croissant' $NOM_FICHIER

echo 
echo "=== Isolement des prix des produits ==="
grep -Eo '[0-9]+\.[0-9]+' $NOM_FICHIER

rm $NOM_FICHIER