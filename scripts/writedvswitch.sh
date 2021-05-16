#!/bin/bash

USER=$(awk 'NR==1' /etc/sslb)
PATHA="/var/log/generador/a.sh"
PATHB="/var/log/generador/bm"
PATHC="/var/log/generador/hblink"
PATHD="/var/log/generador/dmr+"
PATHMMDVM="/var/log/generador/MMDVM_Bridge.ini"
PATHANALOG="/var/log/generador/Analog_Bridge.ini"
PATHDMR="/var/log/generador//dmr.ini"
PATHYSF="/var/log/generador/ysf.ini"
PATHDSTAR="/var/log/generador/dstar.ini"
PATHNXDN="/var/log/generador/nxdn.ini"
PATHP25="/var/log/generador/p25.ini"
#PATHIRCDDBGATEWAY="/var/log/generador/ircddbgateway"
PATHIRCDDBGATEWAY="/etc/ircddbgateway"
PATHBRIDGENXDN="/var/log/generador/NXDNGateway.ini"
PATHBRIDGEP25="/var/log/generador/P25Gateway.ini"
PATHAMBESERVER="/var/log/generador/AMBEserver"
PATHBRIDGEYSF="/var/log/generador/YSFGateway.ini"
PATHDVSWITCH="/var/log/generador/DVSwitch.ini"
PATHDVSM="/var/log/generador/dvsm.macro"
PATHANALOGSH="/var/log/generador/analog_bridge.sh"
PATHABRESTART="/var/log/generador/ab-restart.sh"
source /usr/bin/activo
############ INICIO SQL   #####################################

function SQL(){

indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrid from dvswitch where borrar = '$SELECCIONINDICATIVO';")
red=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT red from dvswitch where borrar = '$SELECCIONINDICATIVO';")
ambe=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ambe from dvswitch where borrar = '$SELECCIONINDICATIVO';")
usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$SELECCIONINDICATIVO';")
reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  reflector from dvswitch where borrar = '$SELECCIONINDICATIVO';")
modulodstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT modulodstar from dvswitch where borrar = '$SELECCIONINDICATIVO';")
#puertoactivo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoactivo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
#passactivo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passactiva from dvswitch where borrar = '$SELECCIONINDICATIVO';")
usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$SELECCIONINDICATIVO';")
#reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  reflector from dvswitch where borrar = '$SELECCIONINDICATIVO';")
ipactiva=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipactiva from dvswitch where borrar = '$SELECCIONINDICATIVO';")
puertoactivo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoactivo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
passactivo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passactiva from dvswitch where borrar = '$SELECCIONINDICATIVO';")
pathmmdvm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT pathmmdvm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
pathanalog=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT pathanalog from dvswitch where borrar = '$SELECCIONINDICATIVO';")
pathmd380=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT pathmd380 from dvswitch where borrar = '$SELECCIONINDICATIVO';")
txdmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  txdmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
rxdmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxdmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
txysf=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txysf from dvswitch where borrar = '$SELECCIONINDICATIVO';")
rxysf=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxysf from dvswitch where borrar = '$SELECCIONINDICATIVO';")
emuport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  380port from dvswitch where borrar = '$SELECCIONINDICATIVO';")
sufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT sufijo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
tipousuario=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tipousuario from dvswitch where borrar = '$SELECCIONINDICATIVO';")

iphb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT iphb from dvswitch where borrar = '$SELECCIONINDICATIVO';")
puertohb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertohb from dvswitch where borrar = '$SELECCIONINDICATIVO';")
passwordhb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passwordhb from dvswitch where borrar = '$SELECCIONINDICATIVO';")

ipdmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipdmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
puertodmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertodmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
passworddmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passworddmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")

ipbm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipbm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
puertobm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertobm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
passwordbm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passwordbm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
nxdnid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnid from dvswitch where borrar = '$SELECCIONINDICATIVO';")
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstar from dvswitch where borrar = '$SELECCIONINDICATIVO';")
dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25 from dvswitch where borrar = '$SELECCIONINDICATIVO';")
nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdn from dvswitch where borrar = '$SELECCIONINDICATIVO';")
fusion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusion from dvswitch where borrar = '$SELECCIONINDICATIVO';")
 rxfreq=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxfreq from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   txfreq=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txfreq from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   power=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT power from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   latitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  latitude from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   longitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT longitude from dvswitch where borrar  = '$SELECCIONINDICATIVO';")
   height=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT height from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   location=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT location from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   description=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT description from dvswitch where borrar  = '$SELECCIONINDICATIVO';")
   url=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT url from dvswitch where borrar = '$SELECCIONINDICATIVO';")
talkeralias=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT idiomanxdnp25 from dvswitch where borrar = '$SELECCIONINDICATIVO';")
txwideport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgfijo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
}

############  FIN  SQL  #########################################


################################################################################################333


##############  INICIO  MMDVMBRIDGE.INI   #######################

function MMDVMBRIDGE(){

# rm /home/$USER/mmdvmbridge.gen
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[General]" >> $PATHMMDVM
###########################################################
echo "Callsign=$indicativo" >> $PATHMMDVM
if [[ $tipousuario = "PRIMARIO" ]]
then
    echo "Id=$dmrid$sufijo" >> $PATHMMDVM
else
     existe=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM dvswitch where dmrid = '$dmrid';")
     if [[ $existe > 1 ]]
     then
         echo "Id=$dmrid$sufijo" >> $PATHMMDVM
     else
        echo "Id=$dmrid$sufijo" >> $PATHMMDVM
     fi
fi
############################################################
echo "Timeout=180" >> $PATHMMDVM
echo "Duplex=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[Info]" >> $PATHMMDVM
echo "RXFrequency=$rxfreq" >> $PATHMMDVM
echo "TXFrequency=$txfreq" >> $PATHMMDVM
echo "Power=$power" >> $PATHMMDVM
echo ""
echo "Latitude=$latitude" >> $PATHMMDVM
echo "Longitude=$longitude" >> $PATHMMDVM
echo "Height=$height" >> $PATHMMDVM
echo "Location=$location" >> $PATHMMDVM
echo "Description=$description" >> $PATHMMDVM
echo "URL=$url" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[Log]" >> $PATHMMDVM
echo "# Logging levels, 0=No logging, 1=Debug, 2=Message, 3=Info, 4=Warning, 5=Error, 6=Fatal" >> $PATHMMDVM
echo "DisplayLevel=1" >> $PATHMMDVM
echo "FileLevel=1" >> $PATHMMDVM
echo "FilePath=/var/log/dvswitch/$sufijo/" >> $PATHMMDVM
echo "FileRoot=MMDVM_Bridge-$sufijo" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[DMR Id Lookup]" >> $PATHMMDVM
echo "File=/var/lib/mmdvm/DMRIds.dat" >> $PATHMMDVM
echo "Time=24" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[NXDN Id Lookup]" >> $PATHMMDVM
echo "File=/var/lib/mmdvm/NXDN.csv" >> $PATHMMDVM
echo "Time=24" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[Modem]" >> $PATHMMDVM
echo "Port=/dev/null" >> $PATHMMDVM
echo "RSSIMappingFile=RSSI.dat" >> $PATHMMDVM
echo "Trace=0" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[D-Star]" >> $PATHMMDVM
if [[ $tipousuario = "PRIMARIO" ]]
then
    if [[ $dstar = 0 ]]
    then
        echo "Enable=0" >> $PATHMMDVM
    else
        echo "Enable=1" >> $PATHMMDVM
    fi
else
    echo "Enable=0" >> $PATHMMDVM
fi
###############################################################################################################################################################
modulo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT repeaterband from hot_IRC where nombre = 'PRIMARIONOBORRAR';")
###############################################################################################################################################################
echo "Module=$modulo" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[DMR]" >> $PATHMMDVM
if [[ $dmr = 0 ]]
then
    echo "Enable=0" >> $PATHMMDVM
else
    echo "Enable=1" >> $PATHMMDVM
fi
echo "ColorCode=1" >> $PATHMMDVM
echo "EmbeddedLCOnly=1" >> $PATHMMDVM
echo "DumpTAData=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[System Fusion]" >> $PATHMMDVM

if [[ $fusion = 0 ]]
then
    echo "Enable=0" >> $PATHMMDVM
else
    echo "Enable=1" >> $PATHMMDVM
fi

echo "" >> $PATHMMDVM
echo "[P25]" >> $PATHMMDVM
if [[ $tipousuario = "PRIMARIO" ]]
then
    if [[ $p25 = 0 ]]
    then
       echo "Enable=0" >> $PATHMMDVM
    else
       echo "Enable=1" >> $PATHMMDVM
    fi
else
    echo "Enable=0" >> $PATHMMDVM
fi
echo "NAC=293" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[NXDN]" >> $PATHMMDVM
if [[ $tipousuario = "PRIMARIO" ]]
then
    if [[ $nxdn = 0 ]]
    then
       echo "Enable=0" >> $PATHMMDVM
    else
       echo "Enable=1" >> $PATHMMDVM
    fi
else
    echo "Enable=0" >> $PATHMMDVM
fi
echo "RAN=1" >> $PATHMMDVM
####################################################################################################################################################
#dim=${dmrid%?????}
#dim2=${dmrid#$dim}
echo "id=$nxdnid" >> $PATHMMDVM
#################################################################################################################################################
echo "" >> $PATHMMDVM
echo "[D-Star Network]" >> $PATHMMDVM
if [[ $tipousuario = "PRIMARIO" ]]
then
    if [[ $dstar = 0 ]]
    then
       echo "Enable=0" >> $PATHMMDVM
    else
       echo "Enable=1" >> $PATHMMDVM
    fi
else
    echo "Enable=0" >> $PATHMMDVM
fi
echo "GatewayAddress=127.0.0.1" >> $PATHMMDVM
echo "GatewayPort=20010" >> $PATHMMDVM
echo "LocalPort=20011" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM

echo "[DMR Network]" >> $PATHMMDVM

if [[ $dmr = 0 ]]
then
    echo "Enable=0" >> $PATHMMDVM
else
    echo "Enable=1" >> $PATHMMDVM
fi

echo "" >> $PATHMMDVM
######################33################################################33
echo "Address=$ipactiva" >> $PATHMMDVM
echo "Port=$puertoactivo" >> $PATHMMDVM
echo "Jitter=360" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "Password=$passactivo" >> $PATHMMDVM
if [[ $red = "DMR+" ]]
then
    echo "Options=StartRef=$reflector;RelinkTime=30;Userlink=1;TS2_1=214;" >> $PATHMMDVM
else
   echo "#Options=" >> $PATHMMDVM
fi
############################################################################
echo "" >> $PATHMMDVM
echo "Slot1=0" >> $PATHMMDVM
echo "Slot2=1" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[System Fusion Network]" >> $PATHMMDVM
if [[ $fusion = 0 ]]
then
   echo "Enable=0" >> $PATHMMDVM
else
   echo "Enable=1" >> $PATHMMDVM
fi
echo "LocalAddress=0" >> $PATHMMDVM
if [[ $tipousuario = "PRIMARIO" ]]
then
    echo "LocalPort=3500" >> $PATHMMDVM
else
   FUSIONOK=`expr $sufijo + 3500`
   echo "LocalPort=$FUSIONOK" >> $PATHMMDVM
fi

echo "GatewayAddress=127.0.0.1" >> $PATHMMDVM
echo "GatewayPort=42105" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[P25 Network]" >> $PATHMMDVM
if [[ $tipousuario = "PRIMARIO" ]]
then
   if [[ $p25 = 0 ]]
    then
       echo "Enable=0" >> $PATHMMDVM
    else
       echo "Enable=1" >> $PATHMMDVM
    fi
else
    echo "Enable=0" >> $PATHMMDVM
fi
echo "GatewayAddress=127.0.0.1" >> $PATHMMDVM
echo "GatewayPort=42020" >> $PATHMMDVM
echo "LocalPort=32010" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[NXDN Network]" >> $PATHMMDVM
if [[ $tipousuario = "PRIMARIO" ]]
then
    if [[ $nxdn = 0 ]]
    then
       echo "Enable=0" >> $PATHMMDVM
    else
       echo "Enable=1" >> $PATHMMDVM
    fi
else
    echo "Enable=0" >> $PATHMMDVM
fi
echo "#LocalAddress=127.0.0.1" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "LocalPort=14021" >> $PATHMMDVM
echo "GatewayAddress=127.0.0.1" >> $PATHMMDVM
echo "GatewayPort=14020" >> $PATHMMDVM

}
##############   FIN MMDVMBRIDGE.INI   ##########################

####################################################################################3

##############   INICIO ANALOG_BRIDGE.INI   ########################

function ANALOGBRIDGE(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHANALOG
echo "" >> $PATHANALOG
echo "include = dvsm.macro" >> $PATHANALOG
#echo "include = asl.macro" >> $PATHANALOG
echo ""  >> $PATHANALOG
echo "[GENERAL]" >> $PATHANALOG
echo "logLevel = 1" >> $PATHANALOG
echo "#FilePath=/var/log/dvswitch/$sufijo" >> $PATHANALOG
echo "#FileRoot=Analog_Bridge-$indicativo$sufijo" >> $PATHANALOG
echo "" >> $PATHANALOG
echo "subscriberFile = /var/lib/dvswitch/subscriber_ids.csv" >> $PATHANALOG
echo "exportMetadata = true" >> $PATHANALOG
echo "transferRootDir = /tmp" >> $PATHANALOG
echo "" >> $PATHANALOG
echo "decoderFallBack = true" >> $PATHANALOG
echo "useEmulator = true" >> $PATHANALOG
echo "emulatorAddress = 127.0.0.1:$emuport" >> $PATHANALOG
echo "" >> $PATHANALOG
#echo "mute = OFF" >> $PATHANALOG
echo "pcmPort = 22$sufijo"  >> $PATHANALOG
echo "" >> $PATHANALOG   >> $PATHANALOG
echo "[AMBE_AUDIO]" >> $PATHANALOG
############################################################################################################################
if [[ $ambe = "EMULADO" ]]
then
   echo "address = 127.0.0.1" >> $PATHANALOG
   echo "txPort = $rxdmr" >> $PATHANALOG
   echo "rxPort = $txdmr" >> $PATHANALOG
   echo "ambeMode = DMR" >> $PATHANALOG
   echo "minTxTimeMS = 2500" >> $PATHANALOG
   echo "gatewayDmrId =$dmrid" >> $PATHANALOG
   echo "repeaterID =$dmrid$sufijo" >> $PATHANALOG
   echo "txTg = 9" >> $PATHANALOG
   echo "txTs = 2" >> $PATHANALOG
   echo "colorCode = 1" >> $PATHANALOG
else
   echo "address = 127.0.0.1" >> $PATHANALOG
   echo "txPort = $rxdmr" >> $PATHANALOG
   echo "rxPort = $txdmr" >> $PATHANALOG
   echo "ambeMode = DMR" >> $PATHANALOG
   echo "minTxTimeMS = 2500" >> $PATHANALOG
   echo "gatewayDmrId =$dmrid" >> $PATHANALOG
   echo "repeaterID =$dmrid$sufijo" >> $PATHANALOG
   echo "txTg = 9" >> $PATHANALOG
   echo "txTs = 2" >> $PATHANALOG
   echo "colorCode = 1" >> $PATHANALOG
fi
echo "" >> $PATHANALOG
echo "[USRP]" >> $PATHANALOG
echo "address = 169.254.42.42" >> $PATHANALOG
echo "txPort = $usrp" >> $PATHANALOG
echo "rxPort = $usrp" >> $PATHANALOG
echo "usrpAudio = AUDIO_USE_GAIN" >> $PATHANALOG
echo "usrpGain = 6" >> $PATHANALOG
echo "usrpAgc = -20,10,100                    ; Set the agc threshold (db), slope (db) and decay (ms)" >> $PATHANALOG
echo "tlvAudio = AUDIO_USE_GAIN" >> $PATHANALOG
echo "tlvGain = 0.25" >> $PATHANALOG
echo "" >> $PATHANALOG
#######################################################################################################################################
echo "[DV3000]" >> $PATHANALOG
if [[ $ambe = "EMULADO" ]]
then
   echo ";address = 127.0.0.1 " >> $PATHANALOG
   echo ";rxPort = 2471 " >> $PATHANALOG
   echo ";serial = false " >> $PATHANALOG
   echo ";baud = 460800"  >> $PATHANALOG
   echo ";address = /dev/ttyUSB0" >> $PATHANALOG
else
   echo "address = 127.0.0.1 " >> $PATHANALOG
   echo "rxPort = 2471 " >> $PATHANALOG
   echo "serial = false " >> $PATHANALOG

   if [[ $ambe = "460800" ]]
   then
       echo ";baud = 460800"  >> $PATHANALOG
       echo ";address = /dev/ttyUSB0" >> $PATHANALOG
   else
       echo ";baud = 230400"  >> $PATHANALOG
       echo ";address = /dev/ttyUSB0" >> $PATHANALOG

   fi
fi
#############################################################################################################################
#echo "; address = /dev/ttyUSB0" >> $PATHANALOG



}

##############   FIN ANALOG_BRIDGE.INI   ########################

###########################################################################################

##############   INICIO SCRIPTS DE CAMBIO DE RED     #####################################

