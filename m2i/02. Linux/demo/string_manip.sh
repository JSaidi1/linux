#./bin/bash

firstname="maRk"
lastname="zuCkerberg"
firstname=${firstname,} # Première minuscule
firstname=${firstname,,} # Tout en minuscule
firstname=${firstname^} # Première majuscule
lastname=${lastname^^} # Tout en majuscule

texte="Je suis une chaine de caractere très très longue..."

# Slice de chaine de caractere (on extrait une partie de la chaine)
echo "Valeur de la chaine : $texte"
echo "Première lettre du texte : ${texte:0:1}"
echo "5 Première lettre du texte : ${texte:0:5}"
echo "A partir de la 10e lettre : ${texte:9}"
echo "A partir de la 5e dernière lettre : ${texte: -5}"

echo "La longueur de mon texte est de : ${#texte} caractère(s)"

ma_chaine="toto toto toto toto toto"
autre_chaine="titi toto titi toto titi"

remplacement_premiere_occurence=${ma_chaine/toto/titi} 
echo "$remplacement_premiere_occurence"
remplacement_toute_occurence=${ma_chaine//toto/titi} 
echo "$remplacement_toute_occurence"
remplacement_premiere_element=${autre_chaine/#titi/toto}
echo "$remplacement_premiere_element" 
remplacement_dernier_element=${autre_chaine/%titi/toto} 
echo "$remplacement_dernier_element"

chaine_adn="aaataaaataaccaaatttt"

# part du début et au premier t, recupere la partie de droite
chaine_suppression_courte=${chaine_adn#*t} # aaat supprimé 
echo "$chaine_suppression_courte"
# part du début et au dernier c, recupere la partie de droite
chaine_suppression_longue=${chaine_adn##*c}
echo "$chaine_suppression_longue"

# part de la fin et au premier t, recupere la partie de gauche
chaine_suppression_courte_depuis_fin=${chaine_adn%t*}
echo "$chaine_suppression_courte_depuis_fin"
# part de la fin et au dernier c, recupere la partie de gauche
chaine_suppression_longue_depuis_fin=${chaine_adn%%c*}
echo "$chaine_suppression_longue_depuis_fin"

chemin="/home/toto/repo/index.html"
chemin_bis="/home/toto/repo/archive.tar.7z"

nom_fichier=${chemin_bis##*/} # archive.tar.7z
extension_complete=${nom_fichier#*.} # tar.7z
extension=${nom_fichier##*.} # 7z
nom_dossier=${chemin_bis%/*} # /home/toto/repo

echo "$nom_fichier"
echo "$extension_complete"
echo "$extension"
echo "$nom_dossier"