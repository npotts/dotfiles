all: 

.PHONY: base
base:
	#wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium-archive-keyring.gpg
	#echo 'deb [signed-by=/etc/apt/trusted.gpg.d/vscodium-archive-keyring.gpg] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
	sudo apt update
	sudo apt install -y zsh tmux vim  build-essential ack nmap socat tcpdump git tree jq  curl python3-yubikey-manager keepassx git-lfs yubikey-manager sqlite3 sqlitebrowser nnn # codi

pgadmin: base
	curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
	echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$$(lsb_release -cs) pgadmin4 main" | sudo tee /etc/apt/sources.list.d/pgadmin4.list
	sudo apt update
	sudo apt install pgadmin4-desktop

docker:
	sudo apt-get remove docker docker-engine docker.io containerd runc || true	
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &> /dev/null
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $$(/bin/lsb_release -cs) stable"
	sudo apt update
	sudo apt install apt-transport-https ca-certificates gnupg-agent software-properties-common docker-ce docker-ce-cli containerd.io
aws-ssm:
	curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
	sudo dpkg -i session-manager-plugin.deb

keybase:
	curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
	sudo apt install ./keybase_amd64.deb
beekeeper:
	wget --quiet -O - https://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add -
	echo "deb https://dl.bintray.com/beekeeper-studio/releases disco main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio.list
	sudo apt install beekeeper-studio
	sudo apt update

op:
	curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
	echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
	sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
	curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
	sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
	curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

.rz: PHONY
rz: base keybase aws-ssm
	sudo apt install -y awscli qgis docker spatialite-gui spatialite-bin postgis pipenv postgresql python3-virtualenv docker
	sudo -H pip install aws-sam-cli poetry black
	

