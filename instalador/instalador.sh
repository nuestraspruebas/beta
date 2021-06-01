#!/bin/bash

################# version 1.0 01/06/2021 #########################
#               Instalador Easy DVLNK VPS by                     # 
#                Jose Antonio Baños  EA7JCL                      #
#               Joaquin Madrid Belando EA5GVK                    #
##################################################################

export NCURSES_NO_UTF8_ACS=1
EASY_CONF_FILE="/tmp/Easy_Conf_File"
CONF_FILE="/etc/Easy_Conf_File"
GIT="https://github.com/nuestraspruebas/"
RAW="https://raw.githubusercontent.com/nuestraspruebas/beta/"
#/etc/systemd/system.conf:
#DefaultTimeoutStartSec=90s
#DefaultTimeoutStopSec=90s
##  obtiene la informacion sobre lo que queremos instalar
DVLINK=$(awk 'NR==1' $EASY_CONF_FILE)
DV=$(awk 'NR==2' $EASY_CONF_FILE)
HB=$(awk 'NR==3' $EASY_CONF_FILE)
HOT=$(awk 'NR==4' $EASY_CONF_FILE)

PATHDB="/etc/mysql/mariadb.conf.d/50-server.cnf"
PATHTTYD="/etc/systemd/system/ttydconfig.service"
DIA=`date +%d`
MES=`date +%m`
AÑO=`date +%Y`
fecha="$AÑO$MES$DIA_Easy_DVLink"
c="const char* VERSION = "
d='"'
ver="$c$d$fecha$d;"

####################3

function INSTALA-MYSQL(){
echo "instala y securiza mariadb"
apt -y install mariadb-server
mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('@^@^@^@^');FLUSH PRIVILEGES;"
printf "@^@^@^@^\n n\n n\n n\n y\n y\n y\n" | mysql_secure_installation
mysql -h localhost -u root -p@^@^@^@^ -e "CREATE DATABASE hblink";
/etc/init.d/mysql stop
/etc/init.d/mysql start
mysql -u root -p@^@^@^@^ -e "CREATE USER 'root'@'%' IDENTIFIED BY '@^@^@^@^';"
mysql -u root -p@^@^@^@^ -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' identified by '@^@^@^@^';"
mysql -u root -p@^@^@^@^ -e "FLUSH PRIVILEGES;"
sed -i "19s/.*/port= 3306/" $PATHDB
sed -i "28s/.*/bind-address = 0.0.0.0/" $PATHDB
/etc/init.d/mysql stop
/etc/init.d/mysql start
}

function RECUPERA-BD(){


#wget https://raw.githubusercontent.com/nuestraspruebas/beta/main/bd/dvlink.sql -O /tmp/dvlink.sql
#RAW="https://raw.githubusercontent.com/nuestraspruebas/beta/"

RAW2=$RAW"main/bd/dvlink.sql -O /tmp/dvlink.sql"
wget $RAW2
mysql -h localhost -u root -p@^@^@^@^ hblink < /tmp/dvlink.sql
sleep 5
}

function CARPETAS(){
mkdir /opt/MM-SECUNDARIOS
mkdir /opt/AB-SECUNDARIOS
mkdir /opt/EMU-SECUNDARIOS
mkdir /opt/WEBPROXY-SECUNDARIOS

}

function INSTALA-SOFTWARE(){
#apt update -y
apt-get update -y
#apt install -y htop p7zip-full net-tools udpcast dialog git gnupg2 cmake g++ pkg-config git vim-common
#apt install -y libwebsockets-dev libjson-c-dev libssl-dev libwxgtk3.0-dev git build-essential
#apt install -y git-core libi2c-dev multitail sshpass gnupg gnupg2 git
apt-get install -y htop p7zip-full net-tools udpcast dialog git gnupg2 cmake g++ pkg-config git vim-common
apt-get install -y libwebsockets-dev libjson-c-dev libssl-dev libwxgtk3.0-dev git build-essential
apt-get install -y git-core libi2c-dev multitail sshpass gnupg gnupg2 git


#PARA HBLINK
#apt-get install python3-twisted python3 python3-pip python3-dev libffi-dev libssl-dev -y
#pip3 install setuptools wheel
#pip3 install Twisted dmr_utils3 bitstring autobahn jinja2

#git clone https://github.com/jackychan2/dmr-utils3.git
#chmod +x /dev/shmz/dmr-utils3#/install.sh
#/dev/shmz/dmr-utils3#/install.sh

}
function DESINSTALA_TTYD(){
rm -r /opt/ttyd
systemctl stop $PATHTTYD
systemctl disable $PATHTTYD
rm $PATHTTYD
}

