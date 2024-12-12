# Servei DNS

## Introducció
Els dos noms de domini de l’empresa son:

barpaco.com
cafepaco.com 

## Definició de les zones
La documentación de las zonas se encuentra en: https://docs.google.com/document/d/1KgvbWonBJlKJRvU1WmfuNxf1u-94wTa6q2GxjR5EPFU/edit?usp=sharing

## Arquitectura del servei DNS

Els serveis DNS estaran implantats sobre un docker cada un dells implantats al proxmox.

El servei DNS està gestionat per dos servidors:
* [Server1](Server1/README.md) (barpaco.com)
* [Server2](Server2/README.md) (cafepaco.com)

## Preparació de l'anfitrio 
Alguns sistemes linux el sistema de resolved està lligat a un servei que es troba lligat al port 53.
```
root@lxc-ub-gestio-01:~# ss -ua
State    Recv-Q   Send-Q     Local Address:Port             Peer Address:Port         Process         
UNCONN   0        0          127.0.0.53%lo:domain                0.0.0.0:*                            
UNCONN   0        0                0.0.0.0:bootps                0.0.0.0:*                            
```
En aquests casos s'ha de deshabilitar el servei.
Per a un ubuntu server s'han de fer les següents passes:
```
systemctl stop systemd-resolved
systemctl disable systemd-resolved
```

Ara el servei DNS systemd-resolved ja no escoltarà al port 53. Si necessites més personalització o si estàs utilitzant un servidor DNS diferent, pots ajustar la configuració segons les teves necessitats.

## Ejecución server 1 (barpaco.com)

1. En primer lugar preparamos un contenedor e instalamos docker y git para clonar el repositorio:

Red: Este servicio se encuentra en la subred de DMZ (dirección de red 192.168.145.192/26)
Nombre maquina: DCK-DNS-G8
Dirección IP: 192.168.145.196/26
Gateway: 192.168.145.193
VLAN tag: 3280

```
apt install docker-compose
```

```
apt install git
```

```
git clone https://github.com/PauAlumnesS2I/s2i-ci-grup8
```

2. En el contenedor entramos a la ruta donde se encuentra el proyecto docker del servidor dns 1

```
cd s2i-ci-grup8/ServeisDNS/Server1
```

3. Arrancamos el contenedor docker
```
docker compose up
```

## Ejecución server 2 (cafepaco.com)

1. En primer lugar preparamos un contenedor e instalamos docker y git para clonar el repositorio:

Red: Este servicio se encuentra en la subred de DMZ (dirección de red 192.168.145.192/26)
Nombre maquina: DCK-DNS-G8-2
Dirección IP: 192.168.145.198/26
Gateway: 192.168.145.193
VLAN tag: 3280

```
apt install docker-compose
```

```
apt install git
```

```
git clone https://github.com/PauAlumnesS2I/s2i-ci-grup8
```

2. En el contenedor entramos a la ruta donde se encuentra el proyecto docker del servidor dns 2

```
cd s2i-ci-grup8/ServeisDNS/Server2
```

3. Arrancamos el contenedor docker
```
docker compose up
```