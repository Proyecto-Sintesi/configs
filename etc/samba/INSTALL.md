# SAMBA
## Instal·lació
```console
root@smix-ThinkPad-P1-Gen-5:/etc/nginx/sites-enabled# sudo apt install samba
Leyendo lista de paquetes... Hecho
Creando árbol de dependencias... Hecho
Leyendo la información de estado... Hecho
samba ya está en su versión más reciente (2:4.15.13+dfsg-0ubuntu1.6).
0 actualizados, 0 nuevos se instalarán, 0 para eliminar y 9 no actualizados.
```

## Verificació
```console
root@smix-ThinkPad-P1-Gen-5:/etc/nginx/sites-enabled# systemctl status smbd
● smbd.service - Samba SMB Daemon
     Loaded: loaded (/lib/systemd/system/smbd.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2024-05-07 16:15:00 CEST; 2h 13min ago
       Docs: man:smbd(8)
             man:samba(7)
             man:smb.conf(5)
    Process: 190281 ExecStartPre=/usr/share/samba/update-apparmor-samba-profile (code=exited, status=0/SUCCESS)
   Main PID: 190290 (smbd)
     Status: "smbd: ready to serve connections..."
      Tasks: 5 (limit: 37931)
     Memory: 10.6M
        CPU: 826ms
     CGroup: /system.slice/smbd.service
             ├─190290 /usr/sbin/smbd --foreground --no-process-group
             ├─190292 /usr/sbin/smbd --foreground --no-process-group
             ├─190293 /usr/sbin/smbd --foreground --no-process-group
             ├─190294 /usr/lib/x86_64-linux-gnu/samba/samba-bgqd --ready-signal-fd=46 --parent-watch-fd=12 --debuglevel=0 -F
             └─206875 /usr/sbin/smbd --foreground --no-process-group

may 07 16:58:06 smix-ThinkPad-P1-Gen-5 smbd[206875]: [2024/05/07 16:58:06.483216,  0] ../../source3/param/loadparm.c:3448(process_use>
may 07 16:58:06 smix-ThinkPad-P1-Gen-5 smbd[206875]:   process_usershare_file: stat of /var/lib/samba/usershares/.git failed. Permiso>
may 07 16:58:06 smix-ThinkPad-P1-Gen-5 smbd[206875]: [2024/05/07 16:58:06.513784,  0] ../../source3/param/loadparm.c:3448(process_use>
may 07 16:58:06 smix-ThinkPad-P1-Gen-5 smbd[206875]:   process_usershare_file: stat of /var/lib/samba/usershares/config failed. Permi>
may 07 17:38:30 smix-ThinkPad-P1-Gen-5 smbd[206875]: [2024/05/07 17:38:30.129797,  0] ../../source3/param/loadparm.c:3448(process_use>
may 07 17:38:30 smix-ThinkPad-P1-Gen-5 smbd[206875]:   process_usershare_file: stat of /var/lib/samba/usershares/.git failed. Permiso>
may 07 17:38:30 smix-ThinkPad-P1-Gen-5 smbd[206875]: [2024/05/07 17:38:30.162868,  0] ../../source3/param/loadparm.c:3448(process_use>
may 07 17:38:30 smix-ThinkPad-P1-Gen-5 smbd[206875]:   process_usershare_file: stat of /var/lib/samba/usershares/.git failed. Permiso>
may 07 17:38:30 smix-ThinkPad-P1-Gen-5 smbd[206875]: [2024/05/07 17:38:30.198713,  0] ../../source3/param/loadparm.c:3448(process_use>
may 07 17:38:30 smix-ThinkPad-P1-Gen-5 smbd[206875]:   process_usershare_file: stat of /var/lib/samba/usershares/config failed. Permi>
```
## Creació d'usuaris
Com els usuaris dels clients ja estarán creats previament, sol tindrem que afegir-los al samba mitjançant les següents comandas
```console
sudo smbpasswd -a alex
New SMB password: test123
Retype new SMB password: test123
Added user alex.
```

```console
sudo smbpasswd -e alex
```
