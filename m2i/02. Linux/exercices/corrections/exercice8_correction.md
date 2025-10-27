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

### Réponse

```bash
grep Chien $NOM_FICHIER
```
2. Afficher toutes les lignes contenant 5 et afficher le numéro de la ligne

### Réponse

```bash
grep -n "5" $NOM_FICHIER
```
3. Afficher toutes les lignes qui ne contiennent pas 'Nemo' (en étant insensible à la casse)

### Réponse

```bash
grep -vi Nemo $NOM_FICHIER
```
4. Afficher toutes les lignes qui contiennent la lettre 'L'

### Réponse

```bash
grep L $NOM_FICHIER
```
5. Afficher toutes les lignes qui contiennent soit 'Lapin' soit 'Furet'

### Réponse

```bash
grep -E "Lapin|Furet" $NOM_FICHIER
```

6. Afficher toutes les lignes qui contiennent une ligne commençant pas 'Dr' et finissant par '20'.

### Réponse

```bash
grep "^Dr.*20$" $NOM_FICHIER
```