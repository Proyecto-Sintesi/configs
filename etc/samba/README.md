# SAMBA
## smb.conf
`smb.conf` es utilitzat per configurar els recursos globals i individuals de Samba.

### Configuració global
`bind interfaces only` especifica si s'hauria d'escoltar només a les interficies de xarxa especificades, en el nostre cas volem que es pugui accedir des de totes.

`
```toml
[global]
        bind interfaces only = no
        browseable = yes
        read only = no
        force group = pterodactyl
```

```toml
[web]
        path = /var/lib/pterodactyl/volumes/133e7e88-823d-4e24-8a50-179a1cc333e1
        admin users = alex

[minecraft]
        path = /var/lib/pterodactyl/volumes/94a28857-adea-49a1-b183-fa7046b0c04f
        admin users = alex
```
