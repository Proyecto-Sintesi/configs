# ISCSI

És un protocol de transferència de dades a través de TCP/IP, Gràcies a això podem disposar d'unitats d'emmagatzematge en xarxa de baix cost, o en entorns amb unes necessitats majors, NAS iSCSI, la qual cosa ens permet tenir en una ubicació de xarxa un complet sistema servidor de fitxers amb sistemes RAID étc per un cost molt inferior al produït per les infraestructures de fibra.

En el context d'emmagatzematge, iSCSI permet a un ordinador utilitzar un iniciador iSCSI (initiator) per a connectar a un dispositiu SCSI (target) com pot ser un disc dur o una cabina de cintes en una xarxa IP per a accedir als mateixos a nivell de bloc.

## Instal·lar
```console
sudo apt install tgt
```

## Configurar
```console
ls -l /dev/disk/by-id/
```

La comanda de abans el que fa és mostra les id dins de la carpetas disk. Una vegada visualitzat la id del disc el que farem serà copiar-la perquè la necessitarem mes endavant.

Un cop fet farem:
```
sudo nano /etc/tgt//conf.d/linux.conf
```
Hi posarem el mateix que el arxiu de [configuració](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/iscsi/linux.conf)

## Comprovació

Per acabar el que farem serà 
```console
sudo systemctl restart tgt
```

```console
sudo tgtadm --op show --mode target
``` 
![image3](https://github.com/Proyecto-Sintesi/configs/assets/165918288/98a8fe96-89da-4bd0-9302-8d155518592b)
