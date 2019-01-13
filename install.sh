DIALOG=${DIALOG=dialog}


$DIALOG --clear --title " Avertissement " --clear --yesno "Le dotfile est customiser pour mon utilisation !\nL'installateur est a utiliser à vos riques et périls !\nÊtes-vous d'accord pour installer le dotfile ?" 25 50

case $? in
	0) echo "Requesting sudoeur...";;
	1)	exit;;
	255)	exit;;
esac

sudo echo "Votre mot de passe est enregistrer pour la durée de l'installation"

# Installation

echo "Installation de yaourt, wget et dialog..."
sudo pacman -Sq yaourt wget dialog
echo "Terminé"
echo " "
echo " "
compteur=0
(
while test $compteur != 150
do
echo $compteur

if (( $compteur == 0 )) ; then
	echo "XXX"
	echo "Téléchargement de packages.list..."
	echo "XXX"
	wget -q https://github.com/ungarscool1/dotfile/raw/master/packages/packages.list
elif (( $compteur == 50 )) ; then
	echo "XXX"
	echo "Téléchargement de games.list..."
	echo "XXX"
	wget -q https://github.com/ungarscool1/dotfile/raw/master/packages/games.list
else
	echo "Terminé"
fi


compteur=`expr $compteur + 50`
done
) | $DIALOG --gauge "Récuperation des fichier à télécharger..." 20 70 0

compteur=0
(
while test $compteur != 150
do
echo $compteur

if (( $compteur == 0 )) ; then
	echo "XXX"
	echo "Téléchargement des clés de confiances pour la compilation de discord..."
	echo "XXX"
	gpg --recv-keys --keyserver hkp://pgp.mit.edu 0FC3042E345AD05D
elif (( $compteur == 50 )) ; then
	echo "XXX"
	echo "Ajout des clés de confiances pour la compilation de discord"
	echo "XXX"
else
	echo "Terminé"
fi


compteur=`expr $compteur + 50`
done
) | $DIALOG --title "Téléchargement" --gauge "Récuperation des fichier à télécharger..." 20 70 0


##
## Installation of packages.list
##

packagesToInstall=$(cat packages.list | wc -l)
compteur=1
(
while test $compteur != $(($packagesToInstall+1))
do
percent=$(awk -vn=$compteur -vx=$packagesToInstall 'BEGIN{print(n/x*100)}')
package=$(sed -n "${compteur}p" < packages.list)
echo $percent
if (( $compteur == $(($packagesToInstall+1)))); then
    echo "XXX"
    echo "Terminé"
    echo "XXX"
else
    echo "XXX"
    echo "Installation de $package"
    echo "XXX"
    sudo yaourt -Ss $package --needed --noconfirm --quiet
fi

compteur=`expr $compteur + 1`
sleep 1
done
) | dialog --gauge "Récuperation des fichier à télécharger..." 6 60 0

##
## Installation of games.list
##

packagesToInstall=$(cat games.list | wc -l)
compteur=1
(
while test $compteur != $(($packagesToInstall+1))
do
percent=$(awk -vn=$compteur -vx=$packagesToInstall 'BEGIN{print(n/x*100)}')
package=$(sed -n "${compteur}p" < games.list)
echo $percent
if (( $compteur == $(($packagesToInstall+1)))); then
    echo "XXX"
    echo "Terminé"
    echo "XXX"
else
    echo "XXX"
    echo "Installation de $package"
    echo "XXX"
    sudo yaourt -Ss $package --needed --noconfirm --quiet
fi

compteur=`expr $compteur + 1`
sleep 1
done
) | dialog --gauge "Récuperation des fichier à télécharger..." 6 60 0


# Configuration

$DIALOG --title " Configuration " --clear --yesno "Voulez-vous configurer Gnome ?" 25 50

case $? in
	0) wget -q https://raw.githubusercontent.com/ungarscool1/dotfile/master/files/scripts/installGnome.sh; chmod +x installGnome.sh; ./installGnome.sh;;
	1)	echo "Configuration de budgie décliné !";;
	255)	echo "Configuration de budgie décliné !";;
esac


$DIALOG --title " Configuration " --clear --yesno "Voulez-vous configurer discord ?" 25 50

case $? in
	0) echo "Configuration de discord en cours...";	echo "Connectez-vous"; discord;	echo "Configuration de discord, terminé";;
	1)	echo "Configuration de discord décliné !";;
	255)	echo "Configuration de discord décliné !";;
esac


$DIALOG --title " Configuration " --clear --yesno "Voulez-vous configurer spotify ?" 25 50

case $? in
	0) echo "Configuration de spotify en cours...";	echo "Connectez-vous et fermez spotify une fois connecté"; spotify;	echo "Configuration de spotify, terminé";;
	1)	echo "Configuration de spotify décliné !";;
	255)	echo "Configuration de spotify décliné !";;
esac

$DIALOG --title " Configuration " --clear --yesno "Voulez-vous configurer Messages Android ?" 25 50

case $? in
	0) 	wget -q https://raw.githubusercontent.com/ungarscool1/dotfile/master/scripts/compileMessage.sh; chmod +x compileMessage.sh; ./compileMessage.sh;;
	1)	echo "Configuration de Messages Android décliné !";;
	255)	echo "Configuration de Messages Android décliné !";;
esac


$DIALOG --title " Configuration " --clear --yesno "Voulez-vous configurer .bashrc ?" 25 50

case $? in
	0) echo "Configuration de .bashrc en cours...";	rm ~/.bashrc;	wget -q https://raw.githubusercontent.com/ungarscool1/dotfile/master/files/.bashrc; mv .bashrc ~/;	echo "Configuration de .bashrc, terminé";;
	1)	echo "Configuration de .bashrc décliné !";;
	255)	echo "Configuration de .bashrc décliné !";;
esac

$DIALOG --title " Configuration " --clear --yesno "Êtes-vous en dual boot avec Windows 10 (Legacy) ?" 25 50

case $? in
	0) 	wget -q https://raw.githubusercontent.com/ungarscool1/dotfile/master/scripts/dualBoot.sh; chmod +x dualBoot.sh; ./dualBoot.sh;;
	1)	echo "Configuration de grub décliné !";;
	255)	echo "Configuration de grub décliné !";;
esac

wget -q https://raw.githubusercontent.com/ungarscool1/dotfile/master/scripts/patch.sh
chmod +x patch.sh
./patch.sh

$DIALOG --title " Terminé " --clear --yesno "Voulez-vous redémarrer l'ordinateur, afin d'appliqué toutes les installations de pilotes et autres ?" 25 50

case $? in
	0) 	sudo shutdown -r now;;
	1)	echo "";;
	255)	echo "";;
esac

clear
