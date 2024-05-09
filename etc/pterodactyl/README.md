# PTERODACTYL

Pterodactyl és el panell d'administració de servidors de jocs de codi obert construït amb PHP, React i Go. Dissenyat amb tenint en compte la seguretat, Pterodactyl executa tots els servidors de jocs en contenidors Docker aïllats mentre exposa un bell i una interfície d'usuari intuïtiva per a administradors i usuaris.

Admetem una gran varietat de jocs mitjançant l'ús de contenidors Docker per a aïllar cada instància, la qual cosa li brinda el poder per a allotjar els seus jocs a tot el món sense haver d'inflar cada màquina física amb dependències addicionals.


Alguns dels principals jocs compatibles inclouen:

- Minecraft
- Rust
- Terraria
- Teamspeak
- Team Fortress 2
- Counter Strike: Global Offensive
- Garry's Mod
- ARK: Survival Evolved

Pterodactyl és completament de codi obert i, com a tal, està completament obert a usuaris i auditors independents per a navegar pel nostre base de codi i cerca de problemes de seguretat.

## Panell
El panell web es l'eïna visible cap als clients, es la part des d'on s'administren els servidors.

Per configurar aquesta part es fa tot a través de comandas:

### Configuració general

Serveix per iniciar la configuració del servei Pterodactyl, on s'estableixen els permisos, encriptació etc.
```console
php artisan p:enviroment:setup
```

Serveix per a configurar l'emmagatzematge de dades.
```console
php artisan p:enviroment:setup
```

La següent comanda crea la base de dades especificada en la comanda anterior, crea les taules necessaries i configura la cache, amb redis o amb arxius depenent de la configuració.
```console
php artisan migrate --seed --force
```

Serveix per configurar el sistema de correu, per canviar contrasenyes, renovacions de servidors etc.
```console
php artisan p:enviroment:mail
```

### Configuració d'usuaris

Creació d'usuaris
```console
php artisan p:user:make
```

Esborrar usuaris
```console
php artisan p:user:delete
```
## Wings
Wings es l'eïna que s'encarrega de connectar el panell web i el servidor a través de la seva API, configurada en l'arxiu `config.yml`.

```yml
api:
  host: 0.0.0.0
  port: 8080
  ssl:
    enabled: false
    cert: /etc/letsencrypt/live/panel.virtualvista.com/fullchain.pem
    key: /etc/letsencrypt/live/panel.virtualvista.com/privkey.pem
  disable_remote_download: false
  upload_limit: 100
  trusted_proxies: []
```


![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/e237c539-11d5-4a13-9013-07ae5e32bdc9)


La instal·lació es pot llegir aqui [INSTALL.md](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/pterodactyl/INSTALL.md)

<p><a href="https://github.com/Proyecto-Sintesi/configs/tree/main/etc/nginx/sites-enabled">Servei anterior</a> - <a href="https://github.com/Proyecto-Sintesi/configs/blob/main/etc/mailcow">Següent servei</a></p>
