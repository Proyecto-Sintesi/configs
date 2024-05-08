# BIND9
## Instal·lar
```console
root@smix-ThinkPad-P1-Gen-5:/etc/nginx/sites-enabled# apt install bind9
Leyendo lista de paquetes... Hecho
Creando árbol de dependencias... Hecho
Leyendo la información de estado... Hecho
bind9 ya está en su versión más reciente (1:9.18.18-0ubuntu0.22.04.2).
0 actualizados, 0 nuevos se instalarán, 0 para eliminar y 9 no actualizados.
```

## Verificar
```console
root@smix-ThinkPad-P1-Gen-5:/etc/nginx/sites-enabled# systemctl status bind9
● named.service - BIND Domain Name Server
     Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2024-05-06 15:15:51 CEST; 1 day 1h ago
       Docs: man:named(8)
   Main PID: 1182 (named)
      Tasks: 62 (limit: 37931)
     Memory: 47.2M
        CPU: 11.975s
     CGroup: /system.slice/named.service
             └─1182 /usr/sbin/named -u bind

may 07 15:23:17 smix-ThinkPad-P1-Gen-5 named[1182]:   validating webmin.com/SOA: no valid signature found
may 07 15:23:17 smix-ThinkPad-P1-Gen-5 named[1182]:   validating QIDPTSN7PHFA4KH4FBHLL0NRHAD3F493.webmin.com/NSEC3: no valid signatur>
may 07 15:23:18 smix-ThinkPad-P1-Gen-5 named[1182]: validating announce.webmin.com/A: no valid signature found
may 07 15:23:18 smix-ThinkPad-P1-Gen-5 named[1182]:   validating webmin.com/SOA: no valid signature found
may 07 15:23:18 smix-ThinkPad-P1-Gen-5 named[1182]:   validating R619EOI7BOS6M6KS6IUO7NAI3B4SDLD2.webmin.com/NSEC3: no valid signatur>
may 07 15:23:19 smix-ThinkPad-P1-Gen-5 named[1182]: validating www.webmin.com/A: no valid signature found
may 07 15:23:19 smix-ThinkPad-P1-Gen-5 named[1182]:   validating webmin.com/SOA: no valid signature found
may 07 15:23:19 smix-ThinkPad-P1-Gen-5 named[1182]:   validating 0N45FDUG0MH70ICU24IQC14H9N500758.webmin.com/NSEC3: no valid signatur>
may 07 16:46:20 smix-ThinkPad-P1-Gen-5 named[1182]: validating unicons.iconscout.com/HTTPS: no valid signature found
may 07 16:46:20 smix-ThinkPad-P1-Gen-5 named[1182]: validating unicons.iconscout.com/A: no valid signature found
```

## named.conf.options
`named.conf.options` ens serveix per configurar com actua el servei de [BIND9](https://github.com/Proyecto-Sintesi/configs/tree/main/etc/bind)

`directory`: Estableix el directori on s'emmagatzemará la cache de bind, els registres creats, dominis registrats etc.

`allow-query`: Estableix les interficies de xarxa des d'on escoltará peticions, en aquest cas escoltará a totes les interficies. Ho hem escollit així per que els servidors dels clients puguin accedir al nostre domini.

`forwardes`: Configura els servidors DNS que s'utilitzarán en cas de que el domini demanat no estigui registrat, utilitzará els especificats aquí per fer la petició.

```bind
options {
        directory "/var/cache/bind";
        allow-query { any; };
        forwarders { 8.8.8.8; 8.8.4.4; };
};
```

## named.conf.local
`named.conf.local` ens serveix per configurar cada zona (o FQDN) individualment
`type` estableix el tipus de zona, en aquest cas es "master" o primaria, això significa que es la principal zona DNS, es a dir, que no es la còpia ni "mirror" d'una altra.
```bind
zone "virtualvista.com" {
        type master;
        file "/etc/bind/db.virtualvista.com";
};
```

## db.virtualvista.com
`db.virtualvista.com` establit abans en `named.conf.local` es l'arxiu de configuració DNS.
``
```bind
$TTL    604800
@       IN      SOA     ns.virtualvista.com. admin.virtualvista.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL

@       IN      NS      virtualvista.com.
@       IN      A       192.168.18.160
panel   IN      CNAME   virtualvista.com.
netdata IN      CNAME   virtualvista.com.
webmin  IN      CNAME   virtualvista.com.
mail    IN      CNAME   virtualvista.com.
autodiscover    IN      CNAME   mail.virtualvista.com.
autoconfig      IN      CNAME   mail.virtualvista.com.
@       IN      MX      10      mail.virtualvista.com.
@       IN      AAAA    ::1
```

### Registres esencials
`@       IN      NS      virtualvista.com.` especifica el "nameserver" del nostre DNS, es a dir, qui s'encarrega d'administrar el nostre domini, això es util per poder utilitzar plataformes com Cloudflare havent comprat o alquilat el teu domini a un altre distribïidor de noms de domini.

`@       IN      A       192.168.18.160` especifica que totes (@) les peticions siguin redirigides a l'IP `192.168.18.160`

### Reverse proxies
Els següents registres son subdominis per poder configurar el [reverse proxy d'NGINX](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/nginx/sites-enabled/virtualvista.com.conf), son una simple redirecció a `virtualvista.com`

`panel   IN      CNAME   virtualvista.com.` [[+](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/nginx/sites-enabled/pterodactyl.conf)]

`netdata IN      CNAME   virtualvista.com.` [[+](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/nginx/sites-enabled/netdata.virtualvista.com.conf)]

`webmin  IN      CNAME   virtualvista.com.` [[+](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/nginx/sites-enabled/webmin.virtualvista.com.conf)]

`mail    IN      CNAME   virtualvista.com.` [[+](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/nginx/sites-enabled/mailcow.conf)]

### [Correu](https://github.com/Proyecto-Sintesi/configs/tree/main/etc/mailcow)
`autodiscover` i `autoconfig` son uns subdominis utlitzats per dispositius mòbils i thunderbird respectivament per configurar de maner rápida el seu client de correu.

`autodiscover    IN      CNAME   mail.virtualvista.com.` especifica 

`autoconfig      IN      CNAME   mail.virtualvista.com.`

`@       IN      MX      10      mail.virtualvista.com.` Els registres `MX` son utilitzats per saber com enviar/intercambiar/rebre un correu

## Demostració
### Comprovació dels registres DNS
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/f1f6e869-c290-4ef3-a860-270ee082ce81)

### Comprovació des de la web
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/5e8ac630-61d7-4077-a535-baca2c3becf0)

<p><a href="https://github.com/Proyecto-Sintesi/configs/tree/main/etc/vsftpd">Servei anterior</a> - <a href="https://github.com/Proyecto-Sintesi/configs/tree/main/etc/nginx/sites-enabled">Següent servei</a></p>