function INSTALA-TTYD(){
if [[ $TTYD = "1" ]]
then
cd /opt/
echo "instala ttyd"
GIT2=$GIT"$GITttyd.git"
git clone $GIT2
cd /opt/ttyd && mkdir build && cd build
cmake ..
make && make install

echo "servicio al arranque de ttyd"
echo "[Unit]" > $PATHTTYD
echo "Description= Arranque configurador web" >> $PATHTTYD
echo "After=syslog.target" >> $PATHTTYD
echo "" >> $PATHTTYD
echo "[Service]" >> $PATHTTYD
echo "ExecStart=ttyd -p100 /etc/scripts/menu.sh" >> $PATHTTYD
echo "" >> $PATHTTYD
echo "[Install]" >> $PATHTTYD
echo "WantedBy=multi-user.target" >> $PATHTTYD
chmod +x $PATHTTYD
systemctl daemon-reload
systemctl enable ttydconfig.service
fi
}


function COPIAR_DE_GITHUB(){
#cd /dev
#git clone https://github.com/jabanos/VPS_DVLINK.git 
mv /dev/shmz/dvlink/ /etc/
chmod 777 -R /etc/dvlink/
cp /dev/shmz/idiomas/* /usr/bin/
chmod +x /usr/bin/trans.sh
#cp /dev/shmz/dvswitch.sh /opt/Analog_Bridge/dvswitch.sh
#chmod +x /opt/Analog_Bridge/dvswitch.sh


}
function COPIAR_RESTO_DE_ARCHIVOS(){

#ACTIVACIONES DEL MENU POR SI SE HACEN PARCIALES LAS INSTALACIONES

cp /dev/shmz/bin/actdv /usr/bin
chmod +x /usr/bin/actdv
cp /dev/shmz/bin/acthb /usr/bin
chmod +x /usr/bin/acthb
cp /dev/shmz/bin/acthot /usr/bin
chmod +x /usr/bin/acthot
cp /dev/shmz/bin/desdv /usr/bin
chmod +x /usr/bin/desdv
cp /dev/shmz/bin/deshb /usr/bin
chmod +x /usr/bin/deshb
cp /dev/shmz/bin/deshot /usr/bin
chmod +x /usr/bin/deshot


#RECPASS
apt install -y lighttpd

echo "#!/bin/bash" > /usr/bin/recpass
echo "/usr/bin/surecpass" >> /usr/bin/recpass
chmod +x /usr/bin/recpass
#SURECPASS
cp /dev/shmz/bin/surecpass /usr/bin
chmod +x /usr/bin/surecpass
#ARBOL YA NO EXISTE ESTA EN DNS.SH
#cp /dev/arbol /usr/bin/
#chmod +x /usr/bin/arbol

#SERVICIO CARPETAS
# YA INCLUIDO EN SERVICIO DNS
#cp /dev/shmz/servicios/carpetas.service /etc/systemd/system/
#systemctl daemon-reload
#systemctl enable carpetas.service
#systemctl start carpetas.service

#DVSWITCH.SH
mv /dev/shmz/mmdvm/dvswitch.sh /opt/Analog_Bridge/
chmod +x /opt/Analog_Bridge/dvswitch.sh
#SYSOP
echo "EA7JCL" > /etc/sysop.ini

# GENERA SSLB

echo $USER > /etc/sslb
echo "1.0.0-VPS" >> /etc/sslb
echo "Spanish" >> /etc/sslb
echo "0" >> /etc/sslb  #4
echo "1" >> /etc/sslb #5
echo "0" >> /etc/sslb #passmenu
echo "1" >> /etc/sslb  #7 produccion
echo $DV >> /etc/sslb #8 
echo $HB >> /etc/sslb #9
echo $HOT >> /etc/sslb #10
echo $DVLINK >> /etc/sslb  #linea 11 VPS
echo "/etc/dvlink" >> /etc/sslb #linea 12 ruta a dvlink para actualizar redes
echo "" >> /etc/sslb  #13
echo "" >> /etc/sslb  #14
echo "" >> /etc/sslb  #15
echo "RESUMIRINSTALACION" >> /etc/sslb  #16

# GENERA ACCESO MENU POR CARPETA Y DNS LOCAL O PUBLICO
mkdir /var/www/html/menu/
mkdir /var/www/html/hblink/
cp /dev/shmz/www/index.html /var/www/html/menu/
cp /dev/shmz/www/indexhblink.html /var/www/html/hblink/index.html
cp /dev/shmz/bin/dns.sh /usr/bin/
chmod +x /usr/bin/dns.sh
echo "@reboot /usr/bin/dns.sh" >> /var/spool/cron/crontabs/$USER
cp /dev/shmz/servicios/dns.service /etc/systemd/system/dns.service
systemctl daemon-reload
systemctl enable dns.service
systemctl start dns.service



}

function MODIFICAR_MARIADB(){
systemctl stop mariadb.service
systemctl disable mariadb.service
RAW2=$RAW"main/servicios/mariadb.service -O /tmp/mariadb.service"
wget $RAW2
cp /tmp/mariadb.service /etc/systemd/system
systemctl daemon-reload
systemctl enable mariadb.service
systemctl start mariadb.service

}

function DESINSTALA_DVSWITCH(){
apt remove -y dvswitch-server

}

function INSTALA-DVSWITCH(){
rm /etc/apt/sources.list.d/dvswitch.list
distribution=$(uname -m)
distribution=buster

if [ -f /etc/apt/sources.list.d/allstarlink.list ] || [ -f /etc/apt/sources.list.d/dvswitch.list ]
then
    echo The Repository file already exists, exiting
    exit 0
fi

wget -O - http://dvswitch.org/DVSwitch_Repository/dvswitch.gpg.key | apt-key add -
echo "# Official DVSwitch repository" >/etc/apt/sources.list.d/dvswitch.list
echo "deb http://dvswitch.org/DVSwitch_Repository $distribution hamradio" >>/etc/apt/sources.list.d/dvswitch.list
echo "#" >>/etc/apt/sources.list.d/dvswitch.list
echo "deb http://ftp.de.debian.org/debian buster-backports main" >>/etc/apt/sources.list.d/dvswitch.list

# print the installed repositories
#echo "Installed repositories:"
#apt-cache policy | grep http | awk '{print $2 $3}' | sort -u
apt update -y
apt upgrade -y
#################  FALLA DURANTE EL DESARROLLO DVSWITCH
#apt install -y dvswitch
#apt install -y dvswich-base
apt install -y dvswitch-server
#apt install -y dvswitch-dashboard
###########################################################

############## FUNCIONA DURANTE EL DESARROLLO DVSWITCH
#apt-get install -y dvswitch-base
#apt-get install -y dvswitch
#apt-get install -y dvswitch-dashboard
#apt-get install -y dvswitch-backup
##########################################################

#apt-get upgrade -y
#apt-get autoremove -y
#apt-get clean -y

#systemctl stop analog_bridge.service
#systemctl disable analog_bridge.service
#rm /etc/systemd/system/multi-user.target.wants/analog_bridge.service
#cp /dev/shmz/servicios/analog_bridge.service /etc/systemd/system/
#systemctl daemon-reload
#systemctl enable analog_bridge.service
#systemctl start analog_bridge.service
#rm -r /var/log/ircddbgateway/
systemctl disable md380-emu.service
rm /etc/systemd/system/multi-user.target.wants/md380-emu.service
sed -i "s#2470#2500#g" "/usr/lib/systemd/system/md380-emu.service"
systemctl daemon-reload
systemctl enable md380-emu.service

sed -i "s#var wsPort = 8080#var wsPort = 8010#g" "/opt/Web_Proxy/proxy.js"
sed -i "s#pcmPort = 2222#pcmPort = 2210#g" "/opt/Web_Proxy/proxy.js"
sed -i "s#/opt/Web_Proxy/proxy.js 8080 2222#/opt/Web_Proxy/proxy.js 8010 2210#g" "/usr/lib/systemd/system/webproxy.service"



#sed -i "s#2470#2500#g" "/usr/lib/systemd/system/md380-emu.service"
#systemctl daemon-reload
#systemctl start md380-emu.service
#distribution=$(uname -m)
#if [ $distribution == "armv6l" ]
#then
#    apt install -y qemu binfmt-support qemu-user-static
#fi
}


function DESINSTALA_HBLINK(){

#Borra las carpetas por si se quiere reinstalar
rm -r /opt/hblink3 > /dev/null 2>&1
rm -r /opt/HBmonitor > /dev/null 2>&1
rm -r /opt/dmr_utils3 > /dev/null 2>&1
systemctl stop hblink3.service
systemctl disable hblink3.service
systemctl stop hbparrot.service
systemctl disable hbparrot.service

}

function INSTALA_HBLINK(){
apt install -y lighttpd
cd /opt
GIT2=$GIT"dmr_utils3.git"
git clone $GIT2
GIT2=$GIT"hblink3.git"
cd /opt
git clone $GIT2
apt-get install python3-pip -y
pip3 install --upgrade .
pip install -r /opt/hblink3/requirements.txt
/usr/bin/python3 -m pip install --upgrade pip
chmod +x /opt/hblink3/install.sh
/opt/hblink3/install.sh
#instala hbmonitor
cd /opt
GIT2=$GIT"HBmonitor.git hbmonitor"
git clone $GIT2
chmod +x /opt/hbmonitor/install.sh
/opt/hbmonitor/install.sh
wget https://database.radioid.net/static/rptrs.json -O /opt/hbmonitor/peer_ids.json
wget https://database.radioid.net/static/users.json -O /opt/hbmonitor/subscriber_ids.json
cp /opt/hbmonitor/peer_ids.json /opt/hblink3/peer_ids.json
cp /opt/hbmonitor/subscriber_ids.json /opt/hblink3/subscriber_ids.json
#instala servicios
RAW2=$RAW"main/servicios/hblink3.service -O /tmp/hblink3.service"
wget $RAW2
cp /tmp/hblink3.service /etc/systemd/system
RAW2=$RAW"main/servicios/hbparrot.service -O /tmp/hbparrot.service"
wget $RAW2
cp /tmp/hbparrot.service /etc/systemd/system
sed -i "9s/.*/WEB_SERVER_PORT = 8081/" /opt/hbmonitor/config.py
#activa servicios
systemctl daemon-reload
systemctl enable hblink3.service
systemctl start hblink3.service
systemctl enable hbparrot.service
systemctl start hbparrot.service
RAW2=$RAW"main/servicios/hbmonrun.service -O /tmp/hbmonrun.service"
wget $RAW2
cp /tmp/hbmonrun.service /etc/systemd/system
RAW2=$RAW"main/servicios/hbmonrun -O /tmp/hbmonrun"
wget $RAW2
cp /tmp/hbmonrun /usr/bin/hbmonrun
chmod +x /usr/bin/hbmonrun
systemctl daemon-reload
systemctl enable hbmonrun.service
systemctl start hbmonrun.service
}




