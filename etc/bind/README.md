# BIND9
## named.conf.options
`named.conf.options` ens serveix per configurar com actua el servei de BIND9

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

### Correu
`autodiscover` i `autoconfig` son uns subdominis utlitzats per dispositius mòbils i thunderbird respectivament per configurar de maner rápida el seu client de correu.

`autodiscover    IN      CNAME   mail.virtualvista.com.` especifica 

`autoconfig      IN      CNAME   mail.virtualvista.com.`

`@       IN      MX      10      mail.virtualvista.com.` Els registres `MX` son utilitzats per saber com enviar/intercambiar/rebre un correu

## Demostració
### Comprovació dels registres DNS
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/f1f6e869-c290-4ef3-a860-270ee082ce81)

### Comprovació des de la web
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/5e8ac630-61d7-4077-a535-baca2c3becf0)
