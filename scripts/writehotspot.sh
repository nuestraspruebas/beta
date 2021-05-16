#!/bin/bash
export NCURSES_NO_UTF8_ACS=1
USER=$(awk 'NR==1' /etc/sslb)
#VERSIONPI=$(awk 'NR==2' /etc/sslb)
#IDIOMA=$(awk 'NR==3' /etc/sslb)
source /usr/bin/activo
PATHDMRGATEWAY="/var/log/DMRGateway.ini"
PATHDMR2YSF="/var/log/DMR2YSF.ini"
PATHYSF2DMR="/var/log/YSF2DMR.ini"
PATHDMR2NXDN="/var/log/DMR2NXDN.ini"
PATHNXDN2DMR="/var/log/NXDN2DMR.ini"
PATHYSF2P25="/var/log/YSF2P25.ini"
PATHYSF2NXDN="/var/log/YSF2NXDN.ini"
PATHMMDVM="/var/log/MMDVM.ini"
PATHIRCDDBGATEWAY="/var/log/ircddbgatewayd"
PATHBRIDGENXDN="/var/log/NXDNGateway.ini"
PATHBRIDGEP25="/var/log/P25Gateway.ini"
PATHBRIDGEYSF="/var/log/YSFGateway.ini"
PATHBRIDGEDMR="/var/log/DMRGateway.ini"
#MMSERVICE="/var/log/MMDVMHOTSPOT-$NOMBRE.service"
#P25SERVICE="/var/log/P25GatewayHOTSPOT-$NOMBRE.service"
#NXDNSERVICE="/var/log/NXDNGatewayHOTSPOT-$NOMBRE.service"
#YSFSERVICE="/var/log/YSFGatewayHOTSPOT-$NOMBRE.service"
#DMRSERVICE="/var/log/DMRGatewayHOTSPOT-$NOMBRE.service"
#DMR2YSFSERVICE="/var/log/DMR2YSFHOTSPOT-$NOMBRE.service"
#YSF2DMRSERVICE="/var/log/YSF2DMRHOTSPOT-$NOMBRE.service"
#YSF2P25SERVICE="/var/log/YSF2P25HOTSPOT-$NOMBRE.service"
#DMR2NXDNSERVICE="/var/log/DMR2NXDNHOTSPOT-$NOMBRE.service"
#YSF2NXDNSERVICE="/var/log/YSF2NXDNHOTSPOT-$NOMBRE.service"
PATHAPRSGATEWAY="/var/log/APRSGateway.ini"
############ INICIO SQL   #####################################


