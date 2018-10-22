echo "Le dotfile est customiser pour mon utilisation !"
echo "L'installateur est a utiliser à vos riques et périls !"
echo "Êtes-vous d'accord pour installer le dotfile ? [Entrer pour valider / ^C pour quitter]"
read imok
echo -n "Requesting sudoeur..."
sudo echo "Votre mot de passe est enregistrer pour la durée de l'installation"

# Installation des paquets

echo -n "Voulez-vous installer ungs-utils (v2.0beta.3) ? [o/N]"
read installUngsUtils
if [ -z $installUngsUtils ] || [ $installUngsUtils = 'y' ] || [ $installUngsUtils = 'Y' ] || [ $installUngsUtils = 'yes' ] || [ $installUngsUtils = 'YES' ] || [ $installUngsUtils = 'o' ] || [ $installUngsUtils = 'O' ] || [ $installUngsUtils = 'oui' ] || [ $installUngsUtils = 'OUI' ]
then
	echo "Installation de Java 8..."
	echo "Si vous trouvez que l'installation est trop longue, merci de patienter..."
	sudo pacman -S jre8-openjdk --quiet
	wget https://github.com/ungarscool1/ungs-bash/releases/download/v2.0beta.3/ungs-utils.jar
        wget https://github.com/ungarscool1/ungs-bash/releases/download/v2.0beta.3/ungs-utils
	chmod +x ungs-utils
	sudo mkdir /opt/ungarscool1
	sudo mkdir /opt/ungarscool1/ungs-utils
	sudo mv ungs-utils.jar /opt/ungarscool1/ungs-utils/
	sudo chmod 777 /opt/ungarscool1/ungs-utils
	sudo chmod 777 /opt/ungarscool1/ungs-utils*
	sudo chmod 777 /opt/ungarscool1/ungs-utils/*
	sudo mv ungs-utils /bin/
else
	echo "ungs-utils ne sera pas installé"
fi

echo "Installation de Steam"
sudo pacman -S steam --quiet
echo "Installation de Yaourt pour pouvoir utiliser AUR"
sudo pacman -S yaourt --quiet
echo "Installation de powerline et de powerline-fonts"
sudo pacman -S powerline powerline-fonts
echo " "
echo " "
echo "Installation de discord"
echo "Validation des public key"
gpg --recv-keys --keyserver hkp://pgp.mit.edu 0FC3042E345AD05D
echo "Terminé..."
echo -n "Êtes-vous là ? [ENTRER pour oui]"
read imhere1
echo -n "Taper 10 quand on vous demande quel discord est a installer, ok ? [ENTRER pour ok]"
read okdiscord
yaourt discord --noconfirm
echo "Terminé..."
echo " "
echo " "
echo "Installation de spotify"
echo -n "Êtes-vous là ? [ENTRER poour oui]"
read imhere2
echo -n "Taper 36 quand on vous demande quel spotify est a installer, ok ? [ENTRER pour ok]"
read okspotify
yaourt spotify --noconfirm

# Configuration
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
