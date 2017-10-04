echo -n "Mot de passe sudo:"
sudo echo "Votre mot de passe à été retenue pour l'installation"
## INSTALL
sudo apt install python-pip
sudo pip install powerline-shell
sudo apt install steam
cd 
## BASH
wget https://raw.githubusercontent.com/ungarscool1/dotfile/master/files/.bashrc
wget https://raw.githubusercontent.com/ungarscool1/dotfile/master/files/.powerline-shell.json
## Google Chrome && IDEA
mkdir tempo
cd tempo
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://download-cf.jetbrains.com/idea/ideaIU-2017.2.5.tar.gz
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo mkdir /Programs
sudo chown leo:leo /Programs
mv ideaIU-2017.2.5.tar.gz /Programs
tar xvzf /Programs/ideaIU-2017.2.5.tar.gz
cd /Programs/
mv ideaIU-2017.2.5 idea
./idea/bin/idea.sh
cd ~/tempo
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
wget https://raw.githubusercontent.com/ungarscool1/ungs-bash/master/installer.sh
sudo sh installer.sh
cd
ungs-utils git ungarscool1/MonFramework

