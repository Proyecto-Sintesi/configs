
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