function CALCULOPUERTOSGATEWAY(){
YSFPORT=$GATEWAYPORT
#
PARROTPORT=`expr $GATEWAYPORT + 1`
#
YSF2DMRPORT=`expr $PARROTPORT + 1`
#
YSF2NXDNPORT=`expr $YSF2DMRPORT + 1`
#
YSF2P25PORT=`expr $YSF2NXDNPORT + 1`
#
FCSPORT=`expr $YSF2P25PORT + 1`
#
NXDNPORT=`expr $FCSPORT + 1`
#
NXDNPARROTPORT=`expr $NXDNPORT + 1`
#
NXDN2DMRPORT=`expr $NXDNPARROTPORT + 1`
#
P25PORT=`expr $NXDN2DMRPORT + 1`
#
P25PARROTPORT=`expr $P25PORT + 1`

function SQL(){

dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrid from hot_conf_personal where nombre = '$NOMBRE';")
indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select indicativo from hot_conf_personal where nombre = '$NOMBRE';")
timeout=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select timeout from hot_modem where nombre = '$NOMBRE';")
duplex=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select duplex from hot_modem where nombre = '$NOMBRE';")
rfmodehang=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select rfmodehang from hot_modem where nombre = '$NOMBRE';")
netmodehang=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select netmodehang from hot_modem where nombre = '$NOMBRE';")
display=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select display from hotspot where nombre = '$NOMBRE';")
nextion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select nextion from hotspot where nombre = '$NOMBRE';")
oled=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select oled from hotspot where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frectx from hot_modem where nombre = '$NOMBRE';")
frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frecrx from hot_modem where nombre = '$NOMBRE';")
power=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select power from hot_modem where nombre = '$NOMBRE';")
latitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select latitude from hot_conf_personal where nombre = '$NOMBRE';")
longitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select longitude from hot_conf_personal where nombre = '$NOMBRE';")
height=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select height from hot_conf_personal where nombre = '$NOMBRE';")
location=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select location from hot_conf_personal where nombre = '$NOMBRE';")
description=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select description from hot_conf_personal where nombre = '$NOMBRE';")
url=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select url from hot_conf_personal where nombre = '$NOMBRE';")
cw=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cw from hotspot where nombre = '$NOMBRE';")
cwtime=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT cwtime from hot_CW where nombre = '$NOMBRE';")
devtty=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select devtty from hot_modem where nombre = '$NOMBRE';")
txinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select txinv from hot_modem where nombre = '$NOMBRE';")
rxinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select rxinv from hot_modem where nombre = '$NOMBRE';")
pttinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select pttinv from hot_modem where nombre = '$NOMBRE';")
rxoffset=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select rxoffset from hot_modem where nombre = '$NOMBRE';")
txoffset=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select txoffset from hot_modem where nombre = '$NOMBRE';")
rxlevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select rxlevel from hot_modem where nombre = '$NOMBRE';")
txlevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select txlevel from hot_modem where nombre = '$NOMBRE';")
rflevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select rflevel from hot_modem where nombre = '$NOMBRE';")
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstar from hotspot where nombre = '$NOMBRE';")
band=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT repeaterband from hot_IRC where nombre = '$NOMBRE';")
dmr2ysf=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr2ysf from hotspot where nombre = '$NOMBRE';")
ysf2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2dmr from hotspot where nombre = '$NOMBRE';")
ysf2p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2p25 from hotspot where nombre = '$NOMBRE';")
ysf2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2nxdn from hotspot where nombre = '$NOMBRE';")
dmr2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr2nxdn from hotspot where nombre = '$NOMBRE';")
nxdn2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdn2dmr from hotspot where nombre = '$NOMBRE';")
dmrgateway=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrgateway from hotspot where nombre = '$NOMBRE';")
dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr from hotspot where nombre = '$NOMBRE';")
dmrbeacon=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrbeacon from hot_DMR where nombre = '$NOMBRE';")
dmrbeaconinterval=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrbeaconinterval from hot_DMR where nombre = '$NOMBRE';")
dmrbeaconduracion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrbeaconduracion from hot_DMR where nombre = '$NOMBRE';")
dmrcolor=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrcolor from hot_DMR where nombre = '$NOMBRE';")
dmrselfonly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrselfonly from hot_DMR where nombre = '$NOMBRE';")
embeddedlconly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT embeddedlconly from hot_DMR where nombre = '$NOMBRE';")
fusionlowdeviation=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusionlowdeviation from hot_YSF where nombre = '$NOMBRE';")
fusionremotegateway=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusionrptport from hot_YSF where nombre = '$NOMBRE';")
p25selfonly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25selfonly from hot_P25 where nombre = '$NOMBRE';")
nxdnselfonly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnselfonly from hot_NXDN where nombre = '$NOMBRE';")
nxdnran=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnreflector from hot_NXDN where nombre = '$NOMBRE';")
rep=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstarplocal from hot_IRC where nombre = '$NOMBRE';")
dmrlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrlocalport from hot_DMR where nombre = '$NOMBRE';")
dmrpassword=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrpassword from hot_DMR where nombre = '$NOMBRE';")
dmroptions=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmroptions from hot_DMR where nombre = '$NOMBRE';")
dmrrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrrptport from hot_DMR where nombre = '$NOMBRE';")
p25rptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25rptport from hot_P25 where nombre = '$NOMBRE';")
p25localport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25localport from hot_P25 where nombre = '$NOMBRE';")
nxdnrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnrptport from hot_NXDN where nombre = '$NOMBRE';")
nxdnlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnlocalport from hot_NXDN where nombre = '$NOMBRE';")
nextionpuerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionpuerto from hot_nextion where nombre = '$NOMBRE';")
nextionbrillo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionbrillo from hot_nextion where nombre = '$NOMBRE';")
nextionclock=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionclock from hot_nextion where nombre = '$NOMBRE';")
nextionlayout=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionlayout from hot_nextion where nombre = '$NOMBRE';")
nextionutc=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionutc from hot_nextion where nombre = '$NOMBRE';")
nextionidlebrillo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionidlebrillo from hot_nextion where nombre = '$NOMBRE';")
oledtipo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledtipo from hot_oled where nombre = '$NOMBRE';")
oledbrillo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledbrillo from hot_oled where nombre = '$NOMBRE';")
oledinversion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledinversion from hot_oled where nombre = '$NOMBRE';")
oledscroll=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledscroll from hot_oled where nombre = '$NOMBRE';")
oledcast=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledcast from hot_oled where nombre = '$NOMBRE';")
oledlogo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledlogo from hot_oled where nombre = '$NOMBRE';")


band=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT repeaterband from hot_IRC where nombre = '$NOMBRE';")
rep=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT repeaterport from hot_IRC where nombre = '$NOMBRE';")



#options=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select options from hotspot where nombre = '$NOMBRE';")

}
###########  FIN  SQL  #########################################
################################################################################################333


############   INICIO DGID GATEWAY

function DGIDGATEWAY()
{

PATHDGIDGATEWAY="/var/log/DGIDGateway.ini"
indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select indicativo from hotspot where nombre = '$NOMBRE';")
dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrid from hot_conf_personal where nombre = '$NOMBRE';")
fusionlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGIDlocalport from hot_DGID where nombre = '$NOMBRE';")
fusionrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGIDrptport from hot_DGID where nombre = '$NOMBRE';")
echo "[General]" > $PATHDGIDGATEWAY
echo "Callsign=$indicativo" >> $PATHDGIDGATEWAY
echo "Suffix=RPT" >> $PATHDGIDGATEWAY
echo "# Suffix=ND" >> $PATHDGIDGATEWAY
echo "Id=$dmrid" >> $PATHDGIDGATEWAY
echo "RptAddress=127.0.0.1" >> $PATHDGIDGATEWAY
echo "RptPort=$fusionlocalport" >> $PATHDGIDGATEWAY

echo "LocalAddress=127.0.0.1" >> $PATHDGIDGATEWAY
echo "LocalPort=$fusionrptport" >> $PATHDGIDGATEWAY

echo "RFHangTime=120" >> $PATHDGIDGATEWAY
echo "NetHangTime=120" >> $PATHDGIDGATEWAY
echo "Bleep=1" >> $PATHDGIDGATEWAY
echo "Debug=0" >> $PATHDGIDGATEWAY
echo "Daemon=0" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY


frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frecrx from hot_conf_personal where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frectx from hot_conf_personal where nombre = '$NOMBRE';")
power=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select power from hot_conf_personal where nombre = '$NOMBRE';")
latitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select latitude from hot_conf_personal where nombre = '$NOMBRE';")
longitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select longitude from hot_conf_personal where nombre = '$NOMBRE';")
height=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select height from hot_conf_personal where nombre = '$NOMBRE';")
description=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select description from hot_conf_personal where nombre = '$NOMBRE';")

echo "[Info]" >> $PATHDGIDGATEWAY
echo "RXFrequency=$frecrx" >> $PATHDGIDGATEWAY
echo "TXFrequency=$frectx" >> $PATHDGIDGATEWAY
echo "Power=$power" >> $PATHDGIDGATEWAY
echo "Latitude=$latitude" >> $PATHDGIDGATEWAY
echo "Longitude=$longitude" >> $PATHDGIDGATEWAY
echo "Height=$height" >> $PATHDGIDGATEWAY
echo "Description=$description" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY

echo "[Log]" >> $PATHDGIDGATEWAY
echo "# Logging levels, 0=No logging" >> $PATHDGIDGATEWAY
echo "DisplayLevel=1" >> $PATHDGIDGATEWAY
echo "FileLevel=1" >> $PATHDGIDGATEWAY
echo "FilePath=." >> $PATHDGIDGATEWAY
echo "FileRoot=DGIdGateway" >> $PATHDGIDGATEWAY
echo "FileRotate=1" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY

aprs=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprs from hotspot where nombre = '$NOMBRE';")
aprslocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprslocalport from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprsdescripcion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprsdescripcion from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprssufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprssufijo from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
echo "[APRS]" >> $PATHDGIDGATEWAY
echo "Enable=$aprs" >> $PATHDGIDGATEWAY
echo "Address=127.0.0.1" >> $PATHDGIDGATEWAY
echo "Port=$aprslocalport" >> $PATHDGIDGATEWAY
echo "Description=$aprsdescripcion" >> $PATHDGIDGATEWAY
echo "Suffix=$aprssufijo" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY

echo "[YSF Network]" >> $PATHDGIDGATEWAY
echo "Hosts=./YSFHosts.txt" >> $PATHDGIDGATEWAY   #añadir a demonio reflectores
echo "RFHangTime=120" >> $PATHDGIDGATEWAY
echo "NetHangTime=60" >> $PATHDGIDGATEWAY
echo "Debug=0" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY

echo "[FCS Network]" >> $PATHDGIDGATEWAY
echo "RFHangTime=120" >> $PATHDGIDGATEWAY
echo "NetHangTime=60" >> $PATHDGIDGATEWAY
echo "Debug=0" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY

echo "[IMRS Network]" >> $PATHDGIDGATEWAY
echo "RFHangTime=240" >> $PATHDGIDGATEWAY
echo "NetHangTime=240" >> $PATHDGIDGATEWAY
echo "Debug=0" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY

DGIrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGIrptport from hot_DGID where nombre = '$NOMBRE';")
DGIDlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGIDlocalport from hot_DGID where nombre = '$NOMBRE';")
echo "[DGId=0]" >> $PATHDGIDGATEWAY
echo "# Local YSF Gateway, this must be DGId=0 for Wires-X to work." >> $PATHDGIDGATEWAY
echo "Type=Gateway" >> $PATHDGIDGATEWAY
echo "Static=1" >> $PATHDGIDGATEWAY
echo "Address=127.0.0.1" >> $PATHDGIDGATEWAY
echo "Port=$DGIrptport" >> $PATHDGIDGATEWAY
echo "Local=$DGIDlocalport" >> $PATHDGIDGATEWAY
echo "#RFHangTime=120" >> $PATHDGIDGATEWAY
echo "#NetHangTime=60" >> $PATHDGIDGATEWAY
echo "Debug=0" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY
##
#viene de ysfgateway para info de conexion
#echo "Startup=$fstartup" >> $PATHBRIDGEYSF
#echo "Options=$options" >> $PATHBRIDGEYSF
#echo "InactivityTimeout=$finactivity" >> $PATHBRIDGEYSF
#echo "Revert=$frevert" >> $PATHBRIDGEYSF
#echo "Debug=0" >> $PATHBRIDGEYSF

##  DGID 40
DGID_num2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_num2 from hot_DGID where nombre = '$NOMBRE';")
DGID_type2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_type2 from hot_DGID where nombre = '$NOMBRE';")
DGID_static2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_static2 from hot_DGID where nombre = '$NOMBRE';")
DGID_conectarcon2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_conectarcon2 from hot_DGID where nombre = '$NOMBRE';")
local2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select local2 from hot_DGID where nombre = '$NOMBRE';")

echo "[DGId=$DGID_num0]" >> $PATHDGIDGATEWAY    # numero que se le quiere asignar
echo "# YSF Reflector CQ-UK" >> $PATHDGIDGATEWAY
echo "Type=$DGID_type2" >> $PATHDGIDGATEWAY    #YSF o FCS
echo "Static=$DGID_static2" >> $PATHDGIDGATEWAY     #estatico SI NO
echo "Name=$DGID_conectarcon2" >> $PATHDGIDGATEWAY  #conectar con
echo "Local=$local2" >> $PATHDGIDGATEWAY
echo "#RFHangTime=120" >> $PATHDGIDGATEWAY
echo "#NetHangTime=60" >> $PATHDGIDGATEWAY
echo "Debug=0" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY

##  DGID 45
DGID_num3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_num3 from hot_DGID where nombre = '$NOMBRE';")
DGID_type3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_type3 from hot_DGID where nombre = '$NOMBRE';")
DGID_static3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_static3 from hot_DGID where nombre = '$NOMBRE';")
DGID_conectarcon3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_conectarcon3 from hot_DGID where nombre = '$NOMBRE';")
local3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select local3 from hot_DGID where nombre = '$NOMBRE';")
echo "[DGId=$DGID_num3]" >> $PATHDGIDGATEWAY
echo "# YSF Reflector Alabama-Link" >> $PATHDGIDGATEWAY
echo "Type=$DGID_type3" >> $PATHDGIDGATEWAY
echo "Static=$DGID_static3" >> $PATHDGIDGATEWAY
echo "Name=$DGID_conectarcon3" >> $PATHDGIDGATEWAY
echo "Local=$local3" >> $PATHDGIDGATEWAY
echo "#RFHangTime=120" >> $PATHDGIDGATEWAY
echo "#NetHangTime=60" >> $PATHDGIDGATEWAY
echo "Debug=0" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY

## DGID 50
DGID_num4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_num4 from hot_DGID where nombre = '$NOMBRE';")
DGID_type4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_type4 from hot_DGID where nombre = '$NOMBRE';")
DGID_static4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_static4 from hot_DGID where nombre = '$NOMBRE';")
DGID_conectarcon4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_conectarcon4 from hot_DGID where nombre = '$NOMBRE';")
local4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select local4 from hot_DGID where nombre = '$NOMBRE';")

echo "[DGId=$DGID_num4]" >> $PATHDGIDGATEWAY
echo "# FCS Reflector FCS004-20" >> $PATHDGIDGATEWAY
echo "Type=$DGID_type4" >> $PATHDGIDGATEWAY
echo "Static=$DGID_static4" >> $PATHDGIDGATEWAY
echo "Name=$DGID_conectarcon4" >> $PATHDGIDGATEWAY
echo "Local=$local4" >> $PATHDGIDGATEWAY
echo "#RFHangTime=120" >> $PATHDGIDGATEWAY
echo "#NetHangTime=60" >> $PATHDGIDGATEWAY
echo "Debug=0" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY

##  DGID 60
DGID_num5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_num5 from hot_DGID where nombre = '$NOMBRE';")
DGID_type5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_type5 from hot_DGID where nombre = '$NOMBRE';")
DGID_static5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_static5 from hot_DGID where nombre = '$NOMBRE';")
DGID_conectarcon5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select DGID_conectarcon5 from hot_DGID where nombre = '$NOMBRE';")
local5=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select local5 from hot_DGID where nombre = '$NOMBRE';")

echo "[DGId=$DGID_num5]" >> $PATHDGIDGATEWAY
echo "# FCS Reflector FCS004-20" >> $PATHDGIDGATEWAY
echo "Type=$DGID_type5" >> $PATHDGIDGATEWAY
echo "Static=$DGID_static5" >> $PATHDGIDGATEWAY
echo "Name=$DGID_conectarcon5" >> $PATHDGIDGATEWAY
echo "Local=$local5" >> $PATHDGIDGATEWAY
echo "#RFHangTime=120" >> $PATHDGIDGATEWAY
echo "#NetHangTime=60" >> $PATHDGIDGATEWAY
echo "Debug=0" >> $PATHDGIDGATEWAY
echo "" >> $PATHDGIDGATEWAY

echo "" >> $PATHDGIDGATEWAY
echo "[GPSD]" >> $PATHDGIDGATEWAY
echo "Enable=0" >> $PATHDGIDGATEWAY
echo "Address=127.0.0.1" >> $PATHDGIDGATEWAY
echo "Port=2947" >> $PATHDGIDGATEWAY

}
#############  FIN DGID GATEWAY


##############  INICIO  MMDVMHOST.INI   #######################
function MMDVMHOST(){
#band=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT repeaterband from hotspot where nombre = '$NOMBRE';")
#rep=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT repeaterport from hotspot where nombre = '$NOMBRE';")

# rm /home/$USER/mmdvmbridge.gen

indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select indicativo from hot_conf_personal where nombre = '$NOMBRE';")
dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrid from hot_conf_personal where nombre = '$NOMBRE';")
duplex=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select duplex from hot_modem where nombre = '$NOMBRE';")
timeout=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select timeout from hot_modem where nombre = '$NOMBRE';")
rfmodehang=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select rfmodehang from hot_conf_personal where nombre = '$NOMBRE';")
netmodehang=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select netmodehang from hot_conf_personal where nombre = '$NOMBRE';")
display=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT display from hotspot where nombre = '$NOMBRE';")
nextion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextion from hotspot where nombre = '$NOMBRE';")
oled=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oled from hotspot where nombre = '$NOMBRE';")

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[General]" >> $PATHMMDVM
###########################################################
echo "Callsign=$indicativo" >> $PATHMMDVM
echo "Id=$dmrid" >> $PATHMMDVM
############################################################
echo "Timeout=$timeout" >> $PATHMMDVM
echo "Duplex=$duplex" >> $PATHMMDVM
echo "# ModeHang=10" >> $PATHMMDVM
echo "RFModeHang=$rfmodehang" >> $PATHMMDVM
echo "NetModeHang=$netmodehang" >> $PATHMMDVM
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

if [[ $display = "1" ]]
then
   if [[ $nextion = "1" ]]
   then
      disp="Nextion"
      else if [[ $oled = "1" ]]
      then
          disp="OLED"
      else
          disp="None"
      fi
   fi
fi
echo "Display=$disp" >> $PATHMMDVM
echo "Daemon=0" >> $PATHMMDVM
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo "" >> $PATHMMDVM
############################################################
frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frecrx from hot_conf_personal where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frectx from hot_conf_personal where nombre = '$NOMBRE';")
power=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select power from hot_conf_personal where nombre = '$NOMBRE';")

echo "[Info]" >> $PATHMMDVM
echo "RXFrequency=$frecrx" >> $PATHMMDVM
echo "TXFrequency=$frectx" >> $PATHMMDVM
echo "Power=$power" >> $PATHMMDVM
#echo "Latitude=$latitude" >> $PATHMMDVM
#echo "Longitude=$longitude" >> $PATHMMDVM
#echo "Height=$height" >> $PATHMMDVM
#echo "Location=$location" >> $PATHMMDVM
#echo "Description=$description" >> $PATHMMDVM
#echo "URL=$url" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
echo "[Log]" >> $PATHMMDVM
echo "# Logging levels, 0=No logging, 1=Debug, 2=Message, 3=Info, 4=Warning, 5=Error, 6=Fatal" >> $PATHMMDVM
echo "DisplayLevel=1" >> $PATHMMDVM
echo "FileLevel=1" >> $PATHMMDVM
echo "FilePath=/var/log/hotspots" >> $PATHMMDVM
echo "FileRoot=MMDVM-$nombre" >> $PATHMMDVM
echo "FileRotate=1" >> $PATHMMDVM

echo "" >> $PATHMMDVM
############################################################
cw=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select cw from hotspot where nombre = '$NOMBRE';")
cwtime=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select cwtime from hot_CW where nombre = '$NOMBRE';")
cwindicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select cwindicativo from hot_CW where nombre = '$NOMBRE';")
echo "[CW Id]" >> $PATHMMDVM
echo "Enable=$cw" >> $PATHMMDVM
echo "Time=$cwtime" >> $PATHMMDVM
echo "Callsign=$indicativo" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
echo "[DMR Id Lookup]" >> $PATHMMDVM
echo "File=DMRIds.dat" >> $PATHMMDVM
echo "Time=24" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[NXDN Id Lookup]" >> $PATHMMDVM
echo "File=/var/lib/mmdvm/NXDN.csv" >> $PATHMMDVM
echo "Time=24" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################

devtty=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select devtty from hot_modem where nombre = '$NOMBRE';")
txinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select txinv from hot_modem where nombre = '$NOMBRE';")
rxinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select rxinv from hot_modem where nombre = '$NOMBRE';")
pttinv=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select pttinv from hot_modem where nombre = '$NOMBRE';")
rxoffset=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select rxoffset from hot_modem where nombre = '$NOMBRE';")
txoffset=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select txoffset from hot_modem where nombre = '$NOMBRE';")
rxlevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select rxlevel from hot_modem where nombre = '$NOMBRE';")
txlevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select txlevel from hot_modem where nombre = '$NOMBRE';")
rflevel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select rflevel from hot_modem where nombre = '$NOMBRE';")

echo "[Modem]" >> $PATHMMDVM
echo "Port=$devtty" >> $PATHMMDVM
echo "Protocol=uart" >> $PATHMMDVM
echo "# Address=0x22" >> $PATHMMDVM
echo "TXInvert=$txinv" >> $PATHMMDVM
echo "RXInvert=$rxinv" >> $PATHMMDVM
echo "PTTInvert=$pttinv" >> $PATHMMDVM
echo "TXDelay=0" >> $PATHMMDVM
echo "RXOffset=$rxoffset" >> $PATHMMDVM
echo "TXOffset=$txoffset" >> $PATHMMDVM
echo "DMRDelay=0" >> $PATHMMDVM
echo "RXLevel=$rxlevel" >> $PATHMMDVM
echo "TXLevel=$txlevel" >> $PATHMMDVM
echo "RXDCOffset=0" >> $PATHMMDVM
echo "TXDCOffset=0" >> $PATHMMDVM
echo "RFLevel=$rflevel" >> $PATHMMDVM
echo "# CWIdTXLevel=50" >> $PATHMMDVM
echo "# D-StarTXLevel=50" >> $PATHMMDVM
echo "# DMRTXLevel=50" >> $PATHMMDVM
echo "# YSFTXLevel=50" >> $PATHMMDVM
echo "# P25TXLevel=50" >> $PATHMMDVM
echo "# NXDNTXLevel=50" >> $PATHMMDVM
echo "# POCSAGTXLevel=50" >> $PATHMMDVM
echo "# FMTXLevel=50" >> $PATHMMDVM
echo "RSSIMappingFile=RSSI.dat" >> $PATHMMDVM
echo "UseCOSAsLockout=0" >> $PATHMMDVM     # A 1 cuando activas FM
echo "Trace=0" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[Transparent Data]" >> $PATHMMDVM
echo "Enable=0" >> $PATHMMDVM
echo "RemoteAddress=127.0.0.1" >> $PATHMMDVM
echo "RemotePort=40094" >> $PATHMMDVM
echo "LocalPort=40095" >> $PATHMMDVM
echo "# SendFrameType=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
echo "[UMP]" >> $PATHMMDVM
echo "Enable=0" >> $PATHMMDVM
echo "# Port=\\.\COM4" >> $PATHMMDVM
echo "Port=/dev/ttyACM1" >> $PATHMMDVM

############################################################    REVISAR IRCDDBAGATEWAY !!!!!!!
echo "" >> $PATHMMDVM
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstar from hotspot where nombre = '$NOMBRE';")
repeaterband=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select repeaterband from hotspot where nombre = '$NOMBRE';")
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstar from hotspot where nombre = '$NOMBRE';")
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstar from hotspot where nombre = '$NOMBRE';")
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstar from hotspot where nombre = '$NOMBRE';")
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstar from hotspot where nombre = '$NOMBRE';")
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstar from hotspot where nombre = '$NOMBRE';")

echo "[D-Star]" >> $PATHMMDVM
echo "Enable=$dstar" >> $PATHMMDVM
echo "Module=$band" >> $PATHMMDVM
#echo "SelfOnly=$dstarselfonly" >> $PATHMMDVM
echo "SelfOnly=0" >> $PATHMMDVM
echo "AckReply=1" >> $PATHMMDVM
echo "AckTime=750" >> $PATHMMDVM
echo "AckMessage=0" >> $PATHMMDVM
echo "ErrorReply=1" >> $PATHMMDVM
echo "RemoteGateway=0" >> $PATHMMDVM
echo "# ModeHang=10" >> $PATHMMDVM
echo "WhiteList=" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################

dmr2ysf=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmr2ysf from hotspot where nombre = '$NOMBRE';")
ysf2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2dmr from hotspot where nombre = '$NOMBRE';")
ysf2p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2p25 from hotspot where nombre = '$NOMBRE';")
ysf2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2nxdn from hotspot where nombre = '$NOMBRE';")
dmr2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmr2nxdn from hotspot where nombre = '$NOMBRE';")
nxdn2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select nxdn2dmr from hotspot where nombre = '$NOMBRE';")
dmrgateway=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrgateway from hotspot where nombre = '$NOMBRE';")
dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmr from hotspot where nombre = '$NOMBRE';")
dmrlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select cross_DMR_localport from hot_CROSSLINKS where nombre = '$NOMBRE';")
dmrrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select cross_DMR_rptport from hot_CROSSLINKS where nombre = '$NOMBRE';")

echo "[DMR]" >> $PATHMMDVM
###############

if [[ $dmr2ysf -eq 1 ]]
then
    echo "Enable=$dmr2ysf" >> $PATHMMDVM
    else if [[ $ysf2dmr -eq 1 ]]
    then
       echo "Enable=0" >> $PATHMMDVM
       else if [[ $ysf2p25 -eq 1 ]]
       then
          echo "Enable=0" >> $PATHMMDVM
          else if [[ $ysf2nxdn -eq 1 ]]
          then
             echo "Enable=0" >> $PATHMMDVM
             else if [[ $dmr2nxdn -eq 1 ]]
             then
                echo "Enable=$dmr2nxdn" >> $PATHMMDVM
                else if [[ $nxdn2dmr -eq 1 ]]
                then
                    echo "Enable=0" >> $PATHMMDVM
                    else if [[ $dmrgateway -eq 1 ]]
                    then
                        echo "Enable=$dmrgateway" >> $PATHMMDVM
                        else if [[ $dmr -eq 1 ]]
                        then
                            echo "Enable=$dmr" >> $PATHMMDVM
                        else
                           echo "Enable=0" >> $PATHMMDVM 
                      fi
                    fi
                 fi
              fi
          fi
       fi
   fi
fi


#####
#echo "Enable=$dmr" >> $PATHMMDVM
dmrbeacon=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrbeacon from hotspot where nombre = '$NOMBRE';")
dmrbeaconinterval=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrbeaconinterval from hot_DMR where nombre = '$NOMBRE';")
dmrcolor=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrcolor from hot_DMR where nombre = '$NOMBRE';")
dmrselfonly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrselfonly from hot_DMR where nombre = '$NOMBRE';")
embeddedlconly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select embeddedlconly from hot_DMR where nombre = '$NOMBRE';")

echo "Beacons=$dmrbeacon" >> $PATHMMDVM
echo "BeaconsInterval=$dmrbeaconinterval" >> $PATHMMDVM
echo "BeaconDuration=$dmrbeaconduracion" >> $PATHMMDVM
echo "ColorCode=$dmrcolor" >> $PATHMMDVM
echo "SelfOnly=$dmrselfonly" >> $PATHMMDVM
echo "EmbeddedLCOnly=$embeddedlconly" >> $PATHMMDVM
echo "DumpTAData=1" >> $PATHMMDVM
echo "# Prefixes=234,235" >> $PATHMMDVM
echo "# Slot1TGWhiteList=" >> $PATHMMDVM
echo "# Slot2TGWhiteList=" >> $PATHMMDVM
echo "CallHang=" >> $PATHMMDVM
echo "TXHang=" >> $PATHMMDVM
echo "# ModeHang=10" >> $PATHMMDVM
echo "# OVCM Values, 0=off, 1=rx_on, 2=tx_on, 3=both_on" >> $PATHMMDVM
echo "# OVCM=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################

ysf2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2dmr from hotspot where nombre = '$NOMBRE';")
ysf2p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2p25 from hotspot where nombre = '$NOMBRE';")
ysf2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2nxdn from hotspot where nombre = '$NOMBRE';")
fusion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select fusion from hotspot where nombre = '$NOMBRE';")
echo "[System Fusion]" >> $PATHMMDVM
if [[ $ysf2dmr -eq 1 ]]
then
   echo "Enable=$ysf2dmr" >> $PATHMMDVM
   else if [[ $ysf2p25 -eq 1 ]]
   then
      echo "Enable=$ysf2p25" >> $PATHMMDVM
      else if [[ $ysf2nxdn -eq 1 ]]
      then
         echo "Enable=$ysf2nxdn" >> $PATHMMDVM
         else if [[ $fusion -eq 1 ]]
         then
             echo "Enable=$fusion" >> $PATHMMDVM
         else
            echo "Enable=0" >> $PATHMMDVM
         fi
      fi
   fi
fi

fusionlowdeviation=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select fusionlowdeviation from hot_YSF where nombre = '$NOMBRE';")
fusionselfonly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select fusionselfonly from hot_YSF where nombre = '$NOMBRE';")
echo "LowDeviation=$fusionlowdeviation" >> $PATHMMDVM
echo "SelfOnly=$fusionselfonly" >> $PATHMMDVM
echo "TXHang=4" >> $PATHMMDVM
#echo "#DGID=1" >> $PATHMMDVM
echo "RemoteGateway=$fusionremotegateway" >> $PATHMMDVM
echo "# ModeHang=10" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################

p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select p25 from hotspot where nombre = '$NOMBRE';")
p25selfonly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select p25selfonly from hotspot where nombre = '$NOMBRE';")
echo "[P25]" >> $PATHMMDVM
echo "Enable=$p25" >> $PATHMMDVM
echo "NAC=293" >> $PATHMMDVM
echo "SelfOnly=$p25selfonly" >> $PATHMMDVM
echo "OverrideUIDCheck=0" >> $PATHMMDVM
echo "RemoteGateway=0" >> $PATHMMDVM
echo "TXHang=5" >> $PATHMMDVM
echo "# ModeHang=10" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################

nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select nxdn from hotspot where nombre = '$NOMBRE';")
nxdn2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select nxdn2dmr from hotspot where nombre = '$NOMBRE';")
nxdnselfonly=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select nxdnselfonly from hot_NXDN where nombre = '$NOMBRE';")
echo "[NXDN]" >> $PATHMMDVM
if [[ $nxdn2dmr -eq 1 ]]
then
    echo "Enable=$nxdn2dmr" >> $PATHMMDVM
    else if [[ $nxdn -eq 1 ]]
    then
       echo "Enable=$nxdn" >> $PATHMMDVM
    else
           echo "Enable=0" >> $PATHMMDVM
    fi
fi
echo "RAN=" >> $PATHMMDVM
echo "SelfOnly=$nxdnselfonly" >> $PATHMMDVM
echo "RemoteGateway=0" >> $PATHMMDVM
echo "TXHang=5" >> $PATHMMDVM
echo "# ModeHang=10" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
echo "[POCSAG]" >> $PATHMMDVM
echo "Enable=0" >> $PATHMMDVM
echo "Frequency=439987500" >> $PATHMMDVM
echo "" >> $PATHMMDVM
####################################################################################################################################################
#dim=${dmrid%?????}
#dim2=${dmrid#$dim}
#echo "id=$dim2" >> $PATHMMDVM
###################################    FM  #########################################
echo "[FM]" >> $PATHMMDVM
echo "Enable=0" >> $PATHMMDVM
echo "# Callsign=G4KLX" >> $PATHMMDVM
echo "CallsignSpeed=20" >> $PATHMMDVM
echo "CallsignFrequency=1000" >> $PATHMMDVM
echo "CallsignTime=10" >> $PATHMMDVM
echo "CallsignHoldoff=0" >> $PATHMMDVM
echo "CallsignHighLevel=50" >> $PATHMMDVM
echo "CallsignLowLevel=20" >> $PATHMMDVM
echo "CallsignAtStart=1" >> $PATHMMDVM
echo "CallsignAtEnd=1" >> $PATHMMDVM
echo "CallsignAtLatch=0" >> $PATHMMDVM
echo "RFAck=K" >> $PATHMMDVM
echo "ExtAck=N" >> $PATHMMDVM
echo "AckSpeed=20" >> $PATHMMDVM
echo "AckFrequency=1750" >> $PATHMMDVM
echo "AckMinTime=4" >> $PATHMMDVM
echo "AckDelay=1000" >> $PATHMMDVM
echo "AckLevel=50" >> $PATHMMDVM
echo "# Timeout=180" >> $PATHMMDVM
echo "TimeoutLevel=80" >> $PATHMMDVM
echo "CTCSSFrequency=88.4" >> $PATHMMDVM
echo "CTCSSThreshold=30" >> $PATHMMDVM
echo "# CTCSSHighThreshold=30" >> $PATHMMDVM
echo "# CTCSSLowThreshold=20" >> $PATHMMDVM
echo "CTCSSLevel=20" >> $PATHMMDVM
echo "KerchunkTime=0" >> $PATHMMDVM
echo "HangTime=7" >> $PATHMMDVM
echo "AccessMode=1" >> $PATHMMDVM
echo "COSInvert=0" >> $PATHMMDVM
echo "RFAudioBoost=1" >> $PATHMMDVM
echo "MaxDevLevel=90" >> $PATHMMDVM
echo "ExtAudioBoost=1" >> $PATHMMDVM
echo "" >> $PATHMMDVM

#################################################################################################################################################

echo "[D-Star Network]" >> $PATHMMDVM
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstar from hotspot where nombre = '$NOMBRE';")
dstarplocal=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstarplocal from hot_IRC where nombre = '$NOMBRE';")
dstargateway=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstargateway from hot_IRC where nombre = '$NOMBRE';")

echo "Enable=$dstar" >> $PATHMMDVM
echo "GatewayAddress=127.0.0.1" >> $PATHMMDVM
echo "GatewayPort=$dstargateway" >> $PATHMMDVM

#####################################################???????????????????????
echo "LocalPort=$dstarplocal" >> $PATHMMDVM
echo "# ModeHang=3" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM

############################################################

dmr2ysf=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmr2ysf from hotspot where nombre = '$NOMBRE';")
ysf2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2dmr from hotspot where nombre = '$NOMBRE';")
ysf2p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2p25 from hotspot where nombre = '$NOMBRE';")
ysf2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2nxdn from hotspot where nombre = '$NOMBRE';")
dmr2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmr2nxdn from hotspot where nombre = '$NOMBRE';")
nxdn2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select nxdn2dmr from hotspot where nombre = '$NOMBRE';")
dmrgateway=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrgateway from hotspot where nombre = '$NOMBRE';")
dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmr from hotspot where nombre = '$NOMBRE';")
dmrlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select cross_DMR_localport from hot_CROSSLINKS where nombre = '$NOMBRE';")
dmrrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select cross_DMR_rptport from hot_CROSSLINKS where nombre = '$NOMBRE';")


echo "[DMR Network]" >> $PATHMMDVM
if [[ $dmr2ysf -eq 1 ]]
then
    echo "Enable=$dmr2ysf" >> $PATHMMDVM
    echo "Type=Direct" >> $PATHMMDVM
    echo "Address=127.0.0.1" >> $PATHMMDVM
    echo "Port=$dmrlocalport" >> $PATHMMDVM
    echo "Password=$dmrpassword" >> $PATHMMDVM
    echo "#Options="  >> $PATHMMDVM
    echo "Local=$dmrrptport" >> $PATHMMDVM
    else if [[ $ysf2dmr -eq 1 ]]
    then
       echo "Enable=0" >> $PATHMMDVM
       echo "Type=Direct" >> $PATHMMDVM
       echo "Address=127.0.0.1" >> $PATHMMDVM
       echo "Port=$dmrlocalport" >> $PATHMMDVM
       echo "Password=$dmrpassword" >> $PATHMMDVM
       echo "#Options="  >> $PATHMMDVM
       echo "Local=$dmrrptport" >> $PATHMMDVM
       else if [[ $ysf2p25 -eq 1 ]]
       then
          echo "Enable=0" >> $PATHMMDVM
          echo "Type=Direct" >> $PATHMMDVM
          echo "Address=127.0.0.1" >> $PATHMMDVM
          echo "Port=$dmrlocalport" >> $PATHMMDVM
          echo "Password=$dmrpassword" >> $PATHMMDVM
          echo "#Options=" >> $PATHMMDVM
          echo "Local=$dmrrptport" >> $PATHMMDVM
          else if [[ $ysf2nxdn -eq 1 ]]
          then
             echo "Enable=0" >> $PATHMMDVM
             echo "Type=Direct" >> $PATHMMDVM
             echo "Address=127.0.0.1" >> $PATHMMDVM
             echo "Port=$dmrlocalport" >> $PATHMMDVM
             echo "Password=$dmrpassword" >> $PATHMMDVM
             echo "#Options=" >> $PATHMMDVM
             echo "Local=$dmrrptport" >> $PATHMMDVM
             else if [[ $dmr2nxdn -eq 1 ]]
             then
                echo "Enable=$dmr2nxdn" >> $PATHMMDVM
                echo "Type=Direct" >> $PATHMMDVM
                echo "Address=127.0.0.1" >> $PATHMMDVM
                echo "Port=$dmrlocalport" >> $PATHMMDVM
                echo "Password=$dmrpassword" >> $PATHMMDVM
                echo "#Options=" >> $PATHMMDVM
                echo "Local=$dmrrptport" >> $PATHMMDVM
                else if [[ $nxdn2dmr -eq 1 ]]
                then
                   echo "Enable=0" >> $PATHMMDVM
                   echo "Type=Direct" >> $PATHMMDVM
                   echo "Address=127.0.0.1" >> $PATHMMDVM
                   echo "Port=$dmrlocalport" >> $PATHMMDVM
                   echo "Password=$dmrpassword" >> $PATHMMDVM
                   echo "#Options="  >> $PATHMMDVM
                   echo "Local=$dmrrptport" >> $PATHMMDVM
                   else if [[ $dmrgateway -eq 1 ]]
                   then
                      echo "Enable=$dmrgateway" >> $PATHMMDVM
                      echo "Type=Gateway" >> $PATHMMDVM
                      echo "Address=127.0.0.1" >> $PATHMMDVM
                      echo "Port=$dmrlocalport" >> $PATHMMDVM
                      echo "Password=$dmrpassword" >> $PATHMMDVM
                      echo "#Options="  >> $PATHMMDVM
                      echo "Local=$dmrrptport" >> $PATHMMDVM
                      else if [[ $dmr -eq 1 ]]
                      then
                         dmrlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrlocalport from hot_DMR where nombre = '$NOMBRE';")
                         dmrpremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrpremoto from hot_DMR where nombre = '$NOMBRE';")
                         dmrdireccion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrdireccion from hot_DMR where nombre = '$NOMBRE';")
                         dmrpassword=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrpassword from hot_DMR where nombre = '$NOMBRE';")
                         dmroptions=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmroptions from hot_DMR where nombre = '$NOMBRE';")
                         echo "Enable=$dmr" >> $PATHMMDVM
                         echo "Type=Direct" >> $PATHMMDVM
                         echo "Address=$dmrdireccion" >> $PATHMMDVM
                         echo "Port=$dmrpremoto" >> $PATHMMDVM
                         echo "Password=$dmrpassword" >> $PATHMMDVM
                         echo "Options=$dmroptions"  >> $PATHMMDVM
                         echo "#Local=$dmrrptport" >> $PATHMMDVM


                         # echo "Enable=$dmr" >> $PATHMMDVM
                         #echo "Address=$dmrdireccion" >> $PATHMMDVM
                         #echo "Port=$dmrpremoto" >> $PATHMMDVM
                         #echo "Password=$dmrpassword" >> $PATHMMDVM
                         #echo "Options=$dmroptions"  >> $PATHMMDVM
                         #echo "#Local=$dmrrptport" >> $PATHMMDVM
                      else
                         echo "Enable=0" >> $PATHMMDVM
                         echo "Type=Direct" >> $PATHMMDVM
                         echo "Address=" >> $PATHMMDVM
                         echo "Port=" >> $PATHMMDVM
                         echo "Password=" >> $PATHMMDVM
                         echo "Options="  >> $PATHMMDVM
                         echo "#Local=" >> $PATHMMDVM
                      fi
                   fi
                fi
             fi
          fi
       fi
   fi
fi
 

echo "Jitter=360" >> $PATHMMDVM
echo "Slot1=1" >> $PATHMMDVM
echo "Slot2=1" >> $PATHMMDVM
echo "# ModeHang=3" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
echo "[System Fusion Network]" >> $PATHMMDVM
ysf2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2dmr from hotspot where nombre = '$NOMBRE';")
ysf2p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2p25 from hotspot where nombre = '$NOMBRE';")
ysf2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ysf2nxdn from hotspot where nombre = '$NOMBRE';")
fusion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select fusion from hotspot where nombre = '$NOMBRE';")

if [[ $ysf2dmr -eq 1 ]]
then
   echo "Enable=$ysf2dmr" >> $PATHMMDVM
   else if [[ $ysf2p25 -eq 1 ]]
   then
      echo "Enable=$ysf2p25" >> $PATHMMDVM
      else if [[ $ysf2nxdn -eq 1 ]]
      then
         echo "Enable=$ysf2nxdn" >> $PATHMMDVM
         else
             echo "Enable=$fusion" >> $PATHMMDVM
       fi
   fi
fi

fusionrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusionrptport from hot_YSF where nombre = '$NOMBRE';")
fusionlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusionlocalport from hot_YSF where nombre = '$NOMBRE';")
echo "LocalAddress=127.0.0.1" >> $PATHMMDVM
echo "LocalPort=$fusionrptport" >> $PATHMMDVM
echo "GatewayAddress=127.0.0.1" >> $PATHMMDVM
echo "GatewayPort=$fusionlocalport" >> $PATHMMDVM
echo "# ModeHang=3" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM

p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25 from hotspot where nombre = '$NOMBRE';")
p25localport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25localport from hotspot where nombre = '$NOMBRE';")
p25rptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25rptport from hotspot where nombre = '$NOMBRE';")

############################################################
echo "[P25 Network]" >> $PATHMMDVM
echo "Enable=$p25" >> $PATHMMDVM
echo "GatewayAddress=127.0.0.1" >> $PATHMMDVM
echo "GatewayPort=$p25localport" >> $PATHMMDVM
echo "LocalPort=$p25rptport" >> $PATHMMDVM
echo "# ModeHang=3" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
echo "[NXDN Network]" >> $PATHMMDVM
nxdn2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdn2dmr from hotspot where nombre = '$NOMBRE';")
nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdn from hotspot where nombre = '$NOMBRE';")
nxdnrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnrptport from hot_NXDN where nombre = '$NOMBRE';")
nxdnlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnlocalport from hot_NXDN where nombre = '$NOMBRE';")

if [[ $nxdn2dmr -eq 1 ]]
then
    echo "Enable=$nxdn2dmr" >> $PATHMMDVM
    else if [[ $nxdn -eq 1 ]]
    then
       echo "Enable=$nxdn" >> $PATHMMDVM
    else
           echo "Enable=0" >> $PATHMMDVM
    fi
fi
echo "Protocol=Icom" >> $PATHMMDVM
echo "LocalAddress=127.0.0.1" >> $PATHMMDVM
echo "LocalPort=$nxdnrptport" >> $PATHMMDVM
echo "GatewayAddress=127.0.0.1" >> $PATHMMDVM
echo "GatewayPort=$nxdnlocalport" >> $PATHMMDVM
echo "ModeHang=3" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM

############################################################
echo "[POCSAG Network]" >> $PATHMMDVM
echo "Enable=" >> $PATHMMDVM
echo "LocalAddress=127.0.0.1" >> $PATHMMDVM
echo "LocalPort=" >> $PATHMMDVM
echo "GatewayAddress=127.0.0.1" >> $PATHMMDVM
echo "GatewayPort=" >> $PATHMMDVM
echo "# ModeHang=3" >> $PATHMMDVM
echo "Debug=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
echo "[TFT Serial]" >> $PATHMMDVM
echo "#Port=modem" >> $PATHMMDVM
echo "Port=/dev/ttyAMA0" >> $PATHMMDVM
echo "Brightness=50" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
echo "[HD44780]" >> $PATHMMDVM
echo "Rows=2" >> $PATHMMDVM
echo "Columns=16" >> $PATHMMDVM
echo "# For basic HD44780 displays (4-bit connection)" >> $PATHMMDVM
echo "# rs, strb, d0, d1, d2, d3" >> $PATHMMDVM
echo "Pins=11,10,0,1,2,3" >> $PATHMMDVM
echo "I2CAddress=0x20" >> $PATHMMDVM
echo "" >> $PATHMMDVM
# PWM backlight
echo "PWM=0" >> $PATHMMDVM
echo "PWMPin=21" >> $PATHMMDVM
echo "PWMBright=100" >> $PATHMMDVM
echo "PWMDim=16" >> $PATHMMDVM
echo "DisplayClock=1" >> $PATHMMDVM
echo "UTC=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################

nextionpuerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionpuerto from hot_NEXTION where nombre = '$NOMBRE';")
nextionbrillo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionbrillo from hot_NEXTION where nombre = '$NOMBRE';")
nextionclock=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionclock from hot_NEXTION where nombre = '$NOMBRE';")
nextionutc=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionutc from hot_NEXTION where nombre = '$NOMBRE';")
nextionlayout=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionlayout from hot_NEXTION where nombre = '$NOMBRE';")
nextionidlebrillo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nextionidlebrillo from hot_NEXTION where nombre = '$NOMBRE';")
echo "" >> $PATHMMDVM
echo "[Nextion]" >> $PATHMMDVM
echo "# Port=modem" >> $PATHMMDVM
echo "Port=$nextionpuerto" >> $PATHMMDVM
echo "Brightness=$nextionbrillo" >> $PATHMMDVM
echo "DisplayClock=$nextionclock" >> $PATHMMDVM
echo "UTC=$nextionutc" >> $PATHMMDVM
echo "#Screen Layout: 0=G4KLX 2=ON7LDS" >> $PATHMMDVM
echo "ScreenLayout=$nextionlayout" >> $PATHMMDVM
echo "IdleBrightness=$nextionidlebrillo" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
oledtipo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledtipo from hot_oled where nombre = '$NOMBRE';")
oledbrillo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledbrillo from hot_oled where nombre = '$NOMBRE';")
oledinversion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledinversion from hot_oled where nombre = '$NOMBRE';")
oledscroll=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledscroll from hot_oled where nombre = '$NOMBRE';")
oledcast=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledcast from hot_oled where nombre = '$NOMBRE';")
oledlogo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT oledlogo from hot_oled where nombre = '$NOMBRE';")
echo "[OLED]" >> $PATHMMDVM
echo "Type=$oledtipo" >> $PATHMMDVM
echo "Brightness=$oledbrillo" >> $PATHMMDVM
echo "Invert=$oledinversion" >> $PATHMMDVM
echo "Scroll=$oledscroll" >> $PATHMMDVM
echo "Rotate=0" >> $PATHMMDVM
echo "Cast=$oledcast" >> $PATHMMDVM
echo "LogoScreensaver=$oledlogo" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
echo "[LCDproc]" >> $PATHMMDVM
echo "Address=localhost" >> $PATHMMDVM
echo "Port=13666" >> $PATHMMDVM
echo "#LocalPort=13667" >> $PATHMMDVM
echo "DimOnIdle=0" >> $PATHMMDVM
echo "DisplayClock=1" >> $PATHMMDVM
echo "UTC=0" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
echo "[Lock File]" >> $PATHMMDVM
echo "Enable=0" >> $PATHMMDVM
echo "File=/tmp/MMDVM_Active.lck" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
#echo "[Mobile GPS]" >> $PATHMMDVM
#echo "Enable=0" >> $PATHMMDVM
#echo "Address=127.0.0.1" >> $PATHMMDVM
#echo "Port=7834" >> $PATHMMDVM
#echo "" >> $PATHMMDVM
############################################################
echo "[Remote Control]" >> $PATHMMDVM
echo "Enable=" >> $PATHMMDVM
echo "Port=" >> $PATHMMDVM
echo "" >> $PATHMMDVM
############################################################
}

##############   FIN MMDVMHOST.INI   ##########################

########################################################################################

######################    INICIO IRCDDBGATEWAY    ##################################
#function IRCSED(){
#llamada=$indicativo
#llamada=${llamada,,}
#sed -i "/ircddbUsername/s/.*/ircddbUsername=$llamada/" $PATHIRCDDBGATEWAY
#llamada=${llamada^^}
#sed -i "/gatewayCallsign/s/.*/gatewayCallsign=$llamada/" $PATHIRCDDBGATEWAY
#sed -i "/dplusLogin/s/.*/dplusLogin=$llamada C/" $PATHIRCDDBGATEWAY
#}

function IRC(){
echo "# DESACTIVADO          Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY
echo "#PRINCIPAL" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

echo "gatewayType=1" >> $PATHIRCDDBGATEWAY
###########################################################################################################################3
echo "gatewayCallsign=$indicativoirc" >> $PATHIRCDDBGATEWAY     #INDICATIVO primario no borrar
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
echo "repeaterBand1=$repeaterband" >> $PATHIRCDDBGATEWAY  #SELECCIONA MODULO
echo "repeaterType1=0" >> $PATHIRCDDBGATEWAY
echo "repeaterAddress1=127.0.0.1" >> $PATHIRCDDBGATEWAY
echo "repeaterPort1=$repeaterport" >> $PATHIRCDDBGATEWAY              #user1 +1 +2 +3
echo "reflector1=$reflector" >> $PATHIRCDDBGATEWAY        #INTRODUCIR REFLECTO DE INICIO
echo "atStartup1=$atstartup" >> $PATHIRCDDBGATEWAY       #ARRANCA AREFLECTOR AL INICIO
echo "reconnect1=$reconnect" >> $PATHIRCDDBGATEWAY       #SELECCIONA TIEMPO DE RECONEXION
echo "frequency1=0.00000" >> $PATHIRCDDBGATEWAY
echo "offset1=0.0000" >> $PATHIRCDDBGATEWAY
echo "rangeKms1=0.000" >> $PATHIRCDDBGATEWAY
echo "latitude1=0.000000" >> $PATHIRCDDBGATEWAY
echo "longitude1=0.000000" >> $PATHIRCDDBGATEWAY
echo "agl1=0.000" >> $PATHIRCDDBGATEWAY
echo "description1_1=" >> $PATHIRCDDBGATEWAY
echo "description1_2=" >> $PATHIRCDDBGATEWAY
echo "url1=hblink.es" >> $PATHIRCDDBGATEWAY
echo "band1_1=0" >> $PATHIRCDDBGATEWAY
echo "band1_2=0" >> $PATHIRCDDBGATEWAY
echo "band1_3=0" >> $PATHIRCDDBGATEWAY

echo "" >> $PATHIRCDDBGATEWAY
echo "#2ª CONFIGURACION" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

echo "repeaterCall2=$indicativoirc2" >> $PATHIRCDDBGATEWAY
echo "repeaterBand2=$repeaterband2" >> $PATHIRCDDBGATEWAY
echo "repeaterType2=0" >> $PATHIRCDDBGATEWAY
echo "repeaterAddress2=127.0.0.1" >> $PATHIRCDDBGATEWAY
echo "repeaterPort2=$repeaterport2" >> $PATHIRCDDBGATEWAY
echo "reflector2=$reflector2" >> $PATHIRCDDBGATEWAY
echo "atStartup2=$atstartup2" >> $PATHIRCDDBGATEWAY
echo "reconnect2=$reconnect2" >> $PATHIRCDDBGATEWAY
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

echo "repeaterCall3=$indicativoirc3" >> $PATHIRCDDBGATEWAY
echo "repeaterBand3=$repeaterband3 " >> $PATHIRCDDBGATEWAY
echo "repeaterType3=0" >> $PATHIRCDDBGATEWAY
echo "repeaterAddress3=127.0.0.1" >> $PATHIRCDDBGATEWAY
echo "repeaterPort3=$repeaterport3" >> $PATHIRCDDBGATEWAY
echo "reflector3=$reflector3" >> $PATHIRCDDBGATEWAY
echo "atStartup3=$atstartup3" >> $PATHIRCDDBGATEWAY
echo "reconnect3=$reconnect3" >> $PATHIRCDDBGATEWAY
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

echo "repeaterCall4=$indicativoirc4" >> $PATHIRCDDBGATEWAY
echo "repeaterBand4=$repeaterband4 " >> $PATHIRCDDBGATEWAY
echo "repeaterType4=0" >> $PATHIRCDDBGATEWAY
echo "repeaterAddress4=127.0.0.1" >> $PATHIRCDDBGATEWAY
echo "repeaterPort4=$repeaterport4" >> $PATHIRCDDBGATEWAY
echo "reflector4=$reflector4" >> $PATHIRCDDBGATEWAY
echo "atStartup4=$atstartup4" >> $PATHIRCDDBGATEWAY
echo "reconnect4=$reconnect4" >> $PATHIRCDDBGATEWAY
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
echo "ircddbHostname=$irchostname" >> $PATHIRCDDBGATEWAY    #SELECCION DE RED
#######################################################################################################################################################3

minusculas=${indicativoirc,,}
echo "ircddbUsername=$minusculas" >> $PATHIRCDDBGATEWAY        #INDICATIVO DE NUEVO MINUSCULAS
#######################################################################################################################################################3
echo "ircddbPassword=" >> $PATHIRCDDBGATEWAY

echo "" >> $PATHIRCDDBGATEWAY
echo "#ENABLE2" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

if [[ $REGISTROS -ge 1 ]]
then
    echo "ircddbEnabled2=1" >> $PATHIRCDDBGATEWAY                     #ENABLES POR USUARIO
else
    echo "ircddbEnabled2=0" >> $PATHIRCDDBGATEWAY
fi

minusculas=${indicativoirc2,,}
echo "ircddbHostname2=$irchostname2" >> $PATHIRCDDBGATEWAY      #SELEECION DE RED POR USUARIO
echo "ircddbUsername=$minusculas" >> $PATHIRCDDBGATEWAY           #INDICATIVO MINUSCULAS POR USUARIO
echo "ircddbPassword2=" >> $PATHIRCDDBGATEWAY

echo "" >> $PATHIRCDDBGATEWAY
echo "#ENABLE3" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

if [[ $REGISTROS -ge 2 ]]
then
    echo "ircddbEnabled3=1" >> $PATHIRCDDBGATEWAY                     #ENABLES POR USUARIO
else
    echo "ircddbEnabled3=0" >> $PATHIRCDDBGATEWAY
fi

echo "ircddbHostname3=$irchostname3" >> $PATHIRCDDBGATEWAY

minusculas=${indicativoirc3,,}
echo "ircddbUsername=$minusculas" >> $PATHIRCDDBGATEWAY
echo "ircddbPassword3=" >> $PATHIRCDDBGATEWAY

echo "" >> $PATHIRCDDBGATEWAY
echo "#ENABLE4" >> $PATHIRCDDBGATEWAY
echo "" >> $PATHIRCDDBGATEWAY

if [[ REGISTROS -eq 3 ]]
then
    echo "ircddbEnabled4=1" >> $PATHIRCDDBGATEWAY                     #ENABLES POR USUARIO
else
    echo "ircddbEnabled4=0" >> $PATHIRCDDBGATEWAY
fi
echo "ircddbHostname4=$irchostname4" >> $PATHIRCDDBGATEWAY
minusculas=${indicativoirc4,,}
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
conex=" $repeaterband"
echo "dplusLogin=$indicativoirc$conex" >> $PATHIRCDDBGATEWAY
######################################################################################################################################################
echo "dcsEnabled=1" >> $PATHIRCDDBGATEWAY
echo "ccsEnabled=1" >> $PATHIRCDDBGATEWAY
echo "ccsHost=$ccshost" >> $PATHIRCDDBGATEWAY
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
echo "remoteEnabled=$remote" >> $PATHIRCDDBGATEWAY         #ACTIVAR ACCESO REMOTO
echo "remotePassword=$remotepass" >> $PATHIRCDDBGATEWAY         #PASSWORD ACCESO REMOTO
echo "remotePort=$remotepuerto" >> $PATHIRCDDBGATEWAY            #PUERTO AR
echo "language=$lenguaje" >> $PATHIRCDDBGATEWAY              #LEGUAJE 
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



##############        INICIO NXDNGATEWAY   ###########################

function NXDNGATEWAY(){

indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from hotspot where nombre = '$NOMBRE';")
nxdnrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnrptport from hot_NXDN where nombre = '$NOMBRE';")
nxdnlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnlocalport from hot_NXDN where nombre = '$NOMBRE';")

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
echo "[General]" >> $PATHBRIDGENXDN
echo "Callsign=$indicativo" >> $PATHBRIDGENXDN
echo "Suffix=NXDN" >> $PATHBRIDGENXDN
echo "# The next four lines are for a Kenwood repeater" >> $PATHBRIDGENXDN
echo "# RptProtocol=Kenwood" >> $PATHBRIDGENXDN
echo "# RptAddress=1.2.3.4" >> $PATHBRIDGENXDN
echo "# RptPort=64000" >> $PATHBRIDGENXDN
echo "# LocalPort=64000" >> $PATHBRIDGENXDN
echo "# The next four lines are for an Icom" repeater" >> $PATHBRIDGENXDN
echo "# RptProtocol=Icom" >> $PATHBRIDGENXDN
echo "# RptAddress=1.2.3.4" >> $PATHBRIDGENXDN
echo "# RptPort=41300" >> $PATHBRIDGENXDN
echo "# LocalPort=41300" >> $PATHBRIDGENXDN
echo "# The next four lines are for an MMDVM" >> $PATHBRIDGENXDN
echo "RptProtocol=Icom" >> $PATHBRIDGENXDN
echo "RptAddress=127.0.0.1" >> $PATHBRIDGENXDN
if [[ $ysf2nxdn -eq 1 ]]
then
   echo "RptPort=$nxdnrptport" >> $PATHBRIDGENXDN
   echo "LocalPort=$nxdnlocalport" >> $PATHBRIDGENXDN
   else if [[ $dmr2nxdn -eq 1 ]]
   then
       echo "RptPort=$nxdnlocalport" >> $PATHBRIDGENXDN
       echo "LocalPort=$nxdnrptport" >> $PATHBRIDGENXDN
   else
       echo "RptPort=$nxdnrptport" >> $PATHBRIDGENXDN
       echo "LocalPort=$nxdnlocalport" >> $PATHBRIDGENXDN
   fi
fi
echo "Debug=0" >> $PATHBRIDGENXDN
echo "Daemon=0" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
#######################################################
frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frecrx from hot_conf_personal where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frectx from hot_conf_personal where nombre = '$NOMBRE';")
power=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select power from hot_conf_personal where nombre = '$NOMBRE';")
latitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select latitude from hot_conf_personal where nombre = '$NOMBRE';")
longitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select longitude from hot_conf_personal where nombre = '$NOMBRE';")
height=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select height from hot_conf_personal where nombre = '$NOMBRE';")
description=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select description from hot_conf_personal where nombre = '$NOMBRE';")
echo "[Info]" >> $PATHBRIDGENXDN
echo "RXFrequency=$frecrx" >> $PATHBRIDGENXDN
echo "TXFrequency=$frectx" >> $PATHBRIDGENXDN
echo "Power=$power" >> $PATHBRIDGENXDN
echo "Latitude=$latitude" >> $PATHBRIDGENXDN
echo "Longitude=$longitude" >> $PATHBRIDGENXDN
echo "Height=$height" >> $PATHBRIDGENXDN
echo "Name=" >> $PATHBRIDGENXDN
echo "Description=$description" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
#######################################################
echo "[Voice]" >> $PATHBRIDGENXDN
echo "Enabled=1" >> $PATHBRIDGENXDN
echo "Language=" >> $PATHBRIDGENXDN
echo "Directory=./Audio" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
#######################################################
aprs=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprs from hotspot where nombre = '$NOMBRE';")
aprslocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprslocalport from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprsdescripcion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprsdescripcion from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprssufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprssufijo from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
echo "[APRS]" >> $PATHBRIDGENXDN
echo "Enable=$aprs" >> $PATHBRIDGENXDN
echo "Address=127.0.0.1" >> $PATHBRIDGENXDN   #Siempre local por el aprsgateway
echo "Port=$aprslocalport" >> $PATHBRIDGENXDN
echo "Suffix=$aprssufijo" >> $PATHBRIDGENXDN
echo "Description=$aprsdescripcion" >> $PATHBRIDGENXDN

echo "" >> $PATHBRIDGENXDN
#######################################################
echo "[Id Lookup]" >> $PATHBRIDGENXDN
echo "Name=/var/lib/mmdvm/NXDN.csv" >> $PATHBRIDGENXDN
echo "Time=24" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
#######################################################
echo "[Log]" >> $PATHBRIDGENXDN
echo "# Logging levels, 0=No logging" >> $PATHBRIDGENXDN
echo "DisplayLevel=1" >> $PATHBRIDGENXDN
echo "FileLevel=1" >> $PATHBRIDGENXDN
echo "FilePath=/var/log/hotspots" >> $PATHBRIDGENXDN
echo "FileRoot=NXDNGateway-$nombre" >> $PATHBRIDGENXDN
echo "FileRotate=1" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
nxdnpuerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT crooss_NXDNP25_GATEWAY_localport from hot_CROSSLINKS where nombre = '$NOMBRE';")
echo "[Network]" >> $PATHBRIDGENXDN
#if [[ $nxdn2dmr -eq 1 ]]
#then
echo "Port=$nxdnpuerto" >> $PATHBRIDGENXDN
#else
#    echo "Port=$nxdnrptport" >> $PATHBRIDGENXDN
#fi
echo "HostsFile1=./NXDNHosts.txt" >> $PATHBRIDGENXDN
echo "HostsFile2=./private/NXDNHosts.txt" >> $PATHBRIDGENXDN
echo "ReloadTime=60" >> $PATHBRIDGENXDN
echo "ParrotAddress=127.0.0.1" >> $PATHBRIDGENXDN
echo "ParrotPort=42021" >> $PATHBRIDGENXDN
echo "NXDN2DMRAddress=127.0.0.1" >> $PATHBRIDGENXDN
crooss_NXDNP25_GATEWAY_rptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT crooss_NXDNP25_GATEWAY_rptport from hot_CROSSLINKS where nombre = '$NOMBRE';")

#if [[ $nxdn2dmr -eq 1 ]]
#then
    echo "NXDN2DMRPort=$NXDN2DMRPORT" >> $PATHBRIDGENXDN
#else
#    echo "NXDN2DMRPort=$nxdnrptport" >> $PATHBRIDGENXDN
#fi

if [ $cross -eq 1 ]
then
   if [[ $ysf2nxdn -eq 1 ]]
   then
       echo "Static=$nxdnreflector" >> $PATHBRIDGENXDN
   else
       echo "Static=20" >> $PATHBRIDGENXDN
   fi
else
   echo "Static=$nxdnreflector" >> $PATHBRIDGENXDN
fi
echo "RFHangTime=120" >> $PATHBRIDGENXD
echo "NetHangTime=60" >> $PATHBRIDGENXD
echo "Debug=0" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
#######################################################
echo "[GPSD]" >> $PATHBRIDGENXDN
echo "Enable=0" >> $PATHBRIDGENXDN
echo "Address=127.0.0.1" >> $PATHBRIDGENXDN
echo "Port=2947" >> $PATHBRIDGENXDN
echo "" >> $PATHBRIDGENXDN
echo "[Remote Commands]" >> $PATHBRIDGENXDN
echo "Enable=0" >> $PATHBRIDGENXDN
echo "Port=6075" >> $PATHBRIDGENXDN

}


##############         FIN   NXDNGATEWAY    ############################


#######################################################################3#####################################33


####################   INICIO P25GATEWAY   ##########################


function P25GATEWAY(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $PATHBRIDGEP25
echo "" >> $PATHBRIDGEP25
echo "[General]" >> $PATHBRIDGEP25
echo "Callsign=$indicativo" >> $PATHBRIDGEP25
echo "RptAddress=127.0.0.1" >> $PATHBRIDGEP25
echo "RptPort=$p25rptport" >> $PATHBRIDGEP25
echo "LocalPort=$p25localport" >> $PATHBRIDGEP25
echo "Daemon=0" >> $PATHBRIDGEP25
echo "" >> $PATHBRIDGEP25
#######################################################
echo "[Id Lookup]" >> $PATHBRIDGEP25
echo "Name=DMRIds.dat" >> $PATHBRIDGEP25
echo "Time=24" >> $PATHBRIDGEP25
echo "" >> $PATHBRIDGEP25
#######################################################
echo "[Voice]" >> $PATHBRIDGEP25
echo "Enabled=1" >> $PATHBRIDGEP25
echo "Language=$p25idioma" >> $PATHBRIDGEP25
echo "Directory=./Audio" >> $PATHBRIDGEP25
echo " " >> $PATHBRIDGEP25
#######################################################
echo "[Log]" >> $PATHBRIDGEP25
echo "# Logging levels, 0=No logging" >> $PATHBRIDGEP25
echo "DisplayLevel=1" >> $PATHBRIDGEP25
echo "FileLevel=1" >> $PATHBRIDGEP25
echo "FilePath=/var/log/hotspots" >> $PATHBRIDGEP25
echo "FileRoot=P25Gateway-$nombre" >> $PATHBRIDGEP25
echo "FileRotate=1" >> $PATHBRIDGEP25
echo "" >> $PATHBRIDGEP25
#######################################################
echo "[Network]" >> $PATHBRIDGEP25
echo "Port=$P25PORT" >> $PATHBRIDGEP25
echo "HostsFile1=./P25Hosts.txt" >> $PATHBRIDGEP25
echo "HostsFile2=./private/P25Hosts.txt" >> $PATHBRIDGEP25
echo "ReloadTime=60" >> $PATHBRIDGEP25
echo "ParrotAddress=127.0.0.1" >> $PATHBRIDGEP25
echo "ParrotPort=$P25PARROTPORT" >> $PATHBRIDGEP25
echo "P252DMRAddress=127.0.0.1" >> $PATHBRIDGEP25
echo "P252DMRPort=42012" >> $PATHBRIDGEP25        #correspondencia con crosslinks p252dmr  BUSCAR!!
#echo "Static=$p25reflector" >> $PATHBRIDGEP25
echo "RFHangTime=120" >> $PATHBRIDGEP25
echo "NetHangTime=60" >> $PATHBRIDGEP25

if [[ $nxdnreflector = "" ]]
then
    echo "#Static=$p25reflector" >> $PATHBRIDGEP25

else
    echo "Static=$p25reflector" >> $PATHBRIDGEP25
fi
echo "Debug=0" >> $PATHBRIDGEP25


}

####################    FIN P25GATEWAY        ########################

#####################################################################################################


######################    INICIO  YSFGATEWAY    ##################################

function YSFGATEWAY(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
echo "[General]" >> $PATHBRIDGEYSF
echo "Callsign=$indicativo" >> $PATHBRIDGEYSF
echo "Suffix=RPT" >> $PATHBRIDGEYSF
echo "Id=$dmrid" >> $PATHBRIDGEYSF
echo "RptAddress=127.0.0.1" >> $PATHBRIDGEYSF
if [[ $cross -eq 0 ]]
then
    echo "RptPort=$fusionrptport" >> $PATHBRIDGEYSF
    echo "LocalAddress=127.0.0.1" >> $PATHBRIDGEYSF
    echo "LocalPort=$fusionlocalport" >> $PATHBRIDGEYSF
else
#### nuevo por DGID GATEWAY
   if [[ $dgid -eq 0 ]]
   then
      echo "RptPort=$fusionlocalport" >> $PATHBRIDGEYSF
      echo "LocalAddress=127.0.0.1" >> $PATHBRIDGEYSF
      echo "LocalPort=$fusionrptport" >> $PATHBRIDGEYSF
   else
      echo "RptPort=$DGIDlocalport" >> $PATHBRIDGEYSF
      echo "LocalAddress=127.0.0.1" >> $PATHBRIDGEYSF
      echo "LocalPort=$DGIrptport" >> $PATHBRIDGEYSF
   fi
fi
echo "WiresXMakeUpper=$fusionwiresx" >> $PATHBRIDGEYSF
echo "WiresXCommandPassthrough=$fusionwiresc" >> $PATHBRIDGEYSF
echo "Daemon=0" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
#########################################################
frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frecrx from hot_conf_personal where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frectx from hot_conf_personal where nombre = '$NOMBRE';")
power=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select power from hot_conf_personal where nombre = '$NOMBRE';")
latitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select latitude from hot_conf_personal where nombre = '$NOMBRE';")
longitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select longitude from hot_conf_personal where nombre = '$NOMBRE';")
height=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select height from hot_conf_personal where nombre = '$NOMBRE';")
description=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select description from hot_conf_personal where nombre = '$NOMBRE';")
echo "[Info]" >> $PATHBRIDGEYSF
echo "RXFrequency=$frecrx" >> $PATHBRIDGEYSF
echo "TXFrequency=$frectx" >> $PATHBRIDGEYSF
echo "Power=$power" >> $PATHBRIDGEYSF
echo "Latitude=$latitude" >> $PATHBRIDGEYSF
echo "Longitude=$longitude" >> $PATHBRIDGEYSF
echo "Height=$height" >> $PATHBRIDGEYSF
echo "Name=" >> $PATHBRIDGEYSF
echo "Description=$description" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
#########################################################
echo "[Log]" >> $PATHBRIDGEYSF
echo "# Logging levels, 0=No logging" >> $PATHBRIDGEYSF
echo "DisplayLevel=1" >> $PATHBRIDGEYSF
echo "FileLevel=1" >> $PATHBRIDGEYSF
echo "FilePath=/var/log/hotspots" >> $PATHBRIDGEYSF
echo "FileRoot=YSFGateway-$nombre" >> $PATHBRIDGEYSF
echo "FileRotate=1" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
#########################################################
aprs=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprs from hotspot where nombre = '$NOMBRE';")
aprslocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprslocalport from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprsdescripcion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprsdescripcion from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprssufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprssufijo from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprspass=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprspass from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
echo "[APRS]" >> $PATHBRIDGEYSF
echo "Enable=$aprs" >> $PATHBRIDGEYSF
echo "Address=127.0.0.1" >> $PATHBRIDGEYSF
echo "Port=$aprslocalport" >> $PATHBRIDGEYSF
#echo "Password=$aprspass" >> $PATHBRIDGEYSF
echo "Description=$aprsdescripcion" >> $PATHBRIDGEYSF
echo "Suffix=$aprssufijo" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
#########################################################
echo "[Network]" >> $PATHBRIDGEYSF
echo "Startup=$fstartup" >> $PATHBRIDGEYSF
echo "Options=$options" >> $PATHBRIDGEYSF
echo "InactivityTimeout=$finactivity" >> $PATHBRIDGEYSF
echo "Revert=$frevert" >> $PATHBRIDGEYSF
echo "Debug=0" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
#########################################################
echo "[YSF Network]" >> $PATHBRIDGEYSF
if [[ $cross -eq 1 ]]
then
echo "Enable=1" >> $PATHBRIDGEYSF
else
echo "Enable=$fusion" >> $PATHBRIDGEYSF
fi
echo "Port=$GATEWAYPORT" >> $PATHBRIDGEYSF
echo "Hosts=./YSFHosts.txt" >> $PATHBRIDGEYSF
echo "ReloadTime=60" >> $PATHBRIDGEYSF
echo "ParrotAddress=127.0.0.1" >> $PATHBRIDGEYSF
echo "ParrotPort=$cross_parrot" >> $PATHBRIDGEYSF
echo "YSF2DMRAddress=127.0.0.1" >> $PATHBRIDGEYSF
echo "YSF2DMRPort=$cross_YSF_localport" >> $PATHBRIDGEYSF
echo "YSF2NXDNAddress=127.0.0.1" >> $PATHBRIDGEYSF
echo "YSF2NXDNPort=$cross_NXDN_localport" >> $PATHBRIDGEYSF
echo "YSF2P25Address=127.0.0.1" >> $PATHBRIDGEYSF
echo "YSF2P25Port=$cross_P25_localport" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
#########################################################
echo "[FCS Network]" >> $PATHBRIDGEYSF
echo "Enable=1" >> $PATHBRIDGEYSF
echo "Rooms=./FCSRooms.txt" >> $PATHBRIDGEYSF
echo "Port=$FCSPORT" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
#########################################################
echo "[GPSD]" >> $PATHBRIDGEYSF
echo "Enable=0" >> $PATHBRIDGEYSF
echo "Address=127.0.0.1" >> $PATHBRIDGEYSF
echo "Port=2947" >> $PATHBRIDGEYSF
echo "" >> $PATHBRIDGEYSF
echo "[Remote Commands]" >> $PATHBRIDGEYSF
echo "Enable=0" >> $PATHBRIDGEYSF
echo "Port=6073" >> $PATHBRIDGEYSF
}

######################     FIN BRIDGEYSF          ################################

#####################     INICIO DMRGATEWAY       ##############################
function DATOSGATEWAY(){

 rm /var/log/dmrgateway
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e \
"select * from hotspot where nombre = '$NOMBRE' into outfile \
'/var/log/dmrgateway' fields terminated by '|';"
activardmrgateway=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 129)
idiomadmrgateway=$(awk "NR==1" /var/log/dmrgateway |cut -d"|" -f 130)
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

}
function DMRGATEWAYSED(){
camino="/opt/HOTSPOTS-ACTIVOS/$NOMBRE/DMRGateway/DMRGateway.ini"
sed -i "5s/.*/RptAddress=127.0.0.1/" $camino
sed -i "6s/.*/RptPort=$dmrrptport/" $camino
sed -i "7s/.*/RptAddress=127.0.0.1/" $camino
sed -i "8s/.*/LocalPort=$dmrlocalport/" $camino
sed -i "17s#.*#FilePath=/var/log/hotspots#" $camino
sed -i "18s/.*/FileRoot=DMRGateway-$nombre/" $camino

}
function DMRGATEWAY(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $PATHDMRGATEWAY
echo "[General]" >> $PATHDMRGATEWAY
echo "Timeout=10" >> $PATHDMRGATEWAY
echo "# RFTimeout=10" >> $PATHDMRGATEWAY
echo "# NetTimeout=7" >> $PATHDMRGATEWAY
echo "RptAddress=127.0.0.1" >> $PATHDMRGATEWAY
echo "RptPort=$dmrrptport" >> $PATHDMRGATEWAY
echo "LocalAddress=127.0.0.1" >> $PATHDMRGATEWAY
echo "LocalPort=$dmrlocalport" >> $PATHDMRGATEWAY
echo "RuleTrace=0" >> $PATHDMRGATEWAY
echo "Daemon=0" >> $PATHDMRGATEWAY
echo "Debug=0" >> $PATHDMRGATEWAY
echo "[Log]" >> $PATHDMRGATEWAY
echo "# Logging levels, 0=No logging" >> $PATHDMRGATEWAY
echo "DisplayLevel=1" >> $PATHDMRGATEWAY
echo "FileLevel=1" >> $PATHDMRGATEWAY
echo "FilePath=/var/log/hotspots" >> $PATHDMRGATEWAY
echo "FileRoot=DMRGateway-$nombre" >> $PATHDMRGATEWAY
echo "" >> $PATHDMRGATEWAY

echo "[[Log]" >> $PATHDMRGATEWAY
echo "[# Logging levels, 0=No logging" >> $PATHDMRGATEWAY
echo "[DisplayLevel=1" >> $PATHDMRGATEWAY
echo "[FileLevel=1" >> $PATHDMRGATEWAY
echo "[FilePath=." >> $PATHDMRGATEWAY
echo "[FileRoot=DMRGateway" >> $PATHDMRGATEWAY
echo "[FileRotate=1" >> $PATHDMRGATEWAY
echo "" >> $PATHDMRGATEWAY

echo "[Voice]" >> $PATHDMRGATEWAY
echo "Enabled=1" >> $PATHDMRGATEWAY
echo "Language=$idiomadmrgateway" >> $PATHDMRGATEWAY
echo "Directory=./Audio" >> $PATHDMRGATEWAY
echo "" >> $PATHDMRGATEWAY

echo "[Info]" >> $PATHDMRGATEWAY
#echo "Enabled=0" >> $PATHDMRGATEWAY
#echo "RXFrequency=$frecrx" >> $PATHDMRGATEWAY
#echo "TXFrequency=$frectx" >> $PATHDMRGATEWAY
#echo "Power=$power" >> $PATHDMRGATEWAY
latitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select latitude from hot_conf_personal where nombre = '$NOMBRE';")
longitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select longitude from hot_conf_personal where nombre = '$NOMBRE';")
height=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select height from hot_conf_personal where nombre = '$NOMBRE';")
description=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select description from hot_conf_personal where nombre = '$NOMBRE';")
location=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select location from hot_conf_personal where nombre = '$NOMBRE';")
url=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select url from hot_conf_personal where nombre = '$NOMBRE';")

echo "Latitude=$latitude" >> $PATHDMRGATEWAY
echo "Longitude=$longitude" >> $PATHDMRGATEWAY
echo "Height=$height" >> $PATHDMRGATEWAY
echo "Location=$location" >> $PATHDMRGATEWAY
echo "Description=$description" >> $PATHDMRGATEWAY
echo "URL=" >> $PATHDMRGATEWAY
echo "" >> $PATHDMRGATEWAY

echo "[XLX Network]" >> $PATHDMRGATEWAY
echo "Enabled=$xlx" >> $PATHDMRGATEWAY
echo "File=XLXHosts.txt" >> $PATHDMRGATEWAY
echo "Port=62030" >> $PATHDMRGATEWAY
echo "Password=passw0rd" >> $PATHDMRGATEWAY
echo "ReloadTime=60" >> $PATHDMRGATEWAY
echo "# Local=3351" >> $PATHDMRGATEWAY
echo "Slot=1" >> $PATHDMRGATEWAY
echo "TG=$xlxtg" >> $PATHDMRGATEWAY
#base=expr($xlxtg*10000)+4000
echo "Base=$base" >> $PATHDMRGATEWAY
echo "Startup=$xlxstartup" >> $PATHDMRGATEWAY
echo "Relink=10" >> $PATHDMRGATEWAY
echo "Debug=0" >> $PATHDMRGATEWAY
echo "#Allow user linking control using Private Calls" >> $PATHDMRGATEWAY
echo "UserControl=1" >> $PATHDMRGATEWAY
echo "#Override default module for startup reflector" >> $PATHDMRGATEWAY
echo "#Module=xlxmodulo" >> $PATHDMRGATEWAY
echo "" >> $PATHDMRGATEWAY


#################################################################
# echo "Enable=$dmr" >> $PATHMMDVM
#echo "Address=$dmrdireccion" >> $PATHMMDVM
#echo "Port=$dmrpremoto" >> $PATHMMDVM
#echo "Password=$dmrpassword" >> $PATHMMDVM
#echo "Options=$dmroptions"  >> $PATHMMDVM
#echo "#Local=$dmrrptport" >> $PATHMMDVM
###################################################################



echo "# Conexion DMR" >> $PATHDMRGATEWAY
echo "[DMR Network 1]" >> $PATHDMRGATEWAY
echo "Enabled=$dmr" >> $PATHDMRGATEWAY
#echo "Name=$bmnombre" >> $PATHDMRGATEWAY
echo "Name=ConexionDMR" >> $PATHDMRGATEWAY
echo "Address=$dmrdireccion" >> $PATHDMRGATEWAY
echo "Port=$dmrpremoto" >> $PATHDMRGATEWAY

if [[ $dmrreflector != "" ]]
then
    echo "Options=$dmroptions" >> $PATHDMRGATEWAY
fi

echo "# Local=" >> $PATHDMRGATEWAY
echo "# Local cluster" >> $PATHDMRGATEWAY

#echo "TGRewrite=$bmtgwrite" >> $PATHDMRGATEWAY
#echo "# Reflector TG on to slot 2 TG9" >> $PATHDMRGATEWAY
#echo "#TGRewrite=2,9,2,9,1" >> $PATHDMRGATEWAY
#echo "# Reflector control command slot 2 94000->4000 to 95000->5000" >> $PATHDMRGATEWAY
#echo "PCRewrite=$pcrewrite" >> $PATHDMRGATEWAY
#echo "# Echo on RF slot 1 TG9990 to network slot 1 9990" >> $PATHDMRGATEWAY
#echo "TypeRewrite=1,9990,1,9990" >> $PATHDMRGATEWAY
#echo "SrcRewrite=1,9990,1,9990,1" >> $PATHDMRGATEWAY
#echo "# Reflector status returns" >> $PATHDMRGATEWAY
#echo "SrcRewrite=2,4000,2,9,1001" >> $PATHDMRGATEWAY
#echo "# Pass all of the other private traffic on slot 1 and slot 2" >> $PATHDMRGATEWAY

#echo "PassAllPC=$bmpassa11pc" >> $PATHDMRGATEWAY

echo "PassAllPC=1" >> $PATHDMRGATEWAY
echo "PassAllPC=2" >> $PATHDMRGATEWAY
echo "Password=$dmrpassword" >> $PATHDMRGATEWAY
echo "Location=1" >> $PATHDMRGATEWAY
echo "Debug=0" >> $PATHDMRGATEWAY
echo "" >> $PATHDMRGATEWAY





#echo "# DMR+" >> $PATHDMRGATEWAY
#echo "[DMR Network 2]" >> $PATHDMRGATEWAY
#echo "Enabled=$dmrgateway" >> $PATHDMRGATEWAY
#echo "Name=$dmrnombre" >> $PATHDMRGATEWAY
#echo "Address=$dmrgatewaydireccion" >> $PATHDMRGATEWAY
#echo "Port=$dmrgatewayport" >> $PATHDMRGATEWAY
#echo "# Local=3352" >> $PATHDMRGATEWAY
#echo "# Reflector TG on to slot 2 TG8" >> $PATHDMRGATEWAY
#echo "TGRewrite=$dmrtgrewrite" >> $PATHDMRGATEWAY
#echo "# Echo on slot 2 TG9990" >> $PATHDMRGATEWAY
#echo "TGRewrite=2,9990,2,9990,1" >> $PATHDMRGATEWAY
#echo "# Reflector control command slot 2 84000->4000 to 85000->5000" >> $PATHDMRGATEWAY
#echo "PCRewrite=$dmrpcrewrite" >> $PATHDMRGATEWAY
#echo "# Pass all of the other talk group traffic on slot 1 and slot 2" >> $PATHDMRGATEWAY
#echo "PassAllTG=$dmrpassa11pc" >> $PATHDMRGATEWAY
#echo "PassAllTG=2" >> $PATHDMRGATEWAY
#echo "Password=$dmrgatewaypass" >> $PATHDMRGATEWAY
#echo "Location=0" >> $PATHDMRGATEWAY
#echo "Debug=0" >> $PATHDMRGATEWAY

#echo "# TGIF Network" >> $PATHDMRGATEWAY
#echo "[DMR Network 3]" >> $PATHDMRGATEWAY
#echo "Enabled=$tgif" >> $PATHDMRGATEWAY
#echo "Name=$tgifnombre" >> $PATHDMRGATEWAY
#echo "TGRewrite0=$tgiftgrewrite" >> $PATHDMRGATEWAY
#echo "SrcRewrite0=$tgifsrcrewrite" >> $PATHDMRGATEWAY
#echo "Address=$tgifdireccion" >> $PATHDMRGATEWAY
#echo "Password=$tgifpassword" >> $PATHDMRGATEWAY
#echo "Port=$tgifpassword" >> $PATHDMRGATEWAY
#echo "Location=0" >> $PATHDMRGATEWAY
#echo "Debug=0" >> $PATHDMRGATEWAY
#echo "# Local HBLink 1 network" >> $PATHDMRGATEWAY
#echo "[DMR Network 4]" >> $PATHDMRGATEWAY
#echo "Enabled=$hblink" >> $PATHDMRGATEWAY
#echo "Name=$hblinkname" >> $PATHDMRGATEWAY
#echo "Address=$hblinkdireccion" >> $PATHDMRGATEWAY
#echo "Port=$hblinkport" >> $PATHDMRGATEWAY
#echo "# Local=3352" >> $PATHDMRGATEWAY
#echo "# Local area TG on to slot 2 TG1" >> $PATHDMRGATEWAY
#echo "TGRewrite=$hblinktgwrite" >> $PATHDMRGATEWAY
#echo "Password=$hblinkpass" >> $PATHDMRGATEWAY
#echo "Location=0" >> $PATHDMRGATEWAY
#echo "Debug=0" >> $PATHDMRGATEWAY

#echo "# Local HBLink 2 network" >> $PATHDMRGATEWAY
#echo "[DMR Network 5]" >> $PATHDMRGATEWAY
#echo "Enabled=$hblink2" >> $PATHDMRGATEWAY
#echo "Name=$hblinkname2" >> $PATHDMRGATEWAY
#echo "Address=$hblinkdireccion2" >> $PATHDMRGATEWAY
#echo "Port=$hblinkport2" >> $PATHDMRGATEWAY
#echo "# Local=3352" >> $PATHDMRGATEWAY
#echo "# Local area TG on to slot 2 TG1" >> $PATHDMRGATEWAY
#echo "TGRewrite=$hblinktgwrite" >> $PATHDMRGATEWAY
#echo "Password=$hblinkpass2" >> $PATHDMRGATEWAY
#echo "Location=0" >> $PATHDMRGATEWAY
#echo "Debug=0" >> $PATHDMRGATEWAY


echo "" >> $PATHDMRGATEWAY
echo "[GPSD]" >> $PATHDMRGATEWAY
echo "Enable=0" >> $PATHDMRGATEWAY
echo "Address=127.0.0.1" >> $PATHDMRGATEWAY
echo "Port=2947" >> $PATHDMRGATEWAY
echo "" >> $PATHDMRGATEWAY

aprs=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprs from hotspot where nombre = '$NOMBRE';")
aprslocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprslocalport from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprsdescripcion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprsdescripcion from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprssufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprssufijo from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
echo "[APRS]" >> $PATHDMRGATEWAY
echo "Enable=0" >> $PATHDMRGATEWAY
echo "Address=127.0.0.1" >> $PATHDMRGATEWAY
echo "Port=8673" >> $PATHDMRGATEWAY
echo "Description=APRS Description" >> $PATHDMRGATEWAY
echo "Suffix=3" >> $PATHDMRGATEWAY
echo "" >> $PATHDMRGATEWAY

echo "[Dynamic TG Control]" >> $PATHDMRGATEWAY
echo "Enabled=1" >> $PATHDMRGATEWAY
echo "Port=3769" >> $PATHDMRGATEWAY
echo "" >> $PATHDMRGATEWAY

}


#####################     FIN DMRGATEWAY       ##############################


####################      INICIO APRSGATEWAY  #################################
function APRSGATEWAY(){
echo "[General]" > $PATHAPRSGATEWAY
echo "Callsign=$indicativo-aprssufijo" >> $PATHAPRSGATEWAY
echo "Debug=1" >> $PATHAPRSGATEWAY
echo "Daemon=0" >> $PATHAPRSGATEWAY
echo "" >> $PATHAPRSGATEWAY

aprsserver=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprsserver from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprspass=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprspass from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
echo "[APRS-IS]" >> $PATHAPRSGATEWAY
echo "# Rorate - global load balance" >> $PATHAPRSGATEWAY
echo "Server=$aprsserver" >> $PATHAPRSGATEWAY
echo "# North America" >> $PATHAPRSGATEWAY
echo "# Server=noam.aprs2.net" >> $PATHAPRSGATEWAY
echo "# South America" >> $PATHAPRSGATEWAY
echo "# Server=soam.aprs2.net" >> $PATHAPRSGATEWAY
echo "# Europe & Africa" >> $PATHAPRSGATEWAY
echo "# Server=euro.aprs2.net" >> $PATHAPRSGATEWAY
echo "# Asia" >> $PATHAPRSGATEWAY
echo "# Server=asia.aprs2.net" >> $PATHAPRSGATEWAY
echo "# Oceania" >> $PATHAPRSGATEWAY
echo "# Server=aunz.aprs2.net" >> $PATHAPRSGATEWAY
echo "Port=14580" >> $PATHAPRSGATEWAY
echo "Password=$aprspass" >> $PATHAPRSGATEWAY
echo "" >> $PATHAPRSGATEWAY

echo "[Log]" >> $PATHAPRSGATEWAY
echo "# Logging levels, 0=No logging" >> $PATHAPRSGATEWAY
echo "DisplayLevel=1" >> $PATHAPRSGATEWAY
echo "FileLevel=1" >> $PATHAPRSGATEWAY
echo "FilePath=." >> $PATHAPRSGATEWAY
echo "FileRoot=APRSGateway" >> $PATHAPRSGATEWAY
echo "FileRotate=1" >> $PATHAPRSGATEWAY
echo "" >> $PATHAPRSGATEWAY

echo "[Network]" >> $PATHAPRSGATEWAY
echo "Address=127.0.0.1" >> $PATHAPRSGATEWAY
echo "Port=$aprslocalport" >> $PATHAPRSGATEWAY

}
######################     FIN APRS GATEWAY   ##################################



#####################     INICIO YSF2NXDN       ##############################
function YSF2NXDN(){
latitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select latitude from hot_conf_personal where nombre = '$NOMBRE';")
longitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select longitude from hot_conf_personal where nombre = '$NOMBRE';")
height=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select height from hot_conf_personal where nombre = '$NOMBRE';")
description=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select description from hot_conf_personal where nombre = '$NOMBRE';")
location=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select location from hot_conf_personal where nombre = '$NOMBRE';")
frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frecrx from hot_conf_personal where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frectx from hot_conf_personal where nombre = '$NOMBRE';")
echo "[Info]" >> $PATHYSF2NXDN
echo "RXFrequency=$frecrx" >> $PATHYSF2NXDN
echo "TXFrequency=$frectx" >> $PATHYSF2NXDN
echo "Latitude=$latitude" >> $PATHYSF2NXDN
echo "Longitude=$longitude" >> $PATHYSF2NXDN
echo "Height=$height" >> $PATHYSF2NXDN
echo "Description=$description" >> $PATHYSF2NXDN
echo "" >> $PATHYSF2NXDN
echo "[YSF Network]" >> $PATHYSF2NXDN
echo "Callsign=$indicativo" >> $PATHYSF2NXDN
echo "Suffix=ND" >> $PATHYSF2NXDN
echo "#Suffix=RPT" >> $PATHYSF2NXDN
echo "DstAddress=127.0.0.1" >> $PATHYSF2NXDN
echo "DstPort=$fusionrptport" >> $PATHYSF2NXDN
echo "LocalAddress=127.0.0.1" >> $PATHYSF2NXDN
echo "LocalPort=$fusionlocalport" >> $PATHYSF2NXDN
echo "EnableWiresX=1" >> $PATHYSF2NXDN
echo "WiresXMakeUpper=1" >> $PATHYSF2NXDN
echo "Daemon=0" >> $PATHYSF2NXDN
echo "" >> $PATHYSF2NXDN
echo "[NXDN Network]" >> $PATHYSF2NXDN
echo "Id=$nxdnid" >> $PATHYSF2NXDN
echo "StartupDstId=$nxdnreflector" >> $PATHYSF2NXDN
echo "LocalAddress=127.0.0.1" >> $PATHYSF2NXDN
echo "LocalPort=$nxdnrptport" >> $PATHYSF2NXDN
echo "DstAddress=127.0.0.1" >> $PATHYSF2NXDN
echo "DstPort=$nxdnlocalport" >> $PATHYSF2NXDN
echo "TGListFile=TGList-NXDN.txt" >> $PATHYSF2NXDN
echo "Debug=0" >> $PATHYSF2NXDN
echo "" >> $PATHYSF2NXDN
echo "[NXDN Id Lookup]" >> $PATHYSF2NXDN
echo "File=/var/lib/mmdvm/NXDN.csv" >> $PATHYSF2NXDN
echo "Time=24" >> $PATHYSF2NXDN
echo "" >> $PATHYSF2NXDN
echo "[Log]" >> $PATHYSF2NXDN
echo "# Logging levels, 0=No logging" >> $PATHYSF2NXDN
echo "DisplayLevel=1" >> $PATHYSF2NXDN
echo "FileLevel=1" >> $PATHYSF2NXDN
echo "FilePath=/var/log/hotspots" >> $PATHYSF2NXDN
echo "FileRoot=YSF2NXDN-$nombre" >> $PATHYSF2NXDN
echo "" >> $PATHYSF2NXDN

aprs=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprs from hotspot where nombre = '$NOMBRE';")
aprsdescripcion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprsdescripcion from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
aprsserver=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprsserver from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
echo "[aprs.fi]" >> $PATHYSF2NXDN
echo "Enable=$aprs" >> $PATHYSF2NXDN
echo "# Server=noam.aprs2.net" >> $PATHYSF2NXDN
echo "Server=$aprsserver" >> $PATHYSF2NXDN
echo "Port=14580" >> $PATHYSF2NXDN
echo "Password=9999" >> $PATHYSF2NXDN
echo "APIKey=Apikey" >> $PATHYSF2NXDN
echo "Refresh=240" >> $PATHYSF2NXDN
echo "Description=$description" >> $PATHYSF2NXDN

}
#####################     FIN YSF2NXDN       ##############################


#####################     INICIO DMR2YSF       ##############################

function DMR2YSF(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $PATHDMR2YSF
echo "" >> $PATHDMR2YSF
echo "[YSF Network]" >> $PATHDMR2YSF
echo "Callsign=$indicativo" >> $PATHDMR2YSF
echo "GatewayAddress=127.0.0.1" >> $PATHDMR2YSF
echo "GatewayPort=$fusionrptport" >> $PATHDMR2YSF
echo "LocalAddress=127.0.0.1" >> $PATHDMR2YSF
echo "LocalPort=$fusionlocalport" >> $PATHDMR2YSF
echo "FCSRooms=FCSRooms.txt" >> $PATHDMR2YSF
echo "Daemon=0" >> $PATHDMR2YSF
echo "Debug=0" >> $PATHDMR2YSF
echo "" >> $PATHDMR2YSF
#########################################################

dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrid from hot_conf_personal where nombre = '$NOMBRE';")
dmrlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select cross_DMR_localport from hot_CROSSLINKS where nombre = '$NOMBRE';")
dmrrptport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select cross_DMR_rptport from hot_CROSSLINKS where nombre = '$NOMBRE';")
fstartup=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select fstartup from hot_YSF where nombre = '$NOMBRE';")
echo "[DMR Network]" >> $PATHDMR2YSF
echo "Id=$dmrid" >> $PATHDMR2YSF
echo "RptAddress=127.0.0.1" >> $PATHDMR2YSF
echo "RptPort=$dmrrptport" >> $PATHDMR2YSF
echo "LocalAddress=127.0.0.1" >> $PATHDMR2YSF
echo "LocalPort=$dmrlocalport" >> $PATHDMR2YSF
echo "DefaultDstTG=9" >> $PATHDMR2YSF
echo "TGUnlink=4000" >> $PATHDMR2YSF

ruta="/opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVM_CM/DMR2YSF/TG-YSFList.txt"
tg=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dtmffusion FROM ysfhost where startup = '$fstartup';")
#echo "EL TG ES $tg y el nombre es $fstartup"
sed -i "5s/.*/9;$tg/" /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVM_CM/DMR2YSF/TG-YSFList.txt
echo "TGListFile=TG-YSFList.txt" >> $PATHDMR2YSF
echo "Debug=0" >> $PATHDMR2YSF
echo "" >> $PATHDMR2YSF
#########################################################
echo "[DMR Id Lookup]" >> $PATHDMR2YSF
echo "File=DMRIds.dat" >> $PATHDMR2YSF
echo "Time=24" >> $PATHDMR2YSF
echo "" >> $PATHDMR2YSF
#########################################################
echo "[Log]" >> $PATHDMR2YSF
echo "# Logging levels, 0=No logging" >> $PATHDMR2YSF
echo "DisplayLevel=1" >> $PATHDMR2YSF
echo "FileLevel=1" >> $PATHDMR2YSF
echo "FilePath=/var/log/hotspots" >> $PATHDMR2YSF
echo "FileRoot=DMR2YSF-$nombre" >> $PATHDMR2YSF
}

#####################     FIN DMR2YSF       ##############################

####################     INICIO YSF2DMR     ##############################

function YSF2DMR(){
latitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select latitude from hot_conf_personal where nombre = '$NOMBRE';")
longitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select longitude from hot_conf_personal where nombre = '$NOMBRE';")
height=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select height from hot_conf_personal where nombre = '$NOMBRE';")
description=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select description from hot_conf_personal where nombre = '$NOMBRE';")
location=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select location from hot_conf_personal where nombre = '$NOMBRE';")
power=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select power from hot_conf_personal where nombre = '$NOMBRE';")
url=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select url from hot_conf_personal where nombre = '$NOMBRE';")
frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frecrx from hot_conf_personal where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frectx from hot_conf_personal where nombre = '$NOMBRE';")
echo "[Info]" > $PATHYSF2DMR
echo "RXFrequency=$frecrx" >> $PATHYSF2DMR
echo "TXFrequency=$frectx" >> $PATHYSF2DMR
echo "Power=$power" >> $PATHYSF2DMR
echo "Latitude=$latitude" >> $PATHYSF2DMR
echo "Longitude=$longitude" >> $PATHYSF2DMR
echo "Height=$height" >> $PATHYSF2DMR
echo "Location=$location" >> $PATHYSF2DMR
echo "Description=$description" >> $PATHYSF2DMR
echo "URL=$url" >> $PATHYSF2DMR
echo "" >> $PATHYSF2DMR
#########################################################
echo "[YSF Network]" >> $PATHYSF2DMR
echo "Callsign=$indicativo" >> $PATHYSF2DMR
echo "Suffix=ND" >> $PATHYSF2DMR
echo "#Suffix=RPT" >> $PATHYSF2DMR
echo "DstAddress=127.0.0.1" >> $PATHYSF2DMR
echo "DstPort=$fusionrptport" >> $PATHYSF2DMR
echo "LocalAddress=127.0.0.1" >> $PATHYSF2DMR
echo "LocalPort=$fusionlocalport" >> $PATHYSF2DMR
echo "EnableWiresX=1" >> $PATHYSF2DMR
echo "RemoteGateway=0" >> $PATHYSF2DMR
echo "HangTime=1000" >> $PATHYSF2DMR
echo "WiresXMakeUpper=1" >> $PATHYSF2DMR
echo "Daemon=0" >> $PATHYSF2DMR
echo "" >> $PATHYSF2DMR
#########################################################
dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrid from hot_conf_personal where nombre = '$NOMBRE';")
dmred=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmred from hotspot where nombre = '$NOMBRE';")

echo "[DMR Network]" >> $PATHYSF2DMR
echo "Id=$dmrid" >> $PATHYSF2DMR
echo "#XLXFile=XLXHosts.txt" >> $PATHYSF2DMR
echo "#XLXReflector=950" >> $PATHYSF2DMR
echo "#XLXModule=$xlxmodulo" >> $PATHYSF2DMR
if [[ $dmred = "BM" ]]
then
    echo "StartupDstId=$tgysf2dmr" >> $PATHYSF2DMR
    else if [[ $dmred = "HBLINK" ]]
    then
       echo "StartupDstId=$tgysf2dmr" >> $PATHYSF2DMR
    else
        echo "StartupDstId=9" >> $PATHYSF2DMR
    fi
fi

dmrlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrlocalport from hot_DMR where nombre = '$NOMBRE';")
dmrpremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrpremoto from hot_DMR where nombre = '$NOMBRE';")
dmrdireccion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrdireccion from hot_DMR where nombre = '$NOMBRE';")
dmrpassword=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrpassword from hot_DMR where nombre = '$NOMBRE';")
dmroptions=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmroptions from hot_DMR where nombre = '$NOMBRE';")

echo "# For TG call: StartupPC=0" >> $PATHYSF2DMR
echo "StartupPC=0" >> $PATHYSF2DMR
echo "Address=$dmrdireccion" >> $PATHYSF2DMR
echo "Port=$dmrpremoto" >> $PATHYSF2DMR
echo "Jitter=500" >> $PATHYSF2DMR
echo "EnableUnlink=1" >> $PATHYSF2DMR
echo "TGUnlink=4000" >> $PATHYSF2DMR
echo "PCUnlink=0" >> $PATHYSF2DMR
echo "# Local=62032" >> $PATHYSF2DMR
echo "Password=$dmrpassword" >> $PATHYSF2DMR
#Options=StartRef=$reflector;RelinkTime=30;Userlink=1;TS2_1=214;
if [[ $dmroptions != "" ]]
then
    echo "Options=$dmroptions" >> $PATHYSF2DMR
else
    echo "#Options=" >> $PATHYSF2DMR
fi
echo "TGListFile=TGList-DMR.txt" >> $PATHYSF2DMR
echo "Debug=0" >> $PATHYSF2DMR
echo "" >> $PATHYSF2DMR
#########################################################
echo "[DMR Id Lookup]" >> $PATHYSF2DMR
echo "File=DMRIds.dat" >> $PATHYSF2DMR
echo "Time=24" >> $PATHYSF2DMR
echo "DropUnknown=0" >> $PATHYSF2DMR
echo "" >> $PATHYSF2DMR
#########################################################
echo "[Log]" >> $PATHYSF2DMR
echo "# Logging levels, 0=No logging" >> $PATHYSF2DMR
echo "DisplayLevel=1" >> $PATHYSF2DMR
echo "FileLevel=1" >> $PATHYSF2DMR
echo "FilePath=/var/log/hotspots" >> $PATHYSF2DMR
echo "FileRoot=YSF2DMR-$nombre" >> $PATHYSF2DMR
echo "" >> $PATHYSF2DMR
#########################################################
aprs=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprs from hotspot where nombre = '$NOMBRE';")
indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select indicativo from hotspot where nombre = '$NOMBRE';")
aprsdescripcion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select aprsdescripcion from hot_APRS_GATEWAY where nombre = '$NOMBRE';")
echo "[aprs.fi]" >> $PATHYSF2DMR
echo "Enable=$aprs" >> $PATHYSF2DMR
echo "AprsCallsign=$indicativo" >> $PATHYSF2DMR
echo "# Server=noam.aprs2.net" >> $PATHYSF2DMR
echo "Server=euro.aprs2.net" >> $PATHYSF2DMR
echo "Port=14580" >> $PATHYSF2DMR
echo "Password=9999" >> $PATHYSF2DMR
echo "APIKey=Apikey" >> $PATHYSF2DMR
echo "Refresh=240" >> $PATHYSF2DMR
echo "Description=$description" >> $PATHYSF2DMR

}
#####################     FIN YSF2DMR        ###############################

####################    INICIO DMR2NXDN     ###############################

function DMR2NXDN(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $PATHDMR2NXDN
echo "[NXDN Network]" >> $PATHDMR2NXDN
echo "GatewayAddress=127.0.0.1" >> $PATHDMR2NXDN
echo "GatewayPort=$nxdnrptport" >> $PATHDMR2NXDN
echo "LocalAddress=127.0.0.1" >> $PATHDMR2NXDN
echo "LocalPort=$nxdnlocalport" >> $PATHDMR2NXDN
echo "DefaultID=$nxdnid" >> $PATHDMR2NXDN
echo "Daemon=0" >> $PATHDMR2NXDN
echo "" >> $PATHDMR2NXDN
#########################################################
dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrid from hot_conf_personal where nombre = '$NOMBRE';")
dmrlocalport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrlocalport from hot_DMR where nombre = '$NOMBRE';")
dmrpremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrpremoto from hot_DMR where nombre = '$NOMBRE';")

echo "[DMR Network]" >> $PATHDMR2NXDN
echo "Id=$dmrid" >> $PATHDMR2NXDN
echo "RptAddress=127.0.0.1" >> $PATHDMR2NXDN
echo "RptPort=$dmrpremoto" >> $PATHDMR2NXDN
echo "LocalAddress=127.0.0.1" >> $PATHDMR2NXDN
echo "LocalPort=$dmrlocalport" >> $PATHDMR2NXDN
echo "Debug=0" >> $PATHDMR2NXDN
echo "" >> $PATHDMR2NXDN
#########################################################
echo "[DMR Id Lookup]" >> $PATHDMR2NXDN
echo "File=DMRIds.dat" >> $PATHDMR2NXDN
echo "Time=24" >> $PATHDMR2NXDN
echo "" >> $PATHDMR2NXDN
#########################################################
echo "[NXDN Id Lookup]" >> $PATHDMR2NXDN
echo "File=NXDN.csv" >> $PATHDMR2NXDN
echo "Time=24" >> $PATHDMR2NXDN
echo "" >> $PATHDMR2NXDN
#########################################################
echo "[Log]" >> $PATHDMR2NXDN
echo "# Logging levels, 0=No logging" >> $PATHDMR2NXDN
echo "DisplayLevel=1" >> $PATHDMR2NXDN
echo "FileLevel=1" >> $PATHDMR2NXDN
echo "FilePath=/var/log/hotspots" >> $PATHDMR2NXDN
echo "FileRoot=DMR2NXDN-$nombre" >> $PATHDMR2NXDN
}
####################   FIN DMR2NXDN         ###############################

####################    INICIO NXDN2DMR     ##############################
function NXDN2DMR(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $PATHNXDN2DMR
frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frecrx from hot_conf_personal where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frectx from hot_conf_personal where nombre = '$NOMBRE';")
power=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select power from hot_conf_personal where nombre = '$NOMBRE';")
latitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select latitude from hot_conf_personal where nombre = '$NOMBRE';")
longitude=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select longitude from hot_conf_personal where nombre = '$NOMBRE';")
height=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select height from hot_conf_personal where nombre = '$NOMBRE';")
description=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select description from hot_conf_personal where nombre = '$NOMBRE';")
url=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select url from hot_conf_personal where nombre = '$NOMBRE';")

echo "[Info]" >> $PATHNXDN2DMR
echo "RXFrequency=$frecrx" >> $PATHNXDN2DMR
echo "TXFrequency=$frectx" >> $PATHNXDN2DMR
echo "Power=$power" >> $PATHNXDN2DMR
echo "Latitude=$latitude" >> $PATHNXDN2DMR
echo "Longitude=$longitude" >> $PATHNXDN2DMR
echo "Height=$height" >> $PATHNXDN2DMR
echo "Location=$location" >> $PATHNXDN2DMR
echo "Description=$description" >> $PATHNXDN2DMR
echo "URL=$url" >> $PATHNXDN2DMR
echo "" >> $PATHNXDN2DMR
#########################################################
echo "[NXDN Network]" >> $PATHNXDN2DMR
echo "Callsign=$indicativo" >> $PATHNXDN2DMR
echo "TG=20" >> $PATHNXDN2DMR
echo "DstAddress=127.0.0.1" >> $PATHNXDN2DMR
#if [[ $nxdn2dmr = "1" ]]
#then
    echo "DstPort=$NXDNPORT" >> $PATHNXDN2DMR
#else
#    echo "DstPort=$nxdnrptport" >> $PATHNXDN2DMR
#fi
echo "LocalAddress=127.0.0.1" >> $PATHNXDN2DMR
#if [[ $nxdn2dmr = "1" ]]
#then
    echo "LocalPort=$NXDN2DMRPORT" >> $PATHNXDN2DMR
#else
#    echo "LocalPort=$nxdnlocalport" >> $PATHNXDN2DMR
#fi

#echo "LocalPort=$nxdnlocalport" >> $PATHNXDN2DMR
echo "DefaultID=$nxdnid" >> $PATHNXDN2DMR
echo "Daemon=0" >> $PATHNXDN2DMR
echo "" >> $PATHNXDN2DMR
#########################################################
dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrid from hot_conf_personal where nombre = '$NOMBRE';")
dmred=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmred from hotspot where nombre = '$NOMBRE';")
echo "[DMR Network]" >> $PATHNXDN2DMR
echo "Id=$dmrid" >> $PATHNXDN2DMR
echo "#XLXFile=XLXHosts.txt" >> $PATHNXDN2DMR
echo "#XLXReflector=950" >> $PATHNXDN2DMR
echo "#XLXModule=D" >> $PATHNXDN2DMR
if [[ $dmred = "BM" ]]
then
    echo "StartupDstId=$tgysf2dmr" >> $PATHNXDN2DMR
    else if [[ $dmred = "HBLINK" ]]
    then
       echo "StartupDstId=$tgysf2dmr" >> $PATHNXDN2DMR
    else
        echo "StartupDstId=9" >> $PATHNXDN2DMR
    
fi

dmrpremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrpremoto from hot_DMR where nombre = '$NOMBRE';")
dmrdireccion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrdireccion from hot_DMR where nombre = '$NOMBRE';")
dmrpassword=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmrpassword from hot_DMR where nombre = '$NOMBRE';")
dmroptions=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dmroptions from hot_DMR where nombre = '$NOMBRE';")

echo "# For TG call: StartupPC=0" >> $PATHNXDN2DMR
echo "StartupPC=0" >> $PATHNXDN2DMR
echo "Address=$dmrdireccion" >> $PATHNXDN2DMR
echo "Port=$dmrpremoto" >> $PATHNXDN2DMR
echo "Jitter=500" >> $PATHNXDN2DMRç
echo "Password=$dmrpassword" >> $PATHNXDN2DMR
#Options=StartRef=$reflector;RelinkTime=30;Userlink=1;TS2_1=214;
if [[ $dmroptions != "" ]]
then
    echo "Options=$dmroptions" >> $PATHNXDN2DMR
else
    echo "#Options=" >> $PATHNXDN2DMR
fi
echo "Debug=0" >> $PATHNXDN2DMR
echo "" >> $PATHNXDN2DMR
#########################################################
echo "[DMR Id Lookup]" >> $PATHNXDN2DMR
echo "File=DMRIds.dat" >> $PATHNXDN2DMR
echo "Time=24" >> $PATHNXDN2DMR
echo "" >> $PATHNXDN2DMR
#########################################################
echo "[NXDN Id Lookup]" >> $PATHNXDN2DMR
echo "File=NXDN.csv" >> $PATHNXDN2DMR
echo "Time=24" >> $PATHNXDN2DMR
echo "" >> $PATHNXDN2DMR
#########################################################
echo "[Log]" >> $PATHNXDN2DMR
echo "# Logging levels, 0=No logging" >> $PATHNXDN2DMR
echo "DisplayLevel=1" >> $PATHNXDN2DMR
echo "FileLevel=1" >> $PATHNXDN2DMR
echo "FilePath=/var/log/hotspots" >> $PATHNXDN2DMR
echo "FileRoot=NXDN2DMR-$nombre" >> $PATHNXDN2DMR
}
####################   FIN NXDN2DMR         #############################

###################    INICIO YSF2P25       ############################
function YSF2P25(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $PATHYSF2P25
frecrx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frecrx from hot_conf_personal where nombre = '$NOMBRE';")
frectx=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select frectx from hot_conf_personal where nombre = '$NOMBRE';")
description=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select description from hot_conf_personal where nombre = '$NOMBRE';")

echo "[Info]" >> $PATHYSF2P25
echo "RXFrequency=$frecrx" >> $PATHYSF2P25
echo "TXFrequency=$frectx" >> $PATHYSF2P25
echo "Description=$description" >> $PATHYSF2P25
echo "" >> $PATHYSF2P25
#########################################################
echo "[YSF Network]" >> $PATHYSF2P25
echo "Callsign=$indicativo" >> $PATHYSF2P25
echo "Suffix=ND" >> $PATHYSF2P25
echo "#Suffix=RPT" >> $PATHYSF2P25
echo "DstAddress=127.0.0.1" >> $PATHYSF2P25
echo "DstPort=$fusionrptport" >> $PATHYSF2P25
echo "LocalAddress=127.0.0.1" >> $PATHYSF2P25
echo "LocalPort=$fusionlocalport" >> $PATHYSF2P25
echo "EnableWiresX=1" >> $PATHYSF2P25
echo "WiresXMakeUpper=1" >> $PATHYSF2P25
echo "Daemon=0" >> $PATHYSF2P25
echo "Debug=0" >> $PATHYSF2P25
echo "" >> $PATHYSF2P25
########################################################
echo "[P25 Network]" >> $PATHYSF2P25
echo "Id=$dmrid" >> $PATHYSF2P25
#if [[ $nxdnreflector = "" ]]
#then
#   echo "#Startup=$p25reflector" >> $PATHYSF2P25
#else
#   echo "Startup=$p25reflector" >> $PATHBRIDGEP25
#fi
echo "StartupDstId=$p25reflector" >> $PATHYSF2P25     # añadir peticion de TG P25
echo "LocalAddress=127.0.0.1" >> $PATHYSF2P25
echo "LocalPort=$p25rptport" >> $PATHYSF2P25
echo "DstAddress=127.0.0.1" >> $PATHYSF2P25
echo "DstPort=$p25localport" >> $PATHYSF2P25
echo "TGListFile=TGList-P25.txt" >> $PATHYSF2P25
echo "Debug=0" >> $PATHYSF2P25
echo "" >> $PATHYSF2P25
#########################################################
echo "[DMR Id Lookup]" >> $PATHYSF2P25
echo "File=DMRIds.dat" >> $PATHYSF2P25
echo "Time=24" >> $PATHYSF2P25
echo "" >> $PATHYSF2P25
#########################################################
echo "[Log]" >> $PATHYSF2P25
echo "# Logging levels, 0=No logging" >> $PATHYSF2P25
echo "DisplayLevel=1" >> $PATHYSF2P25
echo "FileLevel=1" >> $PATHYSF2P25
echo "FilePath=/var/log/hotspots" >> $PATHYSF2P25
echo "FileRoot=YSF2P25-$nombre" >> $PATHYSF2P25

}

###################    FIN YSF2P25          ###########################


####################   INICIO SERVICIOS     ##########################


function DMR2YSFSERVICE(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $DMR2YSFSERVICE
echo "" >> $DMR2YSFSERVICE
echo "[Unit]" >> $DMR2YSFSERVICE
echo "Description= DMR2YSF $nombre daemon " >> $DMR2YSFSERVICE
echo "After=syslog.target network.target" >> $DMR2YSFSERVICE
echo "" >> $DMR2YSFSERVICE
echo "[Service]" >> $DMR2YSFSERVICE
echo "User=root" >> $DMR2YSFSERVICE
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/DMR2YSF/" >> $DMR2YSFSERVICE
echo "RestartSec=always" >> $DMR2YSFSERVICE
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/DMR2YSF/DMR2YSF"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/DMR2YSF/DMR2YSF.ini"
echo "ExecStart=$ruta1 $ruta2" >> $DMR2YSFSERVICE
echo "Restart=always" >> $DMR2YSFSERVICE
echo "RestartSec=10" >> $DMR2YSFSERVICE
echo "" >> $DMR2YSFSERVICE
echo "[Install]" >> $DMR2YSFSERVICE
echo "WantedBy=multi-user.target" >> $DMR2YSFSERVICE
}

function DMR2NXDNSERVICE(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $DMR2NXDNSERVICE
echo "" >> $DMR2NXDNSERVICE
echo "[Unit]" >> $DMR2NXDNSERVICE
echo "Description= DMR2NXDN $nombre daemon " >> $DMR2NXDNSERVICE
echo "After=syslog.target network.target" >> $DMR2NXDNSERVICE
echo "" >> $DMR2NXDNSERVICE
echo "[Service]" >> $DMR2NXDNSERVICE
echo "User=root" >> $DMR2NXDNSERVICE
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/DMR2NXDN/" >> $DMR2NXDNSERVICE
echo "RestartSec=always" >> $DMR2NXDNSERVICE
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/DMR2NXDN/DMR2NXDN"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/DMR2NXDN/DMR2NXDN.ini"
echo "ExecStart=$ruta1 $ruta2" >> $DMR2NXDNSERVICE
echo "Restart=always" >> $DMR2NXDNSERVICE
echo "RestartSec=10" >> $DMR2NXDNSERVICE
echo "" >> $DMR2NXDNSERVICE
echo "[Install]" >> $DMR2NXDNSERVICE
echo "WantedBy=multi-user.target" >> $DMR2NXDNSERVICE
}


function YSF2DMRSERVICE(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $YSF2DMRSERVICE
echo "" >> $YSF2DMRSERVICE
echo "[Unit]" >> $YSF2DMRSERVICE
echo "Description= YSF2DMR $nombre daemon " >> $YSF2DMRSERVICE
echo "After=syslog.target network.target" >> $YSF2DMRSERVICE
echo "" >> $YSF2DMRSERVICE
echo "[Service]" >> $YSF2DMRSERVICE
echo "User=root" >> $YSF2DMRSERVICE
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/YSF2DMR/" >> $YSF2DMRSERVICE
echo "RestartSec=always" >> $YSF2DMRSERVICE
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/YSF2DMR/YSF2DMR"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/YSF2DMR/YSF2DMR.ini"
echo "ExecStart=$ruta1 $ruta2" >> $YSF2DMRSERVICE
echo "Restart=always" >> $YSF2DMRSERVICE
echo "RestartSec=10" >> $YSF2DMRSERVICE
echo "" >> $YSF2DMRSERVICE
echo "[Install]" >> $YSF2DMRSERVICE
echo "WantedBy=multi-user.target" >> $YSF2DMRSERVICE
}

function YSF2P25SERVICE(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $PATHYSF2P25SERVICE
echo "" >> $PATHYSF2P25SERVICE
echo "[Unit]" >> $PATHYSF2P25SERVICE
echo "Description= YSF2P25 $nombre daemon " >> $PATHYSF2P25SERVICE
echo "After=syslog.target network.target" >> $PATHYSF2P25SERVICE
echo "" >> $PATHYSF2P25SERVICE
echo "[Service]" >> $PATHYSF2P25SERVICE
echo "User=root" >> $PATHYSF2P25SERVICE
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/YSF2P25/" >> $PATHYSF2P25SERVICE
echo "RestartSec=always" >> $PATHYSF2P25SERVICE
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/YSF2P25/YSF2P25"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/YSF2P25/YSF2P25.ini"
echo "ExecStart=$ruta1 $ruta2" >> $PATHYSF2P25SERVICE
echo "Restart=always" >> $PATHYSF2P25SERVICE
echo "RestartSec=10" >> $PATHYSF2P25SERVICE
echo "" >> $PATHYSF2P25SERVICE
echo "[Install]" >> $PATHYSF2P25SERVICE
echo "WantedBy=multi-user.target" >> $PATHYSF2P25SERVICE
}

function YSF2NXDNSERVICE(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $YSF2NXDNSERVICE
echo "" >> $YSF2NXDNSERVICE
echo "[Unit]" >> $YSF2NXDNSERVICE
echo "Description= YSF2NXDN $nombre daemon " >> $YSF2NXDNSERVICE
echo "After=syslog.target network.target" >> $YSF2NXDNSERVICE
echo "" >> $YSF2NXDNSERVICE
echo "[Service]" >> $YSF2NXDNSERVICE
echo "User=root" >> $YSF2NXDNSERVICE
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/YSF2NXDN/" >> $YSF2NXDNSERVICE
echo "RestartSec=always" >> $YSF2NXDNSERVICE
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/YSF2NXDN/YSF2NXDN"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/YSF2NXDN/YSF2NXDN.ini"
echo "ExecStart=$ruta1 $ruta2" >> $YSF2NXDNSERVICE
echo "Restart=always" >> $YSF2NXDNSERVICE
echo "RestartSec=10" >> $YSF2NXDNSERVICE
echo "" >> $YSF2NXDNSERVICE
echo "[Install]" >> $YSF2NXDNSERVICE
echo "WantedBy=multi-user.target" >> $YSF2NXDNSERVICE
}

function NXDN2DMRSERVICE(){
PATHNXDN2DMRSERVICE="/var/log/NXDN2DMRHOTSPOT-$NOMBRE.service"
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $PATHNXDN2DMRSERVICE
echo "" >> $PATHNXDN2DMRSERVICE
echo "[Unit]" >> $PATHNXDN2DMRSERVICE
echo "Description= NXDN2DMR $nombre daemon " >> $PATHNXDN2DMRSERVICE
echo "After=syslog.target network.target" >> $PATHNXDN2DMRSERVICE
echo "" >> $PATHNXDN2DMRSERVICE
echo "[Service]" >> $PATHNXDN2DMRSERVICE
echo "User=root" >> $PATHNXDN2DMRSERVICE
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/NXDN2DMR/" >> $PATHNXDN2DMRSERVICE
echo "RestartSec=always" >> $PATHNXDN2DMRSERVICE
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/NXDN2DMR/NXDN2DMR"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVM_CM/NXDN2DMR/NXDN2DMR.ini"
echo "ExecStart=$ruta1 $ruta2" >> $PATHNXDN2DMRSERVICE
echo "Restart=always" >> $PATHNXDN2DMRSERVICE
echo "RestartSec=10" >> $PATHNXDN2DMRSERVICE
echo "" >> $PATHNXDN2DMRSERVICE
echo "[Install]" >> $PATHNXDN2DMRSERVICE
echo "WantedBy=multi-user.target" >> $PATHNXDN2DMRSERVICE
}

function MMDVMSERVICE(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $MMSERVICE
echo "" >> $MMSERVICE
echo "[Unit]" >> $MMSERVICE
echo "Description=MMDVM_Host $nombre daemon " >> $MMSERVICE
echo "After=syslog.target network.target" >> $MMSERVICE
echo "" >> $MMSERVICE
echo "[Service]" >> $MMSERVICE
echo "User=root" >> $MMSERVICE
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVMHost/" >> $MMSERVICE
echo "RestartSec=always" >> $MMSERVICE
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVMHost/MMDVMHost"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/MMDVMHost/MMDVM.ini"
echo "ExecStart=$ruta1 $ruta2" >> $MMSERVICE
echo "Restart=always" >> $MMSERVICE
echo "RestartSec=10" >> $MMSERVICE
echo "" >> $MMSERVICE
echo "[Install]" >> $MMSERVICE
echo "WantedBy=multi-user.target" >> $MMSERVICE
}

function P25SERVICE(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $P25SERVICE
echo "" >> $P25SERVICE
echo "[Unit]" >> $P25SERVICE
echo "Description=P25Gateway $nombre daemon " >> $P25SERVICE
echo "After=syslog.target network.target" >> $P25SERVICE
echo "" >> $P25SERVICE
echo "[Service]" >> $P25SERVICE
echo "User=root" >> $P25SERVICE
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/P25Clients/P25Gateway/" >> $P25SERVICE
echo "RestartSec=always" >> $P25SERVICE
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/P25Clients/P25Gateway/P25Gateway"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/P25Clients/P25Gateway/P25Gateway.ini"
echo "ExecStart=$ruta1 $ruta2" >> $P25SERVICE
echo "Restart=always" >> $P25SERVICE
echo "RestartSec=10" >> $P25SERVICE
echo "" >> $P25SERVICE
echo "[Install]" >> $P25SERVICE
echo "WantedBy=multi-user.target" >> $P25SERVICE
}

function NXDNSERVICE(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $NXDNSERVICE
echo "" >> $NXDNSERVICE
echo "[Unit]" >> $NXDNSERVICE
echo "Description=NXDNGateway $nombre daemon " >> $NXDNSERVICE
echo "After=syslog.target network.target" >> $NXDNSERVICE
echo "" >> $NXDNSERVICE
echo "[Service]" >> $NXDNSERVICE
echo "User=root" >> $NXDNSERVICE
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/NXDNClients/NXDNGateway/" >> $NXDNSERVICE
echo "RestartSec=always" >> $NXDNSERVICE
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/NXDNClients/NXDNGateway/NXDNGateway"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/NXDNClients/NXDNGateway/NXDNGateway.ini"
echo "ExecStart=$ruta1 $ruta2" >> $NXDNSERVICE
echo "Restart=always" >> $NXDNSERVICE
echo "RestartSec=10" >> $NXDNSERVICE
echo "" >> $NXDNSERVICE
echo "[Install]" >> $NXDNSERVICE
echo "WantedBy=multi-user.target" >> $NXDNSERVICE
}


function YSFSERVICE(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $YSFSERVICE
echo "" >> $YSFSERVICE
echo "[Unit]" >> $YSFSERVICE
echo "Description=YSFGateway $nombre daemon " >> $YSFSERVICE
echo "After=syslog.target network.target" >> $YSFSERVICE
echo "" >> $YSFSERVICE
echo "[Service]" >> $YSFSERVICE
echo "User=root" >> $YSFSERVICE
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/YSFClients/YSFGateway/" >> $YSFSERVICE
echo "RestartSec=always" >> $YSFSERVICE
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/YSFClients/YSFGateway/YSFGateway"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/YSFClients/YSFGateway/YSFGateway.ini"
echo "ExecStart=$ruta1 $ruta2" >> $YSFSERVICE
echo "Restart=always" >> $YSFSERVICE
echo "RestartSec=10" >> $YSFSERVICE
echo "" >> $YSFSERVICE
echo "[Install]" >> $YSFSERVICE
echo "WantedBy=multi-user.target" >> $YSFSERVICE
}

function DMRSERVICE(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $DMRSERVICE
echo "" >> $DMRSERVICE
echo "[Unit]" >> $DMRSERVICE
echo "Description=DMRGateway $nombre daemon " >> $DMRSERVICE
echo "After=syslog.target network.target" >> $DMRSERVICE
echo "" >> $DMRSERVICE
echo "[Service]" >> $DMRSERVICE
echo "User=root" >> $DMRSERVICE
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/DMRGateway" >> $DMRSERVICE
echo "RestartSec=always" >> $DMRSERVICE
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/DMRGateway/DMRGateway"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/DMRGateway/DMRGateway.ini"
echo "ExecStart=$ruta1 $ruta2" >> $DMRSERVICE
echo "Restart=always" >> $DMRSERVICE
echo "RestartSec=10" >> $DMRSERVICE
echo "" >> $DMRSERVICE
echo "[Install]" >> $DMRSERVICE
echo "WantedBy=multi-user.target" >> $DMRSERVICE
}

function APRSSERVICE(){
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES" > $APRSSERVICEPATH
echo "" >> $APRSSERVICEPATH
echo "[Unit]" >> $APRSSERVICEPATH
echo "Description=APRSGateway $nombre daemon " >> $APRSSERVICEPATH
echo "After=syslog.target network.target" >> $APRSSERVICEPATH
echo "" >> $APRSSERVICEPATH
echo "[Service]" >> $APRSSERVICEPATH
echo "User=root" >> $APRSSERVICEPATH
echo "WorkingDirectory=/opt/HOTSPOTS-ACTIVOS/$nombre/APRSGateway" >> $APRSSERVICEPATH
echo "RestartSec=always" >> $APRSSERVICEPATH
ruta1="/opt/HOTSPOTS-ACTIVOS/$nombre/APRSGateway/DMRGateway"
ruta2="/opt/HOTSPOTS-ACTIVOS/$nombre/APRSGateway/DMRGateway.ini"
echo "ExecStart=$ruta1 $ruta2" >> $APRSSERVICEPATH
echo "Restart=always" >> $APRSSERVICEPATH
echo "RestartSec=10" >> $APRSSERVICEPATH
echo "" >> $APRSSERVICEPATH
echo "[Install]" >> $APRSSERVICEPATH
echo "WantedBy=multi-user.target" >> $APRSSERVICEPATH
}



####################    FIN SERVICIOS    #####################################

function DATOSIRC(){

 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select nombre from hotspot where dstar = '1' into outfile '/var/log/irchotspot' fields terminated by ',';"
nombre1=$(awk "NR==1" /var/log/hotspot |cut -d"," -f 1)
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstarmodulo,reflector,repeaterband,atstartup,reconnect,irchostname,lenguaje,ccshost,remotepass,remote,indicativo,repeaterport,dstar,remotepass from hot_IRC where nombre = '$nombre1' into outfile '/var/log/nombre1' fields terminated by ',';"
dstarmodulo1=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 1)
reflector1=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 2)
repeaterband1=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 3)
atstartup1=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 4)
reconnect1=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 5)
irchostname1=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 6)
lenguaje1=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 7)
ccshost1=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 8)
remotepass1=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 9)
remote=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 10)
indicativo1=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 11)
repeaterport=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 12)
dstar1=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 13)
remotepass=$(awk "NR==1" /var/log/nombre1 |cut -d"," -f 14)

