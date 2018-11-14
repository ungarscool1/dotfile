#!/bin/sh
DIALOG=${DIALOG=dialog}
compteur=0
(
while test $compteur != 120
do
  echo $compteur
if (( $compteur == 0)); then
    echo "XXX"
    echo "Installation de nativefier..."
    echo "XXX"
    sudo npm install nativefier --quiet -g
elif (($compteur == 20)); then
    echo "XXX"
    echo "Téléchargement des prérequis..."
    echo "XXX"
    wget -q https://github.com/ungarscool1/dotfile/raw/master/files/android-messages-icon.png
    wget -q https://raw.githubusercontent.com/ungarscool1/dotfile/master/files/Messages%20Android.desktop -o Messages\ Android.desktop;
elif (($compteur == 40)); then
    echo "XXX"
    echo "Compilation de l'application..."
    echo "XXX"
    nativefier --name "Messages Android" --icon "android-messages-icon.png" --tray https://messages.android.com/
elif (($compteur == 60)); then
    echo "XXX"
    echo "Compilation de l'application..."
    echo "XXX"
    mv Messages\ Android.desktop ~/.local/share/applications/
    sudo mkdir /opt/ungarscool1
    sudo mv messages-android-linux-x64 /opt/ungarscool1/messages-android
elif (($compteur == 80)); then
    echo "XXX"
    echo "Ouverture de l'application...\nConnectez-vous et fermez Messages Android une fois connecté"
    echo "XXX"
    nativefier --name "Messages Android" --icon "android-messages-icon.png" --tray https://messages.android.com/
    echo "XXX"
    echo "Configuration de Messages Android, terminé"
    echo "XXX"
else
    echo "XXX"
    echo "Terminé..."
    echo "XXX"
fi

compteur=`expr $compteur + 20`
done
) | dialog --gauge "Récuperation des fichier à télécharger..." 6 60 0
