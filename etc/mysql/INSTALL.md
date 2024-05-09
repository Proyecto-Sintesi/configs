# Instal·lació
Primer de tot utilitzarem la següent comanda
```console
sudo apt update
```
A continuació, instal·li el paquet:
```console
sudo apt install mariadb-server
```

Quan s'instal·li des dels repositoris predeterminats, MariaDB s'executarà automàticament. Per a provar això, comprovi el seu estat.
```console
sudo systemctl status mariadb
```

Rebrà un resultat que és similar al següent:
```
Output
● mariadb.service - MariaDB 10.3.22 database server
     Loaded: loaded (/lib/systemd/system/mariadb.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2020-05-12 13:38:18 UTC; 3min 55s ago
       Docs: man:mysqld(8)
             https://mariadb.com/kb/en/library/systemd/
   Main PID: 25914 (mysqld)
     Status: "Taking your SQL requests now..."
      Tasks: 31 (limit: 2345)
     Memory: 65.6M
     CGroup: /system.slice/mariadb.service
             └─25914 /usr/sbin/mysqld
. . .
```
# Configuració

Executi la seqüència de comandos de seguretat instal·lada amb MariaDB. Amb això, veurà una sèrie de sol·licituds mitjançant les quals podrà fer canvis en les opcions de seguretat de la seva instal·lació de MariaDB.
```console
sudo mysql_secure_installation
```
En la primera sol·licitud es demanarà que introdueixi la contrasenya root de la base de dades actual. Pel fet que no configurem una encara, premi ENTER per a indicar “none” (cap).
```
Output
. . .
Enter current password for root (enter for none):
```

En la següent sol·licitud es pregunta si desitja configurar una contrasenya root de base de dades. En Ubuntu, el compte root per a MariaDB està estretament vinculada al manteniment del sistema automatitzat. Per tant, no hauríem de canviar els mètodes d'autenticació configurats per a aquest compte. Escrigui N i premi ENTER.
```
Output
. . .

Set root password? [Y/n] N
```
Des d'allí, pot prémer I i després ENTER per a acceptar els valors predeterminats per a totes les preguntes següents. Això eliminarà alguns usuaris anònims i la base de dades de prova, deshabilitarà els inicis de sessió root remots i carregarà aquestes noves regles.

La instal·lació es pot llegir aqui [README.md](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/mysql/README.md)