function HBLINK(){
distribution=$(uname -m)
if [ $distribution == "armv6l" ]
then
  if dialog --title "Instalacion DVLINK"  --yesno "Has seleccionado instalar HBLINK y tienes una pi Zero o similar. No se recomienda en esta maquina por su poca potencia. Estas seguro de continuar???" 0 0 ;then
     INSTALA_HBLINK
  fi
else
     INSTALA_HBLINK
fi
}


function DESINSTALA_HOTSPOT(){
rm -r /opt/hotspot
rm -r /opt/HOTSPOTS-ACTIVOS
rm -r /opt/fw
}


function INSTALA_HOTSPOTS(){

mkdir /opt/hotspot
mkdir /opt/HOTSPOTS-ACTIVOS/
mkdir /opt/fw/ 
cd /opt/fw/
git clone https://github.com/jabanos/STM32F10X_Lib.git
git clone https://github.com/jabanos/fw1.4.17.git

###### P25
cd /opt/
GIT2=$GIT"P25Clients.git"
git clone $GIT2
cd /opt/P25Clients/P25Gateway/
sed -i "22s/.*/$ver/" /opt/P25Clients/P25Gateway/Version.h
make
systemctl daemon-reload
systemctl enable p25gateway.service
echo 'P25 OK :'

##### YSF
cd /opt/
GIT2=$GIT"YSFClients.git"
git clone $GIT2
cd /opt/YSFClients/YSFGateway/
make clean
sed -i "22s/.*/$ver/" /opt/YSFClients/YSFGateway/Version.h
make
echo 'YSF OK :'

######  NXDN
cd /opt
GIT2=$GIT"NXDNClients.git"ç
git clone $GIT2
cd /opt/NXDNClients/NXDNGateway/
sed -i "22s/.*/$ver/" /opt/NXDNClients/NXDNGateway/Version.h
make
systemctl daemon-reload
systemctl enable p25gateway.service
echo 'NXDN OK :'

####  MMDVMHOST 
mkdir /opt/hotspot
cd /opt/hotspot/
GIT2=$GIT"MMDVMHost.git"
git clone $GIT2
cd /opt/hotspot/MMDVMHost/
sed -i "22s/.*/$ver/" /opt/hotspot/MMDVMHost/Version.h

#mkdir /opt/HOTSPOTS-ACTIVOS
make
cp /opt/hotspot/MMDVMHost/linux/DMRIDUpdate.sh /usr/bin/DMRIDUpdate.sh
sed -i "s#/path/to/DMR/ID/file#/opt/hotspot/MMDVMHost#g" "/usr/bin/DMRIDUpdate.sh"
chmod +x /usr/bin/DMRIDUpdate.sh
echo 'MMDVMHOST OK :'


#######  DMRGATEWAY
cd /opt/hotspot/
GIT2=$GIT"DMRGateway.git"
git clone $GIT2
cd /opt/hotspot/DMRGateway/
sed -i "22s/.*/$ver/" /opt/hotspot/DMRGateway/Version.h
make
echo 'DMRGATEWAY OK :'


#################################   FALTA EN EL GITHUB
#########  APRS GATEWAY
cd /opt/hotspot/
git clone https://github.com/g4klx/APRSGateway.git
sed -i "22s/.*/$ver/" /opt/hotspot/APRSGateway/Version.h
make
echo 'APRSGATEWAY OK :'

##### YSF
cd /opt/hotspot/
GIT2=$GIT"YSFClients.git"
git clone $GIT2
cd /opt/hotspot/YSFClients/YSFGateway/
sed -i "22s/.*/$ver/" /opt/hotspot/YSFClients/YSFGateway/Version.h
make
echo 'YSFGATEWAY OK :'

###### P25
cd /opt/hotspot/
GIT2=$GIT"P25Clients.git"
git clone $GIT2
cd /opt/hotspot/P25Clients/P25Gateway/
sed -i "22s/.*/$ver/" /opt/hotspot/P25Clients/P25Gateway/Version.h
make
echo 'P25GATEWAY OK :'

######  NXDN
cd /opt/hotspot/
GIT2=$GIT"NXDNClients.git"
git clone $GIT2
cd /opt/hotspot/NXDNClients/NXDNGateway/
sed -i "22s/.*/$ver/" /opt/hotspot/NXDNClients/NXDNGateway/Version.h
make
echo 'NXDNGATEWAY OK :'


######  CROSSLINKS


####  DMR2NXDN
cd /opt/hotspot/
GIT2=$GIT"MMDVM_CM.git"
git clone $GIT2
cd /opt/hotspot/MMDVM_CM/DMR2NXDN/
sed -i "23s/.*/$ver/" /opt/hotspot/MMDVM_CM/DMR2NXDN/Version.h
make
echo 'DMR2NXDN OK :'

###  DMR2YSF
cd /opt/hotspot/MMDVM_CM/DMR2YSF/
sed -i "23s/.*/$ver/" /opt/hotspot/MMDVM_CM/DMR2YSF/Version.h
make
echo 'DMR2YSF OK :'

####   NXDN2DMR
cd /opt/hotspot/MMDVM_CM/NXDN2DMR/
sed -i "23s/.*/$ver/" /opt/hotspot/MMDVM_CM/NXDN2DMR/Version.h
make
echo 'NXDN2DMR OK :'

####   YSF2DMR

cd /opt/hotspot/MMDVM_CM/YSF2DMR/
sed -i "23s/.*/$ver/" /opt/hotspot/MMDVM_CM/YSF2DMR/Version.h
make
echo 'YSF2DMR OK :'

####  YSF2NXDN

cd /opt/hotspot/MMDVM_CM/YSF2NXDN/
sed -i "23s/.*/$ver/" /opt/hotspot/MMDVM_CM/YSF2NXDN/Version.h
make
echo 'YSF2NXDN OK :'

####  YSF2P25
cd /opt/hotspot/MMDVM_CM/YSF2P25
sed -i "23s/.*/$ver/" /opt/hotspot/MMDVM_CM/YSF2P25/Version.h
make
echo 'YSF2P25 OK :'


}


