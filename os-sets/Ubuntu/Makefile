all: 

.PHONY: base
base:
	wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium-archive-keyring.gpg
	#echo 'deb [signed-by=/etc/apt/trusted.gpg.d/vscodium-archive-keyring.gpg] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
	sudo apt update
	sudo apt install -y zsh tmux vim  build-essential ack nmap socat tcpdump git tree jq  curl python3-yubikey-manager keepass2 nnn # codium

	


.rz: PHONY
rz: base
	wget --quiet -O - https://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add -
	echo "deb https://dl.bintray.com/beekeeper-studio/releases disco main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio.list
	sudo apt update
	sudo apt install -y awscli qgis docker spatialite-gui postgis pipenv postgresql python3-virtualenv
	
	sudo apt install beekeeper-studio
	sudo -H pip install aws-sam-cli poetry black
	
