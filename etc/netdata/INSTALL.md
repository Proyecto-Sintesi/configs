# Instal·lació
Per instal·lar Netdata utilitzarem la següent comanda
```console
apt-get install curl -y
```

Utilitzem el script per instal·lar automaticament el Netdata
```console
bash <(curl -Ss https://my-netdata.io/kickstart.sh)
```
Se't demanarà que instal·lis les dependències necessàries en el teu sistema, com es mostra a continuació:
```
NOTE: Running apt-get update and updating your APT caches ...
apt-get update 
apt-get install autoconf autoconf-archive autogen automake cmake gcc git libelf-dev libjson-c-dev libjudy-dev liblz4-dev libmnl-dev libssl-dev libtool libuv1-dev make pkg-config uuid-dev zlib1g-dev 


Press ENTER to run it > 
```
Prem Intro per a instal·lar totes les dependències en el teu sistema. Se't demanarà que construeixis el Netdata com es mostra a continuació:
```console
 --- Installing netdata... --- 
[/tmp/netdata-kickstart-LnvxPHJfuV/netdata-v1.26.0-292-gfbb5d8e2]# ./netdata-installer.sh --auto-update 
  ^
  |.-.   .-.   .-.   .-.   .  netdata                                        
  |   '-'   '-'   '-'   '-'   real-time performance monitoring, done right!  
  +----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+--->


  You are about to build and install netdata to your system.

  The build process will use /tmp for
  any temporary files. You can override this by setting $TMPDIR to a
  writable directory where you can execute files.

  It will be installed at these locations:

   - the daemon     at /usr/sbin/netdata
   - config files   in /etc/netdata
   - web files      in /usr/share/netdata
   - plugins        in /usr/libexec/netdata
   - cache files    in /var/cache/netdata
   - db files       in /var/lib/netdata
   - log files      in /var/log/netdata
   - pid file       at /var/run/netdata.pid
   - logrotate file at /etc/logrotate.d/netdata

  This installer allows you to change the installation path.
  Press Control-C and run the same command with --help for help.


  NOTE:
  Anonymous usage stats will be collected and sent to Google Analytics.
  To opt-out, pass --disable-telemetry option to the installer or export
  the environment variable DO_NOT_TRACK to a non-zero or non-empty value
  (e.g: export DO_NOT_TRACK=1).

Press ENTER to build and install netdata to your system > 
```

Pulsa Intro para instalar el Netdata. Una vez terminada la instalación, deberías obtener la siguiente salida:
```console
Setting netdata.tarball.checksum to 'new_installation'

 --- We are done! --- 

  ^
  |.-.   .-.   .-.   .-.   .-.   .  netdata                          .-.   .-
  |   '-'   '-'   '-'   '-'   '-'   is installed and running now!  -'   '-'  
  +----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+--->

  enjoy real-time performance and health monitoring...

 OK  
```
