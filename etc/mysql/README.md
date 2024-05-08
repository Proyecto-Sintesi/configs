# Que és el MYSQL

MySQL és un sistema de gestió de bases de dades (SGBD) relacional de codi obert que permet als usuaris emmagatzemar i accedir a la informació de manera eficient. MariaDB és un sistema de gestió de bases de dades derivat de MySQL.

# Per que hem escollit aquest programa com base de dades?

MySQL és una opció popular com a sistema de gestió de bases de dades (SGBD) per diverses raons:

- Codi Obert: MySQL és de codi obert, el que significa que qualsevol pot utilitzar-lo, modificar-lo i distribuir-lo sense restriccions. Això fa que sigui accessible per a una àmplia comunitat d’usuaris i desenvolupadors.
  
- Ampliament Utilitzat: MySQL és àmpliament utilitzat a tot el món. Moltes empreses, llocs web i aplicacions confien en MySQL per gestionar les seves dades. Aquesta popularitat es deu a la seva fiabilitat, rendiment i escalabilitat.
  
- Rendiment Eficient: MySQL està optimitzat per a un rendiment eficient. Pot gestionar grans quantitats de dades i realitzar consultes ràpides. Això és crucial per a aplicacions web i empresarials que requereixen respostes immediates
  
- Compatibilitat amb Llenguatges de Programació: MySQL és compatible amb diversos llenguatges de programació com PHP, Python, Java i molt més. Això permet als desenvolupadors interactuar amb la base de dades des de diferents entorns.


# Configuració de el nostre panel

```
MariaDB [panel]> SHOW TABLES;
+-----------------------+
| Tables_in_panel       |
+-----------------------+
| activity_log_subjects |
| activity_logs         |
| allocations           |
| api_keys              |
| api_logs              |
| audit_logs            |
| backups               |
| database_hosts        |
| databases             |
| egg_mount             |
| egg_variables         |
| eggs                  |
| failed_jobs           |
| jobs                  |
| locations             |
| migrations            |
| mount_node            |
| mount_server          |
| mounts                |
| nests                 |
| nodes                 |
| notifications         |
| password_resets       |
| recovery_tokens       |
| schedules             |
| server_transfers      |
| server_variables      |
| servers               |
| sessions              |
| settings              |
| subusers              |
| tasks                 |
| tasks_log             |
| user_ssh_keys         |
| users                 |
+-----------------------+
35 rows in set (0,000 sec)
```

- activity_log_subjects: Emmagatzema informació sobre els subjectes dels registres d'activitat.
- activity_logs: Registra activitats o esdeveniments en el sistema.
- allocations: Conté detalls sobre assignacions o distribucions.
- api_keys: Emmagatzema claus de API utilitzades per a autenticació.
- backups: Guarda informació relacionada amb còpies de seguretat.
- databases: Conté detalls sobre les bases de dades.
- eggs: Emmagatzema informació sobre els tipus d'aplicacions o serveis disponibles.
- servers: Registra detalls sobre els servidors o màquines virtuals.
- users: Conté informació sobre els usuaris del sistema.


La instal·lació es pot llegir aqui [INSTALL.md](https://github.com/Proyecto-Sintesi/configs/blob/main/etc/mysql/INSTALL.md)
