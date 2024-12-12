; BIND data file for cafepaco.com

$TTL 60
@   IN  SOA ns01.cafepaco.com. admin.hospitalbinissalem.com. (
            2008052001 ; Serial
            120        ; Refresh
            60         ; Retry
            86400      ; Expire
            60 )       ; Negative Cache TTL

; name servers - NS records
    IN  NS  ns01.cafepaco.com.
    IN  NS  ns02.cafepaco.com.

; mail servers - MX records
    IN  MX  10 mail01.cafepaco.com.
    IN  MX  20 mail02.cafepaco.com.

; Direcciones IP de los servidores Name
ns01    IN  A   192.168.145.198
ns02    IN  A   192.168.145.199

; Registros de host
web     IN  A   192.168.145.208
file    IN  A   192.168.145.209
mail01  IN  A   192.168.145.206
mail02  IN  A   192.168.145.207

; CName records
www     IN  CNAME   web.cafepaco.com.
ftp     IN  CNAME   file.cafepaco.com.

; Delegación - estacions subdominio
estacions   IN  NS  ns01.cafepaco.com.
estacions   IN  NS  ns02.cafepaco.com.