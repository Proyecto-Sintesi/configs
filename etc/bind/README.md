# BIND9
# Instal·lació
```console
sudo apt install bind9
```
# Configuració
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

`named.conf.local` ens serveix per configurar cada zona (o FQDN) individualment
`type` estableix el tipus de zona, en aquest cas es "master" o primaria, això significa que es la principal zona DNS, es a dir, que no es la còpia ni "mirror" d'una altra.
```bind
zone "virtualvista.com" {
        type master;
        file "/etc/bind/db.virtualvista.com";
};
```

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
