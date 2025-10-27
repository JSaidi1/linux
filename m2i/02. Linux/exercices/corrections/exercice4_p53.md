# Exercice


## Sans bouger du répertoire racine (celui qui est à la base de l’arborescence ; il s’agit ici de ~), créez l’arborescence suivante :

```
.
├── fichhier1
└── rep1
    ├── fichier2
    └── rep2
        └── fichier3
2 directories, 3 files
```


## Reponse :

On s'assure de ce placer dans notre répertoire personnel en tapan la commande :

```
cd
```

Version 1 :

```
mkdir rep1 rep1/rep2
touch fichhier1 rep1/fichier2 rep1/rep2/fichier3
```

Version 2 :

```
mkdir -p rep1/rep2
touch fichhier1 rep1/fichier2 rep1/rep2/fichier3
```