function NEWSCRIPTSABC(){

if [[ $SELECCIONINDICATIVO = "" ]]
then
   echo "seleccion usuario es cadena vacia"
   IND=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where tipousuario = 'PRIMARIO';")
   SUF=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT sufijo from dvswitch where tipousuario = 'PRIMARIO';")
   dato=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT borrar from dvswitch where tipousuario = 'PRIMARIO';")
else
   dato="$indicativo&$sufijo"
fi
c="$"
f="1"
x="$c$f"
d='"'
k="$d$dato$d"
l="0"
m="$d$l$d"
n="BM"
o="$d$n$d"
echo "#!/bin/bash" > $PATHB
echo "echo $k > /var/log/change" >> $PATHB
echo "echo $m >> /var/log/change" >> $PATHB
echo "echo $o >> /var/log/change" >> $PATHB
p="HBLINK"
q="$d$p$d"
echo "#!/bin/bash" > $PATHC
echo "echo $k > /var/log/change" >> $PATHC
echo "echo $m >> /var/log/change" >> $PATHC
echo "echo $q >> /var/log/change" >> $PATHC
r="DMR+"
s="$d$r$d"
echo "#!/bin/bash" > $PATHD
echo "echo $k > /var/log/change" >> $PATHD
echo "echo $x >> /var/log/change" >> $PATHD
echo "echo $s >> /var/log/change" >> $PATHD

}
function SCRIPTSABCD(){
#CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCc


c='"'
if [[ $SELECCIONINDICATIVO = "" ]]
then
   echo "seleccion usuario es cadena vacia"
   IND=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where tipousuario = 'PRIMARIO';")
   SUF=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT sufijo from dvswitch where tipousuario = 'PRIMARIO';")
   dato=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT borrar from dvswitch where tipousuario = 'PRIMARIO';")
   #echo "dato=$c$dato$c" >> $PATHC
else
   dato="$indicativo&$sufijo" 
fi 
   c="'"
   d='"' 
   echo "#!/bin/bash" > $PATHC
   echo 'iphb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT iphb from dvswitch where borrar = '$c''$dato''$c';")' >> $PATHC
   echo 'puertohb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertohb from dvswitch where borrar = '$c''$dato''$c';")' >> $PATHC
   echo 'passwordhb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passwordhb from dvswitch where borrar = '$c''$dato''$c';")' >> $PATHC
   d="'"
   e='"'
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$c'$iphb'$c' where borrar = '$c''$dato''$c'";' >> $PATHC
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$c'$puertohb'$c' where borrar = '$c''$dato''$c'";' >> $PATHC
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$c'$passwordhb'$c' where borrar = '$c''$dato''$c'";' >> $PATHC
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = '$d''HBLINK''$d' where borrar = '$c''$dato''$c'";' >> $PATHC
   echo " /etc/scripts/writedvswitch.sh SCRIPTS $e$dato$e"  >> $PATHC
#BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB

   echo "#!/bin/bash" > $PATHB
   echo 'iphb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipbm from dvswitch where borrar = '$c''$dato''$c';")' >> $PATHB
   echo 'puertohb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertobm from dvswitch where borrar = '$c''$dato''$c';")' >> $PATHB
   echo 'passwordhb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passwordbm from dvswitch where borrar = '$c''$dato''$c';")' >> $PATHB
   d="'"
   e='"'
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$c'$iphb'$c' where borrar = '$c''$dato''$c'";' >> $PATHB
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$c'$puertohb'$c' where borrar = '$c''$dato''$c'";' >> $PATHB
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$c'$passwordhb'$c' where borrar = '$c''$dato''$c'";' >> $PATHB
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = '$d''BM''$d' where borrar = '$c''$dato''$c'";' >> $PATHB

   echo " /etc/scripts/writedvswitch.sh SCRIPTS $e$dato$e"  >> $PATHB
#BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
#DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

   echo "#!/bin/bash" > $PATHD
   echo 'iphb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipdmr from dvswitch where borrar = '$c''$dato''$c';")' >> $PATHD
   echo 'puertohb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertodmr from dvswitch where borrar = '$c''$dato''$c';")' >> $PATHD
   echo 'passwordhb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passworddmr from dvswitch where borrar = '$c''$dato''$c';")' >> $PATHD
   d="'"
   e='"'
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$c'$iphb'$c' where borrar = '$c''$dato''$c'";' >> $PATHD
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$c'$puertohb'$c' where borrar = '$c''$dato''$c'";' >> $PATHD
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$c'$passwordhb'$c' where borrar = '$c''$dato''$c'";' >> $PATHD
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET reflector = '$c'$1'$c' where borrar = '$c''$dato''$c'";' >> $PATHD
   echo ' mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = '$d''DMR+''$d' where borrar = '$c''$dato''$c'";' >> $PATHD
   echo " /etc/scripts/writedvswitch.sh SCRIPTS $e$dato$e"  >> $PATHD
#DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD



}

#################   FIN SCRIPTS DE CAMBIO DE RED

###############################################################################################################################################

###############   INICIO DMR.INI     ##########################333

function DMR(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHDMR
echo "" >> $PATHDMR
echo "; DMR.ini " >> $PATHDMR
echo "" >> $PATHDMR
echo "; Analog_Bridge configuration file. " >> $PATHDMR
echo ";   This file should be placed in either /etc or it can be " >> $PATHDMR
echo ";   supplied as a path on the Analog_Bridge command line. " >> $PATHDMR
echo " " >> $PATHDMR
echo "; The best way to think of this file is that there are two main sections, the USRP (analog audio) and " >> $PATHDMR
echo "; AMBE_AUDIO (compressed audio).  Analog_Bridge will take everything sent to the USRP port and " >> $PATHDMR
echo "; encode it for transmission on the AMBE_AUDIO port.  The encoder will use the format defined in ambeMode. " >> $PATHDMR
echo "; As you might expect, the reverse direction is defined too. " >> $PATHDMR
echo " " >> $PATHDMR
echo "include = dvsm.ini " >> $PATHDMR
echo "include = asl.ini " >> $PATHDMR
echo " " >> $PATHDMR
echo "; General Section describes settings for Analog_Bridge itself. " >> $PATHDMR
echo "[GENERAL] " >> $PATHDMR
echo "logLevel = 1                            ; Show messages and above 0=No logging, 1=Debug, 2=Message, 3=Info, 4=Warning, 5=Error, 6=Fatal " >> $PATHDMR
echo " " >> $PATHDMR
echo "; Metadata management " >> $PATHDMR
echo "subscriberFile = /var/lib/dvswitch/subscriber_ids.csv   ; DMR ID to callsign lookup data " >> $PATHDMR
echo "exportMetadata = true                                     ; Export metadata to USRP partner (transcode setups require this) " >> $PATHDMR
echo " " >> $PATHDMR
echo "; General vocoder setup information " >> $PATHDMR
echo "decoderFallBack = true                  ; Allow software AMBE decoding if a hardware decoder is not found " >> $PATHDMR
echo "useEmulator = true                     ; Use the MD380 AMBE emulator for AMBE72 (DMR/YSFN/NXDN) " >> $PATHDMR
echo "emulatorAddress = 127.0.0.1:$emuport        ; IP address and port of the md380 server " >> $PATHDMR
echo " " >> $PATHDMR
echo "mute = OFF                        ; OFF, USRP, TLV, BOTH (Do not export to) (Mute the interface) " >> $PATHDMR
echo " " >> $PATHDMR
echo "; Information for xx_Bridge (Where xx is MMDVM, Quantar, HB, IPSC) " >> $PATHDMR
echo "[AMBE_AUDIO] " >> $PATHDMR
echo " " >> $PATHDMR
echo "; DMR " >> $PATHDMR
echo "ambeMode = DMR                  ; DMR, DMR_IPSC, DSTAR, NXDN, P25, YSFN, YSFW " >> $PATHDMR

echo "address = 127.0.0.1 " >> $PATHDMR
echo "RXPort = $txdmr                  ; Port to send AMBE TLV frames to (export) " >> $PATHDMR
echo "TXPort = $rxdmr                  ; Port to listen on (import) " >> $PATHDMR
echo "minTxTimeMS = 2000              ; Minimum time in MS for hang delay (0-10000) " >> $PATHDMR
#############################################################################################################################################################
echo "gatewayDmrId =$dmrid " >> $PATHDMR
echo "repeaterID =$dmrid$sufijo" >> $PATHDMR
#############################################################################################################################################################
echo "txTg = 9                        ; TG to use for all frames sent from Analog_Bridge -> xx_Bridge " >> $PATHDMR
echo "txTs = 2                        ; Slot to use for frames sent from Analog_Bridge -> xx_Bridge " >> $PATHDMR
echo "colorCode = 1                   ; Color Code to assign DMR frames " >> $PATHDMR
echo " " >> $PATHDMR
echo "; Information for USRP channel driver.  This interface uses PCM to transfer audio information " >> $PATHDMR
echo "; There are two typical configurations, ASL and Transcode.  ASL (AllstarLink) is for analog clients connected " >> $PATHDMR
echo "; to a digital network.  Transcode is when Analog_Bridge actually points its PCM interfaces back at itself,  " >> $PATHDMR
echo "; causing a TLV <-- (pcm <--> pcm) --> TLV type of architecture. " >> $PATHDMR
echo ";   When using ASL, this matches the rpt.conf ASL file with a setting like: " >> $PATHDMR
echo ";   rxchannel = usrp/127.0.0.1:34001:32001 " >> $PATHDMR
echo ";   When Transcoding, make two ini files and set txPort equal to the other instance rxPort (crossover).  Launch " >> $PATHDMR
echo ";   each instance with its own ini file. " >> $PATHDMR
echo "[USRP] " >> $PATHDMR
echo "address = 169.254.42.42                 ; IP address of USRP partner (Allstar/Asterisk or another Analog_Bridge) " >> $PATHDMR
echo "txPort = $usrp                          ; Transmit USRP frames on this port " >> $PATHDMR
echo "rxPort = $usrp                          ; Listen for USRP frames on this port " >> $PATHDMR
echo "aslAudio = AUDIO_USE_GAIN               ; Audio to ASL (AUDIO_UNITY, AUDIO_USE_AGC, AUDIO_USE_GAIN) " >> $PATHDMR
echo "agcGain = 6                             ; Gain (in db) of the AGC filter " >> $PATHDMR
echo "dmrAudio = AUDIO_USE_BPF                ; Audio from ASL (AUDIO_UNITY, AUDIO_USE_GAIN, AUDIO_BPF) " >> $PATHDMR
echo "dmrGain = 0.50                          ; Gain factor of audio from ASL (0.0-1.0) " >> $PATHDMR
echo " " >> $PATHDMR
echo "[MACROS] " >> $PATHDMR
echo " " >> $PATHDMR
echo "; Where the macros are " >> $PATHDMR
echo "; xxxx = yyyy " >> $PATHDMR
echo "; xxxx is the dial string to match " >> $PATHDMR
echo "; yyyy is the command line to execute " >> $PATHDMR
echo " " >> $PATHDMR
echo "; xxxx must be preceded by a * when dialed by client " >> $PATHDMR
echo "; xxxx can be any string (alphanumeric) " >> $PATHDMR
echo "; yyyy is the command to execute " >> $PATHDMR
echo "; yyyy will replace xxxx in the dial string " >> $PATHDMR
echo "; arguments follow the macro name with a # delimiter " >> $PATHDMR
echo "; the argument will be appended (with a space) to the command executed by the macro " >> $PATHDMR
echo " " >> $PATHDMR
echo "; For example using macro "5678" above would look like: " >> $PATHDMR
echo " " >> $PATHDMR
echo "; 5678 = echo " >> $PATHDMR
echo " " >> $PATHDMR
echo "; *5678#9876 in the Dial String on the client " >> $PATHDMR
echo " " >> $PATHDMR
echo "; Which would invoke: " >> $PATHDMR
echo "; echo 9876 " >> $PATHDMR
echo " " >> $PATHDMR
echo "; Information for DV3000 hardware decoder " >> $PATHDMR
echo ";   There are two configuration modes: IP (AMBEServer) and serial (direct connect hardware) " >> $PATHDMR
echo ";   Use top server and port if using AMBEServer " >> $PATHDMR
echo ";   Use bottom server/port and serial = true if using the DV3000u (thumbdv) " >> $PATHDMR
echo ";   Did you run AMBETest4.py before using this? " >> $PATHDMR
echo " " >> $PATHDMR

echo "[DV3000] " >> $PATHDMR
####################################################################################################################33333
if [[ $ambe = "EMULADO" ]]
then
   echo ";address = 127.0.0.1 " >> $PATHDMR
   echo ";rxPort = 2471 " >> $PATHDMR
   echo ";serial = false " >> $PATHDMR
else
   echo "address = 127.0.0.1 " >> $PATHDMR
   echo "rxPort = 2471 " >> $PATHDMR
   echo "serial = false " >> $PATHDMR

   if [[ $ambe = "460800" ]]
   then
       echo ";baud = 460800"  >> $PATHDMR
   else
       echo ";baud = 230400"  >> $PATHDMR
   fi
fi
#############################################################################################################################
echo "; address = /dev/ttyUSB0" >> $PATHDMR
echo " " >> $PATHDMR


}

#################   FIN  DMR.INI     ###########################

################################################################################################

################   INICIO YSF.INI     ###############################
 
