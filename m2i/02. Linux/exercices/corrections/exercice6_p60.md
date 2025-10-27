# Exercice

Lister tous les fichiers :

- se terminant par '5'
- commençant par 'annee4'
- commençant par 'annee4' et de 7 lettres maximum
- commençant par 'annee' avec aucun chiffre numérique,
- contenant la chaîne 'ana',
- commençant par 'a' ou 'A'


## Réponse :


- se terminant par '5'

```
ls *5
```

- commençant par 'annee4'

```
ls annee4*
```

- commençant par 'annee4' et de 7 lettres maximum

```
ls annee4?
```

- commençant par 'annee' avec aucun chiffre numérique,

```
ls annee4[!0-9]
```

- contenant la chaîne 'ana',

```
ls *ana*
```

- commençant par 'a' ou 'A'

```
ls [aA]*
```
