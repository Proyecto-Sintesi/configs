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

