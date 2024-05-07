# NGINX
Nginx és un famós programari de servidor web de codi obert. A la seva versió inicial, funcionava com a servidor HTTP. No obstant això, avui dia també serveix com a proxy invers, balancejador de càrrega HTTP i proxy de correu electrònic per a IMAP, POP3 i SMTP.

Comparat amb altres servidors web, com Apache, Nginx destaca pel seu rendiment, estabilitat i baix consum de recursos. Apache és un dels principals rivals de Nginx i té una gran comunitat d’usuaris.

## Configuració Pterodactyl i Mailcow
Les configuracions de Pterodactyl ens les proveixen ambes parts, es poden trobar a [Pterodactyl NGINX](https://pterodactyl.io/panel/0.7/webserver_configuration.html#nginx-without-ssl) i [Mailcow NGINX](https://docs.mailcow.email/post_installation/reverse-proxy/r_p-nginx/)

## Configuracions página principal, NetData i Webmin
Per aquestes configuracions hem utilitzat el reverse proxy d'NGINX, totes les configuracions mencionades son identiques canviant el port i el nom de domini on NGINX escolta (explicat a sota).

`server` indica una nova entrada de servidor

`server.server_name` ens serveix per especificar quin nom de domini escoltará, en aquest cas `virtualvista.com`

Per últim tenim `proxy_pass`, aquest especifica a quin enllaç NGINX redireccionará, per la web hem utilitzat `http://127.0.0.1:25500` que es on está allotjada.

```nginx
server {
        server_name virtualvista.com;
        listen 80;
        location /{
                proxy_pass http://127.0.0.1:25500;
                proxy_set_header Host $host;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
}
```

Les configuracions de NetData i Webmin son molt similars, es poden trobar a [NetData NGINX](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/nginx/sites-enabled/netdata.virtualvista.com.conf) i [Webmin NGINX](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/nginx/sites-enabled/webmin.virtualvista.com.conf)

## Demostració
### Página principal
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/fdfd51ab-3c61-4478-8f09-6918508e892d)

### Panell web
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/b0c887da-9005-443c-96be-0ba3419704a0)


### Mail
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/f8dc76c6-5898-4f74-9019-4cbeccd57ef1)


La instal·lació es pot llegir aqui [INSTALL.md](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/nginx/sites-enabled/INSTALL.md)
