# Instal·lació
Primer començarem instal·lant totes les dependències requerides de Pterodactyl.

### MariaDB
```console
## Get apt updates
apt update -y

## Install MariaDB
apt install -y mariadb-common mariadb-server mariadb-client

## Start MariaDB
systemctl start mariadb
systemctl enable mariadb
```


