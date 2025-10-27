# Exercice 8 - Grep

## Objectifs 

Apprendre à utiliser les diverses option de la commande `grep`.

## Taches

Récupérer les informations demandé via la commande `grep` en utilisant les options correspondante sur le fichier suivant : 

```bash
NOM_FICHIER="$HOME/animaux.txt"

cat > $NOM_FICHIER << EOF
Rufus Lapin 3
Rex Chien 4
Fido Chien 5
Ponpon Lapin 2
Nemo Poisson 1
Furax Furet 3
Hector Castor 5
Dragor Dragon 120
EOF
```

## Questions

1. Afficher toutes les lignes contenant 'Chien'
2. Afficher toutes les lignes contenant 5 et afficher le numéro de la ligne
3. Afficher toutes les lignes qui ne contiennent pas 'Nemo' (en étant insensible à la casse)
4. Afficher toutes les lignes qui contiennent la lettre 'L'
5. Afficher toutes les lignes qui contiennent soit 'Lapin' soit 'Furet'
6. Afficher toutes les lignes qui contiennent un mot commençant pas 'Dr' et finissant par 'on'.