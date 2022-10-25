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
brew install ansible libgcrypt openjdk@17 awscli libgpg-error openssl@1.1 bdw-gc libidn2 openstackclient brotli libksba p11-kit c-ares libnghttp2 pinentry ca-certificates libtasn1 pkg-config gdbm libtool python@3.10 gettext libunistring pyyaml git-crypt libusb readline gmp libuv screenresolution gnupg libyaml six gnutls m4 sqlite go mpdecimal terraform guile neofetch unbound icu4c nettle xz libassuan npth yarn libevent nvm
brew install --cask dotnet-sdk flameshot
