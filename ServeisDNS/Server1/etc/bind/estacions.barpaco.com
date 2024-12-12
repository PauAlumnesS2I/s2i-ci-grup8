; Archivo de zona para estacions.barpaco.com

$TTL 1m ; Tiempo de vida predeterminado para los registros en la zona (1 minuto)
@   IN  SOA ns01.barpaco.com. admin.barpaco.com. (
            2008052001 ; Número de serie (debe incrementarse con cada cambio)
            120        ; Tiempo de vida del SOA (2 minutos)
            60         ; Intervalo de reintentos del SOA (1 minuto)
            86400      ; Tiempo de vida máximo del SOA (1 día)
            60 )       ; Tiempo de vida predeterminado para los registros (1 minuto)

; Servidores de nombres
@   IN  NS  ns01.barpaco.com.
@   IN  NS  ns02.barpaco.com.

; Registros A para las estaciones
est01  IN  A   10.97.0.1
est02  IN  A   10.97.0.2
est03  IN  A   10.97.0.3
est04  IN  A   10.97.0.4
est05  IN  A   10.97.0.5
