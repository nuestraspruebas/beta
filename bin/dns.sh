#!/bin/bash
#Si vps vale 1 configura index.html con ip publica, sino con ip privada
#MENU
VPS=$(awk 'NR==11' /etc/sslb)
if [[ $VPS = "1" ]]
then
ip=`wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`
else
ip=`hostname -I`
ip=`echo ${ip:0:-1}`
fi

#ip=`echo ${ip:0:-1}`
b="<meta http-equiv="
c='"'
d="refresh"
e=" content="
f="0;URL="
g=":100"
h="http://"
i=">"
buena="$b$c$d$c$e$c$f$h$ip$g$c$i"
sed -i "4s#.*#$buena#" /var/www/html/menu/index.html
g=":8081"
buena="$b$c$d$c$e$c$f$h$ip$g$c$i"
sed -i "4s#.*#$buena#" /var/www/html/hblink/index.html

#### HBMONITOR LASTHEARD

linea=$(awk 'NR==221' /opt/hbmonitor/index_template.html)
ippublica=`wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`
buena="<a target='_blank' href="
c='"'
d="http://"
buena2=':81/log.php"><button class="button link">Lastheard</button></a>'
url=$buena$c$d$ippublica$buena2
if [[ $url != $linea ]];
then
    sed -i "219s#.*#$url#" /opt/hbmonitor/index_template.html
    #systemctl restart hbmonitor.service
fi

####  GENERACION DE CARPETAS

mkdir /var/log/dvswitch
cd /var/log/dvswitch
 mkdir -p 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 \
31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 \
56 57 58 59 60 61 62 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 \
80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99
mkdir /var/log/hotspots
fecha=$(date +%Y-%m-%d)
cad="/var/log/dvswitch/10/MMDVM_Bridge-10-$fecha.log"
cad2="/var/log/dvswitch/10/P25Gateway-$fecha.log"
cad3="/var/log/dvswitch/10/NXDNGateway-$fecha.log"
cad4="/var/log/ircDDBGateway-$fecha.log"
cad6="/var/log/dvswitch/10/Analog_Bridge.log"
 echo "Iniciando servicios....." > $cad
 echo "Iniciando servicios....." > $cad2
 echo "Iniciando servicios....." > $cad3
 echo "Iniciando servicios....." > $cad4
 echo "Iniciando servicios....." > $cad6
for (( i=11; i<=99; i++ ));
do
   cad="/var/log/dvswitch/$i/MMDVM_Bridge-$i-$fecha.log"
   cad1="/var/log/dvswitch/$i/Analog_Bridge.log"
    echo "Servicio aun no iniciado" > $cad
    echo "Servicio aun no iniciado" > $cad1
done
mkdir /var/log/generador
ls &