function ARM(){

sed -i "s#dtparam=spi=off#dtparam=spi=on#g" "/boot/config.txt"
sed -i "s/#dtparam=spi=off/dtparam=spi=on/g" "/boot/config.txt"
sed -i "s/#dtparam=spi=on/dtparam=spi=on/g" "/boot/config.txt"
sed -i "s#dtparam=i2c_arm=off#dtparam=i2c_arm=on#g" "/boot/config.txt"
sed -i "s/dtparam=i2c_arm=off/dtparam=i2c_arm=on/g" "/boot/config.txt"
sed -i "s/#dtparam=i2c_arm=on/dtparam=i2c_arm=on/g" "/boot/config.txt"
sed /etc/modprobe.d/raspi-blacklist.conf -i -e "s/^\(blacklist[[:space:]]*i2c[-_]bcm2708\)/#\1/"
sed /etc/modules -i -e "s/^#[[:space:]]*\(i2c[-_]dev\)/\1/"
sed -i "s/enable_uart=0/enable_uart=1/g" "/boot/config.txt"
echo "dtoverlay=pi3-disable-bt" >> /boot/config.txt
echo "enable_uart=1" >> /boot/config.txt
sed -i /boot/cmdline.txt -e "s/console=ttyAMA0,[0-9]\+ //"
sed -i /boot/cmdline.txt -e "s/console=serial0,[0-9]\+ //"
apt-get install -y build-essential git-core libi2c-dev i2c-tools lm-sensors
echo "i2c-dev" >> /etc/modules
echo "spidev" >> /etc/modules


}

