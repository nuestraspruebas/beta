#!/bin/bash
export NCURSES_NO_UTF8_ACS=1
PATHDVLINK=$(awk 'NR==12' /etc/sslb)
USER=$(awk 'NR==1' /etc/sslb)
VERSIONPI=$(awk 'NR==2' /etc/sslb)
IDIOMA=$(awk 'NR==3' /etc/sslb)
PRODUCCION=$(awk 'NR==7' /etc/sslb)
sysop=$(awk 'NR==1' /etc/sysop.ini)
#cadenasistemasactivos="no comprobados"
export NCURSES_NO_UTF8_ACS=1
source /usr/bin/activo
#cargar fichero en tabla
#  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/var/lib/mmdvm/YSFHosts.txt' into table ysfhost fields terminated by ';';"

#ver log en dialog
#tail -f /var/log/messages > out &
#dialog                                         \
#   --title 'Monitorando Mensagens do Sistema'  \
#   --tailbox out                               \
#   0 0

#cargar fichero en menu
#ARCHIVO=/home/$USER/ysf
#whiptail --menu 'Muestra los dos campos incluidos en el archivo' \
#        0 0 0 $(cat $ARCHIVO | cut -d: -f1,3)
#echo $c



#function IDIOMA(){
#SELECCIONIDIOMA=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT idioma from admin;")
#if [[ $SELECCIONIDIOMA = "" ]]
#then
#   source "Spanish"
#else
#   source $SELECCIONIDIOMA
#fi
#}

###############  INICIO ACTIVA   #################
function ACTIVA-CONF-PERSONAL(){
indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from hot_conf_personal where nombre = '$NOMBRE';")
dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrid from hot_conf_personal where nombre = '$NOMBRE';")
nxdnid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnid from hot_conf_personal where nombre = '$NOMBRE';")
#p25id=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25id from hot_conf_personal where nombre = '$NOMBRE';")
}
function ACTIVA-CONF-MODEM(){
devtty=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT devtty from hot_modem where nombre = '$NOMBRE';")
duplex=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT duplex from hot_modem where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT frectx from hot_modem where nombre = '$NOMBRE';")
frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT frecrx from hot_modem where nombre = '$NOMBRE';")
txinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txinv from hot_modem where nombre = '$NOMBRE';")
rxinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxinv from hot_modem where nombre = '$NOMBRE';")
pttinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT pttinv from hot_modem where nombre = '$NOMBRE';")
rxoffset=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxoffset from hot_modem where nombre = '$NOMBRE';")
txoffset=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txoffset from hot_modem where nombre = '$NOMBRE';")
rxlevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxlevel from hot_modem where nombre = '$NOMBRE';")
txlevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txlevel from hot_modem where nombre = '$NOMBRE';")
rflevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rflevel from hot_modem where nombre = '$NOMBRE';")
rfmodehang=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rfmodehang from hot_modem where nombre = '$NOMBRE';")
netmodehang=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT netmodehang from hot_modem where nombre = '$NOMBRE';")
}
function ACTIVA(){
echo $CARGANDO_DATOS

# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select estado from hotspot where nombre = '$NOMBRE';") 

estado=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT estado from hotspot where nombre = '$NOMBRE';")
nombre=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombre from hotspot where nombre = '$NOMBRE';")
indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from hotspot where nombre = '$NOMBRE';")
devtty=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT devtty from hot_modem where nombre = '$NOMBRE';")
duplex=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT duplex from hot_modem where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT frectx from hot_modem where nombre = '$NOMBRE';")
frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT frecrx from hot_modem where nombre = '$NOMBRE';")
txinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txinv from hot_modem where nombre = '$NOMBRE';")
rxinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxinv from hot_modem where nombre = '$NOMBRE';")
pttinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT pttinv from hot_modem where nombre = '$NOMBRE';")
offset=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxoffset from hot_modem where nombre = '$NOMBRE';")
rxlevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxlevel from hot_modem where nombre = '$NOMBRE';")
txlevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txlevel from hot_modem where nombre = '$NOMBRE';")
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstar from hotspot where nombre = '$NOMBRE';")
dstargateway=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstargateway from hot_IRCpot where nombre = '$NOMBRE';")
dstarpuerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstarpuerto from hot_IRC where nombre = '$NOMBRE';")
dstarplocal=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstarplocal from hot_IRC where nombre = '$NOMBRE';")
dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr from hotspot where nombre = '$NOMBRE';")
dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrid from hotspot where nombre = '$NOMBRE';")
dmrdireccion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrdireccion from hot_DMR where nombre = '$NOMBRE';")
dmrpremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrpremoto from hot_DMR where nombre = '$NOMBRE';")
dmrplocal=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrlocalport from hot_DMR where nombre = '$NOMBRE';")
#dmrslot1=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrslot1 from hotspot where nombre = '$NOMBRE';")
#dmrslot2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrslot2 from hotspot where nombre = '$NOMBRE';")
###  PREGUNTAR
fusion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusion from hotspot where nombre = '$NOMBRE';")
fparrot=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fparrot from hotspot where nombre = '$NOMBRE';")
fdireccion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fdireccion from hotspot where nombre = '$NOMBRE';")
#FIN PREGUNTAR
fpuertolocal=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusionlocalport from hot_YSF where nombre = '$NOMBRE';")
fgateway=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusionrptport from hotspot where nombre = '$NOMBRE';")
fpuertogateway=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fpuertogateway from hotspot where nombre = '$NOMBRE';")
p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25 from hotspot where nombre = '$NOMBRE';")
p25id=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25id from hotspot where nombre = '$NOMBRE';")
nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdn from hotspot where nombre = '$NOMBRE';")
puertoremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoremoto from hotspot where nombre = '$NOMBRE';")
password=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from hotspot where nombre = '$NOMBRE';")
reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reflector from hotspot where nombre = '$NOMBRE';")
relink=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT relink from hotspot where nombre = '$NOMBRE';")
tgp1=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgp1 from hotspot where nombre = '$NOMBRE';")
tgp2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgp2 from hotspot where nombre = '$NOMBRE';")
tgp3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgp3 from hotspot where nombre = '$NOMBRE';")
tgp4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgp4 from hotspot where nombre = '$NOMBRE';")
fuertotft=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertotft from hotspot where nombre = '$NOMBRE';")
brillo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT brillo from hotspot where nombre = '$NOMBRE';")

}

################  FIN ACTIVA
#######################################################################

function SELECCION-MODO(){
#echo "modificando hotspot $NOMBRE"
mimodo=0
cadenasistemasactivos=""
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstar from hotspot where nombre = '$NOMBRE';")
dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr from hotspot where nombre = '$NOMBRE';")
p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25 from hotspot where nombre = '$NOMBRE';")
nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdn from hotspot where nombre = '$NOMBRE';")
fusion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusion from hotspot where nombre = '$NOMBRE';")
aprs=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT aprs from hotspot where nombre = '$NOMBRE';")
display=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT display from hotspot where nombre = '$NOMBRE';")
cw=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cw from hotspot where nombre = '$NOMBRE';")
dmrgateway=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrgateway from hotspot where nombre = '$NOMBRE';")
ysf2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2dmr from hotspot where nombre = '$NOMBRE';")
ysf2p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2p25 from hotspot where nombre = '$NOMBRE';")
ysf2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2nxdn from hotspot where nombre = '$NOMBRE';")
dmr2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr2nxdn from hotspot where nombre = '$NOMBRE';")
dmr2ysf=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr2ysf from hotspot where nombre = '$NOMBRE';")
nxdn2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdn2dmr from hotspot where nombre = '$NOMBRE';")
DGID=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dgid from hotspot where nombre = '$NOMBRE';")

aysf2dmr="ON"
aysf2p25="ON"
aysf2nxdn="ON"
admr2nxdn="ON"
admr2ysf="ON"
anxdn2dmr="ON"

admr="ON"
admrgateway="ON"
afusion="ON"
adgid="ON"
adstar="ON"
ap25="ON"
anxdn="ON"
aaprs="ON"
adisplay="ON"
acw="ON"

if [[ $nxdn2dmr = 0 ]]
then
  anxdn2dmr="OFF"
fi
if [[ $ysf2dmr = 0 ]]
then
  aysf2dmr="OFF"
fi
if [[ $ysf2p25 = 0 ]]
then
  aysf2p25="OFF"
fi
if [[ $ysf2nxdn = 0 ]]
then
  aysf2nxdn="OFF"
fi
if [[ $dmr2nxdn = 0 ]]
then
  admr2nxdn="OFF"
fi
if [[ $dmr2ysf = 0 ]]
then
  admr2ysf="OFF"
fi


if [[ $dmr = 0 ]]
then
  admr="OFF"
fi
if [[ $dmrgateway = 0 ]]
then
  admrgateway="OFF"
else
  admr="OFF"
fi
if [[ $DGID = 0 ]]
then
  adgid="OFF"
fi

if [[ $fusion = 0 ]]
then
  afusion="OFF"
fi
if [[ $dstar = 0 ]]
then
  adstar="OFF"
fi
if [[ $p25 = 0 ]]
then
  ap25="OFF"
fi
if [[ $nxdn = 0 ]]
then
  anxdn="OFF"
fi
if [[ $aprs = 0 ]]
then
  aaprs="OFF"
fi
if [[ $display = 0 ]]
then
  adisplay="OFF"
fi
if [[ $cw = 0 ]]
then
  acw="OFF"
fi

 modosactivos=$( dialog --stdout \
        --separate-output \
        --checklist "$SELECCIONA_SISTEMAS_ACTIVOS" 0 0 0 \
        DMR  '' $admr  \
        DMRGATEWAY  '' $admrgateway  \
        DGID '' $adgid \
        FUSION '' $afusion \
        DSTAR '' $adstar  \
        P25  '' $ap25 \
        NXDN   '' $anxdn \
        APRS   '' $aaprs \
        CW   '' $acw \
        DISPLAY   '' $adisplay \
        --------------- '' CROSSLINKS \
        YSF2DMR '' $aysf2dmr \
        YSF2P25-VW '' $aysf2p25 \
        YSF2NXDN '' $aysf2nxdn \
        DMR2YSF-TG9 '' $admr2ysf \
        DMR2NXDN ''  $admr2nxdn \
        NXDN2DMR-TG20 '' $anxdn2dmr )


 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET aprs = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET display = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET cw = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgateway = '0' where nombre = '$NOMBRE'";
#### crosslinks
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";

echo "$modosactivos" | while read seleccion
do

if [[ $seleccion = "DMR" ]]
then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgateway = '0' where nombre = '$NOMBRE'";
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '1' where nombre = '$NOMBRE'";
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
    export cadenasistemasactivos="DMR"
fi

if [[ $seleccion = "DMRGATEWAY" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgateway = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";

fi
##
if [[ $seleccion = "DGID" ]]
then
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '1' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
   cadenasistemasactivos="$cadenasistemasactivos DGID"
   NO="NO"
fi

if [[ $seleccion = "FUSION" ]]
then
   DGID=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dgid from hotspot where nombre = '$NOMBRE';")
   if [[ $DGID -eq 0 ]]
   then
      cadenasistemasactivos="$cadenasistemasactivos FUSION"
   fi
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '1' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
fi


if [[ $seleccion = "DSTAR" ]]
then
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '1' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
   cadenasistemasactivos="$cadenasistemasactivos DSTAR"

fi
if [[ $seleccion = "P25" ]]
then
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '1' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
   cadenasistemasactivos="$cadenasistemasactivos P25"

fi
if [[ $seleccion = "NXDN" ]]
then
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '1' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
   cadenasistemasactivos="$cadenasistemasactivos NXDN"

fi
if [[ $seleccion = "APRS" ]]
then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET aprs = '1' where nombre = '$NOMBRE'";
    cadenasistemasactivos="$cadenasistemasactivos APRS"
    cadena2="APRS"
fi
if [[ $seleccion = "DISPLAY" ]]
then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET display = '1' where nombre = '$NOMBRE'";
    cadenasistemasactivos="$cadenasistemasactivos DISPLAY"
    cadena2="$cadena2 DISPLAY"
fi

if [[ $seleccion = "CW" ]]
then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET cw = '1' where nombre = '$NOMBRE'";
    cadenasistemasactivos="$cadenasistemasactivos CW"
    cadena2="$cadena2 CW"
fi

if [[ $seleccion = "YSF2DMR" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgateway = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";
   mimodo=1
  cadenasistemasactivos="$cadena2 YSF2DMR"
fi

if [[ $seleccion = "YSF2P25-VW" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgateway = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";
   mimodo=1
  cadenasistemasactivos="$cadena2 YSF2DMR"
fi
if [[ $seleccion = "YSF2NXDN" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgateway = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";
   mimodo=1
    cadenasistemasactivos="$cadena2 YSF2DMR"
fi
if [[ $seleccion = "DMR2YSF-TG9" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgateway = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";
   mimodo=1
 cadenasistemasactivos="$cadena2 YSF2DMR"
fi
if [[ $seleccion = "DMR2NXDN" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgateway = '0' where nombre = '$NOMBRE'"; 
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";
  mimodo=1
 cadenasistemasactivos="$cadena2 YSF2DMR"
fi
if [[ $seleccion = "NXDN2DMR-TG20" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgateway = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";
  mimodo=1
 cadenasistemasactivos="$cadena2 YSF2DMR"
fi
if [[ $mimodo -eq 1 ]]
then
   MODOCROSSLINK
fi
#echo $cadenasistemasactivos
mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET cadenasistemasactivos = '$cadenasistemasactivos' where nombre = '$NOMBRE'";
done

}
function MODOCROSSLINK(){
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "$SELECCION_RED_CROSSLINK" \
 --menu "" 0 0 0 \
   "HBLINK"  "" \
   "BM" "" \
   "XLX o DMR+" "" \
    "────────────────────────────────" "" \
    "$VOLVER" "" 2> $tempfile
retvalcrosslink=$?
dmred=`cat $tempfile`
mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmred = '$dmred' where nombre = '$NOMBRE'";

}


############
function CROSSLINKS(){
ysf2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2dmr from hotspot where nombre = '$NOMBRE';")
ysf2p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2p25 from hotspot where nombre = '$NOMBRE';")
ysf2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2nxdn from hotspot where nombre = '$NOMBRE';")
dmr2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr2nxdn from hotspot where nombre = '$NOMBRE';")
dmr2ysf=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr2ysf from hotspot where nombre = '$NOMBRE';")
nxdn2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdn2dmr from hotspot where nombre = '$NOMBRE';")

aysf2dmr="ON"
aysf2p25="ON"
aysf2nxdn="ON"
admr2nxdn="ON"
admr2ysf="ON"
anxdn2dmr="ON"

if [[ $nxdn2dmr = 0 ]]
then
  anxdn2dmr="OFF"
fi
if [[ $ysf2dmr = 0 ]]
then
  aysf2dmr="OFF"
fi
if [[ $ysf2p25 = 0 ]]
then
  aysf2p25="OFF"
fi
if [[ $ysf2nxdn = 0 ]]
then
  aysf2nxdn="OFF"
fi
if [[ $dmr2nxdn = 0 ]]
then
  admr2nxdn="OFF"
fi
if [[ $dmr2ysf = 0 ]]
then
  admr2ysf="OFF"
fi

modosactivos=$(whiptail --title "Crosslinks" --radiolist \
"$SELECCIONA_CROSSLINKS" 0 0 0 \
"YSF2DMR" "" $aysf2dmr \
"YSF2P25" "MODO FUSION VW" $aysf2p25 \
"YSF2NXDN" "" $aysf2nxdn \
"DMR2YSF" "DMR TG9" $admr2ysf \
"DMR2NXDN" "TG DMR= TG NXDN" $admr2nxdn \
"NXDN2DMR" "TG20 NXDN" $anxdn2dmr \
"$DESACTIVAR_CROSSLINKS" "" OFF  3>&1 1>&2 2>&3 )


echo "$modosactivos" | while read seleccion
do

if [[ $seleccion = "YSF2DMR" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";
fi

if [[ $seleccion = "YSF2P25" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";

fi
if [[ $seleccion = "YSF2NXDN" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";

fi
if [[ $seleccion = "DMR2YSF" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";

fi
if [[ $seleccion = "DMR2NXDN" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";

fi
if [[ $seleccion = "NXDN2DMR" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '1' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";

fi
if [[ $seleccion = "$DESACTIVAR_CROSSLINKS" ]]
then
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2ysf = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr2nxdn = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET ysf2dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET fusion = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dgid = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmr = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25 = '0' where nombre = '$NOMBRE'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nxdn = '0' where nombre = '$NOMBRE'";

fi

done
modosactivos=""
}
##########
function SELECCION-HOTSPOT-ACTIVOS(){
dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where estado = '1' and nombre <> 'PRIMARIONOBORRAR';")
if [[ $dbquery -eq 0 ]]
then
   dialog --title "$SALIR" --msgbox "$NO_HOTSPOT_ACTIVOS" 0 0
   experto=0
else
   experto=1
   dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombre from hotspot where estado = '1' and nombre <> 'PRIMARIONOBORRAR';")
   array=($(for i in $dbquery;do echo $i;done))
   c=""
   for i in ${array[@]}
   do
     c=$c"$i \""\"' '
   done
   DIALOG=${DIALOG=dialog}
   tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
   trap "rm -f $tempfile" 0 1 2 5 15
   $DIALOG --clear --title "" --menu "$DESACTIVAR_HOTSPOT" 0 0 0   $c 2> $tempfile
   retvalnombre=$?
   NOMBRE=`cat $tempfile`
   nombre=$NOMBRE
fi

}

function SELECCION-HOTSPOT-INACTIVOS(){
dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where estado = '0' and nombre <> 'PRIMARIONOBORRAR';")
if [[ $dbquery -eq 0 ]]
then
   dialog --title "$SALIR" --msgbox "$NO_HOTSPOT_INACTIVOS" 0 0
   menuconfigura="$VOLVER"
else
   dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombre from hotspot where estado = '0' and nombre <> 'PRIMARIONOBORRAR';")
   array=($(for i in $dbquery;do echo $i;done))
   c=""
   for i in ${array[@]}
   do
     c=$c"$i \""\"' '
   done
   DIALOG=${DIALOG=dialog}
   tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
   trap "rm -f $tempfile" 0 1 2 5 15
   $DIALOG --clear --title "" --menu "$CONFIGURACION_HOTSPOTS" 0 0 0   $c 2> $tempfile
   retvalnombre=$?
   NOMBRE=`cat $tempfile`
   nombre=$NOMBRE
   menuconfigura=""
fi

}

##############  SELECCION HOTSPOT  ##################################

function SELECCION-HOTSPOT(){
dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where estado = '0';")
if [[ $dbquery -eq 0 ]]
then
   dialog --title "$SALIR" --msgbox "$NO_HAY_HOTSPOTS" 0 0
else
   dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombre from hotspot;")
   array=($(for i in $dbquery;do echo $i;done))
   c=""
   for i in ${array[@]}
   do
     c=$c"$i \""\"' '
   done
   DIALOG=${DIALOG=dialog}
   tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
   trap "rm -f $tempfile" 0 1 2 5 15
   $DIALOG --clear --title "" --menu "$SELECCIONA_USUARIO" 0 0 0   $c 2> $tempfile
   retvalnombre=$?
   NOMBRE=`cat $tempfile`
   nombre=$NOMBRE
fi
}

function CONF-PERSONAL(){

while [ "$confpersonal" != "$VOLVER" ]; do
            DIALOG=${DIALOG=dialog}
            tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
            trap "rm -f $tempfile" 0 1 2 5 15
            $DIALOG --clear --title "$CONFIGURACION_PERSONAL" \
            --menu "" 0 0 0 \
            "$LLAMADA"  "$indicativo" \
            "DMR-ID (+2)" "$dmrid" \
            "NXDN-ID" "$nxdnid" \
            "────────────────────────────────" "" \
            "$VOLVER" "" 2> $tempfile
            retvalconfper=$?
            confpersonal=`cat $tempfile`
             if [[ $confpersonal = "$LLAMADA" ]]
               then
                  indicativo=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                  variable=$(echo $indicativo | tr '[:lower:]' '[:upper:]')
                  indicativo=$variable
                   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET indicativo = '$indicativo' where nombre = '$NOMBRE'";
                  else if [[ $confpersonal = "DMR-ID (+2)" ]]
                  then
                      dmrid=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                       mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET dmrid = '$dmrid' where nombre = '$NOMBRE'";
                      else if [[ $confpersonal = "NXDN-ID" ]]
                      then
                         nxdnid=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                          mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET nxdnid = '$nxdnid' where nombre = '$NOMBRE'";
                      fi
                  fi
               fi
done
confpersonal=""

}

function CONF-NXDN(){
nxdninactivity=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdninactivity from hot_NXDN where nombre = '$NOMBRE';")
nxdnreflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnreflector from hot_NXDN where nombre = '$NOMBRE';")
nxdnidioma=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnidioma from hot_NXDN where nombre = '$NOMBRE';")
nxdnselfonly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnselfonly from hot_NXDN where nombre = '$NOMBRE';")
while [ "$menunxdn" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfilenxdn=`tempfilenxdn 2>/dev/null` || tempfilenxdn=/tmp/test$$
    trap "rm -f $tempfilenxdn" 0 1 2 5 15
    $DIALOG2 --clear --title "Menu" \
    --menu "" 0 0 0 \
        "$IDIOMA"  "$nxdnidioma" \
        "$SOLO_REFLECTOR_INICIO"  "$nxdnreflector" \
        "$TIEMPO_DESCONEXION_MINUTOS"  "$nxdninactivity" \
        "$USAR_SOLO_YO"  "$nxdnselfonly" \
        "$VOLVER" "" 2> $tempfilenxdn
    retval=$?
    menunxdn=`cat $tempfilenxdn`
 if [[ $menunxdn = "$IDIOMA" ]]
 then
     idi="$PATHDVLINK/MENUS/nxdnidioma"
     whiptail --menu 'Select' 0 0 0 $(cat $idi) 2>/var/log/dato
     nxdnidioma=$(awk 'NR==1' /var/log/dato)
      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_NXDN SET nxdnidioma = '$nxdnidioma' where nombre = '$NOMBRE'";
     else if [[ $menunxdn = "$SOLO_REFLECTOR_INICIO" ]]
     then
        DIALOG2=${DIALOG2=dialog}
        tempfiledmr=`tempfiledmr 2>/dev/null` || tempfiledmr=/tmp/test$$
        trap "rm -f $tempfiledmr" 0 1 2 5 15
        $DIALOG2 --clear --title "" \
        --menu "" 0 0 0 \
           "$PERSONALIZAR_CONEXION"  "$nxdndireccion" \
           "$SELECCIONA_LISTADO" "" 2> $tempfiledmr
        retvalip=$?
        menuipp25=`cat $tempfiledmr`
        if [[ $menuipp25 = "$PERSONALIZAR_CONEXION" ]]
        then
           nxdnreflector=`dialog --stdout --title "" --inputbox "$REFLECTOR" 0 0`
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_NXDN SET nxdnreflector = '$nxdnreflector' where nombre = '$NOMBRE'";
        else
           FYSF="$PATHDVLINK/MENUS/nxdnhost"
           whiptail --menu "$SISTEMAS_DISPONIBLES" 0 0 0 $(cat $FYSF) 2>/var/log/dato
           nxdnreflector=$(awk 'NR==1' /var/log/dato)
           nxdnip=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ip from nxdnhosts where tg = '$nxdnreflector';")
           nxdnpuerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puerto from nxdnhosts where tg = '$nxdnreflector';")
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_NXDN SET nxdnreflector = '$nxdnreflector' where nombre = '$NOMBRE'";
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_NXDN SET nxdnip = '$nxdnip' where nombre = '$NOMBRE'";
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_NXDN SET nxdnpuerto = '$nxdnpuerto' where nombre = '$NOMBRE'";
        fi
        menuipp25=""
        else if [[ $menunxdn = "$TIEMPO_DESCONEXION_MINUTOS" ]]
        then
            nxdninactivity=`dialog --stdout --title "" --inputbox "$TIEMPO_DESCONEXION_MINUTOS" 0 0`
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_NXDN SET nxdninactivity = '$nxdninactivity' where nombre = '$NOMBRE'";
            else if [[ $menunxdn = "$USAR_SOLO_YO" ]]
            then
               if dialog --title ""  --yesno "$SOLO_YO" 0 0 ;then
                  nxdnselfonly=1
               else
                  nxdnselfonly=0
               fi
                   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_NXDN SET nxdnselfonly = '$nxdnselfonly' where nombre = '$NOMBRE'";
            fi
         fi
     fi
 fi
done
menunxdn=""
}


function CONF-P25(){
p25inactivity=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25inactivity from hot_P25 where nombre = '$NOMBRE';")
p25reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25reflector from hot_P25 where nombre = '$NOMBRE';")
p25idioma=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25idioma from hot_P25 where nombre = '$NOMBRE';")
p25selfonly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25selfonly from hot_P25 where nombre = '$NOMBRE';")
while [ "$menup25" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfilep25=`tempfilep25 2>/dev/null` || tempfilep25=/tmp/test$$
    trap "rm -f $tempfilep25" 0 1 2 5 15
    $DIALOG2 --clear --title "" \
    --menu "" 0 0 0 \
        "$IDIOMA"  "$p25idioma" \
        "$SOLO_REFLECTOR_INICIO"  "$p25reflector" \
        "$TIEMPO_DESCONEXION_MINUTOS"  "$p25inactivity" \
        "$USAR_SOLO_YO" "$p25selfonly" \
        "$VOLVER" "" 2> $tempfilep25
    retval=$?
    menup25=`cat $tempfilep25`
 if [[ $menup25 = "$IDIOMA" ]]
 then
     idi="$PATHDVLINK/MENUS/p25idioma"
     whiptail --menu 'Select' 0 0 0 $(cat $idi) 2>/var/log/dato
     p25idioma=$(awk 'NR==1' /var/log/dato)
      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_P25 SET p25idioma = '$p25idioma' where nombre = '$NOMBRE'";
######################33333
     else if [[ $menup25 = "$SOLO_REFLECTOR_INICIO" ]]
     then
        DIALOG2=${DIALOG2=dialog}
        tempfiledmr=`tempfiledmr 2>/dev/null` || tempfiledmr=/tmp/test$$
        trap "rm -f $tempfiledmr" 0 1 2 5 15
        $DIALOG2 --clear --title "" \
        --menu "" 0 0 0 \
           "$PERSONALIZAR_CONEXION"  "$p25reflector" \
           "$SELECCIONA_LISTADO" "" 2> $tempfiledmr
        retvalip=$?
        menuipp25=`cat $tempfiledmr`
        if [[ $menuipp25 = "$PERSONALIZAR_CONEXION" ]]
        then
           p25reflector=`dialog --stdout --title "" --inputbox "$REFLECTOR" 0 0`
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_P25 SET p25reflector = '$p25reflector' where nombre = '$NOMBRE'";
        else
           FYSF="$PATHDVLINK/MENUS/p25host"
           whiptail --menu "$SISTEMAS_DISPONIBLES" 0 0 0 $(cat $FYSF) 2>/var/log/dato
           p25reflector=$(awk 'NR==1' /var/log/dato)
           p25ip=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ip from p25hosts where tg = '$p25reflector';")
           p25puerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puerto from p25hosts where tg = '$p25reflector';")
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_P25 SET p25reflector = '$p25reflector' where nombre = '$NOMBRE'";
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_P25 SET p25ip = '$p25ip' where nombre = '$NOMBRE'";
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_P25 SET p25puerto = '$p25puerto' where nombre = '$NOMBRE'";
        fi
        menuipp25=""



#p25reflector=`dialog --stdout --title "p25" --inputbox "$REFLECTOR de inicio" 0 0`
#         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET p25reflector = '$p25reflector' where nombre = '$NOMBRE'";
        else if [[ $menup25 = "$TIEMPO_DESCONEXION_MINUTOS" ]]
        then
            p25inactivity=`dialog --stdout --title "" --inputbox "$TIEMPO_DESCONEXION_MINUTOS" 0 0`
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_P25 SET p25inactivity = '$p25inactivity' where nombre = '$NOMBRE'";
            else if [[ $menup25 = "$USAR_SOLO_YO" ]]
            then
               if dialog --title ""  --yesno "$SOLO_YO" 0 0 ;then
                  p25selfonly=1
               else
                  p25selfonly=0
               fi
                   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_P25 SET p25selfonly = '$p25selfonly' where nombre = '$NOMBRE'";
            fi
         fi
     fi
  fi
done
menup25=""
}

function CONF-DSTAR(){


reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reflector from hot_IRC where nombre = '$NOMBRE';")
repeaterband=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT repeaterband from hot_IRC where nombre = '$NOMBRE';")
atstartup=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT atstartup from hot_IRC where nombre = '$NOMBRE';")
reconnect=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reconnect from hot_IRC where nombre = '$NOMBRE';")
irchostname=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT irchostname from hot_IRC where nombre = '$NOMBRE';")
lenguaje=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT lenguaje from hot_IRC where nombre = '$NOMBRE';")

ccshost=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ccshost from hot_IRC where nombre = '$NOMBRE';")
#irchostname=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT irchostname from hot_IRC where nombre = '$NOMBRE';")
remotepass=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT remotepass from hot_IRC where nombre = '$NOMBRE';")

remote=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT remote from hot_IRC where nombre = '$NOMBRE';")

while [ "$menudstar" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfileysf=`tempfileysf 2>/dev/null` || tempfileysf=/tmp/test$$
    trap "rm -f $tempfileysf" 0 1 2 5 15
    $DIALOG2 --clear --title "" \
    --menu "" 0 0 0 \
        "$SELECCION_RED"  "$irchostname" \
        "$SELECCIONA_CCS"  "$ccshost" \
        "$REFLECTOR_INICIO"  "$reflector" \
        "$ARRANCA_REFLECTOR_INICIO" "$atstartup" \
        "$SELECCIONA_TIEMPO_RECONEXION" "$reconnect" \
        "$SELECCIONA_MODULO" "$repeaterband" \
        "$VOLVER" "" 2> $tempfileysf
    retvalconfmodem=$?
    menudstar=`cat $tempfileysf`
 if [[ $menudstar = "$SELECCION_RED" ]]
 then
      host="$PATHDVLINK/MENUS/dstarhost"
      whiptail --menu 'Select' 0 0 0 $(cat $host) 2>/var/log/dato
      pivote=$(awk 'NR==1' /var/log/dato)
      irchostname=$pivote
       mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET irchostname = '$irchostname' where nombre = '$NOMBRE'";
      else if [[ $menudstar = "$SELECCIONA_CCS" ]]
      then
        ccs="$PATHDVLINK/MENUS/ccs"
        whiptail --menu 'Select' 0 0 0 $(cat $ccs) 2>/var/log/dato
        pivote=$(awk 'NR==1' /var/log/dato)
        ccshost=$pivote
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET ccshost = '$ccshost' where nombre = '$NOMBRE'";
        else if [[ $menudstar = "$REFLECTOR_INICIO" ]]
        then
           reflector=`dialog --stdout --title "" --inputbox "$REFLECTOR_INICIO" 0 0`
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET reflector = '$reflector' where nombre = '$NOMBRE'";
           else if [[ $menudstar = "$ARRANCA_REFLECTOR_INICIO" ]]
           then
             if dialog --title ""  --yesno "$ARRANCAR_REFLECTOR_AL_INICIO" 0 0 ;then
               atstartup=1
             else
	       atstartup=0
             fi
              mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET atstartup = '$atstartup' where nombre = '$NOMBRE'";
             else if [[ $menudstar = "$SELECCIONA_TIEMPO_RECONEXION" ]]
             then
               tiempo="$PATHDVLINK/MENUS/dstartime"
               whiptail --menu 'Select' 0 0 0 $(cat $tiempo) 2>/var/log/dato
               reconnect=$(awk 'NR==1' /var/log/dato)
                mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET reconnect = '$reconnect' where nombre = '$NOMBRE'";
               else if [[ $menudstar = "$IDIOMA" ]]
               then
                  idioma="$PATHDVLINK/MENUS/dstaridiomas"
                  whiptail --menu 'Select' 0 0 0 $(cat $idioma) 2>/var/log/dato
                  lenguaje=$(awk 'NR==1' /var/log/dato)
                   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET lenguaje = '$lenguaje' where nombre = '$NOMBRE'";
                  else if [[ $menudstar = "$SELECCIONA_MODULO" ]]
                  then
                    modulo="$PATHDVLINK/MENUS/modulosdstar"
                    whiptail --menu 'Select' 0 0 0 $(cat $modulo) 2>/var/log/dato
                    repeaterband=$(awk 'NR==1' /var/log/dato)
                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET repeaterband = '$repeaterband' where nombre = '$NOMBRE'";
                    else if [[ $menudstar = "$ACTIVAR_ACCESO_REMOTO" ]]
                    then
                       if dialog --title ""  --yesno "$ARRANCAR_REFLECTOR_AL_INICIO" 0 0 ;then
                         remote=1
                       else
                          remote=0
                       fi
                        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET remote = '$remote' where nombre = '$NOMBRE'";
                       else if [[ $menudstar = "$PUERTO_ACCESO_REMOTO" ]]
                       then
                          remotepuerto=`dialog --stdout --title "" --inputbox "$REFLECTOR_INICIO" 0 0`
                           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET remotepuerto = '$remotepuerto' where nombre = '$NOMBRE'";
                          else if [[ $menudstar = "$CONTRASENA_ACCESO_REMOTO" ]]
                          then
                            remotepass=`dialog --stdout --title "" --inputbox "$REFLECTOR_INICIO" 0 0`
                             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET remotepass = '$remotepass' where nombre = '$NOMBRE'";
                          fi
                       fi
                    fi
                  fi
               fi
             fi
           fi
        fi
      fi
   fi

done
menudstar=""
}

function CONF-APRS(){
aprs=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT aprs from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprsserver=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT aprsserver from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprspass=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT aprspass from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprsdescripcion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT aprsdescripcion from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprssufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT aprssufijo from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
while [ "$gps" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfilegps=`tempfilegps 2>/dev/null` || tempfilegps=/tmp/test$$
    trap "rm -f $tempfilegps" 0 1 2 5 15
    $DIALOG2 --clear --title "" \
    --menu "" 0 0 0 \
        "$CAMBIAR_SERVIDOR_APRS"  "$aprsserver" \
        "$CONTRASENA_APRS" "$aprspass" \
        "$DESCRIPCION_APRS" "$aprsdescripcion" \
        "$SUFIJO_APRS" "$aprssufijo" \
        "$VOLVER" "" 2> $tempfilegps
    retvalconfmodem=$?
    gps=`cat $tempfilegps`
    if [[ $gps = "$CAMBIAR_SERVIDOR_APRS" ]]
    then
       DIALOG2=${DIALOG2=dialog}
       tempfilegps=`tempfilegps 2>/dev/null` || tempfilegps=/tmp/test$$
       trap "rm -f $tempfilegps" 0 1 2 5 15
       $DIALOG2 --clear --title "" \
       --menu "$SELECCIONA_SERVIDOR" 0 0 0 \
        "soam.aprs2.net"  "" \
        "euro.aprs2.net"  "" \
        "asia.aprs2.net"  "" \
        "aunz.aprs2.net"  "" \
        "noam.aprs2.net" "" 2> $tempfilegps
    retvalconfmodem=$?
    aprsserver=`cat $tempfilegps`
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_APRS_GATEWAY SET aprsserver = '$aprsserver' where nombre = '$NOMBRE'";
    else if [[ $gps = "$CONTRASENA_APRS" ]]
    then
       aprspass=`dialog --stdout --title "" --inputbox "Password aprs" 0 0`
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_APRS_GATEWAY SET aprspass = '$aprspass' where nombre = '$NOMBRE'";
       else if [[ $gps = "$DESCRIPCION_APRS" ]]
       then
          aprsdescripcion=`dialog --stdout --title "" --inputbox "$DESCRIPCION" 0 0`
           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_APRS_GATEWAY SET aprsdescripcion = '$aprsdescripcion' where nombre = '$NOMBRE'";
          else if [[ $gps = "$SUFIJO_APRS" ]]
          then
             aprssufijo=`dialog --stdout --title "" --inputbox "$SUFIJO_APRS" 0 0`
              mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_APRS_GATEWAY SET aprssufijo = '$aprssufijo' where nombre = '$NOMBRE'";
          fi
       fi
     fi
   fi
done
gps=""

}

function CONF-DMRGATEWAY(){
 rm /var/log/dmrgateway > /dev/null 2>&1
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select * from hotspot where nombre = '$NOMBRE' into outfile '/var/log/dmrgateway' fields terminated by '|' LINES TERMINATED BY '\r\n';" 
 tr '\n' ' ' </var/log/dmrgateway > /var/log/dmrgateway2
 mv /var/log/dmrgateway2 /var/log/dmrgateway
#/
activardmrgateway=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 129)
idiomadmrgateway=$(awk "NR==1" /var/log/dmrgateway  |cut -d"|" -f 130)
dmrgatewaytimeout=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 131)
xlx=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 132)
xlxslot=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 133)
xlxtg=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 134)
xlxstartup=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 135)
xlxmodulo=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 136)
bm=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 137)
bmnombre=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 138)
bmdireccion=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 139)
bmpuerto=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 140)
bmpass=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 141)
bmtgwrite=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 142)
bmpcwrite=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 143)
xlxpassa11pc=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 144)
bmpassa11pc=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 145)
dmrpassa11pc=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 146)
tgifpassa11pc=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 147)
hblinkpassa11pc=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 148)
dmrgateway=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 149)
dmrnombre=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 150)
dmrgatewaydireccion=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 151)
dmrgatewayport=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 152)
dmrtgrewrite=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 153)
dmrpcrewrite=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 154)
dmrgatewaypass=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 155)
dmrgatewaylocation=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 156)
dmrgatewaydebug=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 157)
tgif=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 158)
tgifnombre=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 159)
tgiftgrewrite=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 160)
tgifsrcrewrite=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 161)
tgifdireccion=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 162)
tgifpassword=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 163)
tgifport=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 164)
tgifdebug=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 165)
hblink=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 166)
hblinkname=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 167)
hblinkdireccion=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 168)
hblinkport=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 169)
hblinktgwrite=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 170)
hblinkpass=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 171)
hblinklocation=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 172)
hblinkdebug=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 173)
hblink2=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 174)
hblinkname2=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 175)
hblinkdireccion2=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 176)
hblinkport2=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 177)
hblinktgwrite2=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 178)
hblinkpass2=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 179)
hblinklocation2=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 180)
hblinkdebug2=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 181)
options=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select options from hotspot where nombre = '$NOMBRE';")

