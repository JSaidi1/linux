# Exercice

Unix possède un manuel « en ligne ». La commande man permet
d'explorer ce manuel.

## 1) Comment est structurée la documentation de ce manuel ?

## Réponse :

Chaque page de manuel suit généralement une structure similaire, comprenant des sections telles que :

- NOM: Le nom de la commande ou du programme, suivi d'une brève description de ce qu'elle fait.

- SYNOPSIS: Une syntaxe abrégée montrant comment utiliser la commande ou le programme, souvent avec différentes options et arguments.

- DESCRIPTION: Une explication plus détaillée de la commande ou du programme, expliquant son fonctionnement et ses options.

- OPTIONS: Une liste des options (drapeaux) que la commande ou le programme accepte, avec une description de chacune.

- ARGUMENTS: Une description des arguments que la commande ou le programme peut prendre, ainsi que leur signification.

- ENVIRONNEMENT: Si la commande ou le programme utilise des variables d'environnement spécifiques, elles sont répertoriées ici.

- FICHIERS: Cette section répertorie les fichiers pertinents pour la commande ou le programme, tels que les fichiers de configuration ou les fichiers de données.

- VOIR AUSSI: Une liste d'autres commandes ou programmes connexes qui pourraient être utiles.

- AUTEUR: Les informations sur l'auteur de la commande ou du programme.

- RAPPORT DE BUGS: Instructions sur la manière de signaler les bugs ou les problèmes liés à la commande ou au programme.

- HISTORIQUE: Des informations sur les versions précédentes de la commande ou du programme, les modifications et les mises à jour.

- NOTES: Des notes supplémentaires ou des informations pertinentes qui n'entrent pas dans les autres sections.

Chaque section est généralement précédée d'un en-tête de section en majuscules pour faciliter la navigation dans la page de manuel. Cette structure standard permet aux utilisateurs de trouver rapidement les informations dont ils ont besoin sur une commande ou un programme spécifique.


## 2) Comment accède- t-on à la page du manuel concernant la commande write ?

## Réponse :

```
man write
```


## 3) Commande ls : précisez les options que vous savez utiliser et celles que vous pourriez éventuellement utiliser

## Réponse :

Nous avions vu les options -a et -l. Pour connaître les différentes options que nous pouvons éventuellement utiliser, nous pouvons ouvrir le manuel de la commande ls en tapant :

```
man ls
```

d'autres options possibles :

```
    --author
        with -l, print the author of each file
    -d, --directory
        list directories themselves, not their contents
```