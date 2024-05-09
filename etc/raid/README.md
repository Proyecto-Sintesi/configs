## Que és?

Un sistema RAID (Redundant Array of Indepedent Disks) o Matriu de Discos Independents Redundants, és definit com la combinació o muntatge de petits discos que formen un dispositiu amb millor rendiment i redundància. Gràcies a aquest sistema, la informació és distribuïda sobre diversos discos en funció de la tècnica que s'usi, la qual cosa permet millorar la velocitat, augmentar la capacitat i minimitzar la pèrdua de dades en cas d'una fallada física en el sistema operatiu.

Nosaltres hem fet servir el RAID 1 per fer còpies de seguretat, ja que el que fa és fer una còpia de un disc en l'altre .

## Instal·lació

```console
sudo apt install mdadm
```

És la eina que farem servir alhora de montar el RAID. La comanda que farem servir per montar-la és la següent:

```console
sudo mdadm -C /dev/md1 -l1 -n2 /dev/sda /dev/sdb
```
El que fa aquesta comanda és amb el mdadm -C cream un raid en la carpeta /dev anomenat md1, -l1 és el nom del RAID 1 i -n2 és el numero de discos que fem servir.

Un cop creat formatejarem el disc a ext4 que és el predeterminat de Linux.

```console
sudo mkfs.ext4 /dev/md1
```

Per acabar crearem una carpeta on montar la RAID.

```console
sudo mkdir RAID1
```

Per acabar montem el disc.

```console
sudo mount /dev/md1 RAID1/
```

## Demostració

![image17](https://github.com/Proyecto-Sintesi/configs/assets/165918288/80c3fc3f-60ff-4ca2-a8a5-2869dd776919)

<p><a href="https://github.com/Proyecto-Sintesi/configs/tree/main/etc/iscsi">Servei anterior</a> - <a href="https://github.com/Proyecto-Sintesi/configs/blob/main/etc/rsync">Següent servei</a></p>
