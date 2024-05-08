# Mailcow
Mailcow és una col·lecció de paquets de programari de codi obert (Dovecot, ClamAV, Memcached, Redis, MySQL, Unbound, PHP-*FPM, Postfix, Lets Encrypt, Nginx, Rmilter, Rspamd, SOGo, Fail2ban) que juntament amb la interfície d'usuari de mailcow conformen un servidor de correu que funciona molt bé.
## Preparació

### Ports necessaris
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

