El que posarem en aquesta apartat seràn els port que estem fent servint y que hem posat la regla de que puguin accedir desde aquells ports als nostre serveis.

```
     Hasta                      Acción      Desde
     -----                      ------      -----
[ 1] 22/tcp                     ALLOW IN    Anywhere
[ 2] 3389                       ALLOW IN    Anywhere
[ 3] 80                         ALLOW IN    Anywhere
[ 4] 443                        ALLOW IN    Anywhere
[ 5] 20,21,10000:10100/tcp      ALLOW IN    Anywhere
[ 6] Bind9                      ALLOW IN    Anywhere
[ 7] 53                         ALLOW IN    Anywhere
[ 8] Postfix                    ALLOW IN    Anywhere
[ 9] 465                        ALLOW IN    Anywhere
[10] 587                        ALLOW IN    Anywhere
[11] 132                        ALLOW IN    Anywhere
[12] 993                        ALLOW IN    Anywhere
[13] 110                        ALLOW IN    Anywhere
[14] 995                        ALLOW IN    Anywhere
[15] 4190                       ALLOW IN    Anywhere
[16] Apache                     ALLOW IN    Anywhere
[17] Samba                      ALLOW IN    Anywhere
```
[SSH](https://github.com/Proyecto-Sintesi/configs/tree/main/home/alex/.ssh): 