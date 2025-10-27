#./bin/bash

# Variables pré-peuplé fournies par le Shell
echo "Le dossier actuel est : $PWD" # Dossier actuelle de travail (répertoire du script)
echo "L'utilisateur actuel est : $USER" # Nom d'utilisateur
echo "Notre dossier personnel : $HOME" # Emplacement du dossier personnel de l'utilisateur actuelle

echo "La commande d'entrée du script est : $0"
echo "Le premier argument du script est : $1"
echo "Le second argument du script est : $2"
echo "Les arguments d'entré du script sont : $*" # "argA argB argC"
echo "Les arguments d'entré du script sont : $@" # argA argB argC
echo "Combien d'arguments en entrée ? $#" # Nombre d'argument donnée
echo "Le code de sortie de la dernière commande : $?"
echo "Le PID du dernier processus lancé : $!" # Dernier PID du processus mis en arrière plan