function ESTADO(){
if [ -f $CONF_FILE ];
then
    DVLINKI=$(awk 'NR==1' $CONF_FILE)
    if [[ $DVLINK == "DVLINKI" ]]
    then
        if [[ $DVLINK == "SI/YES" ]]
        then
            DESINSTALA_DVLINK
        fi
    fi
    DVSWITCHI=$(awk 'NR==2' $CONF_FILE)
    if [[ $DVSWITCH == "DVSWITCHI" ]]
    then
        if [[ $DVSWITCH == "SI/YES" ]]
        then
            DESINSTALA_DVSWITCH
        fi
     fi
    HBLINKI=$(awk 'NR==3' $CONF_FILE)
    if [[ $HBLINK == "HBLINKI" ]]
    then
        if [[ $HBLINK == "SI/YES" ]]
        then
            DESINSTALA_HBLINK
        fi
     fi
    HOTSPOTI=$(awk 'NR==4' $CONF_FILE)
    if [[ $HOTSPOT == "HOTSPOTI" ]]
    then
        if [[ $HOTSPOT == "SI/YES" ]]
        then
            DESINSTALA_HOTSPOT
        fi
     fi

else if [ ! -f $EASY_CONF_FILE ]
then
   dialog --title "Easy DVLink" --msgbox "No has configurado Easy DVLink. Configurelo y vuelva a intentarlo" 0 0
else
   DVLINK=$(awk 'NR==1' $EASY_CONF_FILE)
   DV=$(awk 'NR==2' $EASY_CONF_FILE)
   HB=$(awk 'NR==3' $EASY_CONF_FILE)
   HOT=$(awk 'NR==4' $EASY_CONF_FILE)
   cp $EASY_CONF_FILE $CONF_FILE
fi
fi


}

