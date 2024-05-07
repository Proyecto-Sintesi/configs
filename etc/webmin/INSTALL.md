# Instal·lació
Primer de tot utilitzarem la següent comanda
```console
sudo nano /etc/apt/sources.list
```
A continuació, agregui aquesta línia en la part inferior de l'arxiu per a agregar el nou repositori:

/etc/apt/sources.list
```console
. . .
deb http://download.webmin.com/download/repository sarge contrib
```
Desi l'arxiu i surti de l'editor. Si utilitza nano, podrà fer-ho pressionant CTRL+X, I i després ENTER.

A continuació, afegirà la clau PGP de Webmin perquè el seu sistema confiï en el nou repositori: Per a fer això, primer ha d'instal·lar el paquet gnupg1, que és l'eina de GNU per a protegir la comunicació i l'emmagatzematge de dades.

Actualitzi l'índex de paquets del seu servidor si no ho ha fet recentment:

```console
sudo apt update
```

Després d'això, descarregui la clau PGP de Webmin amb wget i afegeixi-la a la llista de claus del seu sistema:

```console
wget -q -O- http://www.webmin.com/jcameron-key.asc | sudo apt-key add
```

A continuació, actualitzi la llista de paquets de nou per a incloure el repositori Webmin que ara és fiable:

```console
sudo apt update

sudo apt install webmin
```


Quan finalitzi la instal·lació, veurà el següent resultat:

```console
Output
. . .
Webmin install complete. You can now login to
https://your_server:10000 as root with your
root password, or as any user who can use sudo.
```

``
Nota: Si instaló y habilitó ufw durante el paso de requisitos previos, deberá ejecutar el siguiente comando para permitir a Webmin a través del firewall:
sudo ufw allow 10000
Per a major seguretat, és possible que desitgi configurar la seva firewall perquè permeti accés únicament a aquest port des d'uns certs intervals d'IP.
``
La instal·lació es pot llegir aqui [README.md](https://github.com/Proyecto-Sintesi/configs/edit/main/etc/webmin/README.md)