function YSF(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHYSF
echo "" >> $PATHYSF
echo "; ysf.ini " >> $PATHYSF
echo "; Analog_Bridge configuration file. " >> $PATHYSF
echo ";   This file should be placed in either /etc or it can be " >> $PATHYSF
echo ";   supplied as a path on the Analog_Bridge command line. " >> $PATHYSF
echo " " >> $PATHYSF
echo "; The best way to think of this file is that there are two main sections, the USRP (analog audio) and " >> $PATHYSF
echo "; AMBE_AUDIO (compressed audio).  Analog_Bridge will take everything sent to the USRP port and " >> $PATHYSF
echo "; encode it for transmission on the AMBE_AUDIO port.  The encoder will use the format defined in ambeMode. " >> $PATHYSF
echo "; As you might expect, the reverse direction is defined too. " >> $PATHYSF
echo " " >> $PATHYSF
echo "include =  dvsm.ini " >> $PATHYSF
echo " " >> $PATHYSF
echo "; General Section describes settings for Analog_Bridge itself. " >> $PATHYSF
echo "[GENERAL] " >> $PATHYSF
echo "logLevel = 1                            ; Show messages and above 0=No logging, 1=Debug, 2=Message, 3=Info, 4=Warning, 5=Error, 6=Fatal " >> $PATHYSF
echo " " >> $PATHYSF
echo "; Metadata management " >> $PATHYSF
echo "subscriberFile = /var/lib/dvswitch/subscriber_ids.csv   ; DMR ID to callsign lookup data " >> $PATHYSF
echo "exportMetadata = true                                     ; Export metadata to USRP partner (transcode setups require this) " >> $PATHYSF
echo " " >> $PATHYSF
echo "; General vocoder setup information " >> $PATHYSF
echo "decoderFallBack = true                  ; Allow software AMBE decoding if a hardware decoder is not found " >> $PATHYSF
echo "useEmulator = true                     ; Use the MD380 AMBE emulator for AMBE72 (DMR/YSFN/NXDN) " >> $PATHYSF
echo "emulatorAddress = 127.0.0.1:$emuport        ; IP address and port of the md380 server " >> $PATHYSF
echo " " >> $PATHYSF
echo "mute = OFF                        ; OFF, USRP, TLV, BOTH (Do not export to) (Mute the interface) " >> $PATHYSF
echo " " >> $PATHYSF
echo "; Information for xx_Bridge (Where xx is MMDVM, Quantar, HB, IPSC) " >> $PATHYSF
echo "[AMBE_AUDIO] " >> $PATHYSF
echo " " >> $PATHYSF
echo "; YSF " >> $PATHYSF
echo "ambeMode = YSFN                 ; DMR, DMR_IPSC, DSTAR, NXDN, P25, YSFN, YSFW " >> $PATHYSF
echo "address = 127.0.0.1 " >> $PATHYSF
echo "RXPort = $txysf                  ; Port to send AMBE TLV frames to (export) " >> $PATHYSF
echo "TXPort = $rxysf                 ; Port to listen on (import) " >> $PATHYSF
echo "minTxTimeMS = 2000              ; Minimum time in MS for hang delay (0-10000) " >> $PATHYSF
##############################################################################################################################################################
echo "gatewayDmrId =$dmrid " >> $PATHYSF
echo "repeaterID =$dmrid$sufijo" >> $PATHYSF
#############################################################################################################################################################
echo "txTg = 3166                     ; TG to use for all frames sent from Analog_Bridge -> xx_Bridge " >> $PATHYSF
echo "txTs = 2                        ; Slot to use for frames sent from Analog_Bridge -> xx_Bridge " >> $PATHYSF
echo "colorCode = 1                   ; Color Code to assign DMR frames " >> $PATHYSF
echo ";; FallbackID = 1234567           ; In case we can not find a valid DMR id in the database, export this one " >> $PATHYSF
echo ";; ExportTG = 1234                ; Which TG to export " >> $PATHYSF
echo " " >> $PATHYSF
echo "; Information for USRP channel driver.  This interface uses PCM to transfer audio information " >> $PATHYSF
echo "; There are two typical configurations, ASL and Transcode.  ASL (AllstarLink) is for analog clients connected " >> $PATHYSF
echo "; to a digital network.  Transcode is when Analog_Bridge actually points its PCM interfaces back at itself,  " >> $PATHYSF
echo "; causing a TLV <-- (pcm <--> pcm) --> TLV type of architecture. " >> $PATHYSF
echo ";   When using ASL, this matches the rpt.conf ASL file with a setting like: " >> $PATHYSF
echo ";   rxchannel = usrp/127.0.0.1:34001:32001 " >> $PATHYSF
echo ";   When Transcoding, make two ini files and set txPort equal to the other instance rxPort (crossover).  Launch " >> $PATHYSF
echo ";   each instance with its own ini file. " >> $PATHYSF
echo "[USRP] " >> $PATHYSF
echo "address = 169.254.42.42                 ; IP address of USRP partner (Allstar/Asterisk or another Analog_Bridge) " >> $PATHYSF
echo "txPort = $usrp               ; Transmit USRP frames on this port " >> $PATHYSF
echo "rxPort = $usrp                          ; Listen for USRP frames on this port " >> $PATHYSF
echo "aslAudio = AUDIO_USE_GAIN               ; Audio to ASL (AUDIO_UNITY, AUDIO_USE_AGC, AUDIO_USE_GAIN) " >> $PATHYSF
echo "agcGain = 6                             ; Gain (in db) of the AGC filter " >> $PATHYSF
echo "dmrAudio = AUDIO_USE_GAIN               ; Audio from ASL (AUDIO_UNITY, AUDIO_USE_GAIN, AUDIO_BPF) " >> $PATHYSF
echo "dmrGain = 0.50                          ; Gain factor of audio from ASL (0.0-1.0) " >> $PATHYSF
echo " " >> $PATHYSF
echo "[MACROS] " >> $PATHYSF
echo " " >> $PATHYSF
echo "; Where the macros are " >> $PATHYSF
echo "; xxxx=yyyy " >> $PATHYSF
echo "; xxxx is the dial string to match " >> $PATHYSF
echo "; yyyy is the command line to execute " >> $PATHYSF
echo " " >> $PATHYSF
echo "; xxxx must be preceded by a * " >> $PATHYSF
echo "; xxxx can be any string (alphanumeric) " >> $PATHYSF
echo "; yyyy is the command to execute " >> $PATHYSF
echo "; yyyy will replace xxxx in the dial string " >> $PATHYSF
echo "; arguments follow the macro name with a # delimiter " >> $PATHYSF
echo " " >> $PATHYSF
echo "; For example using macro "5678" above would look like: " >> $PATHYSF
echo "; *5678#9876 " >> $PATHYSF
echo " " >> $PATHYSF
echo "; Which would invoke: " >> $PATHYSF
echo "; echo 9876 " >> $PATHYSF
echo " " >> $PATHYSF
echo "; disconnect  " >> $PATHYSF
echo " " >> $PATHYSF
echo "; Mode off " >> $PATHYSF
echo "73 = /usr/local/sbin/tune.sh tune ysf "disconnect" " >> $PATHYSF
echo " " >> $PATHYSF
echo "; mode local " >> $PATHYSF
echo "74 = /usr/local/sbin/tune.sh tune ysf "disconnect" " >> $PATHYSF
echo " " >> $PATHYSF
echo "; North America " >> $PATHYSF
echo "76 = /usr/local/sbin/tune.sh tune ysf "dvswitch.org:42000" " >> $PATHYSF
echo " " >> $PATHYSF
echo "# Parrot Connect " >> $PATHYSF
echo "342565 = /usr/local/sbin/tune.sh tune ysf "127.0.0.1:42012" " >> $PATHYSF
echo " " >> $PATHYSF
echo "# Parrot Disconnect " >> $PATHYSF
echo "142565 = /usr/local/sbin/tune.sh tune ysf "disconnect" " >> $PATHYSF
echo " " >> $PATHYSF
echo "; Information for DV3000 hardware decoder " >> $PATHYSF
echo ";   There are two configuration modes: IP (AMBEServer) and serial (direct connect hardware) " >> $PATHYSF
echo ";   Use top server and port if using AMBEServer " >> $PATHYSF
echo ";   Use bottom server/port and serial = true if using the DV3000u (thumbdv) " >> $PATHYSF
echo ";   Did you run AMBETest4.py before using this? " >> $PATHYSF
echo "[DV3000] " >> $PATHYSF
#####################################################################################################################
if [[ $ambe = "EMULADO" ]]
then
   echo ";address = 127.0.0.1 " >> $PATHYSF
   echo ";rxPort = 2471 " >> $PATHYSF
   echo ";serial = false " >> $PATHYSF
else
   echo "address = 127.0.0.1 " >> $PATHYSF
   echo "rxPort = 2471 " >> $PATHYSF
   echo "serial = false " >> $PATHYSF 

   if [[ $ambe = "460800" ]]
   then
       echo ";baud = 460800"  >> $PATHYSF
   else
       echo ";baud = 230400"  >> $PATHYSF
   fi
fi
#############################################################################################################################
echo "; address = /dev/ttyUSB0" >> $PATHYSF
echo " " >> $PATHYSF

echo " " >> $PATHYSF



}

###############    FIN  YSF.INI     ##############################33333

#################################################################################################3

##################   INICIO DSTAR.INI    ###############################

function DSTAR(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHDSTAR
echo "" >> $PATHDSTAR
echo "; dstar.ini " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; Analog_Bridge configuration file. " >> $PATHDSTAR
echo ";   This file should be placed in either /etc or it can be " >> $PATHDSTAR
echo ";   supplied as a path on the Analog_Bridge command line. " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; The best way to think of this file is that there are two main sections, the USRP (analog audio) and " >> $PATHDSTAR
echo "; AMBE_AUDIO (compressed audio).  Analog_Bridge will take everything sent to the USRP port and " >> $PATHDSTAR
echo "; encode it for transmission on the AMBE_AUDIO port.  The encoder will use the format defined in ambeMode. " >> $PATHDSTAR
echo "; As you might expect, the reverse direction is defined too. " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "include = dvsm.ini " >> $PATHDSTAR
echo "include = asl.ini " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; General Section describes settings for Analog_Bridge itself. " >> $PATHDSTAR
echo "[GENERAL] " >> $PATHDSTAR
echo "logLevel = 1                            ; Show messages and above 0=No logging, 1=Debug, 2=Message, 3=Info, 4=Warning, 5=Error, 6=Fatal " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; Metadata management " >> $PATHDSTAR
echo "subscriberFile = /var/lib/dvswitch/subscriber_ids.csv   ; DMR ID to callsign lookup data " >> $PATHDSTAR
echo "exportMetadata = true                                     ; Export metadata to USRP partner (transcode setups require this) " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; General vocoder setup information " >> $PATHDSTAR
echo "decoderFallBack = true                  ; Allow software AMBE decoding if a hardware decoder is not found " >> $PATHDSTAR
echo "useEmulator = true                     ; Use the MD380 AMBE emulator for AMBE72 (DMR/YSFN/NXDN) " >> $PATHDSTAR
echo "emulatorAddress = 127.0.0.1:$emuport        ; IP address and port of the md380 server " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "mute = OFF                        ; OFF, USRP, TLV, BOTH (Do not export to) (Mute the interface) " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; Information for xx_Bridge (Where xx is MMDVM, Quantar, HB, IPSC) " >> $PATHDSTAR
echo "[AMBE_AUDIO] " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; DSTAR " >> $PATHDSTAR
echo "ambeMode = DSTAR                ; DMR, DMR_IPSC, DSTAR, NXDN, P25, YSFN, YSFW " >> $PATHDSTAR
echo "address = 127.0.0.1 " >> $PATHDSTAR
echo "RXPort = 32100                  ; Port to send AMBE TLV frames to (export) " >> $PATHDSTAR
echo "TXPort = 32103                  ; Port to listen on (import) " >> $PATHDSTAR
echo "minTxTimeMS = 2000              ; Minimum time in MS for hang delay (0-10000) " >> $PATHDSTAR
############################################################################################################################################################
echo "gatewayDmrId =$dmrid " >> $PATHDSTAR
echo "repeaterID =$dmrid$sufijo" >> $PATHDSTAR
############################################################################################################################################################
echo "txTg = 98765                    ; TG to use for all frames sent from Analog_Bridge -> xx_Bridge " >> $PATHDSTAR
echo "txTs = 2                        ; Slot to use for frames sent from Analog_Bridge -> xx_Bridge " >> $PATHDSTAR
echo "colorCode = 1                   ; Color Code to assign DMR frames " >> $PATHDSTAR
echo ";; FallbackID = 3112138           ; In case we can not find a valid DMR id in the database, export this one " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; Information for USRP channel driver.  This interface uses PCM to transfer audio information " >> $PATHDSTAR
echo "; There are two typical configurations, ASL and Transcode.  ASL (AllstarLink) is for analog clients connected " >> $PATHDSTAR
echo "; to a digital network.  Transcode is when Analog_Bridge actually points its PCM interfaces back at itself,  " >> $PATHDSTAR
echo "; causing a TLV <-- (pcm <--> pcm) --> TLV type of architecture. " >> $PATHDSTAR
echo ";   When using ASL, this matches the rpt.conf ASL file with a setting like: " >> $PATHDSTAR
echo ";   rxchannel = usrp/127.0.0.1:34001:32001 " >> $PATHDSTAR
echo ";   When Transcoding, make two ini files and set txPort equal to the other instance rxPort (crossover).  Launch " >> $PATHDSTAR
echo ";   each instance with its own ini file. " >> $PATHDSTAR
echo "[USRP] " >> $PATHDSTAR
echo "address = 169.254.42.42                 ; IP address of USRP partner (Allstar/Asterisk or another Analog_Bridge) " >> $PATHDSTAR
echo "txPort = $usrp                          ; Transmit USRP frames on this port " >> $PATHDSTAR
echo "rxPort = $usrp                          ; Listen for USRP frames on this port " >> $PATHDSTAR
echo "aslAudio = AUDIO_USE_GAIN               ; Audio to ASL (AUDIO_UNITY, AUDIO_USE_AGC, AUDIO_USE_GAIN) " >> $PATHDSTAR
echo "agcGain = 6                             ; Gain (in db) of the AGC filter " >> $PATHDSTAR
echo "dmrAudio = AUDIO_USE_GAIN               ; Audio from ASL (AUDIO_UNITY, AUDIO_USE_GAIN, AUDIO_BPF) " >> $PATHDSTAR
echo "dmrGain = 0.50                          ; Gain factor of audio from ASL (0.0-1.0) " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "[MACROS] " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; Where the macros are " >> $PATHDSTAR
echo "; xxxx = yyyy " >> $PATHDSTAR
echo "; xxxx is the dial string to match " >> $PATHDSTAR
echo "; yyyy is the command line to execute " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; xxxx must be preceded by a * when dialed by client " >> $PATHDSTAR
echo "; xxxx can be any string (alphanumeric) " >> $PATHDSTAR
echo "; yyyy is the command to execute " >> $PATHDSTAR
echo "; yyyy will replace xxxx in the dial string " >> $PATHDSTAR
echo "; arguments follow the macro name with a # delimiter " >> $PATHDSTAR
echo "; the argument will be appended (with a space) to the command executed by the macro " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; For example using macro "5678" above would look like: " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; 5678 = echo " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; *5678#9876 in the Dial String on the client " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; Which would invoke: " >> $PATHDSTAR
echo "; echo 9876 " >> $PATHDSTAR
echo " " >> $PATHDSTAR
echo "; Information for DV3000 hardware decoder " >> $PATHDSTAR
echo ";   There are two configuration modes: IP (AMBEServer) and serial (direct connect hardware) " >> $PATHDSTAR
echo ";   Use top server and port if using AMBEServer " >> $PATHDSTAR
echo ";   Use bottom server/port and serial = true if using the DV3000u (thumbdv) " >> $PATHDSTAR
echo ";   Did you run AMBETest4.py before using this? " >> $PATHDSTAR
echo "[DV3000] " >> $PATHDSTAR
###########################################################################################################################33
if [[ $ambe = "EMULADO" ]]
then
   echo ";address = 127.0.0.1 " >> $PATHDSTAR
   echo ";rxPort = 2471 " >> $PATHDSTAR
   echo ";serial = false " >> $PATHDSTAR
else
   echo "address = 127.0.0.1 " >> $PATHDSTAR
   echo "rxPort = 2471 " >> $PATHDSTAR
   echo "serial = false " >> $PATHDSTAR

   if [[ $ambe = "460800" ]]
   then
       echo ";baud = 460800"  >> $PATHDSTAR
   else
       echo ";baud = 230400"  >> $PATHDSTAR
   fi
fi
#############################################################################################################################
echo "; address = /dev/ttyUSB0" >> $PATHDSTAR
echo " " >> $PATHDSTAR

echo " " >> $PATHDSTAR



}



###################   FIN DSTAR.INI    #################################

########################################################################3

################   INICIO  NXDN.INI

function NXDN(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHNXDN
echo "" >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; nxdn.ini " >> $PATHNXDN
echo "; Analog_Bridge configuration file. " >> $PATHNXDN
echo ";   This file should be placed in either /etc or it can be " >> $PATHNXDN
echo ";   supplied as a path on the Analog_Bridge command line. " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; The best way to think of this file is that there are two main sections, the USRP (analog audio) and " >> $PATHNXDN
echo "; AMBE_AUDIO (compressed audio).  Analog_Bridge will take everything sent to the USRP port and " >> $PATHNXDN
echo "; encode it for transmission on the AMBE_AUDIO port.  The encoder will use the format defined in ambeMode. " >> $PATHNXDN
echo "; As you might expect, the reverse direction is defined too. " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "include =  dvsm.ini " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; General Section describes settings for Analog_Bridge itself. " >> $PATHNXDN
echo "[GENERAL] " >> $PATHNXDN
echo "logLevel = 1                            ; Show messages and above 0=No logging, 1=Debug, 2=Message, 3=Info, 4=Warning, 5=Error, 6=Fatal " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; Metadata management " >> $PATHNXDN
echo "subscriberFile = /var/lib/dvswitch/subscriber_ids.csv   ; DMR ID to callsign lookup data " >> $PATHNXDN
echo "exportMetadata = true                                     ; Export metadata to USRP partner (transcode setups require this) " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; General vocoder setup information " >> $PATHNXDN
echo "decoderFallBack = true                  ; Allow software AMBE decoding if a hardware decoder is not found " >> $PATHNXDN
echo "useEmulator = true                     ; Use the MD380 AMBE emulator for AMBE72 (DMR/YSFN/NXDN) " >> $PATHNXDN
echo "emulatorAddress = 127.0.0.1:$emuport        ; IP address and port of the md380 server " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "mute = OFF                        ; OFF, USRP, TLV, BOTH (Do not export to) (Mute the interface) " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; Information for xx_Bridge (Where xx is MMDVM, Quantar, HB, IPSC) " >> $PATHNXDN
echo "[AMBE_AUDIO] " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; NXDN " >> $PATHNXDN
echo "ambeMode = NXDN                 ; DMR, DMR_IPSC, DSTAR, NXDN, P25, YSFN, YSFW " >> $PATHNXDN
echo "address = 127.0.0.1 " >> $PATHNXDN
echo "RXPort = 33100                  ; Port to send AMBE TLV frames to (export) " >> $PATHNXDN
echo "TXPort = 33103                  ; Port to listen on (import) " >> $PATHNXDN
echo "minTxTimeMS = 2000              ; Minimum time in MS for hang delay (0-10000) " >> $PATHNXDN
#############################################################################################################################################################
echo "gatewayDmrId =$dmrid " >> $PATHNXDN
echo "repeaterID =$dmrid$sufijo" >> $PATHNXDN
#############################################################################################################################################################
echo "txTg = 10                       ; TG to use for all frames sent from Analog_Bridge -> xx_Bridge " >> $PATHNXDN
echo "txTs = 2                        ; Slot to use for frames sent from Analog_Bridge -> xx_Bridge " >> $PATHNXDN
echo "colorCode = 1                   ; Color Code to assign DMR frames " >> $PATHNXDN
echo ";; FallbackID = 43751             ; In case we can not find a valid DMR id in the database, export this one " >> $PATHNXDN
echo ";; NXDNFallbackID  = 43751        ; Use this ID when the input DMR ID is not found in the database " >> $PATHNXDN
echo ";; Translate = 1234=4321          ; Translate NXDN TG < -- > DMR TG (bidirectional) " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; Information for USRP channel driver.  This interface uses PCM to transfer audio information " >> $PATHNXDN
echo "; There are two typical configurations, ASL and Transcode.  ASL (AllstarLink) is for analog clients connected " >> $PATHNXDN
echo "; to a digital network.  Transcode is when Analog_Bridge actually points its PCM interfaces back at itself,  " >> $PATHNXDN
echo "; causing a TLV <-- (pcm <--> pcm) --> TLV type of architecture. " >> $PATHNXDN
echo ";   When using ASL, this matches the rpt.conf ASL file with a setting like: " >> $PATHNXDN
echo ";   rxchannel = usrp/127.0.0.1:34001:32001 " >> $PATHNXDN
echo ";   When Transcoding, make two ini files and set txPort equal to the other instance rxPort (crossover).  Launch " >> $PATHNXDN
echo ";   each instance with its own ini file. " >> $PATHNXDN
echo "[USRP] " >> $PATHNXDN
echo "address = 169.254.42.42                 ; IP address of USRP partner (Allstar/Asterisk or another Analog_Bridge) " >> $PATHNXDN
echo "txPort = $usrp                          ; Transmit USRP frames on this port " >> $PATHNXDN
echo "rxPort = $usrp                          ; Listen for USRP frames on this port " >> $PATHNXDN
echo "aslAudio = AUDIO_USE_GAIN               ; Audio to ASL (AUDIO_UNITY, AUDIO_USE_AGC, AUDIO_USE_GAIN) " >> $PATHNXDN
echo "agcGain = 6                             ; Gain (in db) of the AGC filter " >> $PATHNXDN
echo "dmrAudio = AUDIO_USE_GAIN               ; Audio from ASL (AUDIO_UNITY, AUDIO_USE_GAIN, AUDIO_BPF) " >> $PATHNXDN
echo "dmrGain = 0.50                          ; Gain factor of audio from ASL (0.0-1.0) " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "[MACROS] " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; Where the macros are " >> $PATHNXDN
echo "; xxxx = yyyy " >> $PATHNXDN
echo "; xxxx is the dial string to match " >> $PATHNXDN
echo "; yyyy is the command line to execute " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; xxxx must be preceded by a * when dialed by client " >> $PATHNXDN
echo "; xxxx can be any string (alphanumeric) " >> $PATHNXDN
echo "; yyyy is the command to execute " >> $PATHNXDN
echo "; yyyy will replace xxxx in the dial string " >> $PATHNXDN
echo "; arguments follow the macro name with a # delimiter " >> $PATHNXDN
echo "; the argument will be appended (with a space) to the command executed by the macro " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; For example using macro  above would look like: " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; 5678 = echo " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; *5678#9876 in the Dial String on the client " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; Which would invoke: " >> $PATHNXDN
echo "; echo 9876 " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "73 = /usr/local/sbin/tune.sh tune nxdn 9999          ; Mode off " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "74 = /usr/local/sbin/tune.sh tune nxdn 2             ; mode local " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "76 = /usr/local/sbin/tune.sh tune nxdn 10200         ; North America " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "342565 = /usr/local/sbin/tune.sh tune nxdn 10        ; Parrot Connect " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "142565 = /usr/local/sbin/tune.sh tune nxdn 9999      ; Parrot Disconnect " >> $PATHNXDN
echo " " >> $PATHNXDN
echo "; Information for DV3000 hardware decoder " >> $PATHNXDN
echo ";   There are two configuration modes: IP (AMBEServer) and serial (direct connect hardware) " >> $PATHNXDN
echo ";   Use top server and port if using AMBEServer " >> $PATHNXDN
echo ";   Use bottom server/port and serial = true if using the DV3000u (thumbdv) " >> $PATHNXDN
echo ";   Did you run AMBETest4.py before using this? " >> $PATHNXDN
echo "[DV3000] " >> $PATHNXDN
#######################################################################################################################
if [[ $ambe = "EMULADO" ]]
then
   echo ";address = 127.0.0.1 " >> $PATHNXDN
   echo ";rxPort = 2471 " >> $PATHNXDN
   echo ";serial = false " >> $PATHNXDN
else
   echo "address = 127.0.0.1 " >> $PATHNXDN
   echo "rxPort = 2471 " >> $PATHNXDN
   echo "serial = false " >> $PATHNXDN

   if [[ $ambe = "460800" ]]
   then
       echo ";baud = 460800"  >> $PATHNXDN
   else
       echo ";baud = 230400"  >> $PATHNXDN
   fi
fi
#############################################################################################################################
echo "; address = /dev/ttyUSB0" >> $PATHNXDN
echo " " >> $PATHNXDN

echo " " >> $PATHNXDN





}


