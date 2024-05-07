# SAMBA
## smb.conf
`smb.conf` es utilitzat per configurar els recursos globals i individuals de Samba.

### Configuració global
`bind interfaces only` especifica si s'hauria d'escoltar només a les interficies de xarxa especificades, en el nostre cas volem que es pugui accedir des de totes.

`browseable` poder navegar dins dels directoris

`read only` establit per poder llegir els arxius

`force group` especifica que el group dels arxius sigui pterodactyl, per a que el panell pugui accedir als arxius

```samba
[global]
        bind interfaces only = no
        browseable = yes
        read only = no
        force group = pterodactyl
```

## Configuració dels recursos
Cada reurs te especificat un directori i un administrador, cada administrador pot modificar al seu gust cada directori. Els administradors establits seran els clients de cada servidor.
```samba
[web]
        path = /var/lib/pterodactyl/volumes/133e7e88-823d-4e24-8a50-179a1cc333e1
        admin users = alex

[minecraft]
        path = /var/lib/pterodactyl/volumes/94a28857-adea-49a1-b183-fa7046b0c04f
        admin users = alex
```

## Demostració
En la següent imatge es pot veure com está connectat els arxius del servidor de Minecraft amb un Samba.
![prova](https://github.com/Proyecto-Sintesi/configs/assets/122394285/d1f9a67b-afbe-4b4e-818d-766d5bdfecea)