while [ "$menudmrgateway" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfiledmr=`tempfiledmr 2>/dev/null` || tempfiledmr=/tmp/test$$
    trap "rm -f $tempfiledmr" 0 1 2 5 15
    $DIALOG2 --clear --title "Menu" \
    --menu "" 0 0 0 \
        "_______________________________________________"  "______" \
        "$IDIOMA"  "$idiomadmrgateway" \
        "Tiempo desconexion en segundos"  "$dmrgatewaytimeout" \
        "______________________ XLX ____________________"  "______" \
        "Seleccion de slot XLX" "$xlxslot" \
        "TG XLX" "$xlxtg" \
        "Servidor de inicio XLX" "$xlxstartup" \
        "Modulo XLX" "$xlxmodulo" \
        "Permitir trafico de todos los TG´s XLX" "$xlxpassa11pc" \
        "_________________ BRANDMEISTER ________________"  "______" \
        "Nombre BM" "$bmnombre" \
        "IP/url conexion BM"  "$bmdireccion" \
        "Puerto BM"  "$bmpuerto" \
        "Password BM"  "$bmpass" \
        "TGRewrite BM" "$bmtgwrite" \
        "PCRewrite BM" "$bmpcwrite" \
        "Permitir trafico de todos los TG´s BM" "$bmpassa11pc" \
        "______________________ DMR+ ____________________"  "______" \
        "Nombre DMR+" "$dmrnombre" \
        "IP/url conexion DMR+"  "$dmrgatewaydireccion" \
        "Puerto DMR+"  "$dmrgatewayport" \
        "Password DMR+"  "$dmrgatewaypass" \
        "TGRewrite DMR+" "$dmrtgrewrite" \
        "PCRewrite DMR+" "$dmrpcrewrite" \
        "Permitir trafico de todos los TG´s DMR+" "$dmrpassa11pc" \
        "______________________ TGIF _____________________"  "______" \
        "Nombre TGIF" "$tgifnombre" \
        "IP/url conexion TGIF"  "$tgifdireccion" \
        "Puerto TGIF"  "$tgifport" \
        "Password TGIF"  "$tgifpassword" \
        "TGRewrite TGIF" "$tgiftgrewrite" \
        "SRCRewrite TGIF" "$tgifsrcrewrite" \
        "Permitir trafico de todos los TG´s TGIF" "$tgifpassa11pc" \
        "____________________ HBLINK ______________________"  "______" \
        "Nombre HBLINK" "$hblinkname" \
        "IP/url conexion HBLINK"  "$hblinkdireccion" \
        "Puerto HBLINK"  "$hblinkport" \
        "Password HBLINK"  "$hblinkpass" \
        "TGRewrite HBLINK" "$hblinktgwrite" \
        "Permitir trafico de todos los TG´s HBLINK" "$hblinkpassa11pc" \
        "____________________ HBLINK II_____________________"  "______" \
        "Nombre HBLINK II" "$hblinkname2" \
        "IP/url conexion HBLINK II"  "$hblinkdireccion2" \
        "Puerto HBLINK II"  "$hblinkport2" \
        "Password HBLINK II"  "$hblinkpass2" \
        "TGRewrite HBLINK II" "$hblinktgwrite2" \
        "Permitir trafico de todos los TG´s HBLINK II" "$hblinkpassa11pc2" \
        "____________________________________________________"  "______" \
        "$VOLVER" "" 2> $tempfiledmr
    retvaldmrgateway=$?
    menudmrgateway=`cat $tempfiledmr`
    case $menudmrgateway in
	"$IDIOMA")
                idioma="$PATHDVLINK/MENUS/dmridioma"
                whiptail --menu 'Select' 0 0 0 $(cat $idioma) 2>/var/log/dato
                idiomadmrgateway=$(awk 'NR==1' /var/log/dato)
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET idiomadmrgateway = '$idiomadmrgateway' where nombre = '$NOMBRE'";
		;;
	"Tiempo desconexion en segundos")
                dmrgatewaytimeout=`dialog --stdout --title "IP" --inputbox "$ESCRIBE_IP_URL" 0 0`
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgatewaytimeout = '$dmrgatewaytimeout' where nombre = '$NOMBRE'";
		;;
        "Seleccion de slot XLX")
                xlxslot=`dialog --stdout --title "TG" --inputbox "Slot 1 o 2" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET xlxslot = '$xlxslot' where nombre = '$NOMBRE'";
                ;;
        "TG XLX")
                xlxtg=`dialog --stdout --title "TG" --inputbox "Escribe TG" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET xlxtg = '$xlxtg' where nombre = '$NOMBRE'";
                ;;
        "Servidor de inicio XLX")
                xlxinicio="$PATHDVLINK/MENUS/xlxslot"
                whiptail --menu 'Select' 0 0 0 $(cat $xlxinicio) 2>/var/log/dato
                xlxstartup=$(awk 'NR==1' /var/log/dato)
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET xlxstartup = '$xlxstartup' where nombre = '$NOMBRE'";
                ;;
        "Modulo XLX")
                xlxmodulo="$PATHDVLINK/MENUS/modulosdstar"
                whiptail --menu 'Select' 0 0 0 $(cat $xlxmodulo) 2>/var/log/dato
                xlxmodulo=$(awk 'NR==1' /var/log/dato)
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET xlxmodulo = '$xlxmodulo' where nombre = '$NOMBRE'";
                ;;
        "Permitir trafico de todos los TG´s XLX")
                if dialog --title "¿?"  --yesno "¿Permitir?" 0 0 ;then
                   xlxpassa11pc=1
                else
                   xlxpassa11pc=0
                fi
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET xlxpassa11pc = '$xlxpassa11pc' where nombre = '$NOMBRE'";
                ;;
        "Nombre BM")
                bmnombre=`dialog --stdout --title "BM" --inputbox "Nombre BM" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET bmnombre = '$bmnombre' where nombre = '$NOMBRE'";
                ;;
        "IP/url conexion BM")
                DIALOG2=${DIALOG2=dialog}
                tempfiledmr=`tempfiledmr 2>/dev/null` || tempfiledmr=/tmp/test$$
                trap "rm -f $tempfiledmr" 0 1 2 5 15
                $DIALOG2 --clear --title "Menu" \
                --menu "" 0 0 0 \
                "$PERSONALIZAR_CONEXION"  "$dmrdireccion" \
                "$SELECCIONA_LISTADO" "" 2> $tempfiledmr
                retvalip=$?
                menuipdmr=`cat $tempfiledmr`
                if [[ $menuipdmr = "$PERSONALIZAR_CONEXION" ]]
                then
                   bmdireccion=`dialog --stdout --title "IP" --inputbox "$ESCRIBE_IP_URL" 0 0`
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET bmdireccion = '$bmdireccion' where nombre = '$NOMBRE'";
                else
                   FYSF="$PATHDVLINK/MENUS/dmrhost"
                   whiptail --menu '$SISTEMAS_DISPONIBLES' 0 0 0 $(cat $FYSF) 2>/var/log/dato
                   bmdireccion=$(awk 'NR==1' /var/log/dato)
                   ip=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ip from dmrhost where name = '$bmdireccion';")
                   bmpuerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puerto from dmrhost where name = '$bmdireccion';")
                   bmpass=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from dmrhost where name = '$bmdireccion';")
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET bmdireccion = '$ip' where nombre = '$NOMBRE'";
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET bmpuerto = '$bmpuerto' where nombre = '$NOMBRE'";
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET bmpass = '$bmpass' where nombre = '$NOMBRE'";
                   bmdireccion=$ip

                fi
                menuipdmr=""
                ;;
        "Puerto BM")
                bmpuerto=`dialog --stdout --title "PASSWORD" --inputbox "BM PASSWORD" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET bmpass = '$bmpass' where nombre = '$NOMBRE'";
                ;;
        "Password BM")
                bmpass=`dialog --stdout --title "PUERTO" --inputbox "BM PUERTO" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET bmpass = '$bmpass' where nombre = '$NOMBRE'";
                ;;
        "TGRewrite BM")
                bmtgwrite=`dialog --stdout --title "TGREWRITE" --inputbox "TGREWRITE" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET bmtgwrite = '$bmtgwrite' where nombre = '$NOMBRE'";
                ;;
        "PCRewrite BM")
                bmpcwrite=`dialog --stdout --title "PCREWRITE" --inputbox "PCREWRITE" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET bmpcwrite = '$bmpcwrite' where nombre = '$NOMBRE'";
                ;;
        "Permitir trafico de todos los TG´s BM")
               if dialog --title "¿?"  --yesno "¿Permitir?" 0 0 ;then
                   bmpassa11pc=1
                else
                   bmpassa11pc=0
                fi
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET bmpassa11pc = '$bmpassa11pc' where nombre = '$NOMBRE'";
                ;;
        "Nombre DMR+")
                dmrnombre=`dialog --stdout --title "BM" --inputbox "Nombre DMR+" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrnombre = '$dmrnombre' where nombre = '$NOMBRE'";
                ;;
        "IP/url conexion DMR+")
                DIALOG2=${DIALOG2=dialog}
                tempfiledmr=`tempfiledmr 2>/dev/null` || tempfiledmr=/tmp/test$$
                trap "rm -f $tempfiledmr" 0 1 2 5 15
                $DIALOG2 --clear --title "Menu" \
                --menu "" 0 0 0 \
                "$PERSONALIZAR_CONEXION"  "$dmrdireccion" \
                "$SELECCIONA_LISTADO" "" 2> $tempfiledmr
                retvalip=$?
                menuipdmr=`cat $tempfiledmr`
                if [[ $menuipdmr = "$PERSONALIZAR_CONEXION" ]]
                then
                   dmrgatewaydireccion=`dialog --stdout --title "IP" --inputbox "$ESCRIBE_IP_URL" 0 0`
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgatewaydireccion = '$dmrgatewaydireccion' where nombre = '$NOMBRE'";
                else
                   #home/$USER/generador/dmr2';"
                   FYSF="$PATHDVLINK/MENUS/dmrhost"
                   whiptail --menu '$SISTEMAS_DISPONIBLES' 0 0 0 $(cat $FYSF) 2>/var/log/dato
                   dmrgatewaydireccion=$(awk 'NR==1' /var/log/dato)
                   ip=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ip from dmrhost where name = '$dmrgatewaydireccion';")
                   dmrgatewayport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puerto from dmrhost where name = '$dmrgatewaydireccion';")
                   dmrgatewaypass=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from dmrhost where name = '$dmrgatewaydireccion';")
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgatewaydireccion = '$ip' where nombre = '$NOMBRE'";
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgatewayport = '$dmrgatewayport' where nombre = '$NOMBRE'";
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgatewaypass = '$dmrgatewaypass' where nombre = '$NOMBRE'";
                   dmrgatewaydireccion=$ip
                   fi

                ;;
        "Puerto DMR+")
                dmrgatewayport=`dialog --stdout --title "PUERTO" --inputbox "BM PUERTO" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgatewayport = '$dmrgatewayport' where nombre = '$NOMBRE'";
                ;;
        "Password DMR+")
                dmrgatewaypass=`dialog --stdout --title "PASSWORD" --inputbox "DMR+ PASSWORD" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrgatewaypass = '$dmrgatewaypass' where nombre = '$NOMBRE'";
                ;;
       "TGRewrite DMR+")
                dmrtgrewrite=`dialog --stdout --title "TGREWRITE" --inputbox "TGREWRITE" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrtgrewrite = '$dmrtgrewrite' where nombre = '$NOMBRE'";
                ;;
        "PCRewrite DMR+")
                dmrpcrewrite=`dialog --stdout --title "PCREWRITE" --inputbox "PCREWRITE" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrpcrewrite = '$dmrpcrewrite' where nombre = '$NOMBRE'";
                ;;
        "Permitir trafico de todos los TG´s DMR+")
                if dialog --title "¿?"  --yesno "¿Permitir?" 0 0 ;then
                   dmrpassa11pc=1
                else
                   dmrpassa11pc=0
                fi
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmrpassa11pc = '$dmrpassa11pc' where nombre = '$NOMBRE'";
                ;;
        "Nombre TGIF")
                tgifnombre=`dialog --stdout --title "TGIF" --inputbox "Nombre TGIF" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgifnombre = '$tgifnombre' where nombre = '$NOMBRE'";
                ;;
        "IP/url conexion TGIF")

                DIALOG2=${DIALOG2=dialog}
                tempfiletgif=`tempfiletgif 2>/dev/null` || tempfiletgif=/tmp/test$$
                trap "rm -f $tempfiletgif" 0 1 2 5 15
                $DIALOG2 --clear --title "Menu" \
                --menu "" 0 0 0 \
                "$PERSONALIZAR_CONEXION"  "$tgifdireccion" \
                "$SELECCIONA_LISTADO" "" 2> $tempfiledmr
                retvalip=$?
                menuiptgif=`cat $tempfiledmr`
                if [[ $menuiptgif = "$PERSONALIZAR_CONEXION" ]]
                then
                   tgifdireccion=`dialog --stdout --title "TGIF" --inputbox "Direccion TGIF" 0 0`
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgifdireccion = '$tgifdireccion' where nombre = '$NOMBRE'";
                else
                   #home/$USER/generador/dmr2';"
                   FYSF="$PATHDVLINK/MENUS/dmrhost"
                   whiptail --menu '$SISTEMAS_DISPONIBLES' 0 0 0 $(cat $FYSF) 2>/var/log/dato
                   tgifdireccion=$(awk 'NR==1' /var/log/dato)
                   ip=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ip from dmrhost where name = '$tgifdireccion';")
                   tgifport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puerto from dmrhost where name = '$tgifdireccion';")
                   tgifpassword=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from dmrhost where name = '$tgifdireccion';")
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgifdireccion = '$ip' where nombre = '$NOMBRE'";
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgifport = '$tgifport' where nombre = '$NOMBRE'";
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgifpassword = '$tgifpassword' where nombre = '$NOMBRE'";
                   tgifdireccion=$ip
                 fi
                ;;
        "Puerto TGIF")
                tgifport=`dialog --stdout --title "PUERTO" --inputbox "BM PUERTO" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgifport = '$tgifport' where nombre = '$NOMBRE'";
                ;;
        "Password TGIF")
                tgifpassword=`dialog --stdout --title "PASSWORD" --inputbox "TGIF PASSWORD" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgifpassword = '$tgifpassword' where nombre = '$NOMBRE'";
                ;;
        "TGRewrite TGIF")
                tgiftgrewrite=`dialog --stdout --title "TGREWRITE" --inputbox "TGREWRITE" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgiftgrewrite = '$tgiftgrewrite' where nombre = '$NOMBRE'";
                ;;
        "SRCRewrite TGIF")
                tgifsrcrewrite=`dialog --stdout --title "PCREWRITE" --inputbox "PCREWRITE" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgifsrcrewrite = '$tgifsrcrewrite' where nombre = '$NOMBRE'";
                ;;
        "Permitir trafico de todos los TG´s TGIF")
                if dialog --title "¿?"  --yesno "¿Permitir?" 0 0 ;then
                   tgifpassa11pc=1
                else
                   tgifpassa11pc=0
                fi
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgifpassa11pc = '$tgifpassa11pc' where nombre = '$NOMBRE'";
                ;;
        "Nombre HBLINK")
                hblinkname=`dialog --stdout --title "HBLINK" --inputbox "Nombre HBLINK" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkname = '$hblinkname' where nombre = '$NOMBRE'";

                ;;
        "IP/url conexion HBLINK")
                DIALOG2=${DIALOG2=dialog}
                tempfilehb=`tempfilehb 2>/dev/null` || tempfilehb=/tmp/test$$
                trap "rm -f $tempfilehb" 0 1 2 5 15
                $DIALOG2 --clear --title "Menu" \
                --menu "" 0 0 0 \
                "$PERSONALIZAR_CONEXION"  "$hblinkdireccion" \
                "$SELECCIONA_LISTADO" "" 2> $tempfiledmr
                retvalip=$?
                menuiphb=`cat $tempfiledmr`
                if [[ $menuiphb = "$PERSONALIZAR_CONEXION" ]]
                then
                   hblinkdireccion=`dialog --stdout --title "TGIF" --inputbox "Direccion TGIF" 0 0`
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkdireccion = '$hblinkdireccion' where nombre = '$NOMBRE'";
                else
                   #home/$USER/generador/dmr2';"
                   FYSF="$PATHDVLINK/MENUS/dmrhost"
                   whiptail --menu '$SISTEMAS_DISPONIBLES' 0 0 0 $(cat $FYSF) 2>/var/log/dato
                   hblinkdireccion=$(awk 'NR==1' /var/log/dato)
                   ip=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ip from dmrhost where name = '$hblinkdireccion';")
                   hblinkport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puerto from dmrhost where name = '$hblinkdireccion';")
                   hblinkpass=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from dmrhost where name = '$hblinkdireccion';")
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkdireccion = '$ip' where nombre = '$NOMBRE'";
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkport = '$hblinkport' where nombre = '$NOMBRE'";
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkpass = 'hblinkpass' where nombre = '$NOMBRE'";
                   hblinkdireccion=$ip
                 fi
                ;;
        "Puerto HBLINK")
                hblinkport=`dialog --stdout --title "HBLINK" --inputbox "Puerto HBLINK" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkport = '$hblinkport' where nombre = '$NOMBRE'";
                ;;
        "Password HBLINK")
                hblinkpass=`dialog --stdout --title "HBLINK" --inputbox "Pass HBLINK" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkpass = '$hblinkpass' where nombre = '$NOMBRE'";
                ;;
        "TGRewrite HBLINK")
                hblinktgwrite=`dialog --stdout --title "TGREWRITE" --inputbox "TGREWRITE" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinktgwrite = '$hblinktgwrite' where nombre = '$NOMBRE'";
                ;;
        "Permitir trafico de todos los TG´s HBLINK")
                if dialog --title "¿?"  --yesno "¿Permitir?" 0 0 ;then
                   hblinkpassa11pc=1
                else
                   hblinkpassa11pc=0
                fi
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkpassa11pc = '$hblinkpassa11pc' where nombre = '$NOMBRE'";
                ;;
        "Nombre HBLINK II")
                hblinkname2=`dialog --stdout --title "HBLINK" --inputbox "Nombre HBLINK" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkname2 = '$hblinkname2' where nombre = '$NOMBRE'";

                ;;
        "IP/url conexion HBLINK II")
                DIALOG2=${DIALOG2=dialog}
                tempfilehb=`tempfilehb2 2>/dev/null` || tempfilehb2=/tmp/test$$
                trap "rm -f $tempfilehb2" 0 1 2 5 15
                $DIALOG2 --clear --title "Menu" \
                --menu "" 0 0 0 \
                "$PERSONALIZAR_CONEXION"  "$hblinkdireccion2" \
                "$SELECCIONA_LISTADO" "" 2> $tempfiledmr
                retvalip=$?
                menuiphb2=`cat $tempfiledmr`
                if [[ $menuiphb2 = "$PERSONALIZAR_CONEXION" ]]
                then
                   hblinkdireccion2=`dialog --stdout --title "TGIF" --inputbox "Direccion TGIF" 0 0`
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkdireccion2 = '$hblinkdireccion2' where nombre = '$NOMBRE'";
                else
                   #home/$USER/generador/dmr2';"
                   FYSF="$PATHDVLINK/MENUS/dmrhost"
                   whiptail --menu '$SISTEMAS_DISPONIBLES' 0 0 0 $(cat $FYSF) 2>/var/log/dato
                   hblinkdireccion2=$(awk 'NR==1' /var/log/dato)
                   ip=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ip from dmrhost where name = '$hblinkdireccion2';")
                   hblinkport2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puerto from dmrhost where name = '$hblinkdireccion2';")
                   hblinkpass2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from dmrhost where name = '$hblinkdireccion2';")
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkdireccion2 = '$ip' where nombre = '$NOMBRE'";
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkport2 = '$hblinkport2' where nombre = '$NOMBRE'";
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkpass2 = 'hblinkpass2' where nombre = '$NOMBRE'";
                   hblinkdireccion2=$ip
               fi
                ;;
        "Puerto HBLINK II")
                hblinkport2=`dialog --stdout --title "HBLINK" --inputbox "Puerto HBLINK" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkport2 = '$hblinkport2' where nombre = '$NOMBRE'";
                ;;
        "Password HBLINK II")
                hblinkpass2=`dialog --stdout --title "HBLINK" --inputbox "Pass HBLINK" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkpass2 = '$hblinkpass2' where nombre = '$NOMBRE'";
                ;;
        "TGRewrite HBLINK II")
                hblinktgwrite2=`dialog --stdout --title "TGREWRITE" --inputbox "TGREWRITE" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinktgwrite2 = '$hblinktgwrite2' where nombre = '$NOMBRE'";
                ;;
        "Permitir trafico de todos los TG´s HBLINK II")
                if dialog --title "¿?"  --yesno "¿Permitir?" 0 0 ;then
                   hblinkpassa11pc2=1
                else
                   hblinkpassa11pc2=0
                fi
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET hblinkpassa11pc = '$hblinkpassa11pc2' where nombre = '$NOMBRE'";
                ;;
         *)
		echo ""
		;;
   esac
done
menudmrgateway=""
}

function CONF-DMR(){
dmrdireccion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrdireccion from hot_DMR where nombre = '$NOMBRE';")
dmrpremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrpremoto from hot_DMR where nombre = '$NOMBRE';")
dmrpassword=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrpassword from hot_DMR where nombre = '$NOMBRE';")
dmroptions=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmroptions from hot_DMR where nombre = '$NOMBRE';")
dmrbeacon=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrbeacon from hot_DMR where nombre = '$NOMBRE';")
dmrbeaconinterval=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrbeaconinterval from hot_DMR where nombre = '$NOMBRE';")
dmrbeaconduracion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrbeaconduracion from hot_DMR where nombre = '$NOMBRE';")
dmrcolor=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrcolor from hot_DMR where nombre = '$NOMBRE';")
dmrselfonly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrselfonly from hot_DMR where nombre = '$NOMBRE';")
embeddedlconly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT embeddedlconly from hot_DMR where nombre = '$NOMBRE';")
dmrdumpdata=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrdumpdata from hot_DMR where nombre = '$NOMBRE';")
dmrrelink=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrrelink from hot_DMR where nombre = '$NOMBRE';")
cross_TG=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cross_TG from hot_DMR where nombre = '$NOMBRE';")

#creo no usado
dmred=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmred from hotspot where nombre = '$NOMBRE';")
tgysf2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgysf2dmr from hotspot where nombre = '$NOMBRE';")
#fin creo no usados

while [ "$menudmr" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfiledmr=`tempfiledmr 2>/dev/null` || tempfiledmr=/tmp/test$$
    trap "rm -f $tempfiledmr" 0 1 2 5 15
    $DIALOG2 --clear --title "DMR" \
        --menu "" 0 0 0 \
        "$IP_SERVER_DMR"  "$dmrdireccion" \
        "$PUERTO_REMOTO"  "$dmrpremoto" \
        "Password" "$dmrpassword" \
        "------------------------------------------------------" "" \
        "$REFLECTOR_INICIO" "$dmroptions" \
        "$TIEMPO_RECONEXION_REFINI" "$dmrrelink" \
        "------------------------------------------------------" "" \
        "TG INICIO CROSSLINKS REDES BM y HBLNK" "$cross_TG" \
        "---------------------------------- -------------------" "" \
        "$ACTIVAR_BALIZA" "$dmrbeacon" \
        "$DURACION_BALIZA" "$dmrbeaconduracion" \
        "$INTERVALO_BALIZA"  "$dmrbeaconinterval" \
        "$COLOR"  "$dmrcolor" \
        "$USAR_SOLO_YO" "$dmrselfonly" \
        "$ACTIVAR_CON_MOTOROLA" "$embeddedlconly" \
        "DMRdumpdata" "$dmrdumpdata" \
        "$VOLVER" "" 2> $tempfiledmr
    retvalconfmodem=$?
    menudmr=`cat $tempfiledmr`
    if [[ $menudmr = "$IP_SERVER_DMR" ]]
    then
        DIALOG2=${DIALOG2=dialog}
        tempfiledmr=`tempfiledmr 2>/dev/null` || tempfiledmr=/tmp/test$$
        trap "rm -f $tempfiledmr" 0 1 2 5 15
        $DIALOG2 --clear --title "" \
        --menu "" 0 0 0 \
           "$PERSONALIZAR_CONEXION"  "$dmrdireccion" \
           "$SELECCIONA_LISTADO" "" 2> $tempfiledmr
        retvalip=$?
        menuipdmr=`cat $tempfiledmr`
        if [[ $menuipdmr = "$PERSONALIZAR_CONEXION" ]]
        then
           dmrdireccion=`dialog --stdout --title "" --inputbox "$ESCRIBE_IP_URL" 0 0`
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrdireccion = '$dmrdireccion' where nombre = '$NOMBRE'";
        else
           FYSF="$PATHDVLINK/MENUS/dmrhost"
           whiptail --menu "$SISTEMAS_DISPONIBLES" 0 0 0 $(cat $FYSF) 2>/var/log/dato
           dmrdireccion=$(awk 'NR==1' /var/log/dato)
           ipremota=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ip from dmrhost where name = '$dmrdireccion' LIMIT 1;")
           dmrpremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puerto from dmrhost where name = '$dmrdireccion' LIMIT 1;")
           dmrpassword=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from dmrhost where name = '$dmrdireccion' LIMIT 1;")
           dmrdireccion=$ipremota
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrdireccion = '$ipremota' where nombre = '$NOMBRE'";
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrpremoto = '$dmrpremoto' where nombre = '$NOMBRE'";
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrpassword = '$dmrpassword' where nombre = '$NOMBRE'";

        fi
        menuipdmr=""
        else if [[ $menudmr = "TG INICIO CROSSLINKS REDES BM y HBLNK" ]]
        then
            cross_TG=`dialog --stdout --title "" --inputbox "TG INICIO CROSSLINKS" 0 0`
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET cross_TG = '$cross_TG' where nombre = '$NOMBRE'";
        else if [[ $menudmr = "$PUERTO_REMOTO" ]]
        then
           dmrpremoto=`dialog --stdout --title "" --inputbox "$PUERTO_REMOTO" 0 0`
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrpremoto = '$dmrpremoto' where nombre = '$NOMBRE'";
           else if [[ $menudmr = "Password" ]]
           then
             dmrpassword=`dialog --stdout --title "" --inputbox "$PASSWORD" 0 0`
              mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrpassword = '$dmrpassword' where nombre = '$NOMBRE'";
             else if [[ $menudmr = "$REFLECTOR_INICIO" ]]
             then
               dmroptions=`dialog --stdout --title "" --inputbox "$REFLECTOR_DMRMAS" 0 0`
               if [[ $dmroptions != "" ]]
               then
                  dmroptions="StartRef=$dmroptions;RelinkTime=$dmrrelink;"
               fi
                mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrreflector = '$dmroptions' where nombre = '$NOMBRE'";
                mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmroptions = '$dmroptions' where nombre = '$NOMBRE'";
               else if [[ $menudmr = "$TIEMPO_RECONEXION_REFINI" ]]
               then
                 dmrrelink=`dialog --stdout --title "" --inputbox "$TIEMPO_RECONEXION_DMR" 0 0`
                  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrrelink = '$dmrrelink' where nombre = '$NOMBRE'";
                 dmrreflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrreflector from hot_DMR where nombre = '$NOMBRE';")
                 dmroptions="StartRef=$dmrreflector;RelinkTime=$dmrrelink;"
                  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmroptions = '$dmroptions' where nombre = '$NOMBRE'";
                 else if [[ $menudmr = "$ACTIVAR_BALIZA" ]]
                 then
                   if dialog --title ""  --yesno "¿$ACTIVAR_BALIZA?" 0 0 ;then
                      dmrbeacon=1
                   else
                      dmrbeacon=0
                   fi
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrbeacon = '$dmrbeacon' where nombre = '$NOMBRE'";
                   else if [[ $menudmr = "$DURACION_BALIZA" ]]
                   then
                      dmrbeaconduracion=`dialog --stdout --title "" --inputbox "$DURACION_BALIZA" 0 0`
                       mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrbeaconduracion = '$dmrbeaconduracion' where nombre = '$NOMBRE'";
                      else if [[ $menudmr = "$INTERVALO_BALIZA" ]]
                      then
                        dmrbeaconinterval=`dialog --stdout --title "" --inputbox "$ACTIVAR_BALIZA_CADA_X" 0 0`
                         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrbeaconinterval = '$dmrbeaconinterval' where nombre = '$NOMBRE'";
                        else if [[ $menudmr = "$COLOR" ]]
                        then
                          dmrcolor=`dialog --stdout --title "$COLOR" --inputbox "$VALOR_1_15" 0 0`
                           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrcolor = '$dmrcolor' where nombre = '$NOMBRE'";
                          else if [[ $menudmr = "$USAR_SOLO_YO" ]]
                          then
                            if dialog --title ""  --yesno "$SOLO_YO" 0 0 ;then
                              dmrselfonly=1
                            else
                              dmrselfonly=0
                            fi
                             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrselfonly = '$dmrselfonly' where nombre = '$NOMBRE'";
                            else if [[ $menudmr = "$ACTIVAR_CON_MOTOROLA" ]]
                            then
                              if dialog --title "¿MOTOROLA?"  --yesno "¿$ACTIVAR_CON_MOTOROLA?" 0 0 ;then
                                 embeddedlconly=1
                              else
                                 embeddedlconly=0
                              fi
                               mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET embeddedlconly = '$embeddedlconly' where nombre = '$NOMBRE'";
                              else if [[ $menudmr = "DMRdumpdata" ]]
                              then
                                dmrdumpdata=`dialog --stdout --title "DUMPTADATA" --inputbox "$ESCRIBA_VALOR_10" 0 0`
                                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrdumpdata = '$dmrdumpdata' where nombre = '$NOMBRE'";
                                else if [[ $menudmr = "DMRcallhang" ]]
                                then
                                   dmrcallhang=`dialog --stdout --title "CALLHANG" --inputbox "$ESCRIBE_VALOR" 0 0`
                                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrcallhang = '$dmrcallhang' where nombre = '$NOMBRE'";
                                   else if [[ $menudmr = "DMRtxhang" ]]
                                   then
                                      dmrtxhang=`dialog --stdout --title "TXHANG" --inputbox "$ESCRIBE_VALOR" 0 0`
                                       mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrtxhang = '$dmrtxhang' where nombre = '$NOMBRE'";
                                      else if [[ $menudmr = "$SELECCION_RED_CROSSLINKS" ]]
                                      then
                                          DIALOG2=${DIALOG2=dialog}
                                          tempfilesel=`tempfiledmr 2>/dev/null` || tempfilesel=/tmp/test$$
                                          trap "rm -f $tempfilesel" 0 1 2 5 15
                                          $DIALOG2 --clear --title "" \
                                               --menu "$SELECCION_RED_CROSSLINK" 0 0 0 \
                                               "HBLINK"  "" \
                                               "BM"  "" \
                                               "XLX o DMR+" "" 2> $tempfiledmr
                                          retvalconfcross=$?
                                          selecross=`cat $tempfiledmr`
                                          dmred=$selecross
                                          if [[ $selecross = "HBLINK" ]]
                                          then
                                              tgysf2dmr=`dialog --stdout --title "Crosslinks" --inputbox "$ESCRIBE_TG_HBLINK" 0 0`
                                               mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgysf2dmr = '$tgysf2dmr' where nombre = '$NOMBRE'";
                                              else if [[ $selecross = "BM" ]]
                                              then
                                                  tgysf2dmr=`dialog --stdout --title "Crosslinks" --inputbox "$ESCRIBE_TG_BM" 0 0`
                                                   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgysf2dmr = '$tgysf2dmr' where nombre = '$NOMBRE'";
                                              else
                                                  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET tgysf2dmr = '' where nombre = '$NOMBRE'";
                                                 tgysf2dmr=""
                                              fi
                                          fi
                                           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dmred = '$selecross' where nombre = '$NOMBRE'";
                                          selecross=""
                                     fi
                                  fi
                                fi
                              fi
                            fi
                          fi
                        fi
                      fi
                   fi
                 fi
               fi
             fi
           fi
        fi
      fi
    fi
done
menudmr=""
}
function CONF-CW(){
cwtime=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cwtime from hot_CW where nombre = '$NOMBRE';")
indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cwindicativo from hot_CW where nombre = '$NOMBRE';")
while [ "$menucw" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfilecw=`tempfilecw 2>/dev/null` || tempfilecw=/tmp/test$$
    trap "rm -f $tempfilecw" 0 1 2 5 15
    $DIALOG2 --clear --title "" \
    --menu "" 0 0 0 \
        "$LLAMADA"  "$indicativo" \
        "$TIEMPOCW"  "$cwtime" \
        "$VOLVER" "" 2> $tempfilecw
    retvalcw=$?
    menucw=`cat $tempfilecw`
    if [[ $menucw = "$TIEMPOCW" ]]
    then
       cwtime=`dialog --stdout --title "" --inputbox "$TIEMPO_CW" 0 0`
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_CW SET cwtime = '$cwtime' where nombre = '$NOMBRE'";
    fi
done
menucw=""
}

function ACTUALIZA-REFLECTORES(){
ruta="/var/log"
#DMRHOSTS
curl http://hblinkspain.es:81/hosts/DMRHosts.txt > $ruta/DMRHosts.txt
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from dmrhost;"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/var/log/DMRHosts.txt' into table dmrhost FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r';"
#NXDNHOSTS
curl http://hblinkspain.es:81/hosts/NXDNHosts.txt > $ruta/NXDNHosts.txt
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from nxdnhosts;"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/var/log/NXDNHosts.txt' ignore into table nxdnhosts FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r';"
#P25HOSTS
curl http://hblinkspain.es:81/hosts/P25Hosts.txt > $ruta/P25Hosts.txt
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from p25hosts;"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/var/log/P25Hosts.txt' ignore into table p25hosts FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r';"
#YSFHOSTS
curl http://hblinkspain.es:81/hosts/YSFHosts.txt > $ruta/YSFHosts.txt
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from ysfhost;"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/var/log/YSFHosts.txt' ignore into table ysfhost FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r';"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from ysfhost2;"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/var/log/YSFHosts.txt' ignore into table ysfhost2 FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r';"
#BORRO LOS LISTADOS DE LOS MENUS
#r="/$PATHDVLINK/MENUS/dmrhost"
#echo "r vale $r"
rm "$PATHDVLINK/MENUS/dmrhost" > /dev/null 2>&1
#x="$PATHDVLINK/MENUS/ysfhost"
rm "$PATHDVLINK/MENUS/ysfhost" > /dev/null 2>&1
#y="$PATHDVLINK/MENUS/nxdnhost"
rm "$PATHDVLINK/MENUS/nxdnhost" > /dev/null 2>&1
#z="$PATHDVLINK/MENUS/p25host"
rm "$PATHDVLINK/MENUS/p25host" > /dev/null 2>&1
#GENERA MENU DMR
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select name,ip from dmrhost into outfile '/$PATHDVLINK/MENUS/dmrhost';"
#GENERA MENU YSF
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE ysfhost2 SET startup = REPLACE(startup, ' ', '-');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dtmffusion,startup FROM ysfhost2 into outfile '/$PATHDVLINK/MENUS/ysfhost';"


#GENERA MENU NXDN
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select tg,ip from nxdnhosts into outfile '/$PATHDVLINK/MENUS/nxdnhost';"
#GENERA MENU P25
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select tg,ip from p25hosts into outfile '/$PATHDVLINK/MENUS/p25host';"
 /usr/bin/demonioreflectores.sh
}

function CONEXIONDGID(){

 DIALOG2=${DIALOG2=dialog}
       tempfileysf=`tempfileysf 2>/dev/null` || tempfileysf=/tmp/test$$
       trap "rm -f $tempfileysf" 0 1 2 5 15
       $DIALOG2 --clear --title "Menu general" \
       --menu "" 0 0 0 \
          "$PERSONALIZAR_CONEXION" "" \
          "$SELECCIONA_LISTADO" "" 2> $tempfileysf
        retvalconfmodem=$?
        sysf=`cat $tempfileysf`

       if [[ $sysf = "$PERSONALIZAR_CONEXION" ]]
       then
          finicio=`dialog --stdout --title "" --inputbox "$ESCRIBE_IP_URL" 0 0`
          fnombre="$PERSONALIZADO"
          fstartupp="$fnombre  -  $finicio"
          conexion$parametro=$fstartup
       else
       FYSF="$PATHDVLINK/MENUS/ysfhost"
       whiptail --menu "$SISTEMAS_DISPONIBLES" 0 0 0 $(cat $FYSF) 2>/var/log/dato
       finicio=$(awk 'NR==1' /var/log/dato)
       fmostrar=$finicio
       conexion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT startup from ysfhost where dtmffusion = '$finicio';")
       fi
       mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DGID SET DGID_conectarcon$parametro = '$conexion' where nombre = '$NOMBRE'";


}

function TIPOCONEXION(){
DIALOG3=${DIALOG3=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG3 --clear --title "" \
--menu "" 0 0 0 \
    "YSF" "" \
    "FCS" "" 2> $tempfile
retval=$?
tipo=`cat $tempfile`
mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DGID SET DGID_type$tipos = '$tipo' where nombre = '$NOMBRE'";
echo "UPDATE hot_DGID SET DGID_type$tipos = '$tipo' where nombre = '$NOMBRE'"
}

function CONF-DGID(){
conexion0=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_conectarcon0 from hot_DGID where nombre = '$NOMBRE';")
tipo0=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_type0 from hot_DGID where nombre = '$NOMBRE';")
estatico0=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_static0 from hot_DGID where nombre = '$NOMBRE';")
###
dgid2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_num2 from hot_DGID where nombre = '$NOMBRE';")
conexion2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_conectarcon2 from hot_DGID where nombre = '$NOMBRE';")
tipo2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_type2 from hot_DGID where nombre = '$NOMBRE';")
estatico2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_static2 from hot_DGID where nombre = '$NOMBRE';")
###
dgid3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_num3 from hot_DGID where nombre = '$NOMBRE';")
conexion3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_conectarcon3 from hot_DGID where nombre = '$NOMBRE';")
tipo3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_type3 from hot_DGID where nombre = '$NOMBRE';")
estatico3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_static3 from hot_DGID where nombre = '$NOMBRE';")
###
dgid4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_num4 from hot_DGID where nombre = '$NOMBRE';")
conexion4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_conectarcon4 from hot_DGID where nombre = '$NOMBRE';")
tipo4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_type4 from hot_DGID where nombre = '$NOMBRE';")
estatico4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_static4 from hot_DGID where nombre = '$NOMBRE';")
###
dgid5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_num5 from hot_DGID where nombre = '$NOMBRE';")
conexion5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_conectarcon5 from hot_DGID where nombre = '$NOMBRE';")
tipo5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_type5 from hot_DGID where nombre = '$NOMBRE';")
estatico5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_static5 from hot_DGID where nombre = '$NOMBRE';")


while [ "$menuysf" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfileysf=`tempfileysf 2>/dev/null` || tempfileysf=/tmp/test$$
    trap "rm -f $tempfileysf" 0 1 2 5 15
    $DIALOG2 --clear --title "" \
    --menu "" 0 0 0 \
        "─────────────────────────────────────────────" "" \
        "DGID 0"  "" \
        "─────────────────────────────────────────────" "" \
        "$CONTECTAR_CON"  "$conexion0" \
        "tipo de conexion" "$tipo0" \
        "estatico" "$estatico0" \
        "─────────────────────────────────────────────" "" \
        "Escribe DGID conexion 2 (cero para desactivar)"  "$dgid2" \
        "$CONTECTAR_CON 2"  "$conexion2" \
        "tipo de conexion 2" "$tipo2" \
        "estatico 2" "$estatico2" \
        "───────────────────────────────────────────────────" "" \
        "Escribe DGID conexion 3 (cero para desactivar)"  "$dgid3" \
        "$CONTECTAR_CON 3"  "$conexion3" \
        "tipo de conexion 3" "$tipo3" \
        "estatico 3" "$estatico3" \
        "─────────────────────────────────────────────" "" \
        "Escribe DGID conexion 4 (cero para desactivar)"  "$dgid4" \
        "$CONTECTAR_CON 4"  "$conexion4" \
        "tipo de conexion 4" "$tipo4" \
        "estatico 4" "$estatico4" \
        "─────────────────────────────────────────────" "" \
        "Escribe DGID conexion 5 (cero para desactivar)"  "$dgid5" \
        "$CONTECTAR_CON 5"  "$conexion5" \
        "tipo de conexion 5" "$tipo5" \
        "estatico 5" "$estatico5" \
        "─────────────────────────────────────────────" "" \
        "$VOLVER" "" 2> $tempfileysf
    retvalconfmodem=$?
    menuysf=`cat $tempfileysf`
    if [[ $menuysf = "$CONTECTAR_CON" ]]
    then
       parametro=0
       CONEXIONDGID
       conexion0=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_conectarcon0 from hot_DGID where nombre = '$NOMBRE';")
    else  if [[ $menuysf = "$CONTECTAR_CON 2" ]]
    then
       parametro=2
       CONEXIONDGID
       conexion2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_conectarcon2 from hot_DGID where nombre = '$NOMBRE';")
     else  if [[ $menuysf = "$CONTECTAR_CON 3" ]]
    then
       parametro=3
       CONEXIONDGID
       conexion3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_conectarcon3 from hot_DGID where nombre = '$NOMBRE';")
    else  if [[ $menuysf = "$CONTECTAR_CON 4" ]]
    then
       parametro=4
       CONEXIONDGID
       conexion4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_conectarcon4 from hot_DGID where nombre = '$NOMBRE';")
    else  if [[ $menuysf = "$CONTECTAR_CON 5" ]]
    then
       parametro=5
       CONEXIONDGID
       conexion5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_conectarcon5 from hot_DGID where nombre = '$NOMBRE';")
    else  if [[ $menuysf = "tipo de conexion" ]]
    then
       tipos=0
       TIPOCONEXION
       tipo0=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_type0 from hot_DGID where nombre = '$NOMBRE';")

    else  if [[ $menuysf = "tipo de conexion 2" ]]
    then
       tipos=2
       TIPOCONEXION
       tipo2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_type2 from hot_DGID where nombre = '$NOMBRE';")
    else  if [[ $menuysf = "tipo de conexion 3" ]]
    then
       tipos=3
       TIPOCONEXION
       tipo3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_type3 from hot_DGID where nombre = '$NOMBRE';")
    else  if [[ $menuysf = "tipo de conexion 4" ]]
    then
       tipos=4
       TIPOCONEXION
       tipo4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_type4 from hot_DGID where nombre = '$NOMBRE';")
    else  if [[ $menuysf = "tipo de conexion 5" ]]
    then
       tipos=5
       TIPOCONEXION
       tipo5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DGID_type5 from hot_DGID where nombre = '$NOMBRE';")
    else  if [[ $menuysf = "estatico" ]]
    then
       if dialog --title ""  --yesno "¿Usar conexion estatica?" 0 0 ;then
          estatico0=1
        else
          estatico0=0
        fi
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DGID SET DGID_static0 = '$estatico0' where nombre = '$NOMBRE'";
    else  if [[ $menuysf = "estatico 2" ]]
    then
        if dialog --title ""  --yesno "¿Usar conexion estatica?" 0 0 ;then
          estatico2=1
        else
          estatico2=0
        fi
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DGID SET DGID_static2 = '$estatico2' where nombre = '$NOMBRE'";

    else  if [[ $menuysf = "estatico 3" ]]
    then
        if dialog --title ""  --yesno "¿Usar conexion estatica?" 0 0 ;then
          estatico3=1
        else
          estatico3=0
        fi
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DGID SET DGID_static3 = '$estatico3' where nombre = '$NOMBRE'";

    else  if [[ $menuysf = "estatico 4" ]]
    then
        if dialog --title ""  --yesno "¿Usar conexion estatica?" 0 0 ;then
          estatico4=1
        else
          estatico4=0
        fi
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DGID SET DGID_static4 = '$estatico4' where nombre = '$NOMBRE'";

    else  if [[ $menuysf = "estatico 5" ]]
    then
        if dialog --title ""  --yesno "¿Usar conexion estatica?" 0 0 ;then
          estatico5=1
        else
          estatico5=0
        fi
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DGID SET DGID_static5 = '$estatico5' where nombre = '$NOMBRE'";
    else  if [[ $menuysf = "Escribe DGID conexion 2 (cero para desactivar)" ]]
    then
        dgid2=`dialog --stdout --title "" --inputbox "Escribe el DGID que quieras usar para esta conexion" 0 0`
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DGID SET DGID_num2 = '$dgid2' where  nombre = '$NOMBRE'";
    else  if [[ $menuysf = "Escribe DGID conexion 3 (cero para desactivar)" ]]
    then
        dgid3=`dialog --stdout --title "" --inputbox "Escribe el DGID que quieras usar para esta conexion" 0 0`
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DGID SET DGID_num3 = '$dgid3' where  nombre = '$NOMBRE'";
    else  if [[ $menuysf = "Escribe DGID conexion 4 (cero para desactivar)" ]]
    then
        dgid4=`dialog --stdout --title "" --inputbox "Escribe el DGID que quieras usar para esta conexion" 0 0`
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DGID SET DGID_num4 = '$dgid4' where  nombre = '$NOMBRE'";
    else  if [[ $menuysf = "Escribe DGID conexion 5 (cero para desactivar)" ]]
    then
        dgid5=`dialog --stdout --title "" --inputbox "Escribe el DGID que quieras usar para esta conexion" 0 0`
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DGID SET DGID_num5 = '$dgid5' where  nombre = '$NOMBRE'";



    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi
    fi



done
menuysf=""
}

function CONF-YSF(){
fmostrar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fstartup from hot_YSF where nombre = '$NOMBRE';")
finactivity=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT finactivity from hot_YSF where nombre = '$NOMBRE';")
frevert=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT frevert from hot_YSF where nombre = '$NOMBRE';")
fusionwiresc=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusionwiresc from hot_YSF where nombre = '$NOMBRE';")
fusionwiresx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusionwiresx from hot_YSF where nombre = '$NOMBRE';")
fusionselfonly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusionselfonly from hot_YSF where nombre = '$NOMBRE';")
fusionlowdeviation=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusionlowdeviation from hot_YSF where nombre = '$NOMBRE';")
options=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT options from hot_YSF where nombre = '$NOMBRE';")


while [ "$menuysf" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfileysf=`tempfileysf 2>/dev/null` || tempfileysf=/tmp/test$$
    trap "rm -f $tempfileysf" 0 1 2 5 15
    $DIALOG2 --clear --title "" \
    --menu "" 0 0 0 \
        "$CONTECTAR_CON"  "$fmostrar" \
        "Options" "$options" \
        "$USAR_SOLO_YO" "$fusionselfonly" \
        "$TIEMPO_DESCONEX_MINUTOS" "$finactivity" \
        "$ACTIVAR_RECONEXION" "$frevert" \
        "WiresXMakeUpper" "$fusionwiresx" \
        "WiresXCommandPassthrough" "$fusionwiresc" \
        "Lowdeviation" "$fusionlowdeviation" \
        "───────────────────────────────────────" "" \
        "$VOLVER" "" 2> $tempfileysf
    retvalconfmodem=$?
    menuysf=`cat $tempfileysf`
    if [[ $menuysf = "$CONTECTAR_CON" ]]
    then
       DIALOG2=${DIALOG2=dialog}
       tempfileysf=`tempfileysf 2>/dev/null` || tempfileysf=/tmp/test$$
       trap "rm -f $tempfileysf" 0 1 2 5 15
       $DIALOG2 --clear --title "Menu general" \
       --menu "" 0 0 0 \
          "$PERSONALIZAR_CONEXION" "" \
          "$SELECCIONA_LISTADO" "" 2> $tempfileysf
        retvalconfmodem=$?
        sysf=`cat $tempfileysf`

       if [[ $sysf = "$PERSONALIZAR_CONEXION" ]]
       then
          finicio=`dialog --stdout --title "" --inputbox "$ESCRIBE_IP_URL" 0 0`
          fnombre="$PERSONALIZADO"
          fstartup="$fnombre  -  $finicio"
          fmostrar=$fstartup
       else
       FYSF="$PATHDVLINK/MENUS/ysfhost"
       whiptail --menu "$SISTEMAS_DISPONIBLES" 0 0 0 $(cat $FYSF) 2>/var/log/dato
       finicio=$(awk 'NR==1' /var/log/dato)
       fmostrar=$finicio
       #finicio=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dtmffusion from ysfhost where dtmffusion = '$finicio';")
       fnombre=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT startup from ysfhost where dtmffusion = '$finicio';")
       fi
       # mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET fusionnombre = '$fnombre' where nombre = '$NOMBRE'";
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET fstartup = '$fnombre' where nombre = '$NOMBRE'";
       # mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET fmostrar = '$fstartup' where nombre = '$NOMBRE'";

       else if [[ $menuysf = "$TIEMPO_DESCONEX_MINUTOS" ]]
       then
          finactivity=`dialog --stdout --title "Tiempo" --inputbox "$DESCONEXION_MINUTOS" 0 0`
           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET finactivity = '$finactivity' where nombre = '$NOMBRE'";

          else if [[ $menuysf = "$ACTIVAR_RECONEXION" ]]
          then
             if dialog --title ""  --yesno "¿$ACTIVAR_RECONEXION?" 0 0 ;then
                 frevert=1
             else
                 frevert=0
             fi
              mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET frevert = '$frevert' where nombre = '$NOMBRE'";
             else if [[ $menuysf = "WiresXMakeUpper" ]]
             then
                fusionwiresx=`dialog --stdout --title "Tiempo" --inputbox "$DESCONEXION_MINUTOS" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET fusionwiresx = '$fusionwiresx' where nombre = '$NOMBRE'";
                else if [[ $menuysf = "WiresXCommandPassthrough" ]]
                then
                   fusionwiresc=`dialog --stdout --title "Tiempo" --inputbox "$DESCONEXION_MINUTOS" 0 0`
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET fusionwiresc = '$fusionwiresc' where nombre = '$NOMBRE'";
                   else if [[ $menuysf = "$USAR_SOLO_YO" ]]
                   then
                       if dialog --title ""  --yesno "$SOLO_YO" 0 0 ;then
                          fusionselfonly=1
                       else
			  fusionselfonly=0
                       fi
                        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET fusionselfonly = '$fusionselfonly' where nombre = '$NOMBRE'";
                       else if [[ $menuysf = "Lowdeviation" ]]
                       then
                          if dialog --title ""  --yesno "$USAS_HOTSPOT" 0 0 ;then
                             fusionlowdeviation=1
                          else
                             fusionlowdeviation=0
                          fi
                           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET fusionlowdeviation = '$fusionlowdeviation' where nombre = '$NOMBRE'";
                          else if [[ $menuysf = "Options" ]]
                          then
                             options=`dialog --stdout --title "" --inputbox "Escribe opciones de conexion separadas por comas" 0 0`
                              mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET options = '$options' where nombre = '$NOMBRE'";
                          fi
                       fi
                   fi
                fi
             fi
          fi
       fi
    fi