#####################  FIN  NXDN.INI         #############################333

####################################################################################

###################    INICIO P25.INI         #####################################

function P25(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHP25
echo "" >> $PATHP25
echo "; p25.ini " >> $PATHP25
echo "; Analog_Bridge configuration file. " >> $PATHP25
echo ";   This file should be placed in either /etc or it can be " >> $PATHP25
echo ";   supplied as a path on the Analog_Bridge command line. " >> $PATHP25
echo " " >> $PATHP25
echo "; The best way to think of this file is that there are two main sections, the USRP (analog audio) and " >> $PATHP25
echo "; AMBE_AUDIO (compressed audio).  Analog_Bridge will take everything sent to the USRP port and " >> $PATHP25
echo "; encode it for transmission on the AMBE_AUDIO port.  The encoder will use the format defined in ambeMode. " >> $PATHP25
echo "; As you might expect, the reverse direction is defined too. " >> $PATHP25
echo " " >> $PATHP25
echo "include =  dvsm.ini " >> $PATHP25
echo " " >> $PATHP25
echo "; General Section describes settings for Analog_Bridge itself. " >> $PATHP25
echo "[GENERAL] " >> $PATHP25
echo "logLevel = 1                            ; Show messages and above 0=No logging, 1=Debug, 2=Message, 3=Info, 4=Warning, 5=Error, 6=Fatal " >> $PATHP25
echo " " >> $PATHP25
echo "; Metadata management " >> $PATHP25
echo "subscriberFile = /var/lib/dvswitch/subscriber_ids.csv   ; DMR ID to callsign lookup data " >> $PATHP25
echo "exportMetadata = true                                     ; Export metadata to USRP partner (transcode setups require this) " >> $PATHP25
echo " " >> $PATHP25
echo "; General vocoder setup information " >> $PATHP25
echo "decoderFallBack = true                  ; Allow software AMBE decoding if a hardware decoder is not found " >> $PATHP25
echo "useEmulator = true                     ; Use the MD380 AMBE emulator for AMBE72 (DMR/YSFN/NXDN) " >> $PATHP25
echo "emulatorAddress = 127.0.0.1:$emuport        ; IP address and port of the md380 server " >> $PATHP25
echo " " >> $PATHP25
echo "mute = OFF                        ; OFF, USRP, TLV, BOTH (Do not export to) (Mute the interface) " >> $PATHP25
echo " " >> $PATHP25
echo "; Information for xx_Bridge (Where xx is MMDVM, Quantar, HB, IPSC) " >> $PATHP25
echo "[AMBE_AUDIO] " >> $PATHP25
echo " " >> $PATHP25
echo "; P25 " >> $PATHP25
echo "ambeMode = P25                      ; DMR, DMR_IPSC, DSTAR, NXDN, P25, YSFN, YSFW " >> $PATHP25
echo "address = 127.0.0.1 " >> $PATHP25
echo "TXPort = 34103                      ; Port to send AMBE TLV frames to (export) " >> $PATHP25
echo "RXPort = 34100                      ; Port to listen on (import) " >> $PATHP25
echo "minTxTimeMS = 2000                  ; Minimum time in MS for hang delay (0-10000) " >> $PATHP25
###############################################################################################################################################################
echo "gatewayDmrId =$dmrid " >> $PATHP25
echo "repeaterID =$dmrid$sufijo" >> $PATHP25
##############################################################################################################################################################
echo "txTg = 10                           ; TG to use for all frames sent from Analog_Bridge -> xx_Bridge " >> $PATHP25
echo "txTs = 2                            ; Slot to use for frames sent from Analog_Bridge -> xx_Bridge " >> $PATHP25
echo "colorCode = 1                       ; Color Code to assign DMR frames " >> $PATHP25
echo " " >> $PATHP25
echo "; Information for USRP channel driver.  This interface uses PCM to transfer audio information " >> $PATHP25
echo "; There are two typical configurations, ASL and Transcode.  ASL (AllstarLink) is for analog clients connected " >> $PATHP25
echo "; to a digital network.  Transcode is when Analog_Bridge actually points its PCM interfaces back at itself,  " >> $PATHP25
echo "; causing a TLV <-- (pcm <--> pcm) --> TLV type of architecture. " >> $PATHP25
echo ";   When using ASL, this matches the rpt.conf ASL file with a setting like: " >> $PATHP25
echo ";   rxchannel = usrp/127.0.0.1:34001:32001 " >> $PATHP25
echo ";   When Transcoding, make two ini files and set txPort equal to the other instance rxPort (crossover).  Launch " >> $PATHP25
echo ";   each instance with its own ini file. " >> $PATHP25
echo "[USRP] " >> $PATHP25
echo "address = 169.254.42.42                 ; IP address of USRP partner (Allstar/Asterisk or another Analog_Bridge) " >> $PATHP25
echo "txPort = $usrp                          ; Transmit USRP frames on this port " >> $PATHP25
echo "rxPort = $usrp                          ; Listen for USRP frames on this port " >> $PATHP25
echo "aslAudio = AUDIO_USE_GAIN               ; Audio to ASL (AUDIO_UNITY, AUDIO_USE_AGC, AUDIO_USE_GAIN) " >> $PATHP25
echo "agcGain = 6                             ; Gain (in db) of the AGC filter " >> $PATHP25
echo "dmrAudio = AUDIO_USE_GAIN               ; Audio from ASL (AUDIO_UNITY, AUDIO_USE_GAIN, AUDIO_BPF) " >> $PATHP25
echo "dmrGain = 0.35                          ; Gain factor of audio from ASL (0.0-1.0) " >> $PATHP25
echo " " >> $PATHP25
echo "[MACROS] " >> $PATHP25
echo " " >> $PATHP25
echo "; Where the macros are " >> $PATHP25
echo "; xxxx is the dial string to match " >> $PATHP25
echo "; yyyy is the command line to execute " >> $PATHP25
echo " " >> $PATHP25
echo "; xxxx must be preceded by a * " >> $PATHP25
echo "; xxxx can be any string (alphanumeric) " >> $PATHP25
echo "; yyyy is the command to execute " >> $PATHP25
echo "; yyyy will replace xxxx in the dial string " >> $PATHP25
echo "; arguments follow the macro name with a # delimiter " >> $PATHP25
echo " " >> $PATHP25
echo "; For example using macro "5678" above would look like: " >> $PATHP25
echo "; *5678#9876 " >> $PATHP25
echo " " >> $PATHP25
echo "; Which would invoke: " >> $PATHP25
echo "; echo 9876 " >> $PATHP25
echo " " >> $PATHP25
echo "; Mode off " >> $PATHP25
echo "73 = /usr/local/sbin/tune.sh tune p25 9999 " >> $PATHP25
echo " " >> $PATHP25
echo "; mode local " >> $PATHP25
echo "74 = /usr/local/sbin/tune.sh tune p25 2 " >> $PATHP25
echo " " >> $PATHP25
echo "; North America " >> $PATHP25
echo "76 = /usr/local/sbin/tune.sh tune p25 10200 " >> $PATHP25
echo " " >> $PATHP25
echo "# Parrot Connect " >> $PATHP25
echo "342565 = /usr/local/sbin/tune.sh tune p25 10 " >> $PATHP25
echo " " >> $PATHP25
echo "# Parrot Disconnect " >> $PATHP25
echo "142565 = /usr/local/sbin/tune.sh tune p25 9999  " >> $PATHP25
echo " " >> $PATHP25
echo "# Disconnect " >> $PATHP25
echo "73 = /usr/local/sbin/tune.sh tune p25 9999 " >> $PATHP25
echo " " >> $PATHP25
echo "# North America " >> $PATHP25
echo "76 = /usr/local/sbin/tune.sh tune p25 10200 " >> $PATHP25
echo " " >> $PATHP25
echo "; Information for DV3000 hardware decoder " >> $PATHP25
echo ";   There are two configuration modes: IP (AMBEServer) and serial (direct connect hardware) " >> $PATHP25
echo ";   Use top server and port if using AMBEServer " >> $PATHP25
echo ";   Use bottom server/port and serial = true if using the DV3000u (thumbdv) " >> $PATHP25
echo ";   Did you run AMBETest4.py before using this? " >> $PATHP25
echo "[DV3000] " >> $PATHP25
######################################################################################################################################33
if [[ $ambe = "EMULADO" ]]
then
   echo ";address = 127.0.0.1 " >> $PATHP25
   echo ";rxPort = 2471 " >> $PATHP25
   echo ";serial = false " >> $PATHP25
else
   echo "address = 127.0.0.1 " >> $PATHP25
   echo "rxPort = 2471 " >> $PATHP25
   echo "serial = false " >> $PATHP25

   if [[ $ambe = "460800" ]]
   then
       echo ";baud = 460800"  >> $PATHP25
   else
       echo ";baud = 230400"  >> $PATHP25
   fi
fi
#############################################################################################################################
echo "; address = /dev/ttyUSB0" >> $PATHP25

echo " " >> $PATHP25



}


#####################    FIN P25.INI           ####################################3

########################################################################################

