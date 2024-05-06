;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     ns.virtualvista.com. admin.virtualvista.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      virtualvista.com.
@       IN      A       192.168.18.160
panel   IN      CNAME   virtualvista.com.
netdata IN      CNAME   virtualvista.com.
webmin  IN      CNAME   virtualvista.com.
mail    IN      CNAME   virtualvista.com.
autodiscover    IN      CNAME   mail.virtualvista.com.
autoconfig      IN      CNAME   mail.virtualvista.com.
@       IN      MX      10      mail.virtualvista.com.
@       IN      AAAA    ::1
