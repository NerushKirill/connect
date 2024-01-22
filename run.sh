sudo apt update
sudo apt install -y openssh-server mc htop net-tools netcat nano git make

# read -p "Enter your new username: " user_name
user_name="ansible"
temp_password="TEMP_P@SSw0rd"

sudo useradd -m -s /bin/bash $user_name
echo "$user_name:$temp_password" | sudo chpasswd

sudo cp -r /home/$USER/connect/.ssh /home/$user_name/

sudo chmod 700 /home/$user_name/.ssh
sudo chmod 600 /home/$user_name/.ssh/authorized_keys
sudo chown -R $user_name:$user_name /home/$user_name/.ssh

# Settings SSH
sudo cp /home/$USER/connect/sshd_config /etc/ssh/sshd_config

sudo systemctl restart ssh

# Install docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
