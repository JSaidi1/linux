#./bin/bash

# Signaux principaux

# Signal    Numéro  Description             Action
# SIGHUP    1       Déconnexion terminal    Terminer
# SIGINT    2       Interruption (CTRL+C)   Terminer
# SIGQUIT   3       Quit (CTRL+\)           Terminer + core dump
# SIGKILL   9       Kill forcé              Terminer (non capturable)
# SIGTERM   15      Terminaison propre      Terminer
# SIGCONT   18      Relancer un processus   Fin de pause
# SIGSTOP   19      Pause forcé (CTRL+Z)    Pause 
# SIGUSR1   10      Signal utilisateur 1    Envoie
# SIGUSR2   12      Signal utilisateur 2    Envoie
echo
echo "=== Liste des signaux ==="
kill -l

echo
echo "=== Envoie de signaux ==="
sleep 300 & # & met un processus en arrière plan
PID1=$!
sleep 300 & 
PID2=$!

echo
echo "Processus créés"
echo "PID1 : $PID1"
echo "PID2 : $PID2"

# Kill par numéro
echo
echo "Kill de $PID1"
kill -9 $PID1
ps

# Kill par nom
echo
echo "Kill de $PID2"
kill -KILL $PID2
ps

# kill tout les processus d'un utilisateur
# killall -KILL firefox
# ps

# Kill par nom de processus
# pkill -KILL python

# Kill par regex de nom de processus
# pkill -KILL '^python'

cleanup(){
    echo 
    echo "=== Nettoyage avant sortie ==="
    echo "Suppressions des fichiers temporaire"
    echo "Fermeture des connexion"
    echo "Fin de script"
    exit 0
}

# CTRL+C
handle_sigint(){
    echo
    echo "SIGINT reçu"
    echo "Je fais quelque chose !"
}

# Fin de processus propre
handle_sigterm(){
    echo "SIGNAL TERM reçu - arret propre..."
    cleanup
}

# Reception signal USR1
handle_sigusr1(){
    echo
    echo "Ping reçu par un autre terminal"
}

# trap permet d'utiliser une fonction quand un signal particulier est reçu
trap 'handle_sigint' SIGINT
trap 'handle_sigterm' SIGTERM
trap 'handle_sigusr1' SIGUSR1

while true; do
    sleep 1
    echo -n "."
done