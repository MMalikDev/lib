# Bitwarden

- Prerequisite

  ```bash
  apt update -y
  apt install -y apt-transport-https ca-certificates curl software-properties-common
  ```

- Docker Engine

  ```bash
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable"
  apt install docker-ce -y
  systemctl status docker
  ```

- Docker Compose

  ```bash
  curl -sL "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  docker-compose --version
  ```

- Add user

  ```bash
  useradd -G docker,sudo -s /bin/bash -m -d /opt/bitwarden bitwarden
  passwd bitwarden
  chown -R bitwarden: /opt/bitwarden
  su - bitwarden
  cd /opt/bitwarden
  ```

- Add bitwarden

  ```bash
  curl -Lso bitwarden.sh https://go.btwrdn.co/bw-sh
  chmod +x bitwarden.sh
  ./bitwarden.sh install
  ./bitwarden.sh start
  ```