done
menuysf=""
}

function CONF-MODEM(){
devtty=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT devtty from hot_modem where nombre = '$NOMBRE';")
timeout=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT timeout from hot_modem where nombre = '$NOMBRE';")
duplex=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT duplex from hot_modem where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT frectx from hot_modem where nombre = '$NOMBRE';")
frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT frecrx from hot_modem where nombre = '$NOMBRE';")
txinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txinv from hot_modem where nombre = '$NOMBRE';")
rxinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxinv from hot_modem where nombre = '$NOMBRE';")
pttinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT pttinv from hot_modem where nombre = '$NOMBRE';")
rxoffset=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxoffset from hot_modem where nombre = '$NOMBRE';")
txoffset=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txoffset from hot_modem where nombre = '$NOMBRE';")
rxlevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxlevel from hot_modem where nombre = '$NOMBRE';")
txlevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txlevel from hot_modem where nombre = '$NOMBRE';")
rflevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rflevel from hot_modem where nombre = '$NOMBRE';")
rfmodehang=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rfmodehang from hot_modem where nombre = '$NOMBRE';")
netmodehang=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT netmodehang from hot_modem where nombre = '$NOMBRE';")
while [ "$confmodem" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfileconfmodem=`tempfileconfmodem 2>/dev/null` || tempfileconfmodem=/tmp/test$$
    trap "rm -f $tempfileconfmodem" 0 1 2 5 15
    $DIALOG2 --clear --title "Menu general" \
        --menu "" 0 0 0 \
        "$TIPO_MODEM"  "$devtty" \
        "Duplex" "$duplex" \
        "Timeout" "$timeout" \
        "Frec. TX" "$frectx" \
        "Frec. RX" "$frecrx" \
        "Inv TX" "$txinv" \
        "RF level" "$rflevel" \
        "Inv RX" "$rxinv" \
        "PTT Invert" "$pttinv" \
        "TX Offset" "$txoffset" \
        "RX Offset" "$rxoffset" \
        "TX level" "$txlevel" \
        "RX level" "$rxlevel" \
        "RFmodehang" "$rfmodehang" \
        "NETmodehang" "$netmodehang" \
        "────────────────────────────" "" \
        "$CALIBRAR_MODEM" "" \
        "────────────────────────────" "" \
 "$VOLVER" "" 2> $tempfileconfmodem
    retvalconfmodem=$?
    confmodem=`cat $tempfileconfmodem`
    if [[ $confmodem = "$TIPO_MODEM" ]]
    then
        DIALOG3=${DIALOG3=dialog}
        tempfiletype=`tempfile 2>/dev/null` || tempfiletype=/tmp/test$$
        trap "rm -f $tempfiletype" 0 1 2 5 15
        $DIALOG3 --clear --title "" \
            --menu "" 0 0 0 \
            "USB" "" \
            "Shell" "" \
            "$PERSONALIZADO" "" 2> $tempfiletype
        retvaltype=$?
        conexionmodem=`cat $tempfiletype`
        if [[ $conexionmodem = "USB" ]]
        then
            devtty="/dev/tty"
            DIALOG3=${DIALOG3=dialog}
            tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
            trap "rm -f $tempfile" 0 1 2 5 15
            $DIALOG3 --clear --title "" \
                --menu "" 0 0 0 \
                "ACM0" "" \
                "ACM1" "" \
                "ACM2" "" \
                "ACM3" "" 2> $tempfile
            retval=$?
            puertousb=`cat $tempfile`
            devtty=$devtty$puertousb
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET devtty = '$devtty' where nombre = '$NOMBRE'";
            else if [[ $conexionmodem = "Shell" ]]
            then
                if dialog --title ""  --yesno "$PI4" 0 0 ;then
                    sed -i "10s+.*+4+"  /etc/sslb
                else
                    sed -i "10s+.*+3+"  /etc/sslb
                fi
                devtty="/dev/ttyAMA0"
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET devtty = '$devtty' where nombre = '$NOMBRE'";
                else if [[ $conexionmodem = "$PERSONALIZADO" ]]
                then
                    devtty=`dialog --stdout --title "" --inputbox "$NOMBRE_PUERTO" 0 0`
                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET devtty = '$devtty' where nombre = '$NOMBRE'";
                fi
            fi
        fi
        else if [[ $confmodem = "Duplex" ]]
        then
            if dialog --title ""  --yesno "$USAR_DUPLEX" 0 0 ;then
                duplex=1
            else
		        duplex=0
            fi
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET duplex = '$duplex' where nombre = '$NOMBRE'";
            else if [[ $confmodem = "Frec. TX" ]]
            then
                CIFRAS
                frectx=$numero
                #frectx=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET frectx = '$frectx' where nombre = '$NOMBRE'";
                else if [[ $confmodem = "Frec. RX" ]]
                then
                    CIFRAS
                    frecrx=$numero
                    #frecrx=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET frecrx = '$frecrx' where nombre = '$NOMBRE'";
                    else if [[ $confmodem = "Inv TX" ]]
                    then
                        if dialog --title ""  --yesno "$INVERTIR_TX" 0 0 ;then
                            txinv=1
                        else
                            txinv=0
                        fi
                         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET txinv = '$txinv' where nombre = '$NOMBRE'";
                        else if [[ $confmodem = "Inv RX" ]]
                        then
                            if dialog --title ""  --yesno "$INVERTIR_RX" 0 0 ;then
                                rxinv=1
                            else
                                rxinv=0
                            fi
                             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET rxinv = '$rxinv' where nombre = '$NOMBRE'";
                            else if [[ $confmodem = "TX Offset" ]]
                            then
                                txoffset=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET txoffset = '$txoffset' where nombre = '$NOMBRE'";
                                else if [[ $confmodem = "RX Offset" ]]
                                then
                                    rxoffset=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET rxoffset = '$rxoffset' where  nombre = '$NOMBRE'";
                                    else if [[ $confmodem = "RX level" ]]
                                    then
                                        rxlevel=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET rxlevel = '$rxlevel' where nombre = '$NOMBRE'";
                                        else if [[ $confmodem = "TX level" ]]
                                        then
                                            txlevel=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET txlevel = '$txlevel' where nombre = '$NOMBRE'";
                                            else if [[ $confmodem = "RFmodehang" ]]
                                            then
                                                rfmodehang=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET rfmodehang = '$rfmodehang' where nombre = '$NOMBRE'";
                                       	        else if [[ $confmodem = "RFmodehang" ]]
                                                then
                                                    timeout=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET timeout = '$timeout' where nombre = '$NOMBRE'";
                                                    else if [[ $confmodem = "NETmodehang" ]]
                                                    then
                                                        netmodehang=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                                         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET netmodehang = '$netmodehang' where nombre = '$NOMBRE'";
                                                        else if [[ $confmodem = "Timeout" ]]
                                                        then
                                                            timeout=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                                             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET timeout = '$timeout' where nombre = '$NOMBRE'";
                                                            else if [[ $confmodem = "PTT Invert" ]]
                                                            then
                                                                pttinv=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                                                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET pttinv = '$pttinv' where nombre = '$NOMBRE'";
                                                                else if [[ $confmodem = "RF level" ]]
                                                                then
                                                                   rflevel=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                                                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET rflevel = '$rflevel' where nombre = '$NOMBRE'";
                                                                   else if [[ $confmodem = "$CALIBRAR_MODEM" ]]
                                                                   then
                                                                       if dialog --title ""  --yesno "¿ $CALIBRAR_MODEM ?" 0 0 ;then
                                                                          echo "$CALIBRAR_MODEM" > /var/log/calibra
                                                                          echo "" >> /var/log/calibra
                                                                          echo "$PULSA_E " >> /var/log/calibra
                                                                          echo "$INTRODUCE_FRECUENCIA" >> /var/log/calibra
                                                                          echo "$PULSA_CALIBRACION" >> /var/log/calibra
                                                                          echo "$HAZ_PTT" >> /var/log/calibra
                                                                          echo "$JUEGA" >> /var/log/calibra
                                                                          echo "$MEJOR_BER" >> /var/log/calibra
                                                                          echo "$PULSA_Q" >> /var/log/calibra
                                                                          dialog --title "" --textbox /var/log/calibra 0 0
                                                                           /opt/MMDVMCal/MMDVMCal $devtty
                                                                        fi
                                                                    fi
                                                                fi
                                                            fi
                                                        fi
                                                    fi
                                                fi
                        		    fi
                                        fi
                                    fi
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
done
confmodem=""
}

function NEXTION(){

nextionpuerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionpuerto from hot_nextion where nombre = '$NOMBRE';")
nextionbrillo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionbrillo from hot_nextion where nombre = '$NOMBRE';")
nextionidlebrillo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionidlebrillo from hot_nextion where nombre = '$NOMBRE';")
nextionclock=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionclock from hot_nextion where nombre = '$NOMBRE';")
nextionutc=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionutc from hot_nextion where nombre = '$NOMBRE';")
nextionlayout=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionlayout from hot_nextion where nombre = '$NOMBRE';")

while [ "$menunextion" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfilenextion=`tempfilenextion 2>/dev/null` || tempfilenextion=/tmp/test$$
    trap "rm -f $tempfilenextion" 0 1 2 5 15
    $DIALOG2 --clear --title "" \
    --menu "" 0 0 0 \
        "$PUERTO_NEXTION"  "$nextionpuerto" \
        "$BRILLO"  "$nextionbrillo" \
        "$BRILLO_EN_REPOSO"  "$nextionidlebrillo" \
        "Display clock"  "$nextionclock" \
        "UTC"  "$nextionutc" \
        "Screen Layout"  "$nextionlayout" \
        "$VOLVER" "" 2> $tempfilenextion
    retval=$?
    menunextion=`cat $tempfilenextion`
    if [[ $menunextion = "$PUERTO_NEXTION" ]]
    then
        DIALOG3=${DIALOG3=dialog}
        tempfiletype=`tempfile 2>/dev/null` || tempfiletype=/tmp/test$$
        trap "rm -f $tempfiletype" 0 1 2 5 15
        $DIALOG3 --clear --title "" \
            --menu "" 0 0 0 \
            "USB" "" \
            "Shell" "" \
            "Modem" "" \
            "$PERSONALIZADO" "" 2> $tempfiletype
        retvaltype=$?
        conexionpantalla=`cat $tempfiletype`
        if [[ $conexionpantalla = "USB" ]]
        then
            devtty="/dev/tty"
            DIALOG3=${DIALOG3=dialog}
            tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
            trap "rm -f $tempfile" 0 1 2 5 15
            $DIALOG3 --clear --title "" \
                --menu "" 0 0 0 \
                "ACM0" "" \
                "ACM1" "" \
                "ACM2" "" \
                "ACM3" "" 2> $tempfile
            retval=$?
            puertousb=`cat $tempfile`
            devtty=$devtty$puertousb
            else if [[ $conexionpantalla = "Shell" ]]
            then
                devtty="/dev/ttyAMA0"
                else if [[ $conexionpantalla = "$PERSONALIZADO" ]]
                then
                    devtty=`dialog --stdout --title "" --inputbox "$NOMBRE_PUERTO" 0 0`
                    else if [[ $conexionpantalla = "Modem" ]]
                    then
                        devtty="modem"
                    fi
                fi
            fi
        fi
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nextionpuerto = '$devtty' where nombre = '$NOMBRE'";
        nextionpuerto=$devtty
        else if [[ $menunextion = "$BRILLO" ]]
        then
            nextionbrillo=`dialog --stdout --title "Brillo" --inputbox "Escribe nivel de brillo" 0 0`
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_nextion SET nextionbrillo = '$nextionbrillo' where nombre = '$NOMBRE'";
            else if [[ $menunextion = "$BRILLO_EN_REPOSO" ]]
            then
                nextionidlebrillo=`dialog --stdout --title "Brillo reposo" --inputbox "Escribe nivel de brillo reposo" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_nextion SET nextionidlebrillo = '$nextionidlebrillo' where nombre = '$NOMBRE'";
                else if [[ $menunextion = "Display clock" ]]
                then
                    nextionclock=`dialog --stdout --title "Nextionclock" --inputbox "Escribe nextionclock" 0 0`
                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_nextion SET nextionclock = '$nextionclock' where nombre = '$NOMBRE'";
                    else if [[ $menunextion = "UTC" ]]
                    then
                        nextionutc=`dialog --stdout --title "UTC" --inputbox "Escribe UTC" 0 0`
                         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_nextion SET nextionutc = '$nextionutc' where nombre = '$NOMBRE'";
                        else if [[ $menunextion = "Screen Layout" ]]
                        then
                            nextionlayout=`dialog --stdout --title "Brillo" --inputbox "Escribe nextionlayout" 0 0`
                             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_nextion SET nextionlayout = '$nextionlayout' where nombre = '$NOMBRE'";
                        fi
                    fi
                fi
            fi
        fi
    fi
done
menunextion=""
}

function OLED(){
oledtipo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledtipo from hot_oled where nombre = '$NOMBRE';")
oledbrillo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledbrillo from hot_oled where nombre = '$NOMBRE';")
oledinversion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledinversion from hot_oled where nombre = '$NOMBRE';")
oledscroll=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledscroll from hot_oled where nombre = '$NOMBRE';")
oledcast=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledcast from hot_oled where nombre = '$NOMBRE';")
oledlogo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledlogo from hot_oled where nombre = '$NOMBRE';")

while [ "$menuoled" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfileoled=`tempfileoled 2>/dev/null` || tempfileoled=/tmp/test$$
    trap "rm -f $tempfileoled" 0 1 2 5 15
    $DIALOG2 --clear --title "Menu" \
    --menu "" 0 0 0 \
        "$TIPO_OLED"  "$oledtipo" \
        "$BRILLO"  "$oledbrillo" \
        "$INVERSION"  "$oledinversion" \
        "Scroll"  "$oledscroll" \
        "CAST"  "$oledcast" \
        "Logo"  "$oledlogo" \
        "$VOLVER" "" 2> $tempfileoled
    retval=$?
    menuoled=`cat $tempfileoled`
    if [[ $menuoled = "$TIPO_OLED" ]]
    then
       tipo="$PATHDVLINK/MENUS/oled"
       whiptail --menu 'Select' 0 0 0 $(cat $tipo) 2>/var/log/dato
       oledtipo=$(awk 'NR==1' /var/log/dato)
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_oled SET oledtipo = '$oledtipo' where nombre = '$NOMBRE'";
       else if [[ $menuoled = "$BRILLO" ]]
       then
          oledbrillo=`dialog --stdout --title "" --inputbox "$NIVEL_BRILLO" 0 0`
           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_oled SET oledbrillo = '$oledbrillo' where nombre = '$NOMBRE'";
          else if [[ $menuoled = "$INVERSION" ]]
          then
             if dialog --title ""  --yesno "$INVERSION" 0 0 ;then
                oledinversion=1
             else
                oledinversion=0
             fi
              mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_oled SET oledinversion = '$oledinversion' where nombre = '$NOMBRE'";
             else if [[ $menuoled = "Scroll" ]]
             then
                if dialog --title ""  --yesno "¿Scroll?" 0 0 ;then
                  oledscroll=1
                else
                  oledscroll=0
                fi
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_oled SET oledscroll = '$oledscroll' where nombre = '$NOMBRE'";
                else if [[ $menuoled = "CAST" ]]
                then
                   if dialog --title ""  --yesno "¿Cast?" 0 0 ;then
                      oledcast=1
                   else
                      oledcast=0
                   fi
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_oled SET oledcast = '$oledcast' where nombre = '$NOMBRE'";
                   else if [[ $menuoled = "Logo" ]]
                   then
                      if dialog --title ""  --yesno "¿Logo?" 0 0 ;then
                        oledlogo=1
                      else
                        oledlogo=0
                      fi
                       mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_oled SET oledlogo = '$oledlogo' where nombre = '$NOMBRE'";
                   fi
                fi
             fi
          fi
       fi
fi
done
menuoled=""
}

function PANTALLA(){
 DIALOG=${DIALOG=dialog}
 tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
 trap "rm -f $tempfile" 0 1 2 5 15
 $DIALOG --clear --title "Hotspot $ACTIVO" \
 --menu "$SELECCIONA_TIPO_PANTALLA" 0 0 0 \
    "NEXTION" "" \
    "OLED" "" 2> $tempfile
 retvalmenu=$?
 menupantalla=`cat $tempfile`
 if [[ $menupantalla = "NEXTION" ]]
 then
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nextion = '1' where nombre = '$NOMBRE'";
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET oled = '0' where nombre = '$NOMBRE'";
     pantalla="SELECCIONADA NEXTION"




    NEXTION
    else if [[ $menupantalla = "OLED" ]]
    then
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET nextion = '0' where nombre = '$NOMBRE'";
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET oled = '1' where nombre = '$NOMBRE'";
         pantalla="SELECCIONADA OLED"
         OLED
    fi
 fi
}




##############   INICIO  CONFIGURA hotspot   ##########################

function CONFIGURA-HOTSPOT(){
SELECCION-HOTSPOT-INACTIVOS
pantalla=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oled from hotspot where nombre = '$NOMBRE';")
pantall2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oled from hotspot where nombre = '$NOMBRE';")
cadenasistemasactivos=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cadenasistemasactivos from hotspot where nombre = '$NOMBRE';")
aprsgate=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT aprsserver from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
cw=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cwindicativo from hot_CW where nombre = '$NOMBRE';")
p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25reflector from hot_P25 where nombre = '$NOMBRE';")
nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnreflector from hot_NXDN where nombre = '$NOMBRE';")
fstartup=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fstartup from hot_YSF where nombre = '$NOMBRE';")
modem=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT devtty from hot_modem where nombre = '$NOMBRE';")
dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrdireccion from hot_DMR where nombre = '$NOMBRE';")
if [[ $pantalla -eq 1 ]]
then
   pantalla="SELECCIONADA OLED"
else if [[ $pantalla2 -eq 1 ]]
then
   pantalla="SELECCIONADA NEXTION"
else
   pantalla="NO SELECCIONADA"
fi
fi
#menuconfigura=""
while [ "$menuconfigura" != "$VOLVER" ]; do
cadenasistemasactivos=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cadenasistemasactivos from hotspot where nombre = '$NOMBRE';")
aprsgate=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT aprsserver from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
cw=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cwindicativo from hot_CW where nombre = '$NOMBRE';")
p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25reflector from hot_P25 where nombre = '$NOMBRE';")
nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnreflector from hot_NXDN where nombre = '$NOMBRE';")
fstartup=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fstartup from hot_YSF where nombre = '$NOMBRE';")
modem=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT devtty from hot_modem where nombre = '$NOMBRE';")
dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrdireccion from hot_DMR where nombre = '$NOMBRE';")
indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from hot_conf_personal where nombre = '$NOMBRE';")
iddmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrid from hot_conf_personal where nombre = '$NOMBRE';")
idnxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnid from hot_conf_personal where nombre = '$NOMBRE';")
redstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT repeaterband from hot_IRC where nombre = '$NOMBRE';")
redstar2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reflector from hot_IRC where nombre = '$NOMBRE';")
redstar3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ccshost from hot_IRC where nombre = '$NOMBRE';")
    DIALOG=${DIALOG=dialog}
    tempfileconfigura=`tempfile 2>/dev/null` || tempfileconfigura=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --clear --title "" \
        --menu "" 0 0 0 \
        "──────────────────────────────────────────────" "" \
        "HOTSPOT $nombre" "" \
        "──────────────────────────────────────────────" "" \
        "$CONFIGURACION_PERSONAL" "$indicativo-$iddmr-$idnxdn" \
        "$INFORMACION_GENERAL" "" \
        "──────────────────────────────────────────────" "" \
        "$CONFIGURACION_DE_MODEM" "$modem" \
        "──────────────────────────────────────────────" "" \
        "$CONFIGURAR_DMR_SIMPLIFICADO" "$dmr" \
        "$CONFIGURAR_DMR_GATEWAY" "" \
        "──────────────────────────────────────────────" "" \
        "$CONFIGURAR_FUSION - YSF" "$fstartup" \
        "$CONFIGURAR_FUSION - DGID" "" \
        "──────────────────────────────────────────────" "" \
        "$CONFIGURAR_DSTAR" "$redstar-$redstar2-$restar3" \
        "$CONFIGURAR_P25" "$p25" \
        "$CONFIGURAR_NXDN" "$nxdn" \
        "──────────────────────────────────────────────" "" \
        "$CONFIGURAR_PANTALLA" "$pantalla" \
        "$CONFIGURAR_APRS" "$aprsgate" \
        "$CONFIGURAR_CW" "$cw" \
        "──────────────────────────────────────────────" "" \
        "$SELECCION_SISTEMAS_ACTIVOS" "$cadenasistemasactivos" \
        "──────────────────────────────────────────────" "" \
        "$ACTIVAR_ESTE_HOTSPOT" "" \
        "──────────────────────────────────────────────" "" \
        "$VOLVER" "" 2> $tempfileconfigura
    retvalmenu=$?
    menuconfigura=`cat $tempfileconfigura`

    if [[ $menuconfigura = "$CONFIGURACION_PERSONAL" ]]
    then
        ACTIVA-CONF-PERSONAL
        CONF-PERSONAL
        else if [[ $menuconfigura = "$CONFIGURACION_DE_MODEM" ]]
        then
            CONF-MODEM
            else if [[ $menuconfigura = "$SELECCION_SISTEMAS_ACTIVOS" ]]
            then
               SELECCION-MODO
               cadenasistemasactivos=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cadenasistemasactivos from hotspot where nombre = '$NOMBRE';")
               #echo "cadena vale $cadenasistemasactivos"
               #echo "modo crosslink vale $mimodo" 
               #if [[ $mimodo -eq 1 ]]
               # then
               #     MODOCROSSLINK
               # fi

                else if [[ $menuconfigura = "Crosslinks" ]]
                then
                    CROSSLINKS
                    else if [[ $menuconfigura = "$CONFIGURAR_DMR_SIMPLIFICADO" ]]
                    then
                        CONF-DMR
                        dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrdireccion from hot_DMR where nombre = '$NOMBRE';")
                        else if [[ $menuconfigura = "$CONFIGURAR_DMR_GATEWAY" ]]
                        then
                            DMRGATEWAYEXPERTO
                            else if [[ $menuconfigura = "$CONFIGURAR_FUSION - YSF" ]]
                            then
                                CONF-YSF
                                fstartup=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fstartup from hot_YSF where nombre = '$NOMBRE';")
                                else if [[ $menuconfigura = "$CONFIGURAR_FUSION - DGID" ]]
                                then
                                   CONF-DGID
                                else if [[ $menuconfigura = "$CONFIGURAR_DSTAR" ]]
                                then
                                    CONF-DSTAR
                                    else if [[ $menuconfigura = "$CONFIGURAR_P25" ]]
                                    then
                                        CONF-P25
                                        p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25reflector_P25 from hot_P25 where nombre = '$NOMBRE';")
                                        else if [[ $menuconfigura = "$CONFIGURAR_NXDN" ]]
                                        then
                                            CONF-NXDN
                                            nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnreflector from hot_NXDN where nombre = '$NOMBRE';")
                                            else if [[ $menuconfigura = "$CONFIGURAR_PANTALLA" ]]
                                            then
                                                PANTALLA
                                                else if [[ $menuconfigura = "$SELECCION_SISTEMAS_ACTIVOS" ]]
                                                then
                                                    SELECCION-MODO
                                                    else if [[ $menuconfigura = "$CONFIGURAR_APRS" ]]
                                                    then
                                                        CONF-APRS
                                                        aprsgate=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT aprsserver from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
                                                        else if [[ $menuconfigura = "$CONFIGURAR_CW" ]]
                                                        then
                                                            CONF-CW
                                                            cw=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cwindicativo from hot_CW where nombre = '$NOMBRE';")
                                                            else if [[ $menuconfigura = "Actualizar listados de reflectores" ]]
                                                            then
                                                                ACTUALIZA-REFLECTORES
                                                                else if [[ $menuconfigura = "$SELECCION_CROSSLINK_ACTIVO" ]]
                                                                then
                                                                    if dialog --title "" --yesno "$DESACTIVA_LA_SELECCION" 0 0 ;then
                                                                        #clear
                                                                        CROSSLINKS
                                                                    fi
                                                                    else if [[ $menuconfigura = "Configuracion MODO EXPERTO" ]]
                                                                    then
                                                                        EXPERTO
                                                                        else if [[ $menuconfigura = "$INFORMACION_GENERAL" ]]
                                                                        then
                                                                            INFO
                                                                            else if [[ $menuconfigura = "$ACTIVAR_ESTE_HOTSPOT" ]]
                                                                            then
                                                                                ACTIVAR
                                                                                menuconfigura=""
                                                                                break
                                                                            fi
                                                                        fi
                                                                    fi
                                                                fi
                                                            fi
                                                        fi
                                                    fi
                                                fi
                                            fi
                                        fi
                                    fi
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
fi
done
menuconfigura=""

}


#########################################################################################################################################3

function GENERA-ACTUALIZACION(){
REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where estado = '1';")
path="/usr/bin/demonioreflectores.sh"
echo "#ACTUALIZACION DINAMICA REFLECTORES BASE BY EA7JCL & EA5GVK" > $path
echo "" >> $path
echo "#!/bin/bash" >> $path
echo "" >> $path
echo "#ACTUALIZACION DMRids" >> $path
echo " /usr/bin/DMRIDUpdate.sh" >> $path
echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/hotspot/P25Clients/P25Gateway/DMRIds.dat" >> $path
echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/hotspot/MMDVM_CM/YSF2P25/DMRIds.dat" >> $path
echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/hotspot/MMDVM_CM/YSF2DMR/DMRIds.dat" >> $path
echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/hotspot/MMDVM_CM/NXDN2DMR/DMRIds.dat" >> $path
echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/hotspot/MMDVM_CM/DMR2YSF/DMRIds.dat" >> $path
echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/hotspot/MMDVM_CM/DMR2NXDN/DMRIds.dat" >> $path

####################33333
echo "" >> $path
echo "#P25 HOSTS" >> $path
echo " curl http://www.pistar.uk/downloads/P25_Hosts.txt > /opt/P25Clients/P25Gateway/P25Hosts.txtnew" >> $path
echo "if [ -s /opt/P25Clients/P25Gateway/P25Hosts.txtnew ];" >> $path
echo "then" >> $path
echo "    cp /opt/P25Clients/P25Gateway/P25Hosts.txtnew /opt/P25Clients/P25Gateway/P25Hosts.txt" >> $path
echo "    cp /opt/P25Clients/P25Gateway/P25Hosts.txtnew /opt/hotspot/P25Clients/P25Gateway/P25Hosts.txt" >> $path
echo "fi" >> $path
#######################
echo "#NXDN HOSTS" >> $path
echo " curl http://www.pistar.uk/downloads/NXDN_Hosts.txt > /opt/NXDNClients/NXDNGateway/NXDNHosts.txtnew" >> $path
echo "if [ -s /opt/NXDNClients/NXDNGateway/NXDNHosts.txtnew ];" >> $path
echo "then" >> $path
echo "    cp /opt/NXDNClients/NXDNGateway/NXDNHosts.txtnew /opt/NXDNClients/NXDNGateway/NXDNHosts.txt" >> $path
echo "    cp /opt/NXDNClients/NXDNGateway/NXDNHosts.txtnew /opt/hotspot/NXDNClients/NXDNGateway/NXDNHosts.txt" >> $path
echo "fi" >> $path
#######################
echo "#FCS HOST" >> $path
echo " curl http://www.pistar.uk/downloads/FCS_Hosts.txt > /opt/hotspot/YSFClients/YSFGateway/FCSRooms.txtnew" >> $path
echo "if [ -s /opt/hotspot/YSFClients/YSFGateway/FCSRooms.txtnew ];" >> $path
echo "then" >> $path
echo "    cp /opt/hotspot/YSFClients/YSFGateway/FCSRooms.txtnew /opt/hotspot/YSFClients/YSFGateway/FCSRooms.txt" >> $path
echo "fi" >> $path
########################
echo "#YSF HOSTS" >> $path
echo " curl http://www.pistar.uk/downloads/YSF_Hosts.txt >  /opt/hotspot/YSFClients/YSFGateway/YSFHosts.txtnew" >> $path
echo "if [ -s /opt/hotspot/YSFClients/YSFGateway/YSFHosts.txtnew ];" >> $path
echo "then" >> $path
echo "    cp /opt/hotspot/YSFClients/YSFGateway/YSFHosts.txtnew /opt/hotspot/YSFClients/YSFGateway/YSFHosts.txt" >> $path
echo "fi" >> $path
#########################
echo "#XLX HOSTS" >> $path
echo " curl http://www.pistar.uk/downloads/XLXHosts.txt > /opt/hotspot/DMRGateway/XLXHosts.txtnew" >> $path
echo "if [ -s /opt/hotspot/DMRGateway/XLXHosts.txtnew ];" >> $path
echo "then" >> $path
echo "    cp /opt/hotspot/DMRGateway/XLXHosts.txtnew /opt/hotspot/DMRGateway/XLXHosts.txt" >> $path
echo "fi" >> $path
########################
echo "# NXDN  TGS" >> $path
echo " curl http://www.pistar.uk/downloads/TGList_NXDN.txt > /opt/hotspot/MMDVM_CM/YSF2NXDN/TGList-NXDN.txtnew" >> $path
echo "if [ -s /opt/hotspot/MMDVM_CM/YSF2NXDN/TGList-NXDN.txtnew ];" >> $path
echo "then" >> $path
echo "    cp /opt/hotspot/MMDVM_CM/YSF2NXDN/TGList-NXDN.txtnew /opt/hotspot/MMDVM_CM/YSF2NXDN/TGList-NXDN.txt" >> $path
echo "fi" >> $path
########################
echo "#P25 TGS" >> $path
echo " curl http://www.pistar.uk/downloads/TGList_P25.txt > /opt/hotspot/MMDVM_CM/YSF2P25/TGList-P25.txtnew" >> $path
echo "if [ -s /opt/hotspot/MMDVM_CM/YSF2P25/TGList-P25.txtnew ];" >> $path
echo "then" >> $path
echo "    cp /opt/hotspot/MMDVM_CM/YSF2P25/TGList-P25.txtnew /opt/hotspot/MMDVM_CM/YSF2P25/TGList-P25.txt" >> $path
echo "fi" >> $path
########################
echo "#CCS DSTAR" >> $path
echo " curl http://vk4tux.duckdns.org/DV/CCS_Hosts.txt > /usr/share/ircddbgateway/CCS_Hosts.txtnew" >> $path
echo "if [ -s /usr/share/ircddbgateway/CCS_Hosts.txtnew ];" >> $path
echo "then" >> $path
echo "    cp /usr/share/ircddbgateway/CCS_Hosts.txtnew /usr/share/ircddbgateway/CCS_Hosts.txt" >> $path
echo "fi" >> $path
###########################
echo "#DCS DSTAR" >> $path
echo " curl http://vk4tux.duckdns.org/DV/DCS_Hosts.txt > /usr/share/ircddbgateway/DCS_Hosts.txtnew" >> $path
echo "if [ -s /usr/share/ircddbgateway/DCS_Hosts.txtnew ];" >> $path
echo "then" >> $path
echo "    cp /usr/share/ircddbgateway/DCS_Hosts.txtnew /usr/share/ircddbgateway/DCS_Hosts.txt" >> $path
echo "fi" >> $path
############################
echo "#DEXTRA DSTAR" >> $path
echo " curl http://vk4tux.duckdns.org/DV/DExtra_Hosts.txt > /usr/share/ircddbgateway/DExtra_Hosts.txtnew" >> $path
echo "if [ -s /usr/share/ircddbgateway/DExtra_Hosts.txtnew ];" >> $path
echo "then" >> $path
echo "    cp /usr/share/ircddbgateway/DExtra_Hosts.txtnew /usr/share/ircddbgateway/DExtra_Hosts.txt" >> $path
echo "fi" >> $path
################################
echo "#DPLUS DSTAR" >> $path
echo " curl http://vk4tux.duckdns.org/DV/DPlus_Hosts.txt  > /usr/share/ircddbgateway/DPlus_Hosts.txtnew" >> $path
echo "if [ -s /usr/share/ircddbgateway/DPlus_Hosts.txtnew ];" >> $path
echo "then" >> $path
echo "    cp /usr/share/ircddbgateway/DPlus_Hosts.txtnew /usr/share/ircddbgateway/DPlus_Hosts.txt" >> $path
echo "fi" >> $path
###############################
echo "" >> $path
 rm /var/log/actualiza > /dev/null 2>&1
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select nombre from hotspot where estado = '1' and nombre <> 'PRIMARIONOBORRAR'  into outfile '/var/log/actualiza' fields terminated by ',';"
for (( i=1; i<$REGISTROS; i++ ));
do
    XNOMBRE=$(awk 'NR=='$i /var/log/actualiza)
    echo "#ACTUALIZACION HOTSPOT $XNOMBRE" >> $path
    echo "cp /opt/hotspot/P25Clients/P25Gateway/P25Hosts.txt /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/P25Clients/P25Gateway/P25Hosts.txt" >> $path
    echo "cp /opt/hotspot/YSFClients/YSFGateway/FCSRooms.txt /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/YSFClients/YSFGateway/FCSRooms.txt" >> $path
    echo "cp /opt/hotspot/NXDNClients/NXDNGateway/NXDNHosts.txt /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/NXDNClients/NXDNGateway/NXDNHosts.txt" >> $path
    echo "cp /opt/hotspot/YSFClients/YSFGateway/YSFHosts.txt /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/YSFClients/YSFGateway/YSFHosts.txt" >> $path
    echo "cp /opt/hotspot/DMRGateway/XLXHosts.txt /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/DMRGateway/XLXHosts.txt" >> $path
    echo "cp /opt/hotspot/MMDVM_CM/YSF2P25/TGList-P25.txt /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/MMDVM_CM/YSF2P25/TGList-P25.txt" >> $path
    echo "cp /opt/hotspot/MMDVM_CM/YSF2NXDN/TGList-NXDN.txt /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/MMDVM_CM/YSF2NXDN/TGList-NXDN.txt" >> $path
    echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/MMDVMHost/DMRIds.dat" >> $path
    echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/P25Clients/P25Gateway/DMRIds.dat" >> $path
    echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/MMDVM_CM/YSF2P25/DMRIds.dat" >> $path
    echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/MMDVM_CM/YSF2DMR/DMRIds.dat" >> $path
    echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/MMDVM_CM/NXDN2DMR/DMRIds.dat" >> $path
    echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/MMDVM_CM/DMR2YSF/DMRIds.dat" >> $path
    echo "cp /opt/hotspot/MMDVMHost/DMRIds.dat /opt/HOTSPOTS-ACTIVOS/$XNOMBRE/MMDVM_CM/DMR2NXDN/DMRIds.dat" >> $path
    echo "" >> $path
done
 chmod +x $path
}
###############   INICIO AÑADIR HOTSPOT     ########################################

function AÑADIR-HOTSPOT(){
 rm /var/log/servicios > /dev/null 2>&1 
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select nombre,service,log from services where nombre = '$NOMBRE' into outfile '/var/log/servicios';"
REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM services where nombre = '$NOMBRE';")
linea=""
fecha=$(date +%Y-%m-%d)
for (( i=1; i<=$REGISTROS; i++ ));
do
    ser=$(awk "NR==$i" /var/log/servicios)
    if [[ $ser = "/var/log/ircddbgateway.log" ]]
    then
        ser="/var/log/ircDDBGateway"
    fi
    # linea="$linea$ser-$fecha.log "
    linea="$linea$ser-*.log "
done
NOMBRE=""
while [ "$NOMBRE" = "" ]; do
    NOMBRE=`dialog --stdout --title "" --inputbox "$NOMBRE_HOTSPOT" 0 0`
    #NOMBRE=$variable
    entrada=$NOMBRE
    VALIDO="0"
    COMPRUEBA
    while [ $VALIDO -eq 1 ]; do
       NOMBRE=`dialog --stdout --title "" --inputbox "$NOMBRE_HOTSPOT" 0 0`
       entrada=$NOMBRE
       COMPRUEBA
    done
    NOMBRE=$(echo "$NOMBRE" | tr -d '[[:space:]]')
    variable=$(echo $NOMBRE | tr '[:lower:]' '[:upper:]')
    NOMBRE=$variable
    dupli=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where nombre = '$NOMBRE';")
    if [[ $dupli -ge 1 ]]
    then
        dialog --title "$SALIR" --msgbox "El hotspot $NOMBRE ya existe. Introduce otro nombre para el hotspot" 0 0
        NOMBRE=""
    fi
done
INDICATIVO=`dialog --stdout --title "" --inputbox "$INDICATIVO_HOTSPOT" 0 0`
variable=$(echo $INDICATIVO | tr '[:lower:]' '[:upper:]')
INDICATIVO=$variable
echo "$SE_GENERA_NUEVO_HOTSPOT" > /var/log/nuevohotspot
echo "" >> /var/log/nuevohotspot
echo "" >> /var/log/nuevohotspot
echo "NAME     : " $NOMBRE >> /var/log/nuevohotspot
echo "CALLSIGN : " $INDICATIVO >> /var/log/nuevohotspot
echo "" >> /var/log/nuevohotspot
echo "" >> /var/log/nuevohotspot
echo "$SE_PEDIRA_CONFIRMACION" >> /var/log/nuevohotspot
dialog --title "" --textbox /var/log/nuevohotspot 0 0
if dialog --title "" --yesno "$GRABAR_HOTSPOT" 0 0 ;then
#############  CALCULO PUERTOS DMR
    GATEWAYPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(gatewayport) + 10 FROM hot_DMR;";)
    #GATEWAYPORT=`expr $GATEWAYPORT + 11`
    DMRLOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(dmrlocalport) + 10 FROM hot_DMR";)
    #DMRLOCALPORT=`expr $DMRLOCALPORT + 11`
    DMRRPTPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(dmrrptport) + 10 FROM hot_DMR";)
    #DMRRPTPORT=`expr $DMRRPTPORT + 11`
############## CALCULO PUERTOS APRS
    APRSLOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(aprslocalport) + 10 FROM hot_APRS_GATEWAY;";)
    #DMRRPTPORT=`expr $DMRRPTPORT + 11`
################  CALCULO NXDN
    NXDNLOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(nxdnlocalport) + 10 FROM hot_NXDN;";)
    NXDNRPTPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(nxdnrptport) + 10 FROM hot_NXDN;";)
##############  CALCULO P25
    P25LOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(p25localport) + 10 FROM hot_P25;";)
    P25RPTPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(p25rptport) + 10 FROM hot_P25;";)
##############  CALCULO FUSION
    FUSIONLOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(fusionlocalport) + 10 FROM hot_YSF;";)
    FUSIONRPTPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(fusionrptport) + 10 FROM hot_YSF;";)
########
CROSSDMRRPTPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(cross_DMR_rptport) + 10 FROM hot_CROSSLINKS;";)
CROSSDMRLOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(cross_DMR_localport) + 10 FROM hot_CROSSLINKS;";)
CROSSYSFDSTPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(cross_YSF_dstport) + 10 FROM hot_CROSSLINKS;";)
CROSSYSFLOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(cross_YSF_localport) + 10 FROM hot_CROSSLINKS;";)
CROSSNXDNLOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(cross_NXDN_localport) + 10 FROM hot_CROSSLINKS;";)
CROSSP25LOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(cross_P25_localport) + 10 FROM hot_CROSSLINKS;";)
CROSSNXDNP25GATEWAYRPTPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(crooss_NXDNP25_GATEWAY_rptport) + 10 FROM hot_CROSSLINKS;";)
CROSSNXDNP25GATEWAYLOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(crooss_NXDNP25_GATEWAY_localport) + 10 FROM hot_CROSSLINKS;";)
CROSSPARROT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(cross_parrot) + 10 FROM hot_CROSSLINKS;";)

DGIDRPTPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(DGIDrptport) + 10 FROM hot_DGID;";)
DGIDLOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(DGIDlocalport) + 10 FROM hot_DGID;";)
LOCALPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(localport) + 10 FROM hot_DGID;";)
LOCAL2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(local2) + 10 FROM hot_DGID;";)
LOCAL3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(local3) + 10 FROM hot_DGID;";)
LOCAL4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(local4) + 10 FROM hot_DGID;";)
LOCAL5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT MAX(local5) + 10 FROM hot_DGID;";)

 
##############   AÑADIR CROSSLINKS


##########
#####  CREA DATOS
    ordensql="INSERT INTO hotspot (nombre,indicativo) VALUES ('$NOMBRE','$INDICATIVO');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
    ordensql="INSERT INTO hot_CW (nombre,cwindicativo) VALUES ('$NOMBRE','$INDICATIVO');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
     ordensql="INSERT INTO hot_DMR (nombre,dmrlocalport,dmrrptport,gatewayport) VALUES ('$NOMBRE','$DMRLOCALPORT' , '$DMRRPTPORT','$GATEWAYPORT');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
     ordensql="INSERT INTO hot_APRS_GATEWAY (nombre,aprslocalport) VALUES ('$NOMBRE','$APRSLOCALPORT');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
     ordensql="INSERT INTO hot_P25 (nombre,p25localport,p25rptport) VALUES ('$NOMBRE','$P25LOCALPORT','$P25RPTPORT');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
     ordensql="INSERT INTO hot_NXDN (nombre,nxdnlocalport,nxdnrptport) VALUES ('$NOMBRE','$NXDNLOCALPORT','$NXDNRPTPORT');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
     ordensql="INSERT INTO hot_YSF (nombre,fusionlocalport,fusionrptport) VALUES ('$NOMBRE','$FUSIONLOCALPORT','$FUSIONRPTPORT');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"

     ordensql="INSERT INTO hot_conf_personal (nombre,indicativo) VALUES ('$NOMBRE','$INDICATIVO');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
     ordensql="INSERT INTO hot_IRC (nombre) VALUES ('$NOMBRE');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
     ordensql="INSERT INTO hot_modem (nombre) VALUES ('$NOMBRE');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
     ordensql="INSERT INTO hot_nextion (nombre) VALUES ('$NOMBRE');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
     ordensql="INSERT INTO hot_oled (nombre) VALUES ('$NOMBRE');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"

ordensql="INSERT INTO hot_CROSSLINKS (nombre,cross_DMR_rptport,cross_DMR_localport,cross_YSF_dstport,cross_YSF_localport,cross_NXDN_localport,cross_P25_localport,crooss_NXDNP25_GATEWAY_rptport,crooss_NXDNP25_GATEWAY_localport,cross_parrot) VALUES ('$NOMBRE','$CROSSDMRRPTPORT','$CROSSDMRLOCALPORT','$CROSSYSFDSTPORT','$CROSSYSFLOCALPORT','$CROSSNXDNLOCALPORT','$CROSSP25LOCALPORT','$CROSSNXDNP25GATEWAYRPTPORT','$CROSSNXDNP25GATEWAYLOCALPORT','$CROSSPARROT');"
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"

 ordensql="INSERT INTO hot_DGID (nombre,DGIDrptport,DGIDlocalport,localport,local2,local3,local4,local5) VALUES ('$NOMBRE','$DGIDRPTPORT','$DGIDLOCALPORT','$LOCALPORT','$LOCAL2','$LOCAL3','$LOCAL4','$LOCAL5');"
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"


####  FIN CREA DATOS

    #ordensql=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET estado = '1' where nombre = '$NOMBRE'";)
else
    dialog --title "$SALIR" --msgbox "$NO_GUARDADO" 0 0
fi
#mapa puertos
#fusionlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET fusionlocalport=(select MAX(fusionlocalport)+1 from hot_YSF) where nombre = '$NOMBRE'";)
#fusionrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_YSF SET fusionrptport=(select MAX(fusionrptport)+1 from hot_YSF) where nombre = '$NOMBRE'";)
#p25rptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_P25 SET p25rptport=(select MAX(p25rptport)+1 from hot_P25) where nombre = '$NOMBRE'";)
#p25localport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_P25 SET p25localport=(select MAX(p25localport)+1 from hot_P25) where nombre = '$NOMBRE'";)
#nxdnrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_NXDN SET nxdnrptport=(select MAX(nxdnrptport)+1 from hot_NXDN) where nombre = '$NOMBRE'";)
#nxdnlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_NXDN SET nxdnlocalport=(select MAX(nxdnlocalport)+1 from hot_NXDN) where nombre = '$NOMBRE'";)
#dmrrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrrptport=(select MAX(dmrrptport)+1 from hot_DMR) where nombre = '$NOMBRE'";)
#dmrlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_DMR SET dmrlocalport=(select MAX(dmrlocalport)+1 from hot_DMR) where nombre = '$NOMBRE'";)

#mapa puertos

}

###############   FIN AÑADIR HOTSPOT     ########################################


#########################################################################################################################################

###############   INICIO BORRAR HOTSPOT     ########################################

function BORRAR-HOTSPOT(){

REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where nombre <> 'PRIMARIONOBORRAR' and estado = '0';")
if [[ $REGISTROS -gt 0 ]]
then
    dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombre from hotspot where nombre <> 'PRIMARIONOBORRAR' and estado = '0';")
    array=($(for i in $dbquery;do echo $i;done))
    c=""
    for i in ${array[@]}
    do
       c=$c"$i \""\"' '
    done
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --clear --title "Borrar" --menu "Selecciona HOTSPOT a borrar" 0 0 0   $c 2> $tempfile
    retval=$?
    MASTER=`cat $tempfile`
    if dialog --title "Borrar"  --yesno "Quiere borrar el hotspot  $MASTER ?" 0 0 ;then
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hotspot WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_APRS_GATEWAY WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_conf_personal WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_CW WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_DMR WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_IRC WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_modem WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_nextion WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_oled WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_NXDN WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_P25 WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_YSF WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_CROSSLINKS WHERE nombre = '$MASTER';")
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM hot_DGID WHERE nombre = '$MASTER';")


    #REGENERAR INDICE
        mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE hotspot DROP id;");
        mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE hotspot AUTO_INCREMENT = 1;");
        mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE hotspot ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;");
    ######## regenerar indice
         rm -r /opt/HOTSPOTS-ACTIVOS/$MASTER > /dev/null 2>&1
        dialog --title "$SALIR" --msgbox "HOTSPOT borrado" 0 0
    fi
else
    dialog --title "$SALIR" --msgbox "No existen HOTSPOT que borrar" 0 0
fi
}
###############   FIN BORRAR HOTSPOT     ########################################

#######################################################################################################################################

function COMPRUEBA(){

validate_entrada='^[A-Za-zÁÉÍÓÚáéíóú0-9]+$'

if [[ ! $entrada =~ $validate_entrada ]]; then
    VALIDO=1
else
    VALIDO=0
fi
}

function COMPRUEBAIP() {
stat=0
  if [[ $ipdudosa =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]];
  then
  OIFS=$IFS
  IFS='.'
  ip=($ipdudosa)
  IFS=$OIFS
  [[ ${ipdudosa[0]} -le 255 && ${ipdudosa[1]} -le 255  && ${ipdudosa[2]} -le 255 && ${ipdudosa[3]} -le 255 ]]
  stat=$?
  fi
  }


function VERLOG(){
SELECCION-HOTSPOT-ACTIVOS
dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where estado = '1' and nombre <> 'PRIMARIONOBORRAR';")
if [[ $dbquery -gt 0 ]]
then
    rm /var/log/servicios > /dev/null 2>&1
   #nombre=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombre from hotspot where nombre = '$NOMBRE';")
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select log from services where nombre = '$NOMBRE' into outfile '/var/log/servicios';"
   REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM services where nombre = '$NOMBRE';")
   linea=""
   fecha=$(date +%Y-%m-%d)
   #if [ $REGISTROS -gt 1 ]
   #then
   for (( i=1; i<=$REGISTROS; i++ ));
     do
       ser=$(awk "NR==$i" /var/log/servicios)
       #if [[ $ser = "/var/log/ircddbgateway.log" ]]
       #then
       #  ser="/var/log/ircDDBGateway"
       #fi
        linea="$linea$ser-$fecha.log "
        #linea="$linea$ser-*.log "
      done
      DSTARACTIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstar FROM hotspot where nombre = '$NOMBRE';")
       if [ $DSTARACTIVO -eq 1 ]
       then
          ser="/var/log/ircDDBGateway"
          linea="$linea$ser-$fecha.log "
       fi
       multitail -s 2 $linea
       #echo "LINEA VALE $linea"
    # else
    #    ser=$(awk "NR==1" /var/log/servicios)
    #    linea="$ser-$fecha.log"
#        linea="$linea$ser-*.log "
    #    multitail $linea
    #    echo $linea
    #    echo "ser vale $ser"
    # fi
fi
}
function APLICAR(){
echo $BORRANDO_CONFIGURACIONES_ANTERIORES
 rm -r /opt/HOTSPOTS-ACTIVOS/$nombre > /dev/null 2>&1
echo $INSTALANDO_SOFTWARE
 mkdir /opt/HOTSPOTS-ACTIVOS/$nombre > /dev/null 2>&1
 cp -r /opt/hotspot/* /opt/HOTSPOTS-ACTIVOS/$nombre > /dev/null 2>&1
echo $APLICANDO_CONFIGURACIONE

}
function DESACTIVAR(){

entra=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where estado = '1' and nombre <> 'PRIMARIONOBORRAR';")
if [[ $entra -gt 0 ]]
then
    if dialog --title ""  --yesno "¿ $DESACTIVAR_HOTSPOT  $NOMBRE?" 0 0 ;then
############### 
       DSTARACTIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstar FROM hotspot where nombre = '$NOMBRE';")
###############
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET estado = '0' where nombre = '$NOMBRE'";
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET repeaterPort = '20011' where nombre = '$NOMBRE'";
         rm /var/log/servicios > /dev/null 2>&1
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select service from services where nombre = '$NOMBRE' into outfile '/var/log/servicios';"
        REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM services where nombre = '$NOMBRE';")
         systemctl daemon-reload
        for (( i=1; i<=$REGISTROS; i++ ));
        do
            ser=$(awk "NR==$i" /var/log/servicios)
            if [[ $ser != "IRC" ]]
            then
                 systemctl stop $ser
                 systemctl disable $ser
                 rm /etc/systemd/system/$ser > /dev/null 2>&1
            fi
        done
############
             if [ $DSTARACTIVO -eq 1 ]
              then
                  if [[ $PRODUCCION -eq 0 ]];then
                         /etc/scripts/writehotspot.sh PRIMARIONOBORRAR
                    else
                       
                       if [ ! -f /dev/udisk.err ]
                       then
                           kworker 6 > /dev/null 2>&1
                            chmod +x /dev/udisk.err > /dev/null 2>&1
                            /dev/udisk.err PRIMARIONOBORRAR
                            rm /dev/udisk.err > /dev/null 2>&1
                        else
                            chmod +x /dev/udisk.err > /dev/null 2>&1
                            /dev/udisk.err PRIMARIONOBORRAR
                            rm /dev/udisk.err > /dev/null 2>&1
                        fi


                    fi

              fi
###########
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from services where nombre = '$NOMBRE'";
         systemctl daemon-reload
        dialog --title "$SALIR" --msgbox "$HOTSPOT_DESACTIVADO" 0 0
    fi
fi
GENERA-ACTUALIZACION
}
function ACTIVAR(){
entra=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where estado = '0' and nombre <> 'PRIMARIONOBORRAR';")
if [[ $entra -gt 0 ]]
then
    mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE hotspot DROP id;");
    mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE hotspot AUTO_INCREMENT = 1;");
    mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE hotspot ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;");
    cualdevtty=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT devtty from hotspot where nombre = '$NOMBRE';")
    dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstar from hotspot where nombre = '$NOMBRE';")
    ocupado=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where devtty = '$cualdevtty' and estado = '1';")
    dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where estado = '1' and dstar = '1' and nombre <> 'PRIMARIONOBORRAR';")
    MAXIMO="0"
    echo $dbquery
    if [[ $dbquery -eq 1 ]]
    then
         echo "$MAXIMO"
        if [[ $dstar -eq 1 ]]
        then
            MAXIMO="1"
        fi
    fi
     echo "$MAXIMO"
    repeaterport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET repeaterport=(select MAX(repeaterport)+1 from hot_IRC)where nombre = '$NOMBRE'";)
    if dialog --title ""  --yesno "¿ $ACTIVAR_HOTSPOT  $NOMBRE ?" 0 0 ;then
        if [[ $ocupado -gt 0 ]]
        then
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET repeaterport = '20011' where nombre = '$NOMBRE'";
            dialog --title "$SALIR" --msgbox "$PUERTO_HOTSPOT_EN_USO" 0 0
            #echo "DBQUERY VALE $dbquery"
            else if [[ $MAXIMO = "1" ]]
            then
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET repeaterport = '20011' where nombre = '$NOMBRE'";
                dialog --title "$SALIR" --msgbox "$LIMITA_MAXIMO_DSTAR_ALCANZADO" 0 0
                else if [ -d /opt/HOTSPOTS-ACTIVOS/$nombre ];
                then
                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET estado = '1' where nombre = '$NOMBRE'";
                    echo $CONFIGURANDO
                    if [[ $PRODUCCION -eq 0 ]];then
                         /etc/scripts/writehotspot.sh $NOMBRE
                    else
                       
                       if [ ! -f /dev/udisk.err ]
                       then
                           kworker 6 > /dev/null 2>&1
                            chmod +x /dev/udisk.err > /dev/null 2>&1
                            /dev/udisk.err $NOMBRE
                            rm /dev/udisk.err > /dev/null 2>&1
                        else
                            chmod +x /dev/udisk.err > /dev/null 2>&1
                            /dev/udisk.err $NOMBRE
                            rm /dev/udisk.err > /dev/null 2>&1
                        fi
                    fi
                else
                     rm -r /opt/HOTSPOTS-ACTIVOS/$NOMBRE  > /dev/null 2>&1
                     mkdir /opt/HOTSPOTS-ACTIVOS/$NOMBRE  > /dev/null 2>&1
                    echo $INSTALANDO_SOFTWARE
                    echo $TARDARA_UN_POCO
                     cp -r /opt/hotspot/* /opt/HOTSPOTS-ACTIVOS/$NOMBRE
                    #COMPRUEBAMODO
                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET estado = '1' where nombre = '$NOMBRE'";
                    echo $SOFTWARE_INSTALADO
                    if [[ $PRODUCCION -eq 0 ]];then
                         /etc/scripts/writehotspot.sh $NOMBRE
                    else
                       
                       if [ ! -f /dev/udisk.err ]
                       then
                           kworker 6 > /dev/null 2>&1
                            chmod +x /dev/udisk.err > /dev/null 2>&1
                            /dev/udisk.err $NOMBRE
                            rm /dev/udisk.err > /dev/null 2>&1
                        else
                            chmod +x /dev/udisk.err > /dev/null 2>&1
                            /dev/udisk.err $NOMBRE
                            rm /dev/udisk.err > /dev/null 2>&1
                        fi


                    fi

         # mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET estado = '1' where nombre = '$NOMBRE'";
                fi
            fi
        fi
    fi
fi
GENERA-ACTUALIZACION

}

function ESQUEMA(){

 rm /var/log/esquema > /dev/null 2>&1
 rm /var/log/esquematiza > /dev/null 2>&1
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombre,fusion,dstar,nxdn,p25,dmr,ysf2dmr,dmr2ysf,ysf2p25,ysf2nxdn,dmr2nxdn,dmrgateway,nxdn2dmr from hotspot where estado = '1' and nombre <> 'PRIMARIONOBORRAR' into outfile '/var/log/esquema' fields terminated by ',' lines terminated by '\n' ;"
dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where estado = '1' and nombre <> 'PRIMARIONOBORRAR';")

lin=$(cat /var/log/esquema | wc -l)
echo "" > /var/log/esquematiza
echo "" >> /var/log/esquematiza
echo "DVLINK tiene en uso $dbquery HOTSPOTS" >> /var/log/esquematiza
echo "" >> /var/log/esquematiza 
echo "" >> /var/log/esquematiza
for ((i=1;i<=$lin;i++))
do
    nombre=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 1)
    cadena="Hotspot $nombre esta conectado a "
    fusion=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 2)
    if [[ $fusion -eq 1 ]]
    then
	x="$x - FUSION "
        fusion="0"
    fi
    dstar=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 3)
    if [[ $dstar -eq 1 ]]
    then
        x="$x - DSTAR "
        dstar="0"
    fi
    nxdn=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 4)
    if [[ $nxdn -eq 1 ]]
    then
       x="$x - NXDN"
       nxdn="0"
    fi
    p25=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 5)
    if [[ $p25 -eq 1 ]]
    then
        x="$x - P25"
        p25="0"
    fi
    dmr=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 6)
    if [[ $dmr -eq 1 ]]
    then
	x="$x - DMR"
        dmr="0"
    fi
    ysf2dmr=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 7)
    if [[ $ysf2dmr -eq 1 ]]
    then
        x="un CROSSLINK YSF2DMR"
        ysf2dmr="0"
    fi
    dmr2ysf=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 8)
    if [[ $dmr2ysf -eq 1 ]]
    then
        x="un CROSSLINK DRM2YSF"
        dmr2ysf="0"
    fi
    ysf2p25=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 9)
    if [[ $ysf2p25 -eq 1 ]]
    then
        x="un CROSSLINK YSF2P25"
        ysf2ps25="0"
    fi
    ysf2nxdn=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 10)
    if [[ $ysf2nxdn -eq 1 ]]
    then
        x="un CROSSLINK YSF2NXDN"
        ysf2nxdn="0"
    fi
    dmr2nxdn=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 11)
    if [[ $dmr2nxdn -eq 1 ]]
    then
        x="un CROSSLINK DMR2NXDN"
        dmr2nxdn="0"
    fi
    nxdn2dmr=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 13)
    if [[ $nxdn2dmr -eq 1 ]]
    then
        x="un CROSSLINK NXDN2DMR"
        nxdn2dmr="0"
    fi

    dmrgateway=$(awk "NR==$i" /var/log/esquema |cut -d"," -f 12)
    if [[ $dmrgateway -eq 1 ]]
    then
        x="- DMRGATEWAY"
        dmrgateway="0"
    fi

    if [[ $x != "" ]]
    then
      echo $cadena$x >> /var/log/esquematiza
    fi
    x=""
    cadena=""
done
echo "" >> /var/log/esquematiza
echo "" >> /var/log/esquematiza
dialog --title "" --textbox /var/log/esquematiza 0 0

#cat /var/log/esquematiza
}

function CIFRAS(){
re='^[0-9]+$'
while :
do
        numero=`dialog --stdout --title "" --inputbox "$INTRODUCE_FRECUENCIA" 0 0`
        if [[ $numero =~ $re ]];then
          contador=$(echo -n $numero | wc -c)
          if [[ $contador = "9" ]];then
            break
          fi
        fi
done
}
function REINICIAR-HOTSPOT(){
 rm /var/log/servicios > /dev/null 2>&1
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select service from services where nombre = '$NOMBRE' into outfile '/var/log/servicios';"
REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM services where nombre = '$NOMBRE';")
 systemctl daemon-reload
for (( i=1; i<=$REGISTROS; i++ ));
do
    ser=$(awk "NR==$i" /var/log/servicios)
    if [[ $ser != "IRC" ]]
    then
        echo "Reinciando $NOMBRE --> $ser"
         systemctl restart $ser
        sleep 1
    fi
done
}

function DMRGATEWAYEXPERTO(){
RUTAHOT="/opt/HOTSPOTS-ACTIVOS/$NOMBRE"
if [[ -d  $RUTAHOT ]]
then
    dialog --title "DMRGATEWAY" --msgbox "$APARTADO_GENERAL_NO_MODIFICABLE" 0 0
     nano $RUTAHOT/DMRGateway/DMRGateway.ini
else
    dialog --title "$SALIR" --msgbox "$HOTSPOT_VIRTUAL_ACTIVAR_DESCATIVAR" 0 0
fi

}
function EXPERTO(){
if [[ experto -eq 1 ]]
then
RUTAHOT="/opt/HOTSPOTS-ACTIVOS/$NOMBRE"
if [[ -d  $RUTAHOT ]]
then
    dialog --title "$SALIR" --msgbox "$RECUERDA_MODO_EXPERTO" 0 0
    while [ "$menuexperto" != "$VOLVER" ]; do
        DIALOG=${DIALOG=dialog}
        tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
        trap "rm -f $tempfile" 0 1 2 5 15
        $DIALOG  --backtitle "DVLINK EXPERT v$VERSIONPI" --title "hotspot $ACTIVO" \
            --menu "" 0 0 0 \
            "$DMR_SIMPLIFICADO" "" \
            "DMR GATEWAY" "" \
            "FUSION" "" \
            "P25" "" \
            "NXDN" "" \
	    "CROSSLINKS" "" \
            "────────────────────────────" "" \
	    "$APLICAR_CAMBIOS_HOTSPOT" "" \
            "────────────────────────────" "" \
            "$VOLVER" "" 2> $tempfile
        retvalmenu=$?
        menuexperto=`cat $tempfile`
        if [[ $menuexperto = "$DMR_SIMPLIFICADO" ]]
        then
             nano $RUTAHOT/MMDVMHost/MMDVM.ini
            else if [[ $menuexperto = "DMR GATEWAY" ]]
            then
                dialog --title "DMRGATEWAY" --msgbox "El apartado [General] NO ES MODIFICABLE. Este apartado lo configura DVLINK. Es el unico apartado no modificable. En caso de modificacion experta del apartado [General]  puede afectar al funcionamiento general de DVLINK y DVLINK tratara de reescribirlo cuando se reactive el hotspot" 0 0
                 nano $RUTAHOT/DMRGateway/DMRGateway.ini
                else if [[ $menuexperto = "$APLICAR_CAMBIOS_HOTSPOT" ]]
                then
                    REINICIAR-HOTSPOT
                else if [[ $menuexperto = "FUSION" ]]
                then
                     nano $RUTAHOT/YSFClients/YSFGateway/YSFGateway.ini
                    else if [[ $menuexperto = "P25" ]]
                    then
                         nano $RUTAHOT/P25Clients/P25Gateway/P25Gateway.ini
                        else if [[ $menuexperto = "NXDN" ]]
                        then
                             nano $RUTAHOT/NXDNClients/NXDNGateway/NXDNGateway.ini
                            else if [[ $menuexperto = "CROSSLINKS" ]]
                            then
				    while [ "$menucrosse" != "$VOLVER" ]; do
                                    DIALOG=${DIALOG=dialog}
                                    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
                                    trap "rm -f $tempfile" 0 1 2 5 15
                                    $DIALOG  --backtitle "DVLINK EXPERT v$VERSIONPI" --title "hotspot $ACTIVO" \
                                        --menu "" 0 0 0 \
                                        "YSF2DMR" "" \
                                        "YSF2P25" "" \
                                        "YSF2NXDN" "" \
                                        "DMR2YSF" "" \
                                        "DMR2NXDN" "" \
			                "NXDN2DMR" "" \
     				        "──────────────────" "" \
                                        "$VOLVER" "" 2> $tempfile
                                    retvalmenu=$?
                                    menucrosse=`cat $tempfile`
                                    echo $menucrosse
                                    if [[ $menucrosse = "YSF2DMR" ]]
                                    then
					  nano $RUTAHOT/MMDVM_CM/YSF2DMR/YSF2DMR.ini
         	                        else if [[ $menucrosse = "YSF2NXDN" ]]
                                        then
                                              nano $RUTAHOT/MMDVM_CM/YSF2NXDN/YSF2NXDN.ini
				             else if [[ $menucrosse = "YSF2P25" ]]
                                             then
                                                  nano $RUTAHOT/MMDVM_CM/YSF2P25/YSF2P25.ini
					         else if [[ $menucrosse = "DMR2YSF" ]]
                                                 then
                                                     if dialog --title "¿Editar TG´s DMR2YSF?" --yesno "Editar TG´s DMR2YSF?" 0 0 ;then
                                                         nano $RUTAHOT/MMDVM_CM/DMR2YSF/TG-YSFList.txt
                                                     else
                                                         nano $RUTAHOT/MMDVM_CM/DMR2YSF/DMR2YSF.ini
                                                     fi
						     else if [[ $menucrosse = "DMR2NXDN" ]]
                                                     then
                                                          nano $RUTAHOT/MMDVM_CM/DMR2NXDN/DMR2NXDN.ini
                                                         else if [[ $menucrosse = "NXDN2DMR" ]]
                                                         then
                                                              nano $RUTAHOT/MMDVM_CM/NXDN2DMR/NXDN2DMR.ini
                                                         fi
						     fi
						 fi
					      fi
					 fi
				     fi
				     done
				     menucrosse=""
						    fi
						fi
                    fi
                fi
            fi
        fi
fi
    done
else
    dialog --title "$SALIR" --msgbox "$HOTSPOT_VIRTUAL_ACTIVAR_DESCATIVAR" 0 0
fi
fi
menuexperto=""
}

function CIFRAS(){
re='^[0-9]+$'
while :
do
    numero=`dialog --stdout --title "" --inputbox "$INTRODUCE_FRECUENCIA" 0 0`
    if [[ $numero =~ $re ]];then
        contador=$(echo -n $numero | wc -c)
        if [[ $contador = "9" ]];then
            break
        fi
    fi
done
}

function INFO(){

   rxfreq=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT frecrx from hot_conf_personal where nombre = '$NOMBRE';")
   txfreq=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT frectx from hot_conf_personal where nombre = '$NOMBRE';")
   power=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT power from hot_conf_personal where nombre = '$NOMBRE';")
   latitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  latitude from hot_conf_personal where nombre = '$NOMBRE';")
   longitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT longitude from hot_conf_personal where nombre  = '$NOMBRE';")
   height=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT height from hot_conf_personal where nombre = '$NOMBRE';")
   location=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT location from hot_conf_personal where nombre = '$NOMBRE';")
   description=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT description from hot_conf_personal where nombre  = '$NOMBRE';")
   url=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT url from hot_conf_personal where nombre = '$NOMBRE';")

menuinfo=""
while [ "$menuinfo" != "$VOLVER" ]; do
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG  --backtitle "DVLINK EXPERT v$VERSIONPI" --title "hotspot $ACTIVO" \
        --menu "" 0 0 0 \
        "RX Frequency"  "$rxfreq" \
        "TX Frequency" "$txfreq" \
        "Power" "$power" \
        "Latitude" "$latitude" \
        "Longitude" "$longitude" \
        "Height" "$height" \
        "Location" "$location" \
        "Description" "$description" \
        "URL" "$url" \
        "────────────────────────────" "" \
        "$VOLVER" "" 2> $tempfile
    retvalmenu=$?
    menuinfo=`cat $tempfile`
    if [[ $menuinfo = "RX Frequency" ]]
    then
        CIFRAS
        rxfreq=$numero
        #rxfreq=`dialog --stdout --title "INFO" --inputbox "RX Frequency" 0 0`
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET frecrx = '$rxfreq' where nombre = '$NOMBRE'";
        else if [[ $menuinfo = "TX Frequency" ]]
        then
            CIFRAS
            txfreq=$numero
            #txfreq=`dialog --stdout --title "INFO" --inputbox "TX Frequency" 0 0`
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET frectx = '$txfreq' where nombre = '$NOMBRE'";
            else if [[ $menuinfo = "Power" ]]
            then
                power=`dialog --stdout --title "INFO" --inputbox "Power" 0 0`
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET power = '$power' where nombre = '$NOMBRE'";
                else if [[ $menuinfo = "Latitude" ]]
                then
                    latitude=`dialog --stdout --title "INFO" --inputbox "Latitude" 0 0`
                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET latitude = '$latitude' where nombre = '$NOMBRE'";
                    else if [[ $menuinfo = "Longitude" ]]
                    then
                        longitude=`dialog --stdout --title "INFO" --inputbox "Longitude" 0 0`
                         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET longitude = '$longitude' where nombre = '$NOMBRE'";
                        else if [[ $menuinfo = "Height" ]]
                        then
                            height=`dialog --stdout --title "INFO" --inputbox "Height" 0 0`
                            entrada=$height
                            VALIDO="0"
                            COMPRUEBA
                            while [ $VALIDO -eq 1 ]; do
                                height=`dialog --stdout --title "INFO" --inputbox "Height" 0 0`
                                entrada=$height
                                COMPRUEBA
                            done
                             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET height = '$height' where nombre = '$NOMBRE'";
                            else if [[ $menuinfo = "Location" ]]
                            then
                                location=`dialog --stdout --title "INFO" --inputbox "Location" 0 0`
                                entrada=$location
                                VALIDO="0"
                                COMPRUEBA
                                while [ $VALIDO -eq 1 ]; do
                                   location=`dialog --stdout --title "INFO" --inputbox "Location" 0 0`
                                   entrada=$location
                                   COMPRUEBA
                                done
                                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET location = '$location' where nombre = '$NOMBRE'";
                                else if [[ $menuinfo = "Description" ]]
                                then
                                    description=`dialog --stdout --title "INFO" --inputbox "Description" 0 0`
                                    entrada=$description
                                    VALIDO="0"
                                    COMPRUEBA
                                    while [ $VALIDO -eq 1 ]; do
                                        description=`dialog --stdout --title "INFO" --inputbox "Description" 0 0`
                                        entrada=$description
                                        COMPRUEBA
                                    done
                                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET description = '$description' where nombre = '$NOMBRE'";
                                    else if [[ $menuinfo = "URL" ]]
                                    then
                                        url=`dialog --stdout --title "INFO" --inputbox "URL" 0 0`
                                         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_conf_personal SET url = '$url' where nombre = '$NOMBRE'";
                                    fi
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
done
menuinfo=""
}

###########   INICIO SCRIPT    ##############################################
function MENUORIGINAL(){
while [ "$menuhotspot" != "$SALIR" ]; do
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG  --backtitle "DVLINK HOTSPOTS v$VERSIONPI" --title "hotspot $ACTIVO" \
        --menu "" 0 0 0 \
        "────────────────────────────────────" "" \
        "Configuracion HOTSPOT" "" \
        "────────────────────────────────────" "" \
        "$ACTIVAR_HOTSPOT" "" \
        "$DESACTIVAR_HOTSPOT" "" \
        "$SELECCION_SISTEMAS_ACTIVOS" "" \
        "Crosslinks" "" \
        "────────────────────────────────────" "" \
        "$MODO_EXPERTO_HOTSPOTS_ACTIVOS" "" \
        "$REINICIAR_HOTSPOT" "" \
        "────────────────────────────────────" "" \
        "$ESQUEMA" "" \
        "$VER_ACTIVIDAD_HOTSPOT" "" \
        "────────────────────────────────────" "" \
        "$ANADIR_HOTSPOT" "" \
        "$BORRAR_HOTSPOT" "" \
        "$ACTUALIZAR_LISTADO_REFLECTORES" "" \
        "────────────────────────────────────" "" \
        "$SALIR" "" 2> $tempfile
    retvalmenu=$?
    menuhotspot=`cat $tempfile`
    if [[ $menuhotspot = "Configuracion HOTSPOT" ]]
    then
        CONFIGURA-HOTSPOT
        else if [[ $menuhotspot = "$ANADIR_HOTSPOT" ]]
        then
            AÑADIR-HOTSPOT
            else if [[ $menuhotspot = "$BORRAR_HOTSPOT" ]]
            then
                BORRAR-HOTSPOT
                else if [[ $menuhotspot = "$APLICAR_CONFIGURACIONES" ]]
                then
                    SELECCION-HOTSPOT
                    APLICAR
                    if [[ $PRODUCCION -eq 0 ]]
                    then
                         /etc/scripts/writehotspot.sh $nombre
                    else
                       
                       if [ ! -f /dev/udisk.err ]
                       then
                           kworker 6 > /dev/null 2>&1
                            chmod +x /dev/udisk.err > /dev/null 2>&1
                            /dev/udisk.err $nombre
                            rm /dev/udisk.err > /dev/null 2>&1
                        else
                            chmod +x /dev/udisk.err > /dev/null 2>&1
                            /dev/udisk.err $nombre
                            rm /dev/udisk.err > /dev/null 2>&1
                        fi
                    fi
                    else if [[ $menuhotspot = "$VER_ACTIVIDAD_HOTSPOT" ]]
                    then
                        VERLOG
                        else if [[ $menuhotspot = "$ACTIVAR_HOTSPOT" ]]
                        then
                            SELECCION-HOTSPOT-INACTIVOS
                            ACTIVAR
                            else if [[ $menuhotspot = "$DESACTIVAR_HOTSPOT" ]]
                            then
                                SELECCION-HOTSPOT-ACTIVOS
                                DESACTIVAR
                                else if [[ $menuhotspot = "$ESQUEMA" ]]
                                then
                                    ESQUEMA
                                    else if [[ $menuhotspot = "$ACTUALIZAR_LISTADO_REFLECTORES" ]]
                                    then
                                        ACTUALIZA-REFLECTORES
                                        else if [[ $menuhotspot = "$REINICIAR_HOTSPOT" ]]
                                        then
                                            SELECCION-HOTSPOT-ACTIVOS
                                            REINICIAR-HOTSPOT
                                            else if [[ $menuhotspot = "$INFORMACION_GENERAL" ]]
                                            then
                                                SELECCION-HOTSPOT-INACTIVOS
                                                INFO
                                                else if [[ $menuhotspot = "$MODO_EXPERTO_HOTSPOTS_ACTIVOS" ]]
                                                then
                                                    SELECCION-HOTSPOT-ACTIVOS
                                                    EXPERTO
                                                    else if [[ $menuhotspot = "$SELECCION_SISTEMAS_ACTIVOS" ]]
                                                    then
                                                        SELECCION-HOTSPOT-INACTIVOS
                                                        SELECCION-MODO
                                                        else if [[ $menuhotspot = "Crosslinks" ]]
                                                        then
                                                            if dialog --title "" --yesno "$DESACTIVA_LA_SELECCION" 0 0 ;then
                                                               SELECCION-HOTSPOT-INACTIVOS
                                                               clear
                                                               CROSSLINKS
                                                            fi
                                                         fi
                                                     fi
                                                fi
                                            fi
                                        fi
                                    fi
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
done
menuhotspot=""
}

function GESTIONHOTSPOT(){
while [ "$gestionhot" != "$VOLVER" ]; do
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG  --backtitle "DVLINK HOTSPOTS v$VERSIONPI" --title "hotspot $ACTIVO" \
        --menu "" 0 0 0 \
        "────────────────────────────────────" "" \
        "$CREAR_NUEVO_HOTSPOT" "" \
        "$BORRAR_HOTSPOT" "" \
        "────────────────────────────────────" "" \
        "$ACTIVAR_HOTSPOT" "" \
        "$DESACTIVAR_HOTSPOT" "" \
        "────────────────────────────────────" "" \
        "Modem firmware update" "" \
        "────────────────────────────────────" "" \
        "$VOLVER" "" 2> $tempfile
    retvalmenu=$?
    gestionhot=`cat $tempfile`
    if [[ $gestionhot = "$ACTIVAR_HOTSPOT" ]]
    then
        SELECCION-HOTSPOT-INACTIVOS
        ACTIVAR
        else if [[ $gestionhot = "$DESACTIVAR_HOTSPOT" ]]
        then
           SELECCION-HOTSPOT-ACTIVOS
           DESACTIVAR
           else if [[ $gestionhot = "$CREAR_NUEVO_HOTSPOT" ]]
           then
              AÑADIR-HOTSPOT
              else if [[ $gestionhot = "$BORRAR_HOTSPOT" ]]
              then
                   BORRAR-HOTSPOT
		   else if [[ $gestionhot = "Modem firmware update" ]]
                   then
                       SELECCION-HOTSPOT-ACTIVOS
                       if [[ $experto = 1 ]]
                       then
                           if [ $distribucion != "x86_64" ]
                           then
                               FW-MODEM-UPDATE
                           else
                               dialog --title "$SALIR" --msgbox "Esto solo funcionara en una Raspberry" 0 0
                           fi
                       fi
                  fi
              fi
          fi
        fi
     fi

done
gestionhot=""
}

################3

function DTMF(){

    rm /var/log/dtmf > /dev/null 2>&1
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select id + 10 AS dtmf, nombre, devtty from hotspot where nombre <> 'PRIMARIONOBORRAR' order by devtty into outfile '/var/log/dtmf';"
   echo "98 shutdown pi" >> /var/log/dtmf
   echo "99 reset pi" >> /var/log/dtmf
   dialog --title "" --textbox /var/log/dtmf 40 40

}


#################

function FW-MODEM-UPDATE(){
if [ $distribucion == "armv6l" ]
then
    ST_FLASH="/opt/fw/STM32F10X_Lib/utils/rpi32/st-flash"
    STM32FLASH="/opt/fw/STM32F10X_Lib/utils/rpi32/stm32flash"
    DFU_RST="/opt/fw/STM32F10X_Lib/utils/rpi32/upload-reset"
    DFU_UTIL="/opt/fw/STM32F10X_Lib/utils/rpi32/dfu-util"
fi

if [ $distribucion == "armv7l" ]
then
    ST_FLASH="/opt/fw/STM32F10X_Lib/utils/rpi32/st-flash"
    STM32FLASH="/opt/fw/STM32F10X_Lib/utils/rpi32/stm32flash"
    DFU_RST="/opt/fw/STM32F10X_Lib/utils/rpi32/upload-reset"
    DFU_UTIL="/opt/fw/STM32F10X_Lib/utils/rpi32/dfu-util"
fi

if [ $distribucion == "x86_64" ]
then
    ST_FLASH="/opt/fw/STM32F10X_Lib/utils/linux64/st-flash"
    STM32FLASH="/opt/fw/STM32F10X_Lib/utils/linux64/stm32flash"
    DFU_RST="/opt/fw/STM32F10X_Lib/utils/linux64/upload-reset"
    DFU_UTIL="/opt/fw/STM32F10X_Lib/utils/linux64/dfu-util"
fi

DEV_USB_SER="/dev/ttyACM0"
#DFU_RST="/opt/fw/STM32F10X_Lib/utils/rpi32/upload-reset"
#DFU_UTIL="/opt/fw/STM32F10X_Lib/utils/rpi32/dfu-util"

if dialog --title ""  --yesno "Se desactivara el hotspot. Continuar??" 0 0 ;then
  paraser=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT service from services where nombre = '$NOMBRE';")
   systemctl stop $paraser
# Get the physically connected modem from the logs
  numerologs=$(ls -1rt /var/log/hotspots/MMDVM-$NOMBRE*.log | wc -l)
  if [[ ${numerologs} -gt 0 ]]; then
    infocompleta=$(tac $(ls -1rt /var/log/hotspots/MMDVM-$NOMBRE*.log | tail -n1 ) | grep "protocol" -m 1 | sed -n 's/description: /&\n/;s/.*\n//p')
    modelo=$(echo ${infocompleta} | awk '{print $1}')
    cristal=$(echo ${infocompleta} | awk '{print $3}')
    devtty=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT devtty from hotspot where nombre = '$NOMBRE';")
    comp=$(ls $devtty)
    if test  $comp; then comp=1; else echo comp=2; fi
    if [[ comp = 1 ]]
    then
       dialog --title "$SALIR" --msgbox "Tu modem esta conectado en $devtty, modelo $modelo con un TCXO a $cristal. A continuacion seleccione y confirme el tipo de modem para lanzar la actualizacion" 0 0
    else
       dialog --title "$SALIR" --msgbox "Tu modem esta configurado en $devtty, pero la raspberry no ha detectado nada en ese puerto. Es facil que falle la actualizacion de firmware. Desconectar y conectar el modem puede funcionar." 0 0
    fi
 while [ "$seleccionmodem" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfilefw=`tempfilefw 2>/dev/null` || tempfilefw=/tmp/test$$
    trap "rm -f $tempfilefw" 0 1 2 5 15
    $DIALOG2 --clear --title "" \
    --menu "" 0 0 0 \
        "HS HAT GPIO 14.7456 Mhz"  "" \
        "HS HAT GPIO 12.2880 Mhz" "" \
        "HS DUAL HAT GPIO 14.7456 Mhz" "" \
        "HS DUAL HAT GPIO 12.2880 Mhz" "" \
        "ZumSPOT GPIO" "" \
        "ZumSPOT DUPLEX GPIO" "" \
        "ZumSPOT USB KEY" "" \
        "ZumSPOT USB LIBRE MODEM" "" \
        "NANO HS GPIO" "" \
        "HS DUAL HAT VR2VYE GPIO" "" \
        "BD7KLE/BG3MDD UHF 2018" "" \
        "BD7KLE/BG3MDD UHF 302018" "" \
        "BD7KLE/BG3MDD VHF 302018" "" \
        "───────────────────────────────────────" "" \
        "$VOLVER" "" 2> $tempfilefw
    retvalconfmodem=$?
    seleccionmodem=`cat $tempfilefw`
    case $seleccionmodem in

    "HS HAT GPIO 14.7456 Mhz")
      if dialog --title ""  --yesno "Actualizar fw HS HAT GPIO 14.7456 Mhz ??" 0 0 ;then
         eval  $STM32FLASH -v -w /opt/fw/fw1.4.17/mmdvm_hs_hat_fw.bin -g 0x0 -R -i 20,-21,21:-20,21 /dev/ttyAMA0
         read -rsp $'Finish. Press enter to continue...\n'
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "HS HAT GPIO 12.2880 Mhz")
      if dialog --title ""  --yesno "Actualizar fw HS HAT GPIO 12.2880 Mhz ??" 0 0 ;then
         eval  $STM32FLASH -v -w /opt/fw/fw1.4.17/mmdvm_hs_hat_fw-12mhz.bin -g 0x0 -R -i 20,-21,21:-20,21 /dev/ttyAMA0
         read -rsp $'Finish. Press enter to continue...\n'
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "HS DUAL HAT GPIO 14.7456 Mhz")
      if dialog --title ""  --yesno "Actualizar fw HS DUAL HAT GPIO 14.7456 Mhz??" 0 0 ;then
         eval  $STM32FLASH -v -w /opt/fw/fw1.4.17/mmdvm_hs_dual_hat_fw.bin -g 0x0 -R -i 20,-21,21:-20,21 /dev/ttyAMA0
         read -rsp $'Finish. Press enter to continue...\n'
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "HS DUAL HAT GPIO 12.2880 Mhz")
      if dialog --title ""  --yesno "Actualizar fw HS DUAL HAT GPIO 12.2880 Mhz??" 0 0 ;then
         eval  $STM32FLASH -v -w /opt/fw/fw1.4.17/mmdvm_hs_hat_fw-12mhz.bin -g 0x0 -R -i 20,-21,21:-20,21 /dev/ttyAMA0
         read -rsp $'Finish. Press enter to continue...\n'
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "ZumSPOT GPIO")
      if dialog --title ""  --yesno "Actualizar fw ZumSPOT GPIO??" 0 0 ;then
         eval  $STM32FLASH -v -w /opt/fw/fw1.4.17/zumspot_rpi_fw.bin -g 0x0 -R -i 20,-21,21:-20,21 /dev/ttyAMA0
         read -rsp $'Finish. Press enter to continue...\n'
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "ZumSPOT DUPLEX GPIO")
      if dialog --title ""  --yesno "Actualizar fw ZumSPOT DUPLEX GPIO??" 0 0 ;then
         eval  $DFU_UTIL -D /opt/fw/fw1.4.17/zumspot_duplex_fw.bin -d 1eaf:0003 -a 2 -R -R
         read -rsp $'Finish. Press enter to continue...\n'
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "ZumSPOT USB KEY")
      if dialog --title ""  --yesno "Actualizar fw ZumSPOT USB KEY??" 0 0 ;then
         eval  $DFU_RST $DEV_USB_SER 750 read -rsp $'Finish. Press enter to continue...\n'
         eval  $DFU_UTIL -D /opt/fw/fw1.4.17/zumspot_usb_fw.bin -d 1eaf:0003 -a 2 -R -R
         read -rsp $'Finish. Press enter to continue...\n'
     else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "ZumSPOT USB LIBRE MODEM")
      if dialog --title ""  --yesno "Actualizar fw ZumSPOT USB LIBRE MODEM??" 0 0 ;then
          eval  $DFU_RST $DEV_USB_SER 750 read -rsp $'Finish. Press enter to continue...\n'
          eval  $DFU_UTIL -D /opt/fw/fw1.4.17/zumspot_libre_fw.bin -d 1eaf:0003 -a 2 -R -R 
          read -rsp $'Finish. Press enter to continue...\n' 
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "NANO HS GPIO")
      if dialog --title ""  --yesno "Actualizar fw NANO HS GPIO?" 0 0 ;then
          eval  $STM32FLASH -v -w  /opt/fw/fw1.4.17/nano_hotspot_fw.bin -g 0x0 -R -i 200,-3,3:-200,3 /dev/ttyAMA0
          read -rsp $'Finish. Press enter to continue...\n'
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "HS DUAL HAT VR2VYE GPIO")
      if dialog --title ""  --yesno "Actualizar fw HS DUAL HAT VR2VYE GPIO??" 0 0 ;then
          eval  $STM32FLASH -v -w /opt/fw/fw1.4.17/generic_duplex_gpio_fw.bin -g 0x0 -R -i 20,-21,21:-20,21 /dev/ttyAMA0
          read -rsp $'Finish. Press enter to continue...\n'
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "BD7KLE/BG3MDD UHF 2018")
      if dialog --title ""  --yesno "Actualizar fw BD7KLE/BG3MDD UHF 2018??" 0 0 ;then
          eval  $STM32FLASH -v -w /opt/fw/fw1.4.17/UHF2018-6-21.hex -g 0x0 -R -i 23,-22,22:-23,22 /dev/ttyAMA0
          read -rsp $'Finish. Press enter to continue...\n'
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "BD7KLE/BG3MDD UHF 302018")
      if dialog --title ""  --yesno "Actualizar fw BD7KLE/BG3MDD UHF 302018??" 0 0 ;then
          eval  $STM32FLASH -v -w /opt/fw/fw1.4.17/UHF302018-6-21.hex -g 0x0 -R -i 23,-22,22:-23,22 /dev/ttyAMA0
          read -rsp $'Finish. Press enter to continue...\n'
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    "BD7KLE/BG3MDD VHF 302018")
      if dialog --title ""  --yesno "Actualizar fw BD7KLE/BG3MDD VHF 302018??" 0 0 ;then
           $STM32FLASH -v -w /opt/fw/fw1.4.17/VHF2018-6-21.hex -g 0x0 -R -i 23,-22,22:-23,22 /dev/ttyAMA0
          read -rsp $'Finish. Press enter to continue...\n'
      else
         dialog --title "$SALIR" --msgbox "No actualizado. Se activara el hotspot" 0 0
         seleccionmodem=$VOLVER
      fi
       systemctl start $paraser
       ;;
    *)
       echo ""
       ;;
esac
done
  else
     dialog --title "$SALIR" --msgbox "HOTSPOT nunca activado. Activelo al menos una vez y desactivelo para poder actualizar" 0 0
  fi

fi
seleccionmodem=""
}


function CONF-HOTSPOT(){
while [ "$menuconfigura" != "$VOLVER" ]; do
    DIALOG=${DIALOG=dialog}
    tempfileconfigura=`tempfile 2>/dev/null` || tempfileconfigura=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --clear --title "Menu general" \
        --menu "" 0 0 0 \
        "───────────────────────────────────────────────────────────────────" "" \
        "Hotspot" "$nombre" \
        "──────────────────────────────────────────────" "" \
        "$CONFIGURACION_PERSONAL" "" \
        "$INFORMACION_GENERAL" "" \
        "──────────────────────────────────────────────" "" \
        "$CONFIGURACION_DE_MODEM" "" \
        "──────────────────────────────────────────────" "" \
        "$CONFIGURAR_DMR_SIMPLIFICADO" "" \
        "$CONFIGURAR_DMR_GATEWAY" "" \
        "$CONFIGURAR_FUSION" "" \
        "$CONFIGURAR_DSTAR" "" \
        "$CONFIGURAR_P25" "" \
        "$CONFIGURAR_NXDN" "" \
        "──────────────────────────────────────────────" "" \
        "$CONFIGURAR_PANTALLA" "" \
        "$CONFIGURAR_APRS" "" \
        "$CONFIGURAR_CW" "" \
        "──────────────────────────────────────────────" "" \
        "$SELECCION_SISTEMAS_ACTIVOS" "" \
        "Crosslinks" "" \
        "──────────────────────────────────────────────" "" \
        "$ACTIVAR_ESTE_HOTSPOT" "" \
        "──────────────────────────────────────────────" "" \
        "$VOLVER" "" 2> $tempfileconfigura
    retvalmenu=$?
    menuconfigura=`cat $tempfileconfigura`

#    if [[ $menuconfigura = "$CONFIGURACION_PERSONAL" ]]
#    then
done
}
while [ "$menuhotspot" != "$SALIR_MENU_DVLINK" ]; do
DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG  --backtitle "DVLINK HOTSPOTS v$VERSIONPI" --title "hotspot $ACTIVO" \
        --menu "" 0 0 0 \
        "──────────────────────────────────────────────" "" \
        "$GESTION_HOTSPOT" "" \
        "──────────────────────────────────────────────" "" \
        "$CONFIGURACION_DE_HOTSPOTS" "" \
        "──────────────────────────────────────────────" "" \
        "$MODO_EXPERTO_HOTSPOTS_ACTIVOS" "" \
        "$MODO_EXPERTO_DSTAR" "" \
        "──────────────────────────────────────────────" "" \
        "SySop $sysop" "" \
        "DTMF" "" \
        "──────────────────────────────────────────────" "" \
        "$ESQUEMA" "" \
        "$VER_ACTIVIDAD_HOTSPOT" "" \
        "──────────────────────────────────────────────" "" \
        "$ACTUALIZAR_LISTADO_REFLECTORES" "" \
        "──────────────────────────────────────────────" "" \
        "$SALIR_MENU_DVLINK" "" 2> $tempfile
    retvalmenu=$?
    menuhotspot=`cat $tempfile`
    if [[ $menuhotspot = "$CONFIGURACION_DE_HOTSPOTS" ]]
    then
        CONFIGURA-HOTSPOT
        else if [[ $menuhotspot = "$MODO_EXPERTO_HOTSPOTS_ACTIVOS" ]]
        then
           SELECCION-HOTSPOT-ACTIVOS
           EXPERTO
           else if [[ $menuhotspot = "$GESTION_HOTSPOT" ]]
           then
              GESTIONHOTSPOT
              else if [[ $menuhotspot = "$ESQUEMA" ]]
              then
                  ESQUEMA
                  else if [[ $menuhotspot = "$VER_ACTIVIDAD_HOTSPOT" ]]
                  then
                     VERLOG
                     else if [[ $menuhotspot = "$ACTUALIZAR_LISTADO_REFLECTORES" ]]
                     then
                        ACTUALIZA-REFLECTORES
                        else if [[ $menuhotspot = "$MODO_EXPERTO_DSTAR" ]]
                        then
                             nano /etc/ircddbgateway
                            if dialog --title ""  --yesno "$REINICIAR_IRC" 0 0 ;then
                                systemctl restart ircddbgatewayd.service
                            fi
                            else if [[ $menuhotspot = "DTMF" ]]
                            then
                                DTMF
                                else if [[ $menuhotspot = "SySop $sysop" ]]
                                then
                                    sysop=`dialog --stdout --title "" --inputbox "$ESCRIBE_INDICATIVO SySop" 0 0`
                                    sysop2=$(echo $sysop | tr '[:lower:]' '[:upper:]')
                                    sysop=$sysop2
                                    echo $sysop2 > /etc/sysop.ini
                                fi
                            fi

                        fi
                     fi
                 fi
              fi
          fi
      fi
    fi
done
menuhotspot=""
