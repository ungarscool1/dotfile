echo -ne "Are-you sure you want to install the script? [y/n] "
read -n 1 -s REPLY
if [ "$REPLY" = "y" ]; then
	echo -ne "\nInstalling...\n"
else
	echo -ne "\nAborting\n"
	exit 0
fi

echo "Requesting sudo password"
sudo echo "Your sudo password is registered while installing the script"

# Installation

echo "Installing wget zsh git"
sudo pacman -Sq wget git zsh

echo "Installing plasma"
sudo wget -q -O /usr/lib/sddm/sddm.conf.d/default.conf https://github.com/ungarscool1/dotfile/raw/master/conf/sddm.conf

echo "Installing dev tools"
sudo pacman -S base-devel
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit

wget -q https://github.com/ungarscool1/dotfile/raw/master/packages/packages.list
echo "Installing packages"
sudo pacman -Sy --noconfirm $(cat packages.list)
rm packages.list

echo "Installing yay"
git clone https://aur.archlinux.org/yay.git
sudo mv yay /opt/yay
sudo chown -R $USER:$USER /opt/yay
cd /opt/yay
makepkg -si
cd $HOME

wget -q https://github.com/ungarscool1/dotfile/raw/master/packages/aur.list
echo "Installing AUR packages"
yay -S $(cat aur.list)
rm aur.list

echo "Trackpad driver"
git clone https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver
cd ./asus-touchpad-numpad-driver
echo -ne "2\n2\n" | sudo ./install.sh
cd ..

# Configuration

echo "-- Configuring the script --"
echo -ne " |- zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -ne "\r |- zsh\n"
echo -ne " |- git"
git config --global user.name "Léo Godard"
git config --global user.email "leo.godard@epitech.eu"
git config --global gpg.program gpg2
echo -ne "\r |- git\n"
echo -ne " |- gpg (RSA², 4096)"
wget -q -O ~/.gnupg/gpg-agent.conf https://github.com/ungarscool1/dotfile/raw/master/conf/sddm.conf
gpg --full-gen-key
echo -ne "\r |- gpg\n"


clear
