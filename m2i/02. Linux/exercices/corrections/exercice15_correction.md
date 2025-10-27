# Exercice 15 - Majeur ou mineur

## Objectif

1. Créer une variable `age`
2. Affecter une valeur à la variable `age` (saisi utilisateur)
3. Créer une condition qui permet d'afficher si la personne est majeur ou mineur.

## Exemples

```text
Saisir un age : 23
Vous êtes majeur, vous pouvez rentrer dans le club
```

## Reponses

```bash
#!/bin/bash

read -p "Veuillez donner votre age : " age

if (( age >= 18 )); then
    echo "Vous êtes majeur"
elif (( age >= 0 )); then
    echo "Vous êtes mineur"
else
    echo "Vous n'êtes pas encore née Oo !?"
fi
```