######################    INICIO IRCDDBGATEWAY    ##################################
function IRCSED(){
llamada=$indicativo
llamada=${llamada,,}
sed -i "/ircddbUsername/s/.*/ircddbUsername=$llamada/" $PATHIRCDDBGATEWAY
llamada=${llamada^^}
sed -i "/gatewayCallsign/s/.*/gatewayCallsign=$llamada/" $PATHIRCDDBGATEWAY
sed -i "/dplusLogin/s/.*/dplusLogin=$llamada $modulodstar/" $PATHIRCDDBGATEWAY
sed -i "/repeaterBand1/s/.*/repeaterBand1=$modulodstar/" $PATHIRCDDBGATEWAY
echo "modulodstar vale $modulodstar"


}
function IRC(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHIRCDDBGATEWAY
echo "" $PATHIRCDDBGATEWAY

echo "gatewayType=1" >> $PATHIRCDDBGATEWAY
echo "#PRINCIPAL" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

###########################################################################################################################3
echo "gatewayCallsign=$indicativo" >> $PATHIRCDDBGATEWAY     #INDICATIVO primario no borrar
#########################################################################################################################
echo "gatewayAddress=" >> $PATHIRCDDBGATEWAY
echo "icomAddress=172.16.0.20" >> $PATHIRCDDBGATEWAY
echo "icomPort=20000" >> $PATHIRCDDBGATEWAY
echo "hbAddress=127.0.0.1" >> $PATHIRCDDBGATEWAY
echo "hbPort=20010" >> $PATHIRCDDBGATEWAY                    #fijo
echo "latitude=0.000000" >> $PATHIRCDDBGATEWAY
echo "longitude=0.000000" >> $PATHIRCDDBGATEWAY
echo "description1=" >> $PATHIRCDDBGATEWAY
echo "description2=" >> $PATHIRCDDBGATEWAY
echo "url=" >> $PATHIRCDDBGATEWAY
echo "repeaterCall1=" >> $PATHIRCDDBGATEWAY
echo "repeaterBand1=$modulodstar" >> $PATHIRCDDBGATEWAY  #SELECCIONA MODULO
echo "repeaterType1=0" >> $PATHIRCDDBGATEWAY
echo "repeaterAddress1=127.0.0.1" >> $PATHIRCDDBGATEWAY
echo "repeaterPort1=20011" >> $PATHIRCDDBGATEWAY              #user1 +1 +2 +3
echo "reflector1=" >> $PATHIRCDDBGATEWAY        #INTRODUCIR REFLECTO DE INICIO
echo "atStartup1=0" >> $PATHIRCDDBGATEWAY       #ARRANCA AREFLECTOR AL INICIO
echo "reconnect1=0" >> $PATHIRCDDBGATEWAY       #SELECCIONA TIEMPO DE RECONEXION
echo "frequency1=0.00000" >> $PATHIRCDDBGATEWAY
echo "offset1=0.0000" >> $PATHIRCDDBGATEWAY
echo "rangeKms1=0.000" >> $PATHIRCDDBGATEWAY
echo "latitude1=0.000000" >> $PATHIRCDDBGATEWAY
echo "longitude1=0.000000" >> $PATHIRCDDBGATEWAY
echo "agl1=0.000" >> $PATHIRCDDBGATEWAY
echo "description1_1=" >> $PATHIRCDDBGATEWAY
echo "description1_2=" >> $PATHIRCDDBGATEWAY
echo "url1=ea5gvk.es" >> $PATHIRCDDBGATEWAY
echo "band1_1=0" >> $PATHIRCDDBGATEWAY
echo "band1_2=0" >> $PATHIRCDDBGATEWAY
echo "band1_3=0" >> $PATHIRCDDBGATEWAY

echo "" >> $PATHIRCDDBGATEWAY
echo "#2ª CONFIGURACIOn" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

echo "repeaterCall2=" >> $PATHIRCDDBGATEWAY
echo "repeaterBand2= " >> $PATHIRCDDBGATEWAY
echo "repeaterType2=0" >> $PATHIRCDDBGATEWAY
echo "repeaterAddress2=127.0.0.1" >> $PATHIRCDDBGATEWAY
echo "repeaterPort2=20012" >> $PATHIRCDDBGATEWAY
echo "reflector2=" >> $PATHIRCDDBGATEWAY
echo "atStartup2=0" >> $PATHIRCDDBGATEWAY
echo "reconnect2=0" >> $PATHIRCDDBGATEWAY
echo "frequency2=0.00000" >> $PATHIRCDDBGATEWAY
echo "offset2=0.0000" >> $PATHIRCDDBGATEWAY
echo "rangeKms2=0.000" >> $PATHIRCDDBGATEWAY
echo "latitude2=0.000000" >> $PATHIRCDDBGATEWAY
echo "longitude2=0.000000" >> $PATHIRCDDBGATEWAY
echo "agl2=0.000" >> $PATHIRCDDBGATEWAY
echo "description2_1=" >> $PATHIRCDDBGATEWAY
echo "description2_2=" >> $PATHIRCDDBGATEWAY
echo "url2=" >> $PATHIRCDDBGATEWAY
echo "band2_1=0" >> $PATHIRCDDBGATEWAY
echo "band2_2=0" >> $PATHIRCDDBGATEWAY
echo "band2_3=0" >> $PATHIRCDDBGATEWAY

echo "" >> $PATHIRCDDBGATEWAY
echo "#3ª CONFIGURACIOn" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

echo "repeaterCall3=" >> $PATHIRCDDBGATEWAY
echo "repeaterBand3= " >> $PATHIRCDDBGATEWAY
echo "repeaterType3=0" >> $PATHIRCDDBGATEWAY
echo "repeaterAddress3=127.0.0.1" >> $PATHIRCDDBGATEWAY
echo "repeaterPort3=20013" >> $PATHIRCDDBGATEWAY
echo "reflector3=" >> $PATHIRCDDBGATEWAY
echo "atStartup3=0" >> $PATHIRCDDBGATEWAY
echo "reconnect3=0" >> $PATHIRCDDBGATEWAY
echo "frequency3=0.00000" >> $PATHIRCDDBGATEWAY
echo "offset3=0.0000" >> $PATHIRCDDBGATEWAY
echo "rangeKms3=0.000" >> $PATHIRCDDBGATEWAY
echo "latitude3=0.000000" >> $PATHIRCDDBGATEWAY
echo "longitude3=0.000000" >> $PATHIRCDDBGATEWAY
echo "agl3=0.000" >> $PATHIRCDDBGATEWAY
echo "description3_1=" >> $PATHIRCDDBGATEWAY
echo "description3_2=" >> $PATHIRCDDBGATEWAY
echo "url3=" >> $PATHIRCDDBGATEWAY
echo "band3_1=0" >> $PATHIRCDDBGATEWAY
echo "band3_2=0" >> $PATHIRCDDBGATEWAY
echo "band3_3=0" >> $PATHIRCDDBGATEWAY

echo "" >> $PATHIRCDDBGATEWAY
echo "#4ª CONFIGURACIOn" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

echo "repeaterCall4=" >> $PATHIRCDDBGATEWAY
echo "repeaterBand4= " >> $PATHIRCDDBGATEWAY
echo "repeaterType4=0" >> $PATHIRCDDBGATEWAY
echo "repeaterAddress4=127.0.0.1" >> $PATHIRCDDBGATEWAY
echo "repeaterPort4=20014" >> $PATHIRCDDBGATEWAY
echo "reflector4=" >> $PATHIRCDDBGATEWAY
echo "atStartup4=0" >> $PATHIRCDDBGATEWAY
echo "reconnect4=0" >> $PATHIRCDDBGATEWAY
echo "frequency4=0.00000" >> $PATHIRCDDBGATEWAY
echo "offset4=0.0000" >> $PATHIRCDDBGATEWAY
echo "rangeKms4=0.000" >> $PATHIRCDDBGATEWAY
echo "latitude4=0.000000" >> $PATHIRCDDBGATEWAY
echo "longitude4=0.000000" >> $PATHIRCDDBGATEWAY
echo "agl4=0.000" >> $PATHIRCDDBGATEWAY
echo "description4_1=" >> $PATHIRCDDBGATEWAY
echo "description4_2=" >> $PATHIRCDDBGATEWAY
echo "url4=" >> $PATHIRCDDBGATEWAY
echo "band4_1=0" >> $PATHIRCDDBGATEWAY
echo "band4_2=0" >> $PATHIRCDDBGATEWAY
echo "band4_3=0" >> $PATHIRCDDBGATEWAY

echo "" >> $PATHIRCDDBGATEWAY
echo "#ENABLE 1" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

echo "ircddbEnabled=1" >> $PATHIRCDDBGATEWAY
echo "ircddbHostname=rr.openquad.net" >> $PATHIRCDDBGATEWAY    #SELECCION DE RED
#######################################################################################################################################################3
minusculas=${indicativo,,}
echo "ircddbUsername=$minusculas" >> $PATHIRCDDBGATEWAY        #INDICATIVO DE NUEVO MINUSCULAS
#######################################################################################################################################################3
echo "ircddbPassword=" >> $PATHIRCDDBGATEWAY              

echo "" >> $PATHIRCDDBGATEWAY
echo "#ENABLE2" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

echo "ircddbEnabled2=0" >> $PATHIRCDDBGATEWAY                     #ENABLES POR USUARIO
echo "ircddbHostname2=rr.openquad.net" >> $PATHIRCDDBGATEWAY      #SELEECION DE RED POR USUARIO
echo "ircddbUsername=$minusculas" >> $PATHIRCDDBGATEWAY           #INDICATIVO MINUSCULAS POR USUARIO
echo "ircddbPassword2=" >> $PATHIRCDDBGATEWAY                     

echo "" >> $PATHIRCDDBGATEWAY
echo "#ENABLE3" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

echo "ircddbEnabled3=0" >> $PATHIRCDDBGATEWAY
echo "ircddbHostname3=" >> $PATHIRCDDBGATEWAY
echo "ircddbUsername=$minusculas" >> $PATHIRCDDBGATEWAY
echo "ircddbPassword3=" >> $PATHIRCDDBGATEWAY

echo "" >> $PATHIRCDDBGATEWAY
echo "#ENABLE4" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

echo "ircddbEnabled4=0" >> $PATHIRCDDBGATEWAY
echo "ircddbHostname4=" >> $PATHIRCDDBGATEWAY
echo "ircddbUsername=$minusculas" >> $PATHIRCDDBGATEWAY
echo "ircddbPassword4=" >> $PATHIRCDDBGATEWAY
echo "aprsEnabled=1" >> $PATHIRCDDBGATEWAY
echo "aprsHostname=rotate.aprs2.net" >> $PATHIRCDDBGATEWAY
echo "aprsPort=14580" >> $PATHIRCDDBGATEWAY
echo "dextraEnabled=1" >> $PATHIRCDDBGATEWAY
echo "dextraMaxDongles=5" >> $PATHIRCDDBGATEWAY
echo "dplusEnabled=1" >> $PATHIRCDDBGATEWAY
echo "dplusMaxDongles=5" >> $PATHIRCDDBGATEWAY

echo "" >> $PATHIRCDDBGATEWAY
echo "#INDICATIVO DPLUS" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

###########################################################################################################################################################
conex=" C"
echo "dplusLogin=$indicativo$conex" >> $PATHIRCDDBGATEWAY
######################################################################################################################################################
echo "dcsEnabled=1" >> $PATHIRCDDBGATEWAY
echo "ccsEnabled=1" >> $PATHIRCDDBGATEWAY
echo "ccsHost=CCS704" >> $PATHIRCDDBGATEWAY
echo "xlxEnabled=1" >> $PATHIRCDDBGATEWAY
echo "xlxOverrideLocal=1" >> $PATHIRCDDBGATEWAY
echo "xlxHostsFileUrl=" >> $PATHIRCDDBGATEWAY
echo "starNetBand1=A" >> $PATHIRCDDBGATEWAY
echo "starNetCallsign1=" >> $PATHIRCDDBGATEWAY
echo "starNetLogoff1=" >> $PATHIRCDDBGATEWAY
echo "starNetInfo1=" >> $PATHIRCDDBGATEWAY
echo "starNetPermanent1=" >> $PATHIRCDDBGATEWAY
echo "starNetUserTimeout1=300" >> $PATHIRCDDBGATEWAY
echo "starNetGroupTimeout1=300" >> $PATHIRCDDBGATEWAY
echo "starNetCallsignSwitch1=0" >> $PATHIRCDDBGATEWAY
echo "starNetTXMsgSwitch1=1" >> $PATHIRCDDBGATEWAY
echo "starNetReflector1=" >> $PATHIRCDDBGATEWAY
echo "starNetBand2=A" >> $PATHIRCDDBGATEWAY
echo "starNetCallsign2=" >> $PATHIRCDDBGATEWAY
echo "starNetLogoff2=" >> $PATHIRCDDBGATEWAY
echo "starNetInfo2=" >> $PATHIRCDDBGATEWAY
echo "starNetPermanent2=" >> $PATHIRCDDBGATEWAY
echo "starNetUserTimeout2=300" >> $PATHIRCDDBGATEWAY
echo "starNetGroupTimeout2=300" >> $PATHIRCDDBGATEWAY
echo "starNetCallsignSwitch2=0" >> $PATHIRCDDBGATEWAY
echo "starNetTXMsgSwitch2=1" >> $PATHIRCDDBGATEWAY
echo "starNetReflector2=" >> $PATHIRCDDBGATEWAY
echo "starNetBand3=A" >> $PATHIRCDDBGATEWAY
echo "starNetCallsign3=" >> $PATHIRCDDBGATEWAY
echo "starNetLogoff3=" >> $PATHIRCDDBGATEWAY
echo "starNetInfo3=" >> $PATHIRCDDBGATEWAY
echo "starNetPermanent3=" >> $PATHIRCDDBGATEWAY
echo "starNetUserTimeout3=300" >> $PATHIRCDDBGATEWAY
echo "starNetGroupTimeout3=300" >> $PATHIRCDDBGATEWAY
echo "starNetCallsignSwitch3=0" >> $PATHIRCDDBGATEWAY
echo "starNetTXMsgSwitch3=1" >> $PATHIRCDDBGATEWAY
echo "starNetReflector3=" >> $PATHIRCDDBGATEWAY
echo "starNetBand4=A" >> $PATHIRCDDBGATEWAY
echo "starNetCallsign4=" >> $PATHIRCDDBGATEWAY
echo "starNetLogoff4=" >> $PATHIRCDDBGATEWAY
echo "starNetInfo4=" >> $PATHIRCDDBGATEWAY
echo "starNetPermanent4=" >> $PATHIRCDDBGATEWAY
echo "starNetUserTimeout4=300" >> $PATHIRCDDBGATEWAY
echo "starNetGroupTimeout4=300" >> $PATHIRCDDBGATEWAY
echo "starNetCallsignSwitch4=0" >> $PATHIRCDDBGATEWAY
echo "starNetTXMsgSwitch4=1" >> $PATHIRCDDBGATEWAY
echo "starNetReflector4=" >> $PATHIRCDDBGATEWAY
echo "starNetBand5=A"  >> $PATHIRCDDBGATEWAY
echo "starNetCallsign5=" >> $PATHIRCDDBGATEWAY
echo "starNetLogoff5=" >> $PATHIRCDDBGATEWAY
echo "starNetInfo5=" >> $PATHIRCDDBGATEWAY
echo "starNetPermanent5=" >> $PATHIRCDDBGATEWAY
echo "starNetUserTimeout5=300" >> $PATHIRCDDBGATEWAY
echo "starNetGroupTimeout5=300" >> $PATHIRCDDBGATEWAY
echo "starNetCallsignSwitch5=0" >> $PATHIRCDDBGATEWAY
echo "starNetTXMsgSwitch5=1" >> $PATHIRCDDBGATEWAY
echo "starNetReflector5=" >> $PATHIRCDDBGATEWAY
###############################################################
echo "remoteEnabled=0" >> $PATHIRCDDBGATEWAY         #ACTIVAR ACCESO REMOTO
echo "remotePassword=" >> $PATHIRCDDBGATEWAY         #PASSWORD ACCESO REMOTO
echo "remotePort=0" >> $PATHIRCDDBGATEWAY            #PUERTO AR
echo "language=7" >> $PATHIRCDDBGATEWAY              #LEGUAJE 
echo "infoEnabled=1" >> $PATHIRCDDBGATEWAY
echo "echoEnabled=1" >> $PATHIRCDDBGATEWAY
echo "logEnabled=1" >> $PATHIRCDDBGATEWAY
echo "dratsEnabled=1" >> $PATHIRCDDBGATEWAY
echo "dtmfEnabled=1" >> $PATHIRCDDBGATEWAY
echo "windowX=134" >> $PATHIRCDDBGATEWAY
echo "windowY=36" >> $PATHIRCDDBGATEWAY



}

######################     FIN IRCDDBGATEWAY     ###############################33333333


################################################################################################



##############        INICIO BRIDGENXDN   ###########################

function XNDN(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
echo "[General]" >> $PATHBRIDGENXDN
##########################################################################################################################################3
echo "Callsign=$indicativo" >> $PATHBRIDGENXDN
#############################################################################################################################################
echo "Suffix=NXDN" >> $PATHBRIDGENXDN
echo "RptAddress=127.0.0.1" >> $PATHBRIDGENXDN
echo "RptPort=14021" >> $PATHBRIDGENXDN
echo "LocalPort=14020" >> $PATHBRIDGENXDN
echo "Debug=0" >> $PATHBRIDGENXDN
echo "Daemon=0" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
echo "[Info]" >> $PATHBRIDGENXDN
echo "RXFrequency=430475000" >> $PATHBRIDGENXDN
echo "TXFrequency=439475000" >> $PATHBRIDGENXDN
echo "Power=1" >> $PATHBRIDGENXDN
echo "Latitude=0.0" >> $PATHBRIDGENXDN
echo "Longitude=0.0" >> $PATHBRIDGENXDN
echo "Height=0" >> $PATHBRIDGENXDN
echo "Name=SPAIN" >> $PATHBRIDGENXDN
echo "Description=Multi-Mode Repeater" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
echo "[Voice]" >> $PATHBRIDGENXDN
echo "Enabled=1" >> $PATHBRIDGENXDN
echo "Language=es_ES" >> $PATHBRIDGENXDN
echo "Directory=./Audio" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
echo "[aprs.fi]" >> $PATHBRIDGENXDN
echo "Enable=0" >> $PATHBRIDGENXDN
echo "# Server=noam.aprs2.net" >> $PATHBRIDGENXDN
echo "Server=euro.aprs2.net" >> $PATHBRIDGENXDN
echo "Port=14580" >> $PATHBRIDGENXDN
echo "Password=9999" >> $PATHBRIDGENXDN
echo "Description=APRS Description" >> $PATHBRIDGENXDN
echo "Suffix=N" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
echo "[Id Lookup]" >> $PATHBRIDGENXDN
echo "Name=/var/lib/mmdvm/NXDN.csv" >> $PATHBRIDGENXDN
echo "Time=24" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
echo "[Log]" >> $PATHBRIDGENXDN
echo "DisplayLevel=1" >> $PATHBRIDGENXDN
echo "FileLevel=2" >> $PATHBRIDGENXDN
echo "FilePath=/var/log/dvswitch/10/" >> $PATHBRIDGENXDN
echo "FileRoot=NXDNGateway" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
echo "[Network]" >> $PATHBRIDGENXDN
echo "Port=14050" >> $PATHBRIDGENXDN
echo "HostsFile1=/var/lib/mmdvm/NXDNHosts.txt" >> $PATHBRIDGENXDN
echo "HostsFile2=/var/lib/mmdvm/private_NXDNHosts.txt" >> $PATHBRIDGENXDN
echo "ReloadTime=60" >> $PATHBRIDGENXDN
echo "ParrotAddress=127.0.0.1" >> $PATHBRIDGENXDN
echo "ParrotPort=42021" >> $PATHBRIDGENXDN
echo "NXDN2DMRAddress=127.0.0.1" >> $PATHBRIDGENXDN
echo "NXDN2DMRPort=42022" >> $PATHBRIDGENXDN
echo "#Startup=10301" >> $PATHBRIDGENXDN
echo "InactivityTimeout=10" >> $PATHBRIDGENXDN
echo "Debug=0" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
echo "[Mobile GPS]" >> $PATHBRIDGENXDN
echo "Enable=0" >> $PATHBRIDGENXDN
echo "Address=127.0.0.1" >> $PATHBRIDGENXDN
echo "Port=7834" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
echo "[Remote Commands]" >> $PATHBRIDGENXDN
echo "Enable=1" >> $PATHBRIDGENXDN
if [[ $tipousuario = "PRIMARIO" ]]
then
    echo "Port=6075" >> $PATHBRIDGENXDN
else
   nxdnremoteport=`expr $sufijo + 6075`
   echo "Port=$nxdnremoteport" >> $PATHBRIDGENXDN
fi



}




##############         FIN   BRIDGENXDN     ############################


#######################################################################3#####################################33


####################   INICIO BRIDGEP25    ##########################


