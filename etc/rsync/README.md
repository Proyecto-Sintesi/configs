## Que és?

Rsync és una aplicació lliure per a sistemes de tipus Unix i Microsoft Windows que ofereix transmissió eficient de dades incrementals, que opera també amb dades comprimides i xifratges. Mitjançant una tècnica de delta encoding, permet sincronitzar arxius i directoris entre dues màquines d'una xarxa o entre dues ubicacions en una mateixa màquina, minimitzant el volum de dades transferides. Una característica important de rsync no trobada en la majoria de programes o protocols és que la còpia pren lloc amb només una transmissió en cada direcció. rsync pot copiar o mostrar directoris continguts i còpia d'arxius, opcionalment usant compressió i recursión.

En el nostre càs alhora d'utlitzar el rsync el fem servir de forma remota mitjançant el SSH.

## Funcionament

Primer entrem dins del servidor que volem fer el backup fent un ssh
```console
ssh smix@192.168.56.106
```

Un cop dins obrim el terminal y posem la següent comanda.

```console
sudo rsync -a /var/lib/pterodactyl/volumenes smix@192.168.56.107:RAID1
```
Dàquesta forma tindriem feta la còpia de seguretat.

Alhora de fer-ho en una empresa el que millor va és que el fessim amb un cron. Per fer-ho el que farem serà el següent.

```console
00 12 * * * rsync -aAX --delete --exclude '*.Trash-1000' /source/ /backup/daily
00 15 * * 5 rsync -aAX --delete --exclude '*.Trash-1000' /source/ /backup/weekly
00 16 1 * * rsync -aAX --delete --exclude '*.Trash-1000' /source/ /backup/monthly_$(date +%Y%m%d)
```
És afegir aquestes comandes dins del directori /tmp/crontab.scXSm2/crontab

- `m`  minute
- `h`  hour
- `dom`  day_of_month
- `m`  month
- `dow`  day_of_week
- `command`  the command to execute
  
## Demostració

![image24](https://github.com/Proyecto-Sintesi/configs/assets/165918288/43f44d8d-ecf3-4be8-af27-b1765c0674bb)

<p><a href="https://github.com/Proyecto-Sintesi/configs/tree/main/etc/raid">Servei anterior</a> - <a href="https://github.com/Proyecto-Sintesi/configs/tree/main/home/alex/.ssh">Següent servei</a></p>