nombre2=$(awk "NR==1" /var/log/hotspot |cut -d"," -f 2)
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstarmodulo,reflector,repeaterband,atstartup,reconnect,irchostname,lenguaje,ccshost,remotepass,remote,indicativo,repeaterport,dstar,remotepass from hot_IRC where nombre = '$nombre2' into outfile '/var/log/nombre2' fields terminated by ',';"
dstarmodulo2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 1)
reflector2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 2)
repeaterband2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 3)
atstartup2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 4)
reconnect2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 5)
irchostname2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 6)
lenguaje2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 7)
ccshost2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 8)
remotepass2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 9)
remote2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 10)
indicativo12=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 11)
repeaterport2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 12)
dstar2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 13)
remotepass2=$(awk "NR==1" /var/log/nombre2 |cut -d"," -f 14)

nombre3=$(awk "NR==1" /var/log/hotspot |cut -d"," -f 3)
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstarmodulo,reflector,repeaterband,atstartup,reconnect,irchostname,lenguaje,ccshost,remotepass,remote,indicativo,repeaterport,dstar,remotepass from hot_IRC where nombre = '$nombre3' into outfile '/var/log/nombre3' fields terminated by ',';"
dstarmodulo3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 1)
reflector3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 2)
repeaterband3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 3)
atstartup3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 4)
reconnect3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 5)
irchostname3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 6)
lenguaje3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 7)
ccshost3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 8)
remotepass3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 9)
remote3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 10)
indicativo13=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 11)
repeaterport3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 12)
dstar3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 13)
remotepass3=$(awk "NR==1" /var/log/nombre3 |cut -d"," -f 14)