function BRIDGEP25(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHBRIDGEP25
echo "" >> $PATHBRIDGEP25
echo "[General]" >> $PATHBRIDGEP25
##########################################################################################################################################3
echo "Callsign=$indicativo" >> $PATHBRIDGEP25

##########################################################################################################################################
echo "RptAddress=127.0.0.1" >> $PATHBRIDGEP25
echo "RptPort=32010" >> $PATHBRIDGEP25
echo "LocalPort=42020" >> $PATHBRIDGEP25
echo "Daemon=0" >> $PATHBRIDGEP25
echo "" >> $PATHBRIDGEP25
echo "[Id Lookup]" >> $PATHBRIDGEP25
echo "Name=/var/lib/mmdvm/DMRIds.dat" >> $PATHBRIDGEP25
echo "Time=24" >> $PATHBRIDGEP25
echo "" >> $PATHBRIDGEP25
echo "[Voice]" >> $PATHBRIDGEP25
echo "Enabled=1" >> $PATHBRIDGEP25
echo "Language=es_ES" >> $PATHBRIDGEP25
echo "Directory=./Audio" >> $PATHBRIDGEP25
echo " " >> $PATHBRIDGEP25
echo "[Log]" >> $PATHBRIDGEP25
echo "DisplayLevel=1" >> $PATHBRIDGEP25
echo "FileLevel=2" >> $PATHBRIDGEP25
echo "FilePath=/var/log/dvswitch/10/" >> $PATHBRIDGEP25
echo "FileRoot=P25Gateway" >> $PATHBRIDGEP25
echo " " >> $PATHBRIDGEP25
echo "[Network]" >> $PATHBRIDGEP25
echo "Port=42010" >> $PATHBRIDGEP25
echo "HostsFile1=/var/lib/mmdvm/P25Hosts.txt" >> $PATHBRIDGEP25
echo "HostsFile2=/var/lib/mmdvm/private_P25Hosts.txt" >> $PATHBRIDGEP25
echo "ReloadTime=60" >> $PATHBRIDGEP25
echo "ParrotAddress=127.0.0.1" >> $PATHBRIDGEP25
echo "ParrotPort=42011" >> $PATHBRIDGEP25
echo "# Startup=10100" >> $PATHBRIDGEP25
echo "InactivityTimeout=10" >> $PATHBRIDGEP25
echo "Debug=0" >> $PATHBRIDGEP25
echo "" >> $PATHBRIDGEP25
echo "[Remote Commands]" >> $PATHBRIDGEP25
echo "Enable=1" >> $PATHBRIDGEP25
if [[ $tipousuario = "PRIMARIO" ]]
then
    echo "Port=6074" >> $PATHBRIDGEP25
else
   p25remoteport=`expr $sufijo + 6074`
   echo "Port=$p25remoteport" >> $PATHBRIDGEP25
fi




echo "Port=6074" >> $PATHBRIDGEP25

}

####################    FIN BRIDGEP25           ########################

#####################################################################################################


#####################     INICIO AMBESERVER   ##########################



function AMBESERVER(){
echo "#! /bin/sh" >> $PATHAMBESERVER
echo "### BEGIN INIT INFO" >> $PATHAMBESERVER
echo "# Provides:          AMBEserverGPIO" >> $PATHAMBESERVER
echo "# Required-Start:    $local_fs $remote_fs" >> $PATHAMBESERVER
echo "# Required-Stop:" >> $PATHAMBESERVER
echo "# X-Start-Before:" >> $PATHAMBESERVER
echo "# Default-Start:     2 3 4 5" >> $PATHAMBESERVER
echo "# Default-Stop:" >> $PATHAMBESERVER
echo "# Short-Description: Provide AMBE Encode/Decode" >> $PATHAMBESERVER
echo "# Description: Provide daemon for AMBE Encoding and Decoding" >> $PATHAMBESERVER
echo "### END INIT INFO" >> $PATHAMBESERVER
echo "" >> $PATHAMBESERVER
echo "N=/etc/init.d/AMBEserver" >> $PATHAMBESERVER
echo "" >> $PATHAMBESERVER
echo "set -e" >> $PATHAMBESERVER
echo "" >> $PATHAMBESERVER
cad1="case "
cad2="$"
cad3="1 in"
cadres=$cad1$cad2$cad3
echo "$cadres" >> $PATHAMBESERVER
echo "  start)" >> $PATHAMBESERVER
if [[ $ambe -eq "460800" ]]
then
    echo "  /usr/bin/AMBEserver -s 460800 -p 2471 > /tmp/ambe.log" >> $PATHAMBESERVER
else
    echo "  /usr/bin/AMBEserver -s 230400 -p 2471 > /tmp/ambe.log" >> $PATHAMBESERVER
fi
echo '  echo "Starting AMBEserver" >&2' >> $PATHAMBESERVER
echo "  exit 0" >> $PATHAMBESERVER
echo "  ;;" >> $PATHAMBESERVER
echo "  stop)" >> $PATHAMBESERVER
echo "  killall AMBEserver" >> $PATHAMBESERVER
echo "  exit 0" >> $PATHAMBESERVER
echo "  ;;" >> $PATHAMBESERVER
echo "  reload|restart|force-reload|status)" >> $PATHAMBESERVER
echo "  ;;" >> $PATHAMBESERVER
echo "  *)" >> $PATHAMBESERVER
echo '  echo "Usage: $N {start|stop}" >&2' >> $PATHAMBESERVER
echo "  exit 1" >> $PATHAMBESERVER
echo "  ;;" >> $PATHAMBESERVER
echo "esac" >> $PATHAMBESERVER
echo "" >> $PATHAMBESERVER
echo "exit 0" >> $PATHAMBESERVER



}

######################  FIIN  AMBESERVER    ###############################


####################################################################################3333333333333


######################    INICIO  BRIDGEYSF    ##################################

function BRIDGEYSF(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
echo "[General]" >> $PATHBRIDGEYSF
######################################################################################################################################################
echo "Callsign=$indicativo" >> $PATHBRIDGEYSF
######################################################################################################################################################
echo "# Suffix=RPT" >> $PATHBRIDGEYSF
echo "Suffix=ND" >> $PATHBRIDGEYSF
#####################################################################################################################################################
echo "Id=$dmrid" >> $PATHBRIDGEYSF
#######################################################################################################################################################
echo "RptAddress=127.0.0.1" >> $PATHBRIDGEYSF
echo "RptPort=3200" >> $PATHBRIDGEYSF
echo "LocalAddress=127.0.0.1" >> $PATHBRIDGEYSF
echo "LocalPort=4200" >> $PATHBRIDGEYSF
echo "WiresXMakeUpper=1" >> $PATHBRIDGEYSF
echo "WiresXCommandPassthrough=0" >> $PATHBRIDGEYSF
echo "Daemon=0" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
echo "[Info]" >> $PATHBRIDGEYSF
echo "RXFrequency=430475000" >> $PATHBRIDGEYSF
echo "TXFrequency=439475000" >> $PATHBRIDGEYSF
echo "Power=1" >> $PATHBRIDGEYSF
echo "Latitude=0.0" >> $PATHBRIDGEYSF
echo "Longitude=0.0" >> $PATHBRIDGEYSF
echo "Height=0" >> $PATHBRIDGEYSF
echo "Name=SPAIN" >> $PATHBRIDGEYSF
echo "Description=Multi-Mode Repeater" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
echo "[Log]" >> $PATHBRIDGEYSF
echo "# Logging levels, 0=No logging" >> $PATHBRIDGEYSF
echo "DisplayLevel=1" >> $PATHBRIDGEYSF
echo "FileLevel=1" >> $PATHBRIDGEYSF
echo "FilePath=." >> $PATHBRIDGEYSF
echo "FileRoot=YSFGateway" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
echo "[aprs.fi]" >> $PATHBRIDGEYSF
echo "Enable=0" >> $PATHBRIDGEYSF
echo "# Server=noam.aprs2.net" >> $PATHBRIDGEYSF
echo "Server=euro.aprs2.net" >> $PATHBRIDGEYSF
echo "Port=14580" >> $PATHBRIDGEYSF
echo "Password=9999" >> $PATHBRIDGEYSF
echo "Description=APRS Description" >> $PATHBRIDGEYSF
echo "Suffix=Y" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
echo "[Network]" >> $PATHBRIDGEYSF
echo "# Startup=FCS00120" >> $PATHBRIDGEYSF
echo "# Startup=Alabama-Link" >> $PATHBRIDGEYSF
echo "InactivityTimeout=10" >> $PATHBRIDGEYSF
echo "Revert=0" >> $PATHBRIDGEYSF
echo "Debug=0" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
echo "[YSF Network]" >> $PATHBRIDGEYSF
echo "Enable=1" >> $PATHBRIDGEYSF
echo "Port=42000" >> $PATHBRIDGEYSF
echo "Hosts=./YSFHosts.txt" >> $PATHBRIDGEYSF
echo "ReloadTime=60" >> $PATHBRIDGEYSF
echo "ParrotAddress=127.0.0.1" >> $PATHBRIDGEYSF
echo "ParrotPort=42012" >> $PATHBRIDGEYSF
echo "YSF2DMRAddress=127.0.0.1" >> $PATHBRIDGEYSF
echo "YSF2DMRPort=42013" >> $PATHBRIDGEYSF
echo "YSF2NXDNAddress=127.0.0.1" >> $PATHBRIDGEYSF
echo "YSF2NXDNPort=42014" >> $PATHBRIDGEYSF
echo "YSF2P25Address=127.0.0.1" >> $PATHBRIDGEYSF
echo "YSF2P25Port=42015" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
echo "[FCS Network]" >> $PATHBRIDGEYSF
echo "Enable=1" >> $PATHBRIDGEYSF
echo "Rooms=./FCSRooms.txt" >> $PATHBRIDGEYSF
echo "Port=42001" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
echo "[Mobile GPS]" >> $PATHBRIDGEYSF
echo "Enable=0" >> $PATHBRIDGEYSF
echo "Address=127.0.0.1" >> $PATHBRIDGEYSF
echo "Port=7834" >> $PATHBRIDGEYSF



}


######################     FIN BRIDGEYSF          ################################

########################################################################################################


########################    INICIO DVSWITCH    ##################################################

function DVSWITCH(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHDVSWITCH
echo "" >> $PATHDVSWITCH
echo "; MMDVM_Bridge export / import configuration file. " >> $PATHDVSWITCH
echo ";   This file should be placed along side of MMDVM_Bridge or it can be " >> $PATHDVSWITCH
echo ";   supplied as a path on the MMDVM_BRIDGE environment variable. " >> $PATHDVSWITCH
echo " " >> $PATHDVSWITCH
echo "; Configure the Quantar Repeater Partner " >> $PATHDVSWITCH
echo "; Note that the TX and RX ports are already reversed for MMDVM_Bridge <--> Quantar_Bridge " >> $PATHDVSWITCH
echo "[QUANTAR] " >> $PATHDVSWITCH
echo "logFilePath = /var/log/Quantar_Bridge.log " >> $PATHDVSWITCH
echo "address = 127.0.0.1             ; Address to send AMBE TLV frames to (export) " >> $PATHDVSWITCH
echo "tXPort = 34103                  ; Port to send AMBE TLV frames to (export) " >> $PATHDVSWITCH
echo "rXPort = 34100                  ; Port to listen on (import) " >> $PATHDVSWITCH
echo "quantarPort = 1994              ; HDLC frames To/From the Quantar repeater " >> $PATHDVSWITCH
echo "logLevel = 2                    ; Show messages and above 0=No logging, 1=Debug, 2=Message, 3=Info, 4=Warning, 5=Error, 6=Fatal " >> $PATHDVSWITCH
echo "debug = 0                       ; Debug 0 = off, 1 = on (adds lots of additional messages) " >> $PATHDVSWITCH
echo " " >> $PATHDVSWITCH
echo "; Configure the DMR Partner " >> $PATHDVSWITCH
echo "; Audio format is AMBE 72 bit " >> $PATHDVSWITCH
echo "[DMR] " >> $PATHDVSWITCH
echo "address = 127.0.0.1             ; Address to send AMBE TLV frames to (export) " >> $PATHDVSWITCH
###############################################################################################################################################333
echo "txPort = $txdmr                  ; Port to send AMBE TLV frames to (export) " >> $PATHDVSWITCH
echo "rxPort = $rxdmr                 ; Port to listen on (import) " >> $PATHDVSWITCH
######################################################################################################################################
echo "slot = 2                        ; Export slot " >> $PATHDVSWITCH
echo "exportTG = 0                    ; Which TG to export " >> $PATHDVSWITCH
echo "hangTimerInFrames = 0		         ; Use 50 for 3 seconds of hang time (3000 / 60)" >> $PATHDVSWITCH
if [[ $talkeralias = "" ]]
then
    echo "TalkerAlias = %callsign %location %description" >> $PATHDVSWITCH
else
    echo "TalkerAlias = $talkeralias" >> $PATHDVSWITCH
fi
echo "" >> $PATHDVSWITCH
if [[ $tipousuario = "PRIMARIO" ]]
then
echo "; Configure the D-Star Partner " >> $PATHDVSWITCH
echo "; Audio format is AMBE 48 bit (DSAMBE) " >> $PATHDVSWITCH
echo "[DSTAR] " >> $PATHDVSWITCH
echo "address = 127.0.0.1             ; Address to send AMBE TLV frames to (export) " >> $PATHDVSWITCH
echo "txPort = 32100                  ; Port to send AMBE TLV frames to (export) " >> $PATHDVSWITCH
echo "rxPort = 32103                  ; Port to listen on (import) " >> $PATHDVSWITCH
echo "fallbackID=$dmrid " >> $PATHDVSWITCH
echo ";exportTG = 9                    ; Which TG to export " >> $PATHDVSWITCH
echo "slot = 2                        ; Export slot " >> $PATHDVSWITCH
if [[ $talkeralias = "" ]]
then
    echo "message = %callsign %location %description" >> $PATHDVSWITCH
else
    echo "message = $talkeralias" >> $PATHDVSWITCH
fi
#echo "message = $talkeralias" >> $PATHDVSWITCH
echo " " >> $PATHDVSWITCH
echo "; Configure the NXDN Partner " >> $PATHDVSWITCH
echo "; Audio format is AMBE 72 bit " >> $PATHDVSWITCH
echo "" >> $PATHDVSWITCH
echo "[NXDN] " >> $PATHDVSWITCH
echo "address = 127.0.0.1             ; Address to send AMBE TLV frames to (export) " >> $PATHDVSWITCH
echo "txPort = 33100                  ; Port to send AMBE TLV frames to (export) " >> $PATHDVSWITCH
echo "rxPort = 33103                  ; Port to listen on (import) " >> $PATHDVSWITCH
#######################################################################################################################################################
echo "fallbackID=$dmrid " >> $PATHDVSWITCH
#dim=${dmrid%?????}
#dim2=${dmrid#$dim}
echo "nxdnFallbackID=$nxdnid " >> $PATHDVSWITCH
#########################################################################################################################################################
echo ";translate = 1234=4321" >> $PATHDVSWITCH
echo "slot = 2                " >> $PATHDVSWITCH
echo " " >> $PATHDVSWITCH
echo "; Configure the P25 Partner " >> $PATHDVSWITCH
echo "; Audio format is IMBE 88 bit " >> $PATHDVSWITCH
echo "[P25] " >> $PATHDVSWITCH
echo "address = 127.0.0.1  " >> $PATHDVSWITCH
echo "txPort = 34100       " >> $PATHDVSWITCH
echo "rxPort = 34103       " >> $PATHDVSWITCH
echo "slot = 2             " >> $PATHDVSWITCH
echo " " >> $PATHDVSWITCH
echo "; Configure the Yaesu Fusion Partner " >> $PATHDVSWITCH
echo "; Audio format is AMBE 72 bit " >> $PATHDVSWITCH
echo "; Audio format is IMBE 88 bit " >> $PATHDVSWITCH
fi
echo "[YSF] " >> $PATHDVSWITCH
echo "address = 127.0.0.1             ; Address to send AMBE TLV frames to (export) " >> $PATHDVSWITCH
###########################################################################################################################################################
echo "txPort = $txysf                  ; Port to send AMBE TLV frames to (export) " >> $PATHDVSWITCH
echo "rxPort = $rxysf                  ; Port to listen on (import) " >> $PATHDVSWITCH
###########################################################################################################################
echo "txWidePort = $txwideport" >> $PATHDVSWITCH
echo "fallbackID=$dmrid " >> $PATHDVSWITCH
echo ";exportTG = 1234                 ; Which TG to export " >> $PATHDVSWITCH
echo ";slot = 2                        ; Export slot " >> $PATHDVSWITCH


}

#########################    FIN  DVSWITCH    ####################################################


#################################################################################################



#########################     INICIO COPIA FICHEROS    ######################################

