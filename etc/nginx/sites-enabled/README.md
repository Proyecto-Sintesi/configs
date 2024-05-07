# NGINX
Nginx és un famós programari de servidor web de codi obert. A la seva versió inicial, funcionava com a servidor HTTP. No obstant això, avui dia també serveix com a proxy invers, balancejador de càrrega HTTP i proxy de correu electrònic per a IMAP, POP3 i SMTP.

Comparat amb altres servidors web, com Apache, Nginx destaca pel seu rendiment, estabilitat i baix consum de recursos. Apache és un dels principals rivals de Nginx i té una gran comunitat d’usuaris.

## Instal·lar
```console
root@smix-ThinkPad-P1-Gen-5:/etc/nginx/sites-enabled# apt install nginx
Leyendo lista de paquetes... Hecho
Creando árbol de dependencias... Hecho
Leyendo la información de estado... Hecho
nginx ya está en su versión más reciente (1.18.0-6ubuntu14.4).
0 actualizados, 0 nuevos se instalarán, 0 para eliminar y 9 no actualizados.
```

## Verificar
```console
root@smix-ThinkPad-P1-Gen-5:/etc/nginx/sites-enabled# systemctl status nginx
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2024-05-07 15:28:34 CEST; 2h 5min ago
       Docs: man:nginx(8)
    Process: 164998 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
    Process: 164999 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
   Main PID: 165000 (nginx)
      Tasks: 21 (limit: 37931)
     Memory: 21.8M
        CPU: 325ms
     CGroup: /system.slice/nginx.service
             ├─165000 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
             ├─165001 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165002 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165003 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165004 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165005 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165006 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165007 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165008 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165009 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165010 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165011 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165012 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165013 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165014 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165015 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165016 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165017 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165018 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─165019 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             └─165020 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

may 07 15:28:34 smix-ThinkPad-P1-Gen-5 systemd[1]: Starting A high performance web server and a reverse proxy server...
may 07 15:28:34 smix-ThinkPad-P1-Gen-5 systemd[1]: Started A high performance web server and a reverse proxy server.
```


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

