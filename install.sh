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
xcode-select --install
echo "XCode is installed? [y/n]"
read -n 1 -s REPLY
if [ "$REPLY" = "y" ]; then
	echo -ne "\nInstalling...\n"
else
	echo -ne "\nAborting\n"
	exit 0
fi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ansible awscli openstackclient pinentry pkg-config git-crypt gnupg terraform neofetch xz yarn nvm leptonica tesseract

echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp config/.zshrc ~/.zshrc