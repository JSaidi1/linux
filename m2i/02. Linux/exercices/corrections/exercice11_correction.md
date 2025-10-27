# Exercice 11 - Initial

Ecrire un script bash permettant d'échanger d'afficher les initiales. 
Vous devrez déclarer une variable `nom` et `prenom` qui seront initialisé puis vous devrez afficher la première lettres de ces 2 variables en majuscules séparé par un '.'

### Exemples

```bash
nom=Toto
prenom=Tata

# Resultat
T.T
```

```bash
#!/bin/bash

read -p "Veuillez entrer un nom : " nom
read -p "Veuillez entrer un prenom : " prenom

# nom=walle
# prenom=loick

nom=${nom^^}
prenom=${prenom^^}

echo "${prenom:0:1}.${nom:0:1}"
```