#!/bin/sh
DIALOG=${DIALOG=dialog}
compteur=0
(
while test $compteur != 125
do
  echo $compteur
if (($compteur==0)); then
echo "XXX"
echo "Téléchargement du fichier de configuration..."
echo "XXX"
wget -q https://github.com/ungarscool1/dotfile/raw/master/files/40_custom
elif (($compteur==25)); then
echo "XXX"
echo "Suppression de la configuration existante..."
echo "XXX"
sudo rm /etc/grub.d/40_custom
elif (($compteur==50)); then
echo "XXX"
echo "Installation de la nouvelle configuration..."
echo "XXX"
sudo mv 40_custom /etc/grub.d/
elif (($compteur==75)); then
echo "XXX"
echo "Application de la nouvelle configuration..."
echo "XXX"
sudo grub-mkconfig -o /boot/grub/grub.cfg
else
echo "XXX"
echo "Grub est configuré"
echo "XXX"
fi
compteur=`expr $compteur + 25`
done
) | dialog --gauge "Récuperation des fichier à télécharger..." 6 60 0
