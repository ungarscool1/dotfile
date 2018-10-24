echo "Le dotfile est customiser pour mon utilisation !"
echo "L'installateur est a utiliser à vos riques et périls !"
echo "Êtes-vous d'accord pour installer le dotfile ? [Entrer pour valider / ^C pour quitter]"
read imok
echo -n "Requesting sudoeur..."
sudo echo "Votre mot de passe est enregistrer pour la durée de l'installation"

# Installation

echo "Installation de yaourt..."
sudo pacman -S yaourt wget
echo "Terminé"
echo " "
echo " "
echo "Téléchargement de la liste des packets à télécharger"
wget -q https://github.com/ungarscool1/dotfile/raw/master/packages/packages.list
wget -q https://github.com/ungarscool1/dotfile/raw/master/packages/games.list
echo "Terminé"
echo " "
echo " "
echo "Téléchargement de la liste des packets packages.list"
echo " "
echo "Les paquets suivants vont être télécharger: "
cat packages.list
echo "Êtes vous sûr ? [ENTRER pour continuer]"
read sur1
cat packages.list | xargs yaourt -S --needed --noconfirm

echo " "
echo " "
echo "Téléchargement de la liste des packets games.list"
echo "Les paquets suivants vont être télécharger: "
cat games.list
echo "Êtes vous sûr ? [ENTRER pour continuer]"
read sur2
cat games.list | xargs yaourt -S --needed --noconfirm


# Configuration
echo -n "Voulez-vous configurer les tray-icons et gnome ? [O/n]"
read configTray
if [ -z $configTray ] || [ $configTray = 'y' ] || [ $configTray = 'Y' ] || [ $configTray = 'yes' ] || [ $configTray = 'YES' ] || [ $configTray = 'o' ] || [ $configTray = 'O' ] || [ $configTray = 'oui' ] || [ $configTray = 'OUI' ]
then
	echo "Configuration de gnome en cours..."
	echo "Appuyez sur OFF, puis le switch passe sur ON"
	xdg-open https://extensions.gnome.org/extension/1031/topicons/
	echo "Avez-vous passer de OFF à ON ? [ENTRER si c'est le cas]"
	read configTrayExtOn
	echo "Allez dans extentions, puis chercher TopIcons Plus"
	gnome-tweaks
	echo "C'est bon ? [ENTRER si c'est le cas]"
	read configTrayExtOk
	echo "Téléchargement de la configuration de TopIcons Plus..."
	wget -q https://github.com/ungarscool1/dotfile/raw/master/files/topIconsPlus/extension.js
	mv extension.js ~/.local/share/gnome-shell/extensions/TopIcons@phocean.net/

	echo "Appuyez sur OFF, puis le switch passe sur ON"
	xdg-open https://extensions.gnome.org/extension/118/no-topleft-hot-corner/
	echo "Avez-vous passer de OFF à ON ? [ENTRER si c'est le cas]"
	read configHotConerExtOn
	echo "Allez dans extentions, puis chercher No hot corner"
	gnome-tweaks
	echo "C'est bon ? [ENTRER si c'est le cas]"
	read configHotConerExtOk
	echo " "
	echo " "
	echo "Téléchargement du theme Yaru"
	wget -q https://github.com/ungarscool1/dotfile/raw/master/files/Yaru.zip
	unzip Yaru.zip
	sudo mv Yaru /usr/shares/themes/
	sudo mv Yaru-dark /usr/shares/themes/
	echo "Veuillez appliquer le theme"
	gnome-tweaks
else
	echo "Configuration de gnome décliné !"
fi

echo -n "Voulez-vous configurer discord ? [O/n]"
read configDiscord
if [ -z $configDiscord ] || [ $configDiscord = 'y' ] || [ $configDiscord = 'Y' ] || [ $configDiscord = 'yes' ] || [ $configDiscord = 'YES' ] || [ $configDiscord = 'o' ] || [ $configDiscord = 'O' ] || [ $configDiscord = 'oui' ] || [ $configDiscord = 'OUI' ]
then
	echo "Configuration de discord en cours..."
	echo "Connectez-vous et fermez discord une fois connecté"
	discord
else
	echo "Configuration de discord décliné !"
fi

echo " "
echo " "
echo -n "Voulez-vous configurer spotify ? [O/n]"
read configSpotify
if [ -z $configSpotify ] || [ $configSpotify = 'y' ] || [ $configSpotify = 'Y' ] || [ $configSpotify = 'yes' ] || [ $configSpotify = 'YES' ] || [ $configSpotify = 'o' ] || [ $configSpotify = 'O' ] || [ $configSpotify = 'oui' ] || [ $configSpotify = 'OUI' ]
then
	echo "Configuration de spotify en cours..."
	echo "Connectez-vous et fermez spotify une fois connecté"
	spotify
else
	echo "Configuration de spotify décliné !"
fi

echo " "
echo " "
echo -n "Voulez-vous configurer Messages Android ? [O/n]"
read configmsgAndroid
if [ -z $configmsgAndroid ] || [ $configmsgAndroid = 'y' ] || [ $configmsgAndroid = 'Y' ] || [ $configmsgAndroid = 'yes' ] || [ $configmsgAndroid = 'YES' ] || [ $configmsgAndroid = 'o' ] || [ $configmsgAndroid = 'O' ] || [ $configmsgAndroid = 'oui' ] || [ $configmsgAndroid = 'OUI' ]
then
	echo "Configuration de messages Android en cours..."
	
	sudo npm install nativefier -g
	wget -q https://github.com/ungarscool1/dotfile/raw/master/files/android-messages-icon.png
	wget -q https://github.com/ungarscool1/dotfile/raw/master/files/Messages%20Android.desktop -o Messages\ Android.desktop
	mv Messages\ Android.desktop ~/.local/share/applications/
	nativefier --name "Messages Android" --icon "android-messages-icon.png" https://messages.android.com/
	sudo mkdir /opt/ungarscool1
	sudo mv messages-android-linux-x64 /opt/ungarscool1/messages-android
	sudo ln /opt/ungarscool1/messages-android/messages-android /bin/messages-android
	echo "Connectez-vous et fermez Messages Android une fois connecté"
	/opt/ungarscool1/messages-android/messages-android
else
	echo "Configuration de Messages Android décliné !"
fi



# Nettoyage...
echo " "
echo " "
echo "Nettoyage..."
rm Yaru.zip packages.list games.list android-messages-icon.png