nombre4=$(awk "NR==1" /var/log/hotspot |cut -d"," -f 4)
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select dstarmodulo,reflector,repeaterband,atstartup,reconnect,irchostname,lenguaje,ccshost,remotepass,remote,indicativo,repeaterport,dstar,remotepass from hot_IRC where nombre = '$nombre4' into outfile '/var/log/nombre4' fields terminated by ',';"
dstarmodulo4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 1)
reflector4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 2)
repeaterband4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 3)
atstartup4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 4)
reconnect4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 5)
irchostname4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 6)
lenguaje4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 7)
ccshost4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 8)
remotepass4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 9)
remote4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 10)
indicativo14=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 11)
repeaterport4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 12)
dstar4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 13)
remotepass4=$(awk "NR==1" /var/log/nombre4 |cut -d"," -f 14)

reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reflector from hot_IRC where nombre = '$NOMBRE';")
repeaterband=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT repeaterband from hot_IRC where nombre = '$NOMBRE';")
atstartup=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT atstartup from hot_IRC where nombre = '$NOMBRE';")
reconnect=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reconnect from hot_IRC where nombre = '$NOMBRE';")
irchostname=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT irchostname from hot_IRC where nombre = '$NOMBRE';")
lenguaje=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT lenguaje from hot_IRC where nombre = '$NOMBRE';")
ccshost=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ccshost from hot_IRC where nombre = '$NOMBRE';")
irchostname=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT irchostname from hot_IRC where nombre = '$NOMBRE';")
remotepass=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT remotepass from hot_IRC where nombre = '$NOMBRE';")
remote=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT remote from hot_IRC where nombre = '$NOMBRE';")
nombre2=$(awk "NR==1" /var/log/hotspot |cut -d"," -f 3)
nombre3=$(awk "NR==1" /var/log/hotspot |cut -d"," -f 4)
nombre4=$(awk "NR==1" /var/log/hotspot |cut -d"," -f 4)

}

