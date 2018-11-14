#!/bin/sh
DIALOG=${DIALOG=dialog}
compteur=0
(
while test $compteur != 132
do
echo $compteur
if (($compteur==0)); then
echo "XXX"
echo "Correction de steam..."
echo "XXX"
sudo rm /usr/share/applications/steam*
wget -q https://raw.githubusercontent.com/ungarscool1/dotfile/master/files/steam.desktop
sudo mv steam.desktop /usr/share/applications/
elif (($compteur==33)); then
echo "XXX"
echo "Correction de teamvieawer..."
echo "XXX"
sudo systemctl enable teamviewerd
sudo systemctl start teamviewerd
elif (($compteur==66)); then
echo "XXX"
echo "Nettoyage..."
echo "XXX"
rm Yaru.zip packages.list games.list android-messages-icon.png
else
echo "XXX"
echo "Terminé"
echo "XXX"
fi
compteur=`expr $compteur + 33`
done
) | dialog --gauge "Récuperation des fichier à télécharger..." 6 60 0

$DIALOG --title " Configuration " --clear --infobox "Votre système est configuré !" 6 20
