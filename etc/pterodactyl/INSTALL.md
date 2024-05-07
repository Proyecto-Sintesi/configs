# Instal·lació
El primer que tenim que fer per poder descarregar el Pterodactyl és afegir els repositoris mínims. La comanda següent és el que tenim que afegir desde root.


```
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

Una cop fet això copiarem el nostre arxiu de configuració d'entorn predeterminat, instal·larem les dependències principals i, a continuació, generarem un arxiu Nova clau de xifratge d'aplicacions

```console
sudo cp .env.example .env

sudo composer install --no-dev --optimize-autoloader
```
![image25](https://github.com/Proyecto-Sintesi/configs/assets/165918288/80557e08-7ab4-4855-a3ae-1f22b2001c10)

```console
sudo php artisan key:generate --force
```

Un cop instal·lat configurarem el entorn. L'entorn central de Pterodactyl es configura fàcilment mitjançant alguns comandos CLI diferents integrats en l'aplicació. Aquest pas cobrirà la configuració de coses com a sessions, emmagatzematge en caixet, credencials de base de dades i enviament de correu electrònic.

![image88](https://github.com/Proyecto-Sintesi/configs/assets/165918288/94fe12c7-b91a-48f6-9047-a7892c87d82b)

![image31](https://github.com/Proyecto-Sintesi/configs/assets/165918288/27c43b74-1e9d-4c2a-850c-f016a383ca07)

![image5](https://github.com/Proyecto-Sintesi/configs/assets/165918288/1b3ed28d-f1a9-4e96-8e9f-31e43adfcf0d)