#############################################################################################################################################

function CONF-YSF2DMR(){

MMSERVICE="/var/log/MMDVMHOTSPOT-$NOMBRE.service"
YSFSERVICE="/var/log/YSFGatewayHOTSPOT-$NOMBRE.service"
DMR2YSFSERVICE="/var/log/DMR2YSFHOTSPOT-$NOMBRE.service"
YSF2DMRSERVICE="/var/log/YSF2DMRHOTSPOT-$NOMBRE.service"

MMDVMHOST
YSF2DMR

 cp /var/log/MMDVM.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVMHost/MMDVM.ini
 cp /var/log/YSF2DMR.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVM_CM/YSF2DMR/YSF2DMR.ini

MMDVMSERVICE
YSF2DMRSERVICE
 cp /var/log/YSF2DMRHOTSPOT-$NOMBRE.service /etc/systemd/system/
 cp /var/log/MMDVMHOTSPOT-$NOMBRE.service /etc/systemd/system/

 systemctl daemon-reload
 systemctl enable YSF2DMRHOTSPOT-$NOMBRE.service
 systemctl enable MMDVMHOTSPOT-$NOMBRE.service
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','YSF2DMRHOTSPOT-$NOMBRE.service','/var/log/hotspots/YSF2DMR-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','MMDVMHOTSPOT-$NOMBRE.service','/var/log/hotspots/MMDVM-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
 systemctl restart YSF2DMRHOTSPOT-$NOMBRE.service
 systemctl restart MMDVMHOTSPOT-$NOMBRE.service

}

