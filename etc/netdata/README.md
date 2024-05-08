# Que és?

Netdata és una eina per a visualitzar i monitorar mètriques en temps real, optimitzada per a acumular tot tipus de dades, com a ús de CPU, activitat de disc, consultes SQL, visites a un lloc web, etc. L'eina està dissenyada per a visualitzar l'ara en el major detall possible, permetent a l'usuari obtenir una visió del que està succeint i el que acaba de succeir en el seu sistema o aplicació, sent una opció ideal per a solucionar problemes d'acompliment en temps real.

## Per que la hem escollit?

Hem escollit NetData per el monitoratge de recursos del nostre servidor ja que ens permet connectar diversos nodes, ens serveix per poder monitoritzar el servidor de backups i els d'allotjament des d'un sol lloc.


![image](https://github.com/Proyecto-Sintesi/configs/assets/165918288/47935912-e01a-4577-9ee7-e7101ef65009)

Com es pot observar en el *Netdata* ens monstra els apartats com per exemple:
- Utilització de CPU
- Utilització de RAM
- Utilització dels discos
- Xarxa
- Altres

## Allotjament local
De normal el panell de NetData s'allotja als seus servidors privats, en el nostre cas voliem utilitzar el subdomini `netdata.`. Per aconseguir això només hem de canviar el atribut `default port` de l'apartat `web` de l'arxiu de configuració.

![image](https://github.com/Proyecto-Sintesi/configs/assets/122394285/61bad3b4-874c-4bd2-8f4d-4df65d4414f0)

```conf
[web]
        ...
        default port = 19999
        ...
```

La instal·lació es pot llegir aqui [INSTALL.md](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/netdata/INSTALL.md)

<p><a href="https://github.com/Proyecto-Sintesi/configs/tree/main/etc/webmin">Servei anterior</a> - <a href="https://github.com/Proyecto-Sintesi/configs/tree/main/home/alex/.ssh">Següent servei</a></p>
