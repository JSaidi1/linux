# Exercice 12 - script to_upper

Ecrire un script bash `save.sh` qui recevra 2 argument (arg1: mot à sauvegarder, arg2: fichier), utilisé de la manière suivante :

```bash
./save.sh arg1 arg2
```

L'argument 1 reçu sera directement mis dans le fichier (argument2).
Vérifier le contenue du fichier avec `cat`

### Exemples

```bash
./save.sh toto log.txt
cat log.txt

# Resultat
toto
```