function CONF-NXDN2DMR(){

MMSERVICE="/var/log/MMDVMHOTSPOT-$NOMBRE.service"
PATHNXDN2DMRSERVICE="/var/log/NXDN2DMRHOTSPOT-$NOMBRE.service"
PATHNXDN2DMR="/var/log/NXDN2DMR.ini"
PATHBRIDGENXDN="/var/log/NXDNGateway.ini"

MMDVMHOST
NXDN2DMR
NXDNGATEWAY
 cp /var/log/MMDVM.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVMHost/MMDVM.ini
 cp /var/log/NXDNGateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/NXDNClients/NXDNGateway/NXDNGateway.ini
 cp /var/log/NXDN2DMR.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVM_CM/NXDN2DMR/NXDN2DMR.ini

MMDVMSERVICE
NXDNSERVICE
NXDN2DMRSERVICE

 cp /var/log/NXDN2DMRHOTSPOT-$NOMBRE.service /etc/systemd/system/
 cp /var/log/MMDVMHOTSPOT-$NOMBRE.service /etc/systemd/system/
 cp /var/log/NXDNGatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/

 systemctl daemon-reload
 systemctl enable NXDN2DMRHOTSPOT-$NOMBRE.service
 systemctl enable MMDVMHOTSPOT-$NOMBRE.service
 systemctl enable NXDNGatewayHOTSPOT-$NOMBRE.service
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','NXDN2DMRHOTSPOT-$NOMBRE.service','/var/log/hotspots/NXDN2DMR-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','MMDVMHOTSPOT-$NOMBRE.service','/var/log/hotspots/MMDVM-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','NXDNGatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/NXDNGateway-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"

 systemctl restart NXDN2DMRHOTSPOT-$NOMBRE.service
 systemctl restart MMDVMHOTSPOT-$NOMBRE.service
 systemctl restart NXDNGatewayHOTSPOT-$NOMBRE.service

}

