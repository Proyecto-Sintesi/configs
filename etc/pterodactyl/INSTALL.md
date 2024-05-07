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

![image19](https://github.com/Proyecto-Sintesi/configs/assets/165918288/f1fe284f-64c4-407d-ac17-171a943449f1)

![image67](https://github.com/Proyecto-Sintesi/configs/assets/165918288/079aacf7-8804-4e37-b269-5f8370077dce)

![image40](https://github.com/Proyecto-Sintesi/configs/assets/165918288/ef4f4f22-b0ab-4954-a623-19afc2dcd1e4)

El que hem fet anterior ment és configurar el panel de forma que és podes mostra amb els serveis.

Ara hem de configurar totes les dades basi per al Panell en la base de dades que vas crear anteriorment. El següent comando pot trigar algun temps a executar-se depenent de la seva màquina. Si us plau, NO surti del procés fins que s'hagi completat! Aquest configurarà les taules de la base de dades i després agregarà tots els nius i ous que alimenten a Pterodactyl.

```console
sudo php artisan migrate --seed --force
```
A continuació, haurà de crear un usuari administratiu per a poder iniciar sessió en el panell. Per a això, executi el següent comando. En aquest moment les contrasenyes han de complir amb els següents requisits: 8 caràcters, majúscules i minúscules, almenys un número.

![image62](https://github.com/Proyecto-Sintesi/configs/assets/165918288/9ada144e-5b04-4627-8454-e6e090225747)

El que farem serà pujar el domini mitjançant el nagios. En primer lloc, eliminem la configuració predeterminada de NGINX.

```console
smix@smix-ThinkPad-P1-Gen-5:/etc/nginx/sites-enabled$ sudo rm default
```
Canviarem el proprietary de tots els arxius a dins de /var/www/pterodactyl, aquest usuari i grup son els encarregats d’executar els serveis web.

```console
root@smix-ThinkPad-P1-Gen-5:/var/www/pterodactyl# chown -R www-data:www-data *
```
Ara configurarem el servei web, canviarem el contingut de l’arxiu /etc/nginx/sites-enabled/pterodactyl.conf amb la configuració predeterminada de Pterodactyl

```console
server {
    # Replace the example <domain> with your domain name or IP address
    listen 6969;
    server_name panel.virtualvista.com;

    root /var/www/pterodactyl/public;
    index index.html index.htm index.php;
    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/pterodactyl.app-error.log error;

    # allow larger file uploads and longer script runtimes
    client_max_body_size 100m;
    client_body_timeout 120s;

    sendfile off;

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param PHP_VALUE "upload_max_filesize = 100M \n post_max_size=100M";
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param HTTP_PROXY "";
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }

    location ~ /\.ht {
        deny all;
    }
}

```
Reiniciarem el servei d’NGINX i confirmarem que s’ha configurat tot correctament

```console
root@smix-ThinkPad-P1-Gen-5:/var/www/pterodactyl# systemctl restart nginx
```

Una vegada iniciada la sessió veurem un llistat dels nostres servidors, per poder configurar un nou node haurem de crear una nova localització en el panell d’admin.

![image18](https://github.com/Proyecto-Sintesi/configs/assets/165918288/6958cc2e-47a4-41bb-8233-ae61d3f8266f)

Una vegada creat, podrem crear un nou node a aquesta localització, cada localització pot tenir N nodes i cada node pot contenir N servidors, pre exemple podriem tenir dos localitzacions differents, una a Espanya amb dos nodes i un altre a Alemanya amb un sol node.

![image26](https://github.com/Proyecto-Sintesi/configs/assets/165918288/fe58bfb7-ee52-4ba1-aad6-30ba6c88a65e)

En la pestanya d’”Allocations” podrem configurar quins ports s’utilitzaran per cada servidor.

![image74](https://github.com/Proyecto-Sintesi/configs/assets/165918288/10b88c19-4531-4d09-a899-d64cb84ff1cc)

Una vegada fet això ja podrem crear els nostres servidors. El primer servidor que crearem serà un de prova, amb una configuració predeterminada d’un servidor de Minecraft.

En la pagina de creació de servidors podrem configurar els recursos que utilitzara cada servidor, com RAM, CPU, memòria swap, quantitat de bases de dades…

![image76](https://github.com/Proyecto-Sintesi/configs/assets/165918288/c4675614-a13e-4782-acbb-4cd04bf0d34f)

A més de la configuració per servidor, en aquest cas quin software de servidor utilitzar, la versió o altres.

![image45](https://github.com/Proyecto-Sintesi/configs/assets/165918288/b7ae9f2d-6cd7-4043-a3f1-7f0c222584b5)

Una vegada creat el podrem veure a la llista mencionada anteriorment.

![image91](https://github.com/Proyecto-Sintesi/configs/assets/165918288/73a6d1d4-b146-41c0-9b61-2b2dd63a1b46)

Si entrem al servidor de Minecraft veurem el panell d’administrador, on es pot utilitzar la consola i modificar els paràmetres d’aquest servidor.

![image77](https://github.com/Proyecto-Sintesi/configs/assets/165918288/59fc4de2-13ff-4a4b-882b-d6c223a0f703)


Utilitzant la IP que apareix ens podrem connectar al servidor. Fent un nmap podem comprovar com el servidor es public.

![image12](https://github.com/Proyecto-Sintesi/configs/assets/165918288/c0418792-4420-434d-9ad7-829519872fc5)


Per instal·lar differents tipus de servidors haurem d’instal·lar els anomenats “Eggs”, en el panell tenim els “Nests” o nius que s’encarregan d’agrupar els “Eggs”, i cada egg es un tipus de servidor. En la imatge es mostra el “Nest” de Minecraft.

![image81](https://github.com/Proyecto-Sintesi/configs/assets/165918288/46e8a17a-e4a0-49ad-b528-68efa5ab577b)

Per instal·lar eggs externs es pot utilitzar l’eina d’importació.

![image79](https://github.com/Proyecto-Sintesi/configs/assets/165918288/8b7b3e94-1860-438c-9d80-7c7fcd534827)

En aquest cas m’he descarregat el egg de python i l’he importat per poder executar la nostra página web.