function INSTALA_DVLINK(){

mkdir /etc/scripts
cd /etc/scripts
git clone https://github.com/nuestraspruebas/beta.git
cp /etc/scripts/beta/scripts/* /etc/scripts
cp /etc/scripts/beta/idiomas/* /usr/bin/
mv /etc/scripts/beta/hosts /etc/scripts/
mv /etc/scripts/beta/menus /etc/scripts/
cp /etc/scripts/beta/bin/surecpass /usr/bin/recpass
rm -r /etc/scripts/beta
}


#######  INICIO INSTALADOR  #########
ESTADO
   if [[ $DVLINK = "SI/YES" ]]
   then
     INSTALA_DVLINK
     INSTALA-SOFTWARE
     INSTALA-MYSQL
     RECUPERA-BD
     MODIFICAR_MARIADB
     INSTALA-TTYD

    fi
    if [[ $HB == "SI/YES" ]]
    then
        INSTALA-SOFTWARE
        HBLINK
    fi
    if [[ $HOT == "SI/YES" ]]
    then
        INSTALA-SOFTWARE
        INSTALA_HOTSPOTS
        distribucion=$(uname -m)
    fi

rm -r /dev/shmz > /dev/null 2>&1
distribucion=$(uname -m)
if [[ $distribucion == "x86_64" ]]
then
   dialog --title "Easy DVLink" --msgbox "Instalacion terminada. El sistema se reinciara" 0 0
fi
#reboot
