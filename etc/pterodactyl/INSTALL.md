# Instal·lació
El primer que tenim que fer per poder descarregar el Pterodactyl és afegir els repositoris mínims. La comanda següent és el que tenim que afegir desde root.


```console
# Add "add-apt-repository" command

apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg

# Add additional repositories for PHP, Redis, and MariaDB

LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

# Add Redis official APT repository

curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

# MariaDB repo setup script can be skipped on Ubuntu 22.04

curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash

# Update repositories list

apt update

# Install Dependencies

apt -y install php8.1 php8.1-{common,cli,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip} mariadb-server nginx tar unzip git redis-server


Després el que faré serà instal·lar Composer. Composer és un administrador de dependències per a PHP que ens permet enviar tot el que necessita quant a codi per a operar el Panell.

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

```

Continuarem creant la carpeta on viurà el panell i després moure'ns a ella carpeta recentment creada.

```console
sudo mkdir-p /var/www/pterodactyl
```

Després passarem a descarregar dins d'aquesta carpeta l'arxiu

```console
sudo curl -Lo panel.tar.gz http://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
```

Un cop descarregat el descomprimirem

```console
sudo tar-xzvf panel.tar.gz
```

Per acabar donarem permís com mostra la següent comanda
```console
sudo chmod -R 755 storage/* bootstrap/cache
```
Un cop fet tot això passarà començant amb la instal·lació, primer de tot necesitamos configurar algunos aspectos centrales del Panel. Dins del Mysql.

![image](https://github.com/Proyecto-Sintesi/configs/assets/165918288/b07d3eb1-81fe-4019-99c1-3bc9aae7420e)
