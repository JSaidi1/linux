# Exercice - type de commande

## Objectifs

Ecrire un script modifiant une chaine de caractere selon l'option qui aura été donnée au préalable. 

Option disponible : 
    -maj : affiche la chaine en majuscule
    -min : affiche la chaine en minuscule
    -cap : affiche la chaine avec la première lettre en majuscule et le reste en minuscule

Si l'option donnée ne fait pas partie des propositions précédentes alors afficher un message d'erreur. 

## Exemples utilisation

```bash
./script -maj toto
TOTO
./script -min tOTO
toto
./script -cap toto
Toto 
./script -test toto
Erreur, les options disponibles sont [-maj,-min,-cap]
```

## Reponses

```bash
#!/bin/bash

option=$1
mot=$2

case $option in
    -maj)
        echo "${mot^^}"
        ;;
    -min)
        echo "${mot,,}"
        ;;
    -cap)
        mot=${mot,,}
        echo "${mot^}"
        ;;
    *)
        echo "L'option $option est indisponible"
        ;;
esac
```