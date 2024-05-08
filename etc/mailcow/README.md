# Mailcow
Mailcow és una col·lecció de paquets de programari de codi obert (Dovecot, ClamAV, Memcached, Redis, MySQL, Unbound, PHP-*FPM, Postfix, Lets Encrypt, Nginx, Rmilter, Rspamd, SOGo, Fail2ban) que juntament amb la interfície d'usuari de mailcow conformen un servidor de correu que funciona molt bé.
## Preparació

### Ports necessaris
Abans d'instal·lar el servei de Mailcow necessitarem obrir els següents ports.
|       Service       |  Port  |
|:-------------------:|:------:|
|     Postfix SMTP    |   25   |
|    Postfix SMTPS    |   465  |
|    Postfix SMTPS    |   587  |
|     Dovecot IMAP    |   143  |
|    Dovecot IMAPS    |   993  |
|     Dovecot POP3    |   110  |
|    Dovecot POP3S    |   995  |
| Dovecot ManageSieve |  4190  |
|       HTTP(S)       | 80/443 |

### DNS
Configurat a [/etc/bind/README.md](https://github.com/Proyecto-Sintesi/configs/tree/main/etc/bind#correu)

## Instal·lació
Instal·larem Docker compose, aquest software ens permetra encapsular cada micro servei de Mailcow per monitoritzar i manipular cadascun.
![image93](https://github.com/Proyecto-Sintesi/configs/assets/122394285/1f11f903-806e-4a8f-993f-aa1d2d3db57e)

Clonarem el repositori
![image50](https://github.com/Proyecto-Sintesi/configs/assets/122394285/d2cfe608-3f1f-433d-bb38-93713ce8bfb3)

Utilitzarem l'script `generate_config.sh` per generar la configuració predeterminada.
![image56](https://github.com/Proyecto-Sintesi/configs/assets/122394285/2d1e1d1b-a020-4758-9961-870640f1bcae)

## Configuració
Mailcow utilitza el port 8080 per el seu panell web, però el port 8080 ja esta en ús per [Pterodactyl (Wings)](https://github.com/Proyecto-Sintesi/configs/tree/main/etc/pterodactyl#wings).
Per canviar el port obrirem l'arxiu [/etc/mailcow-dockerized/mailcow.conf](https://google.com) i canviarem el `HTTP_PORT` a 8880 i el `HTTPS` a 8443 ja que esta en ús per [NGINX](https://github.com/Proyecto-Sintesi/configs/tree/main/etc/nginx/sites-enabled).

```conf
HTTP_PORT=8880
HTTPS_PORT=8443
```

Com utilitzarem NGINX per aprofitar el domini `mail.virtualvista.com` utilitzant el reverse proxy que ofereix, establirem el `HTTP/S_BIND` a `127.0.0.1` (localhost), per que només escolti per aquesta interficie de xarxa.
```conf
HTTP_BIND=127.0.0.1
HTTPS_BIND=127.0.0.1
```

Un cop configurats els ports i adreçes procedirem a iniciar el servei
```console
docker compose pull
docker compose up -d
```

Un cop iniciat haurem de configurar l'NGINX per poder accedir al servei amb [la configuració que ens proveeix la documentació](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/nginx/sites-enabled/mailcow.conf)


Un cop configurat NGINX veurem el panell d'inici de sessió d'administrador.
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/f65c68b8-4d80-4694-a995-9cfc3a1c9c8a)

Iniciem sessió amb les credencials proveïdes a la instal·lació o les regenerem amb el script `/etc/mailcow-dockerized/helper-scripts/mailcow-reset-admin.sh`
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/352d7fcc-3c90-4654-b1cb-4c058b897b7e)

Seguidament crearem el nostre usuari
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/b317ac5b-ad63-4f28-9a94-8a6d2978de28)

Per comprovar el nostre compte iniciant sessió a [https://mail.virtualvista.com/SOGo](https://mail.virtualvista.com/SOGo).
SOGo es el nostre panell de correu electrònic, on podem enviar i rebre correus a més d'altres funcions con calendari i recordatoris.

![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/64190c0d-d245-47da-a983-cf559f519177)
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/3ecae75e-81af-4952-a33d-559f6f0eb4c7)


