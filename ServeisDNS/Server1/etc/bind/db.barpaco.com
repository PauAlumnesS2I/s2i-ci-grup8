; BIND data file for barpaco.com

$TTL 60
@   IN  SOA ns01.barpaco.com. admin.barpaco.com. (
            2008052001 ; Serial
            120        ; Refresh
            60         ; Retry
            86400      ; Expire
            60 )       ; Negative Cache TTL

; name servers - NS records
    IN  NS  ns01.barpaco.com.
    IN  NS  ns02.barpaco.com.

; mail servers - MX records
    IN  MX  10 mail01.barpaco.com.
    IN  MX  20 mail02.barpaco.com.

; Direcciones IP de los servidores Name
ns01    IN  A   192.168.145.196
ns02    IN  A   192.168.145.197

; Registros de host
web     IN  A   192.168.145.202
file    IN  A   192.168.145.203
mail01  IN  A   192.168.145.200
mail02  IN  A   192.168.145.201

; CName records
www     IN  CNAME   web.barpaco.com.
ftp     IN  CNAME   file.barpaco.com.

; Delegación - estacions subdominio
estacions   IN  NS  ns01.barpaco.com.
estacions   IN  NS  ns02.barpaco.com.
