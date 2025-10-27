# Exercice 14 - Nombre mystere

### Objectif - trouver le nombre mystere

Créer une variable nb_mystere qui contiendra un nombre, et afficher si le nombre est plus grand ou plus petit. 
Si le nombre mystere est trouvé afficher: 'Vous avez gagné !' 

## Exemples : 

```bash
Veuillez entrer un nombre : 5
Plus grand
Veuillez entrer un nombre : 8
Plus grand
Veuillez entrer un nombre : 11
Plus petit
Veuillez entrer un nombre : 9
Plus grand
Veuillez entrer un nombre : 10
Vous avez gagné !
```

## Reponses

```bash
#!/bin/bash

nb_mystere=5

read -p "Veuillez saisir un nombre : " user_input

if [[ $user_input -lt $nb_mystere ]]; then
    echo "Le nombre mystere est plus grand"
elif [[ $user_input -gt $nb_mystere ]]; then
    echo "Le nombre mystere est plus petit"
else
    echo "Vous avez Gagné !!!"
fi
```