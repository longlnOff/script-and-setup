# Install docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce


# Install nvidia-docker toolkit
sudo apt-get install -y nvidia-container-toolkit
sudo apt install -y nvidia-docker2
sudo systemctl daemon-reload
sudo systemctl restart docker