function CONF-DMR2YSF(){
MMSERVICE="/var/log/MMDVMHOTSPOT-$NOMBRE.service"

MMDVMHOST
DMR2YSF
YSFGATEWAY
 cp /var/log/MMDVM.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVMHost/MMDVM.ini
 cp /var/log/YSFGateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/YSFClients/YSFGateway/YSFGateway.ini
 cp /var/log/DMR2YSF.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVM_CM/DMR2YSF/DMR2YSF.ini
DMR2YSFSERVICE
MMDVMSERVICE
YSFSERVICE
 cp /var/log/DMR2YSFHOTSPOT-$NOMBRE.service /etc/systemd/system/
 cp /var/log/MMDVMHOTSPOT-$NOMBRE.service /etc/systemd/system/
 cp /var/log/YSFGatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/
 systemctl daemon-reload
 systemctl enable DMR2YSFHOTSPOT-$NOMBRE.service
 systemctl enable MMDVMHOTSPOT-$NOMBRE.service
 systemctl enable YSFGatewayHOTSPOT-$NOMBRE.service
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','DMR2YSFHOTSPOT-$NOMBRE.service','/var/log/hotspots/DMR2YSF-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','MMDVMHOTSPOT-$NOMBRE.service','/var/log/hotspots/MMDVM-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','YSFGatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/YSFGateway-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
 systemctl restart DMR2YSFHOTSPOT-$NOMBRE.service
 systemctl restart MMDVMHOTSPOT-$NOMBRE.service
 systemctl restart YSFGatewayHOTSPOT-$NOMBRE.service
}

