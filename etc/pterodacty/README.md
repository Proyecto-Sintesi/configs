Pterodactyl és el panell d'administració de servidors de jocs de codi obert construït amb PHP, React i Go. Dissenyat amb tenint en compte la seguretat, Pterodactyl executa tots els servidors de jocs en contenidors Docker aïllats mentre exposa un bell i una interfície d'usuari intuïtiva per a administradors i usuaris.

El primer que tenim que fer per poder descarregar el Pterodactyl és afegir els repositoris mínims. La comanda següent és el que tenim que afegir desde root.
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

Continuarem creant la carpeta on viurà el panell i després moure'ns a ella carpeta recentment creada.
explicar!








Un cop fet tot això passarà començant amb la instal·lació, primer de tot necesitamos configurar algunos aspectos centrales del Panel.





Una cop fet això copiarem el nostre arxiu de configuració d'entorn predeterminat, instal·larem les dependències principals i, a continuació, generarem un arxiu Nova clau de xifratge d'aplicacions.








Un cop instal·lat configurarem el entorn. L'entorn central de Pterodactyl es configura fàcilment mitjançant alguns comandos CLI diferents integrats en l'aplicació. Aquest pas cobrirà la configuració de coses com a sessions, emmagatzematge en caixet, credencials de base de dades i enviament de correu electrònic.














Ara hem de configurar totes les dades basi per al Panell en la base de dades que vas crear anteriorment. El següent comando pot trigar algun temps a executar-se depenent de la seva màquina. Si us plau, NO surti del procés fins que s'hagi completat! Aquest configurarà les taules de la base de dades i després agregarà tots els nius i ous que alimenten a Pterodactyl.




A continuació, haurà de crear un usuari administratiu per a poder iniciar sessió en el panell. Per a això, executi el següent comando. En aquest moment les contrasenyes han de complir amb els següents requisits: 8 caràcters, majúscules i minúscules, almenys un número.





El que farem serà pujar el domini mitjançant el nagios. En primer lloc, eliminem la configuració predeterminada de NGINX.




Canviarem el proprietary de tots els arxius a dins de /var/www/pterodactyl, aquest usuari i grup son els encarregats d’executar els serveis web.


Ara configurarem el servei web, canviarem el contingut de l’arxiu /etc/nginx/sites-enabled/pterodactyl.conf amb la configuració predeterminada de Pterodactyl
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

Reiniciarem el servei d’NGINX i confirmarem que s’ha configurat tot correctament





Una vegada iniciada la sessió veurem un llistat dels nostres servidorsPer poder configurar un nou node haurem de crear una nova localització en el panell d’admin




Una vegada creat, podrem crear un nou node a aquesta localització, cada localització pot tenir N nodes i cada node pot contenir N servidors, pre exemple podriem tenir dos localitzacions differents, una a Espanya amb dos nodes i un altre a Alemanya amb un sol node



En la pestanya d’”Allocations” podrem configurar quins ports s’utilitzaran per cada servidor.


Una vegada fet això ja podrem crear els nostres servidors. El primer servidor que crearem serà un de prova, amb una configuració predeterminada d’un servidor de Minecraft.

En la pagina de creació de servidors podrem configurar els recursos que utilitzara cada servidor, com RAM, CPU, memòria swap, quantitat de bases de dades…

A més de la configuració per servidor, en aquest cas quin software de servidor utilitzar, la versió o altres
Una vegada creat el podrem veure a la llista mencionada anteriorment



Si entrem al servidor de Minecraft veurem el panell d’administrador, on es pot utilitzar la consola i modificar els paràmetres d’aquest servidor.




Utilitzant la IP que apareix ens podrem connectar al servidor. Fent un nmap podem comprovar com el servidor es public.





Per instal·lar differents tipus de servidors haurem d’instal·lar els anomenats “Eggs”, en el panell tenim els “Nests” o nius que s’encarregan d’agrupar els “Eggs”, i cada egg es un tipus de servidor. En la imatge es mostra el “Nest” de Minecraft.



Per instal·lar eggs externs es pot utilitzar l’eina d’importació.
En aquest cas m’he descarregat el egg de python i l’he importat per poder executar la nostra página web.


