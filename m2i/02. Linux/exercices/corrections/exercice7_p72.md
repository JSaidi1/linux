# Exercice


- Dans votre répertoire courant, vous créez un répertoire courant essai_droit. Par défaut, ce répertoire est à755 (rwxr-xr-x). Quelles sont les commandes (en notation symbolique et en base 8) pour lui donner les droits suivants (voir tableau page 72 du support) (on suppose qu'après chaque commande on remet le répertoire à 755) :

## Réponse :

- COMMANDE POUR AFFICHER LES DROITS DU RÉPERTOIRE : 

```
ls –dl essai_droit
```

- COMMANDE POUR REMETTRE LES DROITS « PAR DÉFAUT » POUR L’EXERCICE ENTRE CHAQUE COMMANDE :

```
chmod 755 essai_droit
```

- Commande 1

rwx r-x- -x

```
chmod 751 essai_droit
chmod o-r essai_droit
```

- Commande 2

r-x –w- --x

```
chmod 521 essai_droit
chmod u-w,g+w-rx,o-r essai_droit
```

- Commande 3

-w- --x r--

```
chmod 214 essai_droit
chmod u-rx,g-r,o-x essai_droit
```

- Commande 4

--x r-x ---

```
chmod 150 essai_droit
chmod u-rw,o-rx essai_droit
```