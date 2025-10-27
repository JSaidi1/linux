#./bin/bash
# On se sert de cette ligne dite "she-bang" de sorte à définir quel va être l'éxécutable qui va servir à lancer le script.

# On peut ensuite utiliser les commandes bash classique dans notre script
echo "toto" 

# Pour créer des variables, on utilise la syntaxe suivante
firstname="John"
lastname="Wayne"

# Pour afficher les variables, on passe par une expansion des variables (syntaxe $nom_variable)
echo "Hello $firstname $lastname"

# On peut créer des variables à partie d'autres variables 
fullname="$firstname $lastname"

echo "Hello $fullname"

# Pour peupler une variable d'un retour de commande, on utilise la substition de commande ( $( <operation> ))
date_actuelle=$(date '+%d-%m-%Y %H:%M')

echo "Aujourd'hui, la date est $date_actuelle" 

# On peut crére des variables à partir de nombres
nb_a=12
nb_b=7

# Pour créer une variable issue d'un calcul mathématique, on utilise ( $(( <operation> )) ) 
addition_result=$(( nb_a + nb_b ))
echo "$nb_a + $nb_b = $addition_result"

# Pour les nombres à virgules, on va utiliser une substitution avec piping vers bc, cette commande gérant les nombres à virgule
result_division=$( echo "scale=3; 5 / 2" | bc) 

echo "5 / 2 = $result_division"

# Manipulation de strings
# ${mon_texte,} => Première lettre en minuscule
# ${mon_texte^} => Première lettre en majuscule
# ${mon_texte,,} => Tout en minuscule
# ${mon_texte^^} => Tout en majuscule

firstname="maRk"
lastname="zuCkerberg"
firstname=${firstname,,}
echo "$firstname en minuscule"
firstname=${firstname^}
echo "$firstname avec la première en majuscule"
lastname=${lastname^^}
echo "$lastname en majuscule"

# On peut choisir de récupérer les variables via la synataxe ( ${variable} )
echo "Hello ${firstname^^} ${lastname,,}"

texte="Je suis une chaine de caractere très très longue..."

# Slice de chaine de caractere (on extrait une partie de la chaine)
echo "Valeur de la chaine : $texte"
echo "Première lettre du texte : ${texte:0:1}"
echo "5 Première lettre du texte : ${texte:0:5}"
echo "A partir de la 10e lettre : ${texte:9}"
echo "A partir de la 5e dernière lettre : ${texte: -5}"

echo "La longueur de mon texte est de : ${#texte} caractère(s)"