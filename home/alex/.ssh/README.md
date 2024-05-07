# SSH
## Instal·lació
```console
root@smix-ThinkPad-P1-Gen-5:/etc/nginx/sites-enabled# apt install openssh-server
Leyendo lista de paquetes... Hecho
Creando árbol de dependencias... Hecho
Leyendo la información de estado... Hecho
openssh-server ya está en su versión más reciente (1:8.9p1-3ubuntu0.7).
0 actualizados, 0 nuevos se instalarán, 0 para eliminar y 9 no actualizados.
```

## Verificació
```console
root@smix-ThinkPad-P1-Gen-5:/etc/nginx/sites-enabled# systemctl status ssh
● ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2024-05-06 15:15:51 CEST; 1 day 3h ago
       Docs: man:sshd(8)
             man:sshd_config(5)
   Main PID: 1592 (sshd)
      Tasks: 1 (limit: 37931)
     Memory: 5.5M
        CPU: 62ms
     CGroup: /system.slice/ssh.service
             └─1592 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"

may 06 15:15:51 smix-ThinkPad-P1-Gen-5 systemd[1]: Starting OpenBSD Secure Shell server...
may 06 15:15:51 smix-ThinkPad-P1-Gen-5 sshd[1592]: Server listening on 0.0.0.0 port 22.
may 06 15:15:51 smix-ThinkPad-P1-Gen-5 systemd[1]: Started OpenBSD Secure Shell server.
may 06 15:15:51 smix-ThinkPad-P1-Gen-5 sshd[1592]: Server listening on :: port 22.
may 06 16:06:01 smix-ThinkPad-P1-Gen-5 sshd[39891]: Accepted publickey for alex from 192.168.17.8 port 37012 ssh2: RSA SHA256:g37R4/F>
may 06 16:06:01 smix-ThinkPad-P1-Gen-5 sshd[39891]: pam_unix(sshd:session): session opened for user alex(uid=1001) by (uid=0)
may 07 15:02:16 smix-ThinkPad-P1-Gen-5 sshd[147408]: Accepted publickey for alex from 192.168.17.8 port 50084 ssh2: RSA SHA256:g37R4/>
may 07 15:02:16 smix-ThinkPad-P1-Gen-5 sshd[147408]: pam_unix(sshd:session): session opened for user alex(uid=1001) by (uid=0)
```
## Connexió sense contrasenya
Per poder connectar-nos sense contrasenya, el servidor haurá de tenir registrada la nostra clau pública, la començarem creant de la següent manera.
```console
alex@DESKTOP-Q6TQQI6:/home/alex$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/home/alex/.ssh/id_rsa):
Created directory '/home/alex/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/alex/.ssh/id_rsa
Your public key has been saved in /home/alex/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:nE4vrlCB51/LsV9NulaVnCfOqNdazixng0GDtBP+MvY alex@DESKTOP-Q6TQQI6
The key's randomart image is:
+---[RSA 3072]----+
|                 |
|     .    o      |
|    . o  o +  . o|
|     o o .= o .+o|
|      o S o+ = .+|
|     . + ++++ o+.|
|    .   +.== ++..|
|     . . ...E**. |
|      ...  .o*=. |
+----[SHA256]-----+
```
La següent pasa será crear el directori .ssh en el nostre usuari del servidor i pujar la nostra clau pública (~/.ssh/id_rsa)
```console
mkdir ~/.ssh

ssh-copy-id alex@virtualvista.com
```

Canviarem els permisos de la clau per que només nosaltres puguem llegirles
```console
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

Un cop importades ja podem iniciar sessió sense contrasenya
![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/8842b731-b9af-4677-8a0b-4052d89676da)
