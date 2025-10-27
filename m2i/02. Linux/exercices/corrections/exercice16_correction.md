# Exercice 16 - Voyelle ou consonne

1. Créer une variable `caractere`
2. Affecter une valeur (saisie) à la variable `caractere`
3. A l'aide de conditions, déterminer si le caractere est une consonne ou une voyelle.
4. Si la saisie prend plus d'un caractere nous récupérerons que la première lettre.

```text
Saisir un caractere : c
Le caractere est une consonne
```

## Reponses

```bash
#!/bin/bash

read -p "Veuillez saisir un caractere : " caractere

caractere=${caractere,,}
caractere=${caractere:0:1}

if [[ $caractere == "a" || $caractere == "e" || $caractere == "i" ||$caractere == "o" || $caractere == "u" || $caractere == "y" ]]; then
    echo "C'est une voyelle"
else
    echo "C'est une consonne"
fi

case $caractere in 
    [aeiouy])
        echo "C'est une voyelle"
        ;;
    [[:alpha:]])
        echo "C'est une consonne"
        ;;
    *)
        echo "Ce n'est pas un caractere alphabétique"
        ;;
esac
```