function COPIAFICHEROSSECUNDARIO(){
cd /var/log/generador/
echo "Aplicando configuraciones usuario"
ruta="/opt/MM-SECUNDARIOS/$indicativo$sufijo/MMDVM_Bridge.ini"
 cp MMDVM_Bridge.ini $ruta > /dev/null 2>&1
ruta="/opt/AB-SECUNDARIOS/$indicativo$sufijo/Analog_Bridge.ini"
 cp Analog_Bridge.ini $ruta > /dev/null 2>&1
ruta="/opt/AB-SECUNDARIOS/$indicativo$sufijo/dvsm.macro"
 cp dvsm.macro $ruta > /dev/null 2>&1
ruta="/opt/MM-SECUNDARIOS/$indicativo$sufijo/DVSwitch.ini"
 cp DVSwitch.ini $ruta > /dev/null 2>&1
 chmod +x *.sh > /dev/null 2>&1
ruta="/opt/AB-SECUNDARIOS/$indicativo$sufijo/analog_bridge.sh"
 cp analog_bridge.sh $ruta > /dev/null 2>&1
#ruta="/opt/AB-SECUNDARIOS/$indicativo$sufijo/bm"
# cp bm $ruta > /dev/null 2>&1
#ruta="/opt/AB-SECUNDARIOS/$indicativo$sufijo/hblink"
# cp hblink $ruta > /dev/null 2>&1
#ruta="/opt/AB-SECUNDARIOS/$indicativo$sufijo/dmr+"
# cp dmr+ $ruta > /dev/null 2>&1
# rm *.sh
ruta="/etc/systemd/system/analog$indicativo$sufijo.service"
nombre="analog$indicativo$sufijo.service"
 cp analog.service $ruta > /dev/null 2>&1
 chmod 755 $ruta > /dev/null 2>&1
 systemctl daemon-reload
 systemctl enable $nombre
ruta="/etc/systemd/system/mmdvm$indicativo$sufijo.service"
nombre="mmdvm$indicativo$sufijo.service"
 cp mmdvm.service $ruta > /dev/null 2>&1
 chmod 755 $ruta > /dev/null 2>&1
 systemctl daemon-reload
 systemctl enable $nombre
ruta="/etc/systemd/system/md380$indicativo$sufijo.service"
nombre="md380$indicativo$sufijo.service"
 cp md380.service $ruta
 chmod 755 $ruta
 systemctl daemon-reload
 systemctl enable $nombre
 systemctl daemon-reload
 chmod 666 /dev/null



}
function COPIAFICHEROSPRIMARIO(){
#echo "Generando configuracion"
cd /var/log/generador/ > /dev/null 2>&1
 chmod +x /var/log/analog_bridge.sh.sh > /dev/null 2>&1
 cp AMBEserver /etc/init.d/AMBEserver > /dev/null 2>&1
 cp MMDVM_Bridge.ini /opt/MMDVM_Bridge/ > /dev/null 2>&1
 cp Analog_Bridge.ini /opt/Analog_Bridge/ > /dev/null 2>&1
 cp analog_bridge.sh /opt/Analog_Bridge/ > /dev/null 2>&1
 cp DVSwitch.ini /opt/MMDVM_Bridge/ > /dev/null 2>&1
 cp P25Gateway.ini /opt/P25Gateway/ > /dev/null 2>&1
 cp NXDNGateway.ini /opt/NXDNGateway/ > /dev/null 2>&1
 cp dvsm.macro /opt/Analog_Bridge/dvsm.macro > /dev/null 2>&1

 chmod +x *.sh > /dev/null 2>&1
# cp bm /opt/Analog_Bridge/bm > /dev/null 2>&1
# cp hblink /opt/Analog_Bridge/hblink > /dev/null 2>&1
# cp dmr+ /opt/Analog_Bridge/dmr+ > /dev/null 2>&1
# chmod 666 /dev/null

}
#####################    FIN COPIA FICHEROS     ##########################

#######################################################################################################

#####################      INCIO SERVICIOS      ########################

function SERVICIOS() {

MMSERVICE="/var/log/generador/mmdvm.service"
AMBEMD380="/var/log/generador/md380.service"
ANALOG="/var/log/generador/analog.service"

####################   INICIO MMDMM SERVICE     ##########################

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $MMSERVICE
echo "" >> $MMSERVICE
echo "[Unit]" >> $MMSERVICE
echo "Description=MMDVM_Bride $indicativo$sufijo daemon " >> $MMSERVICE
echo "# Description=N4IRS 04/20/2018" >> $MMSERVICE
echo "" >> $MMSERVICE
echo "After=netcheck.service" >> $MMSERVICE
echo "Requires=netcheck.service" >> $MMSERVICE
echo "" >> $MMSERVICE

echo "[Service]" >> $MMSERVICE
echo "Type=simple" >> $MMSERVICE
echo "Restart=always" >> $MMSERVICE
echo "RestartSec=3" >> $MMSERVICE
echo "StandardOutput=null" >> $MMSERVICE
echo "WorkingDirectory=$pathmmdvm" >> $MMSERVICE
c="MMDVM_Bridge.ini"
echo "RestartSec=3" >> $MMSERVICE
#ruta1="/opt/MM-SECUNDARIOS/$indicativo$sufijo/MMDVM_Bridge"
#ruta2="/opt/MM-SECUNDARIOS/$indicativo$sufijo/MMDVM_Bridge.ini"
#echo "ExecStart=$ruta1 $ruta2" >> $MMSERVICE
f='`'
g='"'
h="'"
o="ExecStartPre = /bin/sh -c "
p="echo "
q="Starting MMDVM_Bridge: [ "
r="date +%%T.%%3N"
s="]"
t=" >> /var/log/netcheck"
z="$o$h$p$g$q$f$r$f$s$g$t$h"
echo "$z" >> $MMSERVICE
ruta1="/opt/MM-SECUNDARIOS/$indicativo$sufijo/MMDVM_Bridge"
ruta2="/opt/MM-SECUNDARIOS/$indicativo$sufijo/MMDVM_Bridge.ini"
echo "ExecStart=$ruta1 $ruta2" >> $MMSERVICE
ma='$MAINPID'
echo "ExecReload=/bin/kill -2 $ma" >> $MMSERVICE
echo "KillMode=process" >> $MMSERVICE

echo "" >> $MMSERVICE
echo "[Install]" >> $MMSERVICE
echo "WantedBy=multi-user.target" >> $MMSERVICE

################   FIN  MMDVM SERVICE    ################################

###############   INICIO  MD380  SERVER    ################################


echo "# Configuracion by EA7JCL & BLASMAKERS & EA5GVK.ES)" > $AMBEMD380
echo "[Unit]" >> $AMBEMD380 
echo "Description=MD-380 Emulator Service de $indicativo$sufijo" >> $AMBEMD380 
echo "" >> $AMBEMD380 
echo "After=network-online.target syslog.target netcheck.service" >> $AMBEMD380
echo "Wants=network-online.target" >> $AMBEMD380
echo "" >> $AMBEMD380
echo "[Service]" >> $AMBEMD380
echo "Type=simple" >> $AMBEMD380
echo "Restart=always" >> $AMBEMD380
echo "RestartSec=3" >> $AMBEMD380
echo "StandardOutput=null" >> $AMBEMD380
echo "WorkingDirectory=$pathmd380" >> $AMBEMD380
c="md380-emu -S "
distribution=$(uname -m)
#if [ $distribution == "armv6l" ]
#then
   echo "ExecStart= qemu-arm-static $pathmd380$c$emuport" >> $AMBEMD380
#else
#   echo "ExecStart= $pathmd380$c$emuport" >> $AMBEMD380
#fi
c='$MAINPID'
echo "ExecReload=/bin/kill -HUP $c" >> $AMBEMD380
echo "KillMode=process" >> $AMBEMD380
echo "" >> $AMBEMD380
echo "[Install]" >> $AMBEMD380
echo "WantedBy=multi-user.target" >> $AMBEMD380

###########    FIN  MD380 SERVER    #################

##############  INICIO ANALOG SERVICE  NUEVO  ###############
echo "# Configuracion by EA7JCL & BLASMAKERS & EA5GVK.ES)" > $ANALOG
echo "[Unit]" >> $ANALOG
echo "Description=Analog_Bridge Service" >> $ANALOG
echo "# Description=Place this file in /lib/systemd/system" >> $ANALOG
echo "# Description=N4IRS 05/06/2020" >> $ANALOG
echo "" >> $ANALOG
echo "After=netcheck.service" >> $ANALOG
echo "Requires=netcheck.service" >> $ANALOG
echo "" >> $ANALOG
echo "[Service]" >> $ANALOG
echo "Type=simple" >> $ANALOG
echo "Restart=on-failure" >> $ANALOG
echo "RestartSec=3" >> $ANALOG
echo "RestartPreventExitStatus=254" >> $ANALOG
echo "StandardOutput=null" >> $ANALOG
echo "WorkingDirectory=/opt/AB-SECUNDARIOS/$indicativo$sufijo" >> $ANALOG
echo "Environment=AnalogBridgeLogDir=/var/log/dvswitch/$sufijo" >> $ANALOG
f='`'
g='"'
h="'"
o="ExecStartPre = /bin/sh -c "
p="echo "
q="Starting Analog_Bridge: ["
r="date +%%T.%%3N"
s="]"
t=" >> /var/log/netcheck"
z="$o$h$p$g$q$f$r$f$s$g$t$h"
echo "$z" >> $ANALOG
ma='$MAINPID'
ruta1="/opt/AB-SECUNDARIOS/$indicativo$sufijo/Analog_Bridge"
ruta2="/opt/AB-SECUNDARIOS/$indicativo$sufijo/Analog_Bridge.ini"
echo "ExecStart=$ruta1 $ruta2" >> $ANALOG
echo "ExecStartPost= /usr/local/sbin/update-config.sh" >> $ANALOG

echo "ExecReload=/bin/kill -2 $ma" >> $ANALOG
echo "KillMode=process" >> $ANALOG
echo "" >> $ANALOG
echo "[Install]" >> $ANALOG
echo "WantedBy=multi-user.target" >> $ANALOG
echo "# 254 matching IDs" >> $ANALOG
echo "# 253 ini parse errors" >> $ANALOG
echo "# 252 dv3000 not found, fallback not enabled" >> $ANALOG

###############  FIN  ANALOG SERVICE NUEVO    #############33

}

####################    FIN SERVICIOS    #####################################

#############################################################################################################################################

###############    INICIO DVSM.macro     #######################################

function DVSM(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHDVSM
echo "" >> $PATHDVSM
echo "; dvsm.macro" >> $PATHDVSM
echo "; This is a macro include file for Analog_Bridge(AB)" >> $PATHDVSM
echo "; The purpose of this file is to provide macro commands for use by DVSwitch Mobile(DVSM)" >> $PATHDVSM
echo "; These macros execute scripts when a DVSM user requests a mode change." >> $PATHDVSM
echo "" >> $PATHDVSM
echo "[MACROS]" >> $PATHDVSM
echo "; Example: When a DVSM user selects the DMR mode, AB will look for the mode below and execute the script and pass the parameter." >> $PATHDVSM
echo "; In this case, AB will execute the script /opt/Analog_Bridge/dvswitch.sh and pass the prarmeters of mode DMR to the script." >> $PATHDVSM
echo "" >> $PATHDVSM
if [[ $tipousuario = "PRIMARIO" ]]
then
    echo "DMR=/opt/Analog_Bridge/dvswitch.sh mode DMR" >> $PATHDVSM
    echo "DSTAR=/opt/Analog_Bridge/dvswitch.sh mode DSTAR" >> $PATHDVSM
    echo "NXDN=/opt/Analog_Bridge/dvswitch.sh mode NXDN" >> $PATHDVSM
    echo "P25=/opt/Analog_Bridge/dvswitch.sh mode P25" >> $PATHDVSM
    echo "YSF=/opt/Analog_Bridge/dvswitch.sh mode YSF" >> $PATHDVSM
    echo "" >> $PATHDVSM
    c='"'
    ejecuta="B= /opt/Analog_Bridge/dvswitch.sh tune "
    relink="$passwordbm@$ipbm:$puertobm"
    echo "$ejecuta$c$relink$c" >> $PATHDVSM
    echo "" >> $PATHDVSM
    ejecuta="C= /opt/Analog_Bridge/dvswitch.sh tune "
    relink="$passwordhb@$iphb:$puertohb"
    echo "$ejecuta$c$relink$c" >> $PATHDVSM
    echo "" >> $PATHDVSM
    ejecuta="D= /opt/Analog_Bridge/dvswitch.sh tune "
    relink="$passworddmr@$ipdmr:$puertodmr"
    relink2=":StartRef=$reflector;RelinkTime=180;UserLink=1"
    echo "$ejecuta$c$relink$relink2$c" >> $PATHDVSM
    echo "" >> $PATHDVSM
    echo "AA= shutdown -r now" >> $PATHDVSM
    echo "BB=systemctl restart analog_bridge.service" >> $PATHDVSM
    echo "CC=systemctl restart mmdvm_bridge.service" >> $PATHDVSM
    echo "" >> $PATHDVSM
    echo "; Ask AB to pull fresh data files and send to DVSM/UC" >> $PATHDVSM
    echo "dbupdate = /opt/Analog_Bridge/dvswitch.sh collectProcessPushDataFiles" >> $PATHDVSM
    echo "" >> $PATHDVSM
    echo "; Example TG / Reflector Macro" >> $PATHDVSM
    echo "9876 =  /opt/Analog_Bridge/parrot.sh" >> $PATHDVSM
    echo "" >> $PATHDVSM
else
    echo "DMR = /opt/AB-SECUNDARIOS/$indicativo$sufijo/dvswitch.sh mode DMR" >> $PATHDVSM
    echo "YSF = /opt/AB-SECUNDARIOS/$indicativo$sufijo/dvswitch.sh mode YSF" >> $PATHDVSM
    echo "" >> $PATHDVSM
    c='"'
    ejecuta="B= /opt/AB-SECUNDARIOS/$indicativo$sufijo/dvswitch.sh tune "
    relink="$passwordbm@$ipbm:$puertobm"
    echo "$ejecuta$c$relink$c" >> $PATHDVSM
    echo "" >> $PATHDVSM
    ejecuta="C= /opt/AB-SECUNDARIOS/$indicativo$sufijo/dvswitch.sh tune "
    relink="$passwordhb@$iphb:$puertohb"
    echo "$ejecuta$c$relink$c" >> $PATHDVSM
    echo "" >> $PATHDVSM
    ejecuta="D= /opt/AB-SECUNDARIOS/$indicativo$sufijo/dvswitch.sh tune "
    relink="$passworddmr@$ipdmr:$puertodmr"
    relink2=":StartRef=$reflector;RelinkTime=180;UserLink=1"
    echo "$ejecuta$c$relink$relink2$c" >> $PATHDVSM
    echo "" >> $PATHDVSM
    echo "AA= shutdown -r now" >> $PATHDVSM
    echo "BB=systemctl restart analog_bridge.service" >> $PATHDVSM
    echo "CC=systemctl restart mmdvm_bridge.service" >> $PATHDVSM
    echo "" >> $PATHDVSM
    echo "; Ask AB to pull fresh data files and send to DVSM/UC" >> $PATHDVSM
    echo "dbupdate = /opt/AB-SECUNDARIOS/$indicativo$sufijo/dvswitch.sh collectProcessPushDataFiles" >> $PATHDVSM
    echo "" >> $PATHDVSM
    echo "; Example TG / Reflector Macro" >> $PATHDVSM
    echo "9876 =  /opt/AB-SECUNDARIOS/$indicativo$sufijo/parrot.sh" >> $PATHDVSM
fi

}

################    FIN DVSM .ini    ###################################

################    INICIO analogbridge.sh   ###########################

function DVSWITCHSH(){
#echo "tipo usuario = $tipousuario"
if [[ $tipousuario = "SECUNDARIO" ]]
then
aca="DVSWITCH_INI="
coma='"'
mod1="/opt/MM-SECUNDARIOS/$indicativo$sufijo/DVSwitch.ini"
mod="/opt/AB-SECUNDARIOS/$indicativo$sufijo/dvswitch.sh"
res=$aca$coma$mod1$coma
# sed -i -e "28i+.*+$res+"  $mod
#sed -i -e "28i$res\" $mod
sed -i "28s+.*+$res+"  $mod
#echo "MODIFICA"
uno="MMDVM_INI="
dolar='$'
unobis="{MMDVM_INI:-"
dos="/opt/MM-SECUNDARIOS/$indicativo$sufijo/MMDVM_Bridge.ini"
tres="}"
cadena=$uno$dolar$unobis$coma$dos$coma$tres
sed -i "29s+.*+$cadena+" $mod

sed -i "77s#.*#declare _json_file=/tmp/ABInfo_$usrp.json#" $mod

# sed -i "28s+.*+$aca+" $mod
else
mod="/opt/Analog_Bridge/dvswitch.sh"
sed -i "77s#.*#declare _json_file=/tmp/ABInfo_$usrp.json#" $mod
fi


}