function CONF-YSF2NXDN(){
NXDNSERVICE="/var/log/NXDNGatewayHOTSPOT-$NOMBRE.service"
MMSERVICE="/var/log/MMDVMHOTSPOT-$NOMBRE.service"
MMDVMHOST
YSF2NXDN
#YSFGATEWAY
NXDNGATEWAY
 cp /var/log/MMDVM.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVMHost/MMDVM.ini
 cp /var/log/YSF2NXDN.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVM_CM/YSF2NXDN/YSF2NXDN.ini
# cp /var/log/YSFGateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/YSFClients/YSFGateway/YSFGateway.ini
 cp /var/log/NXDNGateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/NXDNClients/NXDNGateway/NXDNGateway.ini
MMDVMSERVICE
YSF2NXDNSERVICE
#YSFSERVICE
NXDNSERVICE
 cp /var/log/YSF2NXDNHOTSPOT-$NOMBRE.service /etc/systemd/system/
 cp /var/log/MMDVMHOTSPOT-$NOMBRE.service /etc/systemd/system/
# cp /var/log/YSFGatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/
 cp /var/log/NXDNGatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/
 systemctl daemon-reload
 systemctl enable YSF2NXDNHOTSPOT-$NOMBRE.service
 systemctl enable MMDVMHOTSPOT-$NOMBRE.service
# systemctl enable YSFGatewayHOTSPOT-$NOMBRE.service
 systemctl enable NXDNGatewayHOTSPOT-$NOMBRE.service
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','YSF2NXDNHOTSPOT-$NOMBRE.service','/var/log/hotspots/YSF2NXDN-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','MMDVMHOTSPOT-$NOMBRE.service','/var/log/hotspots/MMDVM-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
#ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','YSFGatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/YSFGateway-$NOMBRE');"
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','NXDNGatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/NXDNGateway-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
 systemctl restart YSF2NXDNHOTSPOT-$NOMBRE.service
 systemctl restart MMDVMHOTSPOT-$NOMBRE.service
# systemctl restart YSFGatewayHOTSPOT-$NOMBRE.service
 systemctl restart NXDNGatewayHOTSPOT-$NOMBRE.service
}

function CONF-DMR2NXDN(){
NXDNSERVICE="/var/log/NXDNGatewayHOTSPOT-$NOMBRE.service"
MMSERVICE="/var/log/MMDVMHOTSPOT-$NOMBRE.service"
MMDVMHOST
DMR2NXDN
NXDNGATEWAY
 
 cp /var/log/MMDVM.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVMHost/MMDVM.ini
 cp /var/log/DMR2NXDN.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVM_CM/DMR2NXDN/DMR2NXDN.ini
 cp /var/log/NXDNGateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/NXDNClients/NXDNGateway/NXDNGateway.ini
MMDVMSERVICE
DMR2NXDNSERVICE
NXDNSERVICE
 cp /var/log/DMR2NXDNHOTSPOT-$NOMBRE.service /etc/systemd/system/
 cp /var/log/MMDVMHOTSPOT-$NOMBRE.service /etc/systemd/system/
 cp /var/log/NXDNGatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/
 systemctl daemon-reload
 systemctl enable DMR2NXDNHOTSPOT-$NOMBRE.service
 systemctl enable MMDVMHOTSPOT-$NOMBRE.service
 systemctl enable NXDNGatewayHOTSPOT-$NOMBRE.service
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','DMR2NXDNHOTSPOT-$NOMBRE.service','/var/log/hotspots/DMR2NXDN-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','MMDVMHOTSPOT-$NOMBRE.service','/var/log/hotspots/MMDVM-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','NXDNGatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/NXDNGateway-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"

 systemctl restart DMR2NXDNHOTSPOT-$NOMBRE.service
 systemctl restart MMDVMHOTSPOT-$NOMBRE.service
 systemctl restart NXDNGatewayHOTSPOT-$NOMBRE.service
}

function CONF-YSF2P25(){
PATHYSF2P25SERVICE="/var/log/YSF2P25HOTSPOT-$NOMBRE.service"
P25SERVICE="/var/log/P25GatewayHOTSPOT-$NOMBRE.service"
MMSERVICE="/var/log/MMDVMHOTSPOT-$NOMBRE.service"

MMDVMHOST
YSF2P25
#YSFGATEWAY
P25GATEWAY
 cp /var/log/MMDVM.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVMHost/MMDVM.ini
 cp /var/log/YSF2P25.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVM_CM/YSF2P25/YSF2P25.ini
# cp /var/log/YSFGateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/YSFClients/YSFGateway/YSFGateway.ini
 cp /var/log/P25Gateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/P25Clients/P25Gateway/P25Gateway.ini
MMDVMSERVICE
YSF2P25SERVICE
#YSFSERVICE
P25SERVICE
 cp $PATHYSF2P25SERVICE /etc/systemd/system/
 cp $MMSERVICE /etc/systemd/system/
# cp /var/log/YSFGatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/
 cp $P25SERVICE /etc/systemd/system/
 systemctl daemon-reload
 systemctl enable YSF2P25HOTSPOT-$NOMBRE.service
 systemctl enable MMDVMHOTSPOT-$NOMBRE.service
# systemctl enable YSFGatewayHOTSPOT-$NOMBRE.service
 systemctl enable P25GatewayHOTSPOT-$NOMBRE.service
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','YSF2P25HOTSPOT-$NOMBRE.service','/var/log/hotspots/YSF2P25-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','MMDVMHOTSPOT-$NOMBRE.service','/var/log/hotspots/MMDVM-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
#ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','YSFGatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/YSFGateway-$NOMBRE');"
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','P25GatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/P25Gateway-$NOMBRE');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
 systemctl restart YSF2P25HOTSPOT-$NOMBRE.service
 systemctl restart MMDVMHOTSPOT-$NOMBRE.service
# systemctl restart YSFGatewayHOTSPOT-$NOMBRE.service
 systemctl restart P25GatewayHOTSPOT-$NOMBRE.service
}

function DATOS-IRC(){

#rm /var/log/genircdvswitch > /dev/null 2>&1
rm /var/log/genirchotspot > /dev/null 2>&1
rm /var/log/nombreseleccionado > /dev/null 2>&1

mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT irchostname,ccshost,reflector,atstartup,reconnect,repeaterband,lenguaje,remote,dstarpuerto,remotepass,repeaterPort FROM hot_IRC WHERE nombre = 'PRIMARIONOBORRAR' into outfile '/var/log/genirchotspot' fields terminated by ';';"
indicativoirc=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from hotspot WHERE nombre = 'PRIMARIONOBORRAR';")

irchostname=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 1)
ccshost=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 2)
reflector=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 3)
atstartup=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 4)
reconnect=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 5)
repeaterband=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 6)
lenguaje=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 7)
remote=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 8)
remotepuerto=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 9)
remotepass=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 10)
#indicativoirc=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 11)
repeaterport=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 11)

rm /var/log/genirchotspot > /dev/null 2>&1
rm /var/log/nombreseleccionado > /dev/null 2>&1
mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombre FROM hotspot WHERE dstar = '1' and nombre <> 'PRIMARIONOBORRAR' into outfile '/var/log/nombreseleccionado' fields terminated by ';';"
minombre=$(awk "NR==1" /var/log/nombreseleccionado)
mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT irchostname,ccshost,reflector,atstartup,reconnect,repeaterband,lenguaje,remote,dstarpuerto,remotepass,repeaterPort FROM hot_IRC WHERE nombre = '$minombre' into outfile '/var/log/genirchotspot' fields terminated by ';';"
indicativoirc2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from hotspot WHERE nombre = '$minombre';")

irchostname2=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 1)
ccshost2=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 2)
reflector2=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 3)
atstartup2=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 4)
reconnect2=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 5)
repeaterband2=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 6)
#indicativoirc2=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 7)
repeaterport2=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 7)

rm /var/log/genirchotspot > /dev/null 2>&1
minombre=$(awk "NR==2" /var/log/nombreseleccionado)
mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT irchostname,ccshost,reflector,atstartup,reconnect,repeaterband,lenguaje,remote,dstarpuerto,remotepass,repeaterPort FROM hot_IRC WHERE nombre = '$minombre' into outfile '/var/log/genirchotspot' fields terminated by ';';"
indicativoirc3=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from hotspot WHERE nombre = '$minombre';")

irchostname3=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 1)
ccshost3=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 2)
reflector3=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 3)
atstartup3=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 4)
reconnect3=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 5)
repeaterband3=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 6)
#indicativoirc3=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 7)
repeaterport3=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 7)

rm /var/log/genirchotspot > /dev/null 2>&1
minombre=$(awk "NR==3" /var/log/nombreseleccionado)
mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT irchostname,ccshost,reflector,atstartup,reconnect,repeaterband,lenguaje,remote,dstarpuerto,remotepass,repeaterPort FROM hot_IRC WHERE nombre = '$minombre' into outfile '/var/log/genirchotspot' fields terminated by ';';"
indicativoirc4=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from hotspot WHERE nombre = '$minombre';")

irchostname4=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 1)
ccshost4=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 2)
reflector4=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 3)
atstartup4=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 4)
reconnect4=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 5)
repeaterband4=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 6)
#indicativoirc4=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 7)
repeaterport4=$(awk "NR==1" /var/log/genirchotspot |cut -d";" -f 7)

}

######################   INICIO SCRIPT      ##################################

NOMBRE=$1
echo $NOMBRE
ALGUNO=0
MMSERVICE="/var/log/MMDVM-$NOMBRE.service"
P25SERVICE="/var/log/P25Gateway-$NOMBRE.service"
NXDNSERVICE="/var/log/NXDNGatewayHOTSPOT-$NOMBRE.service"
YSFSERVICE="/var/log/YSFGatewayHOTSPOT-$NOMBRE.service"
DMRSERVICE="/var/log/DMRGatewayHOTSPOT-$NOMBRE.service"
DMR2YSFSERVICE="/var/log/DMR2YSFHOTSPOT-$NOMBRE.service"
YSF2DMRSERVICE="/var/log/YSF2DMRHOTSPOT-$NOMBRE.service"
YSF2P25SERVICE="/var/log/YSF2P25HOTSPOT-$NOMBRE.service"
DMR2NXDNSERVICE="/var/log/DMR2NXDNHOTSPOT-$NOMBRE.service"
YSF2NXDNSERVICE="/var/log/YSF2NXDNHOTSPOT-$NOMBRE.service"
NXDNSERVICE="/var/log/NXDNGatewayHOTSPOT-$NOMBRE.service"
APRSSERVICEPATH="/var/log/APRGatewayHOTSPOT-$NOMBRE.service"

SQL
ysf2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2dmr from hotspot where nombre = '$NOMBRE';")
ysf2p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2p25 from hotspot where nombre = '$NOMBRE';")
ysf2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ysf2nxdn from hotspot where nombre = '$NOMBRE';")
dmr2nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr2nxdn from hotspot where nombre = '$NOMBRE';")
dmr2ysf=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr2ysf from hotspot where nombre = '$NOMBRE';")
nxdn2dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdn2dmr from hotspot where nombre = '$NOMBRE';")
fusion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusion from hotspot where nombre = '$NOMBRE';")
dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr from hotspot where nombre = '$NOMBRE';")
dmrgateway=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrgateway from hotspot where nombre = '$NOMBRE';")
dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstar from hotspot where nombre = '$NOMBRE';")
p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25 from hotspot where nombre = '$NOMBRE';")
nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdn from hotspot where nombre = '$NOMBRE';")



if [[ $NOMBRE != "PRIMARIONOBORRAR" ]]
then
 GATEWAYPORT=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT gatewayport from hot_DMR where nombre = '$NOMBRE';")
 CALCULOPUERTOSGATEWAY
 cross=0
 if [[ $dmr2ysf -eq 1 ]]
 then
    ALGUNO=1
    cross=1
    CONF-DMR2YSF
    else if [[ $ysf2dmr -eq 1 ]]
    then
       ALGUNO=1
       cross=1
       CONF-YSF2DMR
       else if [[ $ysf2p25 -eq 1 ]]
       then
          ALGUNO=1
          cross=1
          CONF-YSF2P25
          else if [[ $ysf2nxdn -eq 1 ]]
          then
             ALGUNO=1
             cross=1
             CONF-YSF2NXDN
             else if [[ $dmr2nxdn -eq 1 ]]
             then
                ALGUNO=1
                cross=1
                CONF-DMR2NXDN
                else if [[ $nxdn2dmr -eq 1 ]]
                then
                   ALGUNO=1
                   cross=1
                   CONF-NXDN2DMR
                fi
             fi
          fi
       fi
   fi
fi

if [[ $cross -eq 0 ]]
then

   echo $fusion
   if [[ $fusion -eq 1 ]]
   then
       ALGUNO=1
       YSFGATEWAY
       YSFSERVICE
        cp /var/log/YSFGateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/YSFClients/YSFGateway/YSFGateway.ini
        cp /var/log/YSFGatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/
       ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','YSFGatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/YSFGateway-$nombre');"
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
   fi
   if [[ $dmrgateway -eq 1 ]]
   then
      ALGUNO=1
      #DMRGATEWAY
      DMRGATEWAYSED
      DMRSERVICE
      # cp /var/log/DMRGateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/DMRGateway/DMRGateway.ini
       cp /var/log/DMRGatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/
      ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','DMRGatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/DMRGateway-$nombre');"
       mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
   fi

   if [[ $dmr -eq 1 ]]
   then
      ALGUNO=1
   fi

   if [[ $p25 -eq 1 ]]
   then
        ALGUNO=1
        P25SERVICE="/var/log/P25GatewayHOTSPOT-$NOMBRE.service"
        P25GATEWAY
        P25SERVICE
         cp /var/log/P25GatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/
         cp /var/log/P25Gateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/P25Clients/P25Gateway/P25Gateway.ini
        ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','P25GatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/P25Gateway-$nombre');"
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
   fi
   if [[ $nxdn -eq 1 ]]
   then
        ALGUNO=1
        NXDNSERVICE="/var/log/NXDNGatewayHOTSPOT-$NOMBRE.service"
        NXDNGATEWAY
        NXDNSERVICE
         cp /var/log/NXDNGatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/
         cp /var/log/NXDNGateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/NXDNClients/NXDNGateway/NXDNGateway.ini
        ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','NXDNGatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/NXDNGateway-$nombre');"
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
    fi
    if [[ $dstar -eq 1 ]]
    then
        ALGUNO=1
        DATOS-IRC
        IRC
         cp /var/log/ircddbgatewayd /etc/ircddbgateway
        #ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','IRC','/var/log/ircddbgateway.log');"
        # mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
        systemctl restart ircddbgatewayd.service
 
   fi

    if [[ $ALGUNO -eq 1 ]]
    then
        MMSERVICE="/var/log/MMDVMHOTSPOT-$NOMBRE.service"
        MMDVMHOST
         cp /var/log/MMDVM.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/MMDVMHost/MMDVM.ini
        MMDVMSERVICE
         cp /var/log/MMDVMHOTSPOT-$NOMBRE.service /etc/systemd/system/
        ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','MMDVMHOTSPOT-$NOMBRE.service','/var/log/hotspots/MMDVM-$nombre');"
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET estado = '1' where nombre = '$NOMBRE'";
##########  NUEVO 30/11/2020
 #        DMRGATEWAY
 #        cp /var/log/DMRGateway /opt/HOTSPOTS-ACTIVOS/$NOMBRE/DMRGateway/DMRGateway.ini
 #        DMRSERVICE
 #        cp /var/log/DMRGatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/
 #        ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','DMRGatewayHOTSPOT-$NOMBRE.service','/var/log/hotspots/DMRGateway-$nombre');"
 #        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"

#         APRSGATEWAY
#         cp /var/log/APRSGateway.ini /opt/HOTSPOTS-ACTIVOS/$NOMBRE/APRSGateway/APRSGateway.ini
#         APRSSERVICE
#         cp /var/log/APRGatewayHOTSPOT-$NOMBRE.service /etc/systemd/system/
#         ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','APRSGatewayHOTSPOT-$NOMBRE.service','/var/log/APRGatewayHOTSPOT-$NOMBRE.service');"
#         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"

#DMRSERVICE="/var/log/DMRGatewayHOTSPOT-$NOMBRE.service"
#PATHDMRGATEWAY="/var/log/DMRGateway.ini"
#######################

        # instala los servicios creados
         rm /var/log/servicios  > /dev/null 2>&1
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select service from services where nombre = '$NOMBRE' into outfile '/var/log/servicios';"
        REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM services where nombre = '$NOMBRE';")
         systemctl daemon-reload
        for (( i=1; i<=$REGISTROS; i++ ));
        do
          ser=$(awk "NR==$i" /var/log/servicios)
          if [[ $ser != "IRC" ]]
          then
              systemctl enable $ser
              systemctl restart $ser
          fi
        done


    else
       dialog --no-lines --title "" --msgbox "$NO_SE_ACTIVA_SIS_NO_ACTIVOS" 0 0
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET estado = '0' where nombre = '$NOMBRE'";

    fi

fi
else
  DATOS-IRC
  IRC
   cp /var/log/ircddbgatewayd /etc/ircddbgateway
  #ordensql="INSERT INTO services (nombre,service,log) VALUES ('$NOMBRE','IRC','/var/log/ircddbgateway.log');"
  # mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
  systemctl restart ircddbgatewayd.service
fi



