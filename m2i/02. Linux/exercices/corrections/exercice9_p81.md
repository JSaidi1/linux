# Exercice


1. Chercher tous les fichiers dont le nom est 'passwd'.
2. Chercher tous les fichiers dont la date de la dernière modification remonte à plus de 10 minutes.
3. Trouver tous les fichiers du groupe 'root'.
4. Chercher tous les fichiers dont la taille est supérieure à 20Mo.
5. Chercher tous les répertoires se trouvant sous /etc.
6. Chercher tous les fichiers associés à votre utilisateur

## Réponse :

Attention, l'utilisateur qui lance la commande find n'a pas nécessairement les droits d'accès à tous les répertoires, ce qui entraînera des erreurs de permission denied dans les résultats. Nous pouvons utiliser la commande sudo pour éviter ces erreurs.

1. Chercher tous les fichiers dont le nom est 'passwd'.

```
find / -name 'passwd' -type f
```

2. Chercher tous les fichiers dont la date de la dernière modification remonte à plus de 10 minutes.

```
find / -type f -mmin +10
```

3. Trouver tous les fichiers du groupe 'root'.

```
find / -type f -group 'root'
```

4. Chercher tous les fichiers dont la taille est supérieure à 20Mo.

```
find / -type f -size +20M
```

5. Chercher tous les répertoires se trouvant sous /etc.

```
find /etc -type d
```

6. Chercher tous les fichiers associés à votre utilisateur

```
find / -type f -user 'root'
```

