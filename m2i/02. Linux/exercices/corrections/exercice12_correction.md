# Exercice 12 - script to_upper

Ecrire un script bash `to_upper.sh` qui recevra un argument de la manière suivante :

```bash
./to_upper.sh arg1
```

L'argument sera reçu dans le script et devra être afficher en majuscule.

### Exemples

```bash
./to_upper.sh bonjour

# Resultat
BONJOUR
```

## Reponse

```bash
#!/bin/bash

mot=$1
mot=${mot^^}

echo "$mot" 
echo "${1^^}"
```