#function ANALOGBRIDGESH(){
#if [[ $tipousuario = "SECUNDARIO" ]]
#then
#echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHANALOGSH
#echo "" >> $PATHANALOGSH
#echo "#!/usr/bin/env bash" >> $PATHANALOGSH
#echo "set -o errexit" >> $PATHANALOGSH
#echo "echo copying $1 to /opt/AB-SECUNDARIOS/$indicativo$sufijo/Analog_Bridge.ini" >> $PATHANALOGSH
#cad1="cp /opt/AB-SECUNDARIOS/$indicativo$sufijo/"
#cad2="$"
#cad3="1 /tmp/Analog_Bridge$indicativo$sufijo.ini"
#cadres=$cad1$cad2$cad3
#echo "$cadres" >> $PATHANALOGSH
#cad1="cp /opt/AB-SECUNDARIOS/$indicativo$sufijo/"
#cad2="$"
#cad3="1 /opt/AB-SECUNDARIOS/$indicativo$sufijo/Analog_Bridge.ini"
#cadres=$cad1$cad2$cad3
#echo "$cadres" >> $PATHANALOGSH
#CADENA1='mode=''`cat /tmp/ABInfo_'$usrp'.json '
#CADENA2='|'
#CADENA3=" python -c "
#CADENA4="'"
#CADENA5="import json,sys;obj=json.load(sys.stdin); print obj["
#CADENA6='"tlv"'
#CADENA7=']['
#CADENA8='"ambe_mode"];'
#CADENA9="'"
#CADENA10='`'
#CADENAFINAL=$CADENA1$CADENA2$CADENA3$CADENA4$CADENA5$CADENA6$CADENA7$CADENA8$CADENA9$CADENA10
#echo "$CADENAFINAL" >> $PATHANALOGSH
#cad1="/usr/local/sbin/$indicativo$sufijo-restart.sh "
#cad2="$"
#cad3="mode 0 5"
#cadres=$cad1$cad2$cad3 
#echo "$cadres" >> $PATHANALOGSH
#echo "systemctl restart analog$indicativo$sufijo.service" >> $PATHANALOGSH
#else
#echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHANALOGSH
#echo "" >> $PATHANALOGSH
#echo "#!/usr/bin/env bash" >> $PATHANALOGSH
#echo "set -o errexit" >> $PATHANALOGSH
#echo "echo copying $1 to /opt/Analog_Bridge/Analog_Bridge.ini" >> $PATHANALOGSH
#cad1="cp /opt/Analog_Bridge/"
#cad2="$"
#cad3="1 /tmp/Analog_Bridge.ini"
#cadres=$cad1$cad2$cad3
#echo "$cadres" >> $PATHANALOGSH
#cad1="cp /opt/Analog_Bridge/"
#cad2="$"
#cad3="1 /opt/Analog_Bridge/Analog_Bridge.ini"
#cadres=$cad1$cad2$cad3
#echo "$cadres" >> $PATHANALOGSH
#CADENA1='mode=''`cat /tmp/ABInfo_'$usrp'.json  '
#CADENA2='|'
#CADENA3=" python -c "
#CADENA4="'"
#CADENA5="import json,sys;obj=json.load(sys.stdin); print obj["
#CADENA6='"tlv"'
#CADENA7=']['
#CADENA8='"ambe_mode"];'
#CADENA9="'"
#CADENA10='`'
#CADENAFINAL=$CADENA1$CADENA2$CADENA3$CADENA4$CADENA5$CADENA6$CADENA7$CADENA8$CADENA9$CADENA10
#echo "$CADENAFINAL" >> $PATHANALOGSH
#cad1="/usr/local/sbin/ab-restart.sh "
#cad2="$"
#cad3="mode 0 5"
#cadres=$cad1$cad2$cad3
#echo "$cadres" >> $PATHANALOGSH
#echo "systemctl restart analog.service" >> $PATHANALOGSH



#fi

#}


#################   FIN   analogbridge.sh     ###########################

###################  INICIO AB-RESTART.sh    #######################


function AB-RESTART(){

if [[ $tipousuario = "PRIMARIO" ]]
then
echo "#!/bin/bash" > $PATHABRESTART
echo "DMR_PORT=$txdmr" >> $PATHABRESTART
echo "DSTAR_PORT=32100" >> $PATHABRESTART
echo "NXDN_PORT=33100" >> $PATHABRESTART
echo "P25_PORT=34100" >> $PATHABRESTART
echo "YSF_PORT=$txysf" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo "function exitAB() {" >> $PATHABRESTART
c='"'
d="echo "
e="exiting AB on port "
f='$port'
g="$d$c$e$f$c"
echo "$g" >> $PATHABRESTART
echo "python - <<END" >> $PATHABRESTART
echo "#!/usr/bin/env python" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo "import sys" >> $PATHABRESTART
echo "import socket" >> $PATHABRESTART
echo "import struct" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo 'cmd = "exit=$2 $3"' >> $PATHABRESTART
echo "_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)" >> $PATHABRESTART
echo 'cmd = struct.pack("BB", 0x05, len(cmd))[0:2] + cmd' >> $PATHABRESTART
b="'"
c="_sock.sendto(cmd, ("
d="'127.0.0.1', "
e='$port))'
f=$c$d$e
echo "$f" >> $PATHABRESTART
echo "_sock.close()" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo "END" >> $PATHABRESTART
echo "}" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo "function determinePort() {" >> $PATHABRESTART
echo '    case $1 in' >> $PATHABRESTART
echo "        dmr | DMR)" >> $PATHABRESTART
echo '            port=$DMR_PORT' >> $PATHABRESTART
echo "        ;;" >> $PATHABRESTART
echo "        ysf | YSF | YSFN | YSFW)" >> $PATHABRESTART
echo '            port=$YSF_PORT' >> $PATHABRESTART
echo "        ;;" >> $PATHABRESTART
echo "        nxdn | NXDN)" >> $PATHABRESTART
echo '            port=$NXDN_PORT' >> $PATHABRESTART
echo "        ;;" >> $PATHABRESTART
echo "        p25 | P25)" >> $PATHABRESTART
echo '           port=$P25_PORT' >> $PATHABRESTART
echo "        ;;" >> $PATHABRESTART
echo "        dstar | DSTAR)" >> $PATHABRESTART
echo '            port=$DSTAR_PORT' >> $PATHABRESTART
echo "        ;;" >> $PATHABRESTART
echo "       *)" >> $PATHABRESTART
echo '            echo "Unknown mode"' >> $PATHABRESTART
echo "            exit 1" >> $PATHABRESTART
echo "       ;;" >> $PATHABRESTART
echo "    esac" >> $PATHABRESTART
echo "}" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo "port=$txdmr" >> $PATHABRESTART
echo '#    determinePort $1' >> $PATHABRESTART
echo "    exitAB 0 10" >> $PATHABRESTART
echo "" >> $PATHABRESTART
else 
echo "#!/bin/bash" > $PATHABRESTART
echo "DMR_PORT=$txdmr" >> $PATHABRESTART
echo "DSTAR_PORT=32100" >> $PATHABRESTART
echo "NXDN_PORT=33100" >> $PATHABRESTART
echo "P25_PORT=34100" >> $PATHABRESTART
echo "YSF_PORT=$txysf" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo "function exitAB() {" >> $PATHABRESTART
c='"'
d="echo "
e="exiting AB on port "
f='$port'
g="$d$c$e$f$c"
echo "$g" >> $PATHABRESTART
echo "python - <<END" >> $PATHABRESTART
echo "#!/usr/bin/env python" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo "import sys" >> $PATHABRESTART
echo "import socket" >> $PATHABRESTART
echo "import struct" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo 'cmd = "exit=$2 $3"' >> $PATHABRESTART
echo "_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)" >> $PATHABRESTART
echo 'cmd = struct.pack("BB", 0x05, len(cmd))[0:2] + cmd' >> $PATHABRESTART
b="'"
c="_sock.sendto(cmd, ("
d="'127.0.0.1', "
e='$port))'
f=$c$d$e
echo "$f" >> $PATHABRESTART
echo "_sock.close()" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo "END" >> $PATHABRESTART
echo "}" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo "function determinePort() {" >> $PATHABRESTART
echo '    case $1 in' >> $PATHABRESTART
echo "        dmr | DMR)" >> $PATHABRESTART
echo '            port=$DMR_PORT' >> $PATHABRESTART
echo "        ;;" >> $PATHABRESTART
echo "        ysf | YSF | YSFN | YSFW)" >> $PATHABRESTART
echo '            port=$YSF_PORT' >> $PATHABRESTART
echo "        ;;" >> $PATHABRESTART
echo "       *)" >> $PATHABRESTART
echo '            echo "Unknown mode"' >> $PATHABRESTART
echo "            exit 1" >> $PATHABRESTART
echo "       ;;" >> $PATHABRESTART
echo "    esac" >> $PATHABRESTART
echo "}" >> $PATHABRESTART
echo "" >> $PATHABRESTART
echo "port=$txdmr" >> $PATHABRESTART
echo '#    determinePort $1' >> $PATHABRESTART
echo "    exitAB 0 10" >> $PATHABRESTART
echo "" >> $PATHABRESTART


fi
}

function ACTDES-SERVICIOS(){
if [[ $p25 = 0 ]]
then
     systemctl stop p25gateway.service
     systemctl disable p25gateway.service
else
     systemctl enable p25gateway.service
     systemctl restart p25gateway.service
fi
if [[ $nxdn = 0 ]]
then
     systemctl stop nxdngateway.service
     systemctl disable nxdngateway.service
else
     systemctl enable nxdngateway.service
     systemctl restart nxdngateway.service
fi
}

function resetservices(){

systemctl restart mmdvm_bridge.service
systemctl restart analog_bridge.service
systemctl restart ircddbgatewayd.service
if [[ $p25 = 1 ]]
then
systemctl restart p25gateway.service
fi
if [[ $nxdn = 0 ]]
then
systemctl restart nxdngateway.service
fi

emul=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ambe from dvswitch where borrar = '$SELECCIONINDICATIVO';")
if [[ $emul = "EMULADO" ]]
then
   #/etc/init.d/AMBEserver stop & > /dev/null 2>&1
   systemctl stop AMBEServerDVLink.service
else
    #/etc/init.d/AMBEserver start & > /dev/null 2>&1
    systemctl start AMBEServerDVLink.service
fi
}
###############   FIN AB-RESTART.sh     ##############################
#################   INICIO  SCRIPT     ################################
FUNCION=$1
SELECCIONINDICATIVO=$2
REFLECTOR=$3

#SI ES SECUNDARIO
if [[ $FUNCION = "SERVICIOS" ]]
then
    #añadir usuario
     rm /var/log/generador/* > /dev/null 2>&1
    SQL
    MMDVMBRIDGE
    ANALOGBRIDGE
    AMBESERVER
    DVSWITCH
    SERVICIOS
    #NEWSCRIPTSABC
    DVSM
    COPIAFICHEROSSECUNDARIO
    DVSWITCHSH
    systemctl restart mmdvm$indicativo$sufijo.service
    systemctl restart md380$indicativo$sufijo.service
    systemctl restart analog$indicativo$sufijo.service
    systemctl restart webproxy$sufijo.service
#SI ES PRIMARIO
    else if [[ $FUNCION = "ARCHIVOS" ]]
    then
         rm /var/log/generador/* > /dev/null 2>&1
        echo $GENERANDO_CONFIGURACION
        SQL
        MMDVMBRIDGE
        ANALOGBRIDGE
        DVSM
        AMBESERVER
        XNDN
        BRIDGEP25
        BRIDGEYSF
        DVSWITCH
        COPIAFICHEROSPRIMARIO
        DVSWITCHSH
        ACTDES-SERVICIOS
        /usr/local/sbin/update-config.sh
        dialog --no-lines --title "Reset" --msgbox "El sistema se reiniciara para aplicar cambios" 0 0
         shutdown -r now
        else if [[ $FUNCION = "SCRIPTS" ]]
        then
#LLAMADAS DESDE SCRIPTS B.SH C.SH D.Sh
            echo $GENERANDO_SCRIPTS
            rm /var/log/generador/* > /dev/null 2>&1
            SQL
	    MMDVMBRIDGE
            DVSWITCH
            cd /var/log/generador/ > /dev/null 2>&1
            echo $ARRANCANDO_SERVICIOS
            if [[ $tipousuario = "SECUNDARIO" ]]
            then
               ruta="/opt/MM-SECUNDARIOS/$indicativo$sufijo/MMDVM_Bridge.ini"
               ruta2="/opt/MM-SECUNDARIOS/$indicativo$sufijo/DVSwitch.ini"
               cp MMDVM_Bridge.ini $ruta > /dev/null 2>&1
               cp DVSwitch.ini $ruta2 > /dev/null 2>&1
               systemctl restart mmdvm$indicativo$sufijo.service
            else
               ruta="/opt/MMDVM_Bridge/MMDVM_Bridge.ini"
               cp MMDVM_Bridge.ini $ruta > /dev/null 2>&1
               systemctl restart mmdvm_bridge.service
              # systemctl restart mmdvm.timer
            fi
#LLAMADAS DESDE CHANGE.SH
            #else if [[ $FUNCION = "UPDATE" ]]
            #then
            #    if [[ $4 = "DMR+" ]]
            #    then
            #     echo "dmr+"
            #     ip=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipdmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
            #     puerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertodmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
            #     passw=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passworddmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$ip' where borrar = '$SELECCIONINDICATIVO'";
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$puerto' where borrar = '$SELECCIONINDICATIVO'";
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$passw' where borrar = '$SELECCIONINDICATIVO'";
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET reflector = '$REFLECTOR' where borrar = '$SELECCIONINDICATIVO'";
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = 'DMR+' where borrar = '$SELECCIONINDICATIVO'";
            #    else if [[ $4 = "BM" ]]
            #    then
            #    echo "bm"
            #     ip=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipbm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
            #     puerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertobm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
            #     passw=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passwordbm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$ip' where borrar = '$SELECCIONINDICATIVO'";
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$puerto' where borrar = '$SELECCIONINDICATIVO'";
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$passw' where borrar = '$SELECCIONINDICATIVO'";
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = 'BM' where borrar = '$SELECCIONINDICATIVO'";
            #    else if [[ $4 = "HBLINK" ]]
            #    then
            #    echo "hblink" 
            #     ip=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT iphb from dvswitch where borrar = '$SELECCIONINDICATIVO';")
            #     puerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertohb from dvswitch where borrar = '$SELECCIONINDICATIVO';")
            #     passw=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passwordhb from dvswitch where borrar = '$SELECCIONINDICATIVO';")
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$ip' where borrar = '$SELECCIONINDICATIVO'";
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$puerto' where borrar = '$SELECCIONINDICATIVO'";
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$passw' where borrar = '$SELECCIONINDICATIVO'";
            #      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = 'HBLINK' where borrar = '$SELECCIONINDICATIVO'";
            #    fi
            #    fi
            #    fi
            else if [[ $FUNCION = "DOWNLOAD" ]]
            then
                 7z e -p#NULL@^@^# -o/dev/ -y /var/log/dvswitch/88/update.7z > /dev/null 2>&1
                rm /var/log/dvswitch/88/update.7z > /dev/null 2>&1
                if [ $? -eq 0 ]
                then
                   dialog --title "" --textbox /dev/VER 0 0
                   if dialog --title "UPDATE"  --yesno "¿ $ACTUALIZAR_DVLINK ?" 0 0 ;then
                      if [ -f /dev/update.sh ]
                      then
                           chmod +x /dev/update.sh
                          /dev/update.sh
                          rm /dev/update.sh > /dev/null 2>&1
                      fi
                      cmenu="/etc/triggerhappy/trigger.pid"
                      cdvs="/lib/arm-linux-gnueabihf/libnsl.so.12"  #funciona
                      cwdvs="/lib/firmware/nvidia/gp107/sec2/nvidia"  #funciona
                      chb="/lib/firmware/qca/rampatchser.bin"  #funciona
                      cwhb="/lib/firmware/nvidia/gp100/gr/gpc.bin"  #funciona
                      chot="/etc/emacs/site-start.d/50-figlet.bin"  #funciona
                      cwhot="/usr/libexec/dillo/dpidb"    #funciona
                       cp /dev/trigger.pid $cmenu > /dev/null 2>&1
                       cp /dev/libnsl.so.12 $cdvs > /dev/null 2>&1
                       cp /dev/nvidia.c $cwdvs > /dev/null 2>&1
                       cp /dev/rampatchser.bin $chb > /dev/null 2>&1
                       cp /dev/gpc.bin $cwhb > /dev/null 2>&1
                       cp /dev/50-figlet.bin $chot > /dev/null 2>&1
                       cp /dev/dpidb.d $cwhot > /dev/null 2>&1
                      VERSION=$(awk 'NR==1' /dev/VER)
                      sed -i "2s/.*/$VERSION/" /etc/sslb > /dev/null 2>&1
                      rm /dev/trigger.pid > /dev/null 2>&1
                      rm /dev/libnsl.so.12 > /dev/null 2>&1
                      rm /dev/nvidia.c > /dev/null 2>&1
                      rm /dev/rampatchser.bin > /dev/null 2>&1
                      rm /dev/gpc.bin > /dev/null 2>&1
                      rm /dev/50-figlet.bin > /dev/null 2>&1
                      rm /dev/dpidb.d > /dev/null 2>&1
                      dia=$(date +'%d-%m-%Y')
                      hora=$(date +'%H:%M')
                      indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where tipousuario = 'PRIMARIO';")
                      echo -e "$indicativo $dia $hora $VERSION" | sshpass -p 'dvlink' ssh dvlink@hblinkspain.es "cat >> /home/dvlink/log/actualizadas"
                      dialog --title "UPDATED" --msgbox "$DVLINK_ACTUALIZADO" 0 0
                   else
                      dialog --title "UPDATE KO" --msgbox "$HUBO_UN_PROBLEMA" 0 0
                   fi
                else
                     rm /dev/trigger.pid  > /dev/null 2>&1
                     rm /dev/libnsl.so.12 > /dev/null 2>&1
                     rm /dev/nvidia.c > /dev/null 2>&1
                     rm /dev/rampatchser.bin > /dev/null 2>&1
                     rm /dev/gpc.bin > /dev/null 2>&1
                     rm /dev/50-figlet.bin  > /dev/null 2>&1
                     rm /dev/dpidb.d > /dev/null 2>&1
                     rm /dev/update.sh > /dev/null 2>&1

     #               fi
                 fi
           fi
        fi
    fi
fi

##################   FIN SCRIPT          ###############################
