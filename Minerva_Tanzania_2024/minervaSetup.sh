# Connect odroid M1 to display, 12v power source, and keyboard, boot into U-boot (Bootloader)
# select exit to shell, run the following commands:


## pb-update
## netboot_default

# select exit to shell
# select ubuntu 22 as installed OS, follow onscreen for install onto NVME2 drive, use full partition




# Once OS install is complete, run the following script as executable

# pdate the system
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Install basic tools
sudo apt install openssh-server curl wget git vim build-essential -y

# Enable and start SSH
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh


# Set up automatic updates (optional)
# sudo apt install unattended-upgrades -y
# sudo dpkg-reconfigure --priority=low unattended-upgrades

# Reboot
sudo reboot

# install docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-ce -y
sudo systemctl status docker

#install kiwix serve ARM image (check kiwix github container storage for latest)
#latest as of July 2024
docker pull ghcr.io/kiwix/kiwix-serve:3.7.0@sha256:cdd28e1f37eeddb87810be5ba1103fb44b461bb7fde36b8765022f7c3d2e97ae


# start kiwix with restart always
sudo docker run -d --restart unless-stopped -v /var/lib/kiwix:/data -p 8096:8080 ghcr.io/kiwix/kiwix-serve:latest *.zim

#kolibri setup and install
sudo add-apt-repository ppa:learningequality/kolibri
sudo apt-get update
sudo apt-get install kolibri


# optional nextcloud setup
# sudo docker run \
# --init \
# --sig-proxy=false \
# --name nextcloud-aio-mastercontainer \
# --restart always \
# --publish 80:80 \
# --publish 8095:8080 \
# --publish 8443:8443 \
# --volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
# --volume /var/run/docker.sock:/var/run/docker.sock:ro \
# nextcloud/all-in-one:latest



# Run kiwixContentInstall.sh for content kiwixContentInstall
# Navigate to kolibri port for kolibri studio content install

# install size ~800GB of content, allow 72 hours. Kiwix torrent files are available for larger files

