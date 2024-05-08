# Que és?

Vsftpd és un servidor FTP (Protocol de Transferència de Fitxers) molt potent i complet que està disponible per a la majoria dels distribucions de Linux. Aquest servidor FTP és el favorit de molts administradors de sistemes per la seva configurabilitat i la facilitat de realitzar configuracions avançades directament al servidor FTP.

# Per que ho hem fet servir?

Hem agafat aquest servei per expandir els connexions a l'hora de poder accedir al nostre servei d'un altre forma remota, d'aquesta forma els empleats accedirien per modificar/reparar alguna cosa necessària.

Ofereix configurabilidad avançada, com FTP segur mitjançant SSL/TLS, restriccions basades en usuaris i adreces IP, i suport per a IPv6. A més, la seva eficiència en l'ús de recursos el fa ideal per a servidors amb limitacions de maquinari .

# Que modifiquem dins del arxiu?

Dins de l'arxiu el que modifiquem és que el nostre servidor pugui acceptar o rebutjar depenen de la configuració. En el nostre cas el que hem fet ha sigut que només pot accedir al nostre servidor a través d'usuaris creats.

# Demostració

![image29](https://github.com/Proyecto-Sintesi/configs/assets/165918288/08fa7af9-a278-4aa4-9fcd-e7931f798357)

![image](https://github.com/Proyecto-Sintesi/configs/assets/165918288/82c9567b-e2d9-4eac-a129-3d7148a0ff0c)

<p><a href="https://github.com/Proyecto-Sintesi/configs/tree/main/home/alex/.ssh">Servei anterior</a> - <a href="https://github.com/Proyecto-Sintesi/configs/tree/main/etc/mysql">Següent servei</a></p>
