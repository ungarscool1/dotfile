#!/bin/sh
DIALOG=${DIALOG=dialog}
compteur=0
(
while test $compteur != 125
do
	echo $compteur
if (($compteur==0)); then
echo "XXX"
echo "Téléchargement du theme Yaru..."
echo "XXX"
wget -q https://github.com/ungarscool1/dotfile/raw/master/files/Yaru.zip
elif (($compteur==25)); then
echo "XXX"
echo "Dézippage et installation du theme..."
echo "XXX"
unzip Yaru.zip;	sudo mv Yaru /usr/share/themes/
sudo mv Yaru-dark /usr/share/themes/
elif (($compteur==50)); then
echo "XXX"
echo "Vous avez besoin d'effectuer quelques actions ! [ENTRER si vous êtes là]"
echo "XXX"
read here
xdg-open https://extensions.gnome.org/extension/1031/topicons/
echo "XXX"
echo "Appuyez sur OFF, puis le switch passe sur ON [ENTRER si vous l'avez fait]"
echo "XXX"
read configTrayExtOn
echo "XXX"
echo "Allez dans extentions, puis chercher TopIcons Plus et activé le [ENTRER si vous l'avez fait]"
echo "XXX"
gnome-tweaks
read configTrayExtOk
echo "XXX"
echo "Téléchargement de la configuration de TopIcons Plus..."
echo "XXX"
wget -q https://github.com/ungarscool1/dotfile/raw/master/files/topIconsPlus/extension.js
echo "XXX"
echo "Application de la configuration de TopIcons Plus..."
echo "XXX"
mv extension.js ~/.local/share/gnome-shell/extensions/TopIcons@phocean.net/
elif (($compteur==75)); then
	echo "XXX"
	echo "Vous avez besoin d'effectuer quelques actions ! [ENTRER si vous êtes là]"
	echo "XXX"
	read here
	xdg-open https://extensions.gnome.org/extension/118/no-topleft-hot-corner/
	echo "XXX"
	echo "Appuyez sur OFF, puis le switch passe sur ON [ENTRER si vous l'avez fait]"
	echo "XXX"
	read configHotConerExtOn
	echo "XXX"
	echo "Allez dans extentions, puis chercher No hot corner et activé le [ENTRER si vous l'avez fait]"
	echo "XXX"
	gnome-tweaks
	read configHotConerExtOk
else
echo "XXX"
echo "L'installation et la configuration de gnome est terminé !"
echo "XXX"
fi
compteur=`expr $compteur + 25`
done
) | dialog --gauge "Récuperation des fichier à télécharger..." 6 60 0

$DIALOG --title " Configuration " --clear --yesno "Avez-vous appliqué le theme et les extentions ?" 6 20

case $? in
	0) echo "Ok !";;
	1)	echo "Le theme n'est pas installé";;
	255)	echo "Le theme n'est pas installé";;
esac
