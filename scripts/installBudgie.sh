#!/bin/sh
DIALOG=${DIALOG=dialog}
compteur=0
(
while test $compteur != 150
do
	echo $compteur
if (($compteur==0)); then
echo "XXX"
echo "Téléchargement du theme Yaru..."
echo "XXX"
wget -q https://github.com/ungarscool1/dotfile/raw/master/files/Yaru.zip
elif (($compteur==50)); then
echo "XXX"
echo "Dézippage et installation du theme..."
echo "XXX"
unzip Yaru.zip;	sudo mv Yaru /usr/share/themes/
sudo mv Yaru-dark /usr/share/themes/
else
echo "XXX"
echo "Vous pouvez appliquer le theme"
echo "XXX"
fi
compteur=`expr $compteur + 50`
done
) | dialog --gauge "Récuperation des fichier à télécharger..." 6 60 0

$DIALOG --title " Configuration " --clear --yesno "Avez-vous appliqué le theme ?" 6 20

case $? in
	0) exit;;
	1)	echo "Le theme n'est pas installé";;
	255)	echo "Le theme n'est pas installé";;
esac
