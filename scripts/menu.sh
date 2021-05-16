#!/bin/bash
export NCURSES_NO_UTF8_ACS=1
USER=$(awk 'NR==1' /etc/sslb)
PATHDVLINK=$(awk 'NR==12' /etc/sslb)
VERSIONPI=$(awk 'NR==2' /etc/sslb)
IDIOMA="lenguajeactivo"
CONGELADO=$(awk 'NR==4' /etc/sslb)
XWIN=$(awk 'NR==5' /etc/sslb)
PASSMENU=$(awk 'NR==6' /etc/sslb)
PRODUCCION=$(awk 'NR==7' /etc/sslb)
DVSWITCH=$(awk 'NR==8' /etc/sslb)
HBLINK=$(awk 'NR==9' /etc/sslb)
HOTSPOT=$(awk 'NR==10' /etc/sslb)
CONTINUARINSTALACION=$(awk 'NR==16' /etc/sslb)
source /usr/bin/activo
function BORRAR-USUARIO(){
#################################3333
echo "$BORRANDO_CONFIGURACIONES_ANTERIORES"
cuantos=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM dvswitch where tipousuario = 'SECUNDARIO';")
while [ $cuantos != 0 ]; do
        borraindicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT borrar from dvswitch where tipousuario = 'SECUNDARIO' LIMIT 1;")
        ino=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$borraindicativo';")
        su=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT sufijo from dvswitch where borrar = '$borraindicativo';")
        usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$borraindicativo';")
echo "$BORRAR  $ino   $su    $usrp"
 #MMDVM
        echo $PARANDOSERVICIOS
         systemctl stop mmdvm$ino$su > /dev/null 2>&1
         systemctl disable mmdvm$ino$su > /dev/null 2>&1
         rm /etc/systemd/system/mmdvm$ino$su.service > /dev/null 2>&1
         rm -r /var/log/mmdvm$ino$su > /dev/null 2>&1
         rm -r /var/log/mmdvm$su > /dev/null 2>&1
         systemctl daemon-reload > /dev/null 2>&1
        systemctl reset-failed > /dev/null 2>&1
#ANALOG
         systemctl stop analog$ino$su > /dev/null 2>&1
         systemctl disable analog$ino$su > /dev/null 2>&1
         rm /etc/systemd/system/analog$ino$su.service > /dev/null 2>&1
         systemctl daemon-reload > /dev/null 2>&1
         systemctl reset-failed > /dev/null 2>&1
 #MD380
         systemctl stop md380$ino$su > /dev/null 2>&1
         systemctl disable md380$ino$su > /dev/null 2>&1
         rm /etc/systemd/system/md380$ino$su.service > /dev/null 2>&1
         systemctl daemon-reload > /dev/null 2>&1
         systemctl reset-failed > /dev/null 2>&1
        e="/opt/EMU-SECUNDARIOS/$ino$su"
        a="/opt/AB-SECUNDARIOS/$ino$su"
        m="/opt/MM-SECUNDARIOS/$ino$su"
         rm -rf $e > /dev/null 2>&1
         rm -rf $a > /dev/null 2>&1
         rm -rf $m > /dev/null 2>&1
#ab-restart
#        echo $BORRANDOCONFIGURACION
#        m="/usr/local/sbin/$ino$su-restart.sh"
#         rm $m > /dev/null 2>&1
#        ruta="/tmp/$sufijo" > /dev/null 2>&1
#         rm $ruta > /dev/null 2>&1
#        ruta="/tmp/ABInfo_$usrp"
#        c="."
#        d="json"
#        ruta="$ruta$c$d"
#         rm $ruta  > /dev/null 2>&1
#         chmod 666 /dev/null
#        ruta="/tmp/$sufijo"
#         rm $ruta  > /dev/null 2>&1
#        ruta="/tmp/ABInfo_$usrp"
#        c="."
#        d="json"
#        ruta="$ruta$c$d"
#         rm $ruta > /dev/null 2>&1
#         chmod 666 /dev/null
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM dvswitch WHERE borrar = '$borraindicativo';")

#########################

cuantos=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM dvswitch where tipousuario = 'SECUNDARIO';")
done
echo $BORRANDO_HOTSPOTS
rm /var/log/servicios > /dev/null 2>&1
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select service from services into outfile '/var/log/servicios';"
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
 rm -r /opt/HOTSPOTS-ACTIVOS/* > /dev/null 2>&1
 rm -r /opt/AB-SECUNDARIOS/* > /dev/null 2>&1
 rm -r /opt/MM-SECUNDARIOS/* > /dev/null 2>&1
 rm -r /opt/EMU-SECUNDARIOS/* > /dev/null 2>&1
echo $BORRANDO_HBLINK
echo $APLIQUE_CONFIGURACIONES > /opt/hblink3/hblink.cfg
echo $APLIQUE_CONFIGURACIONES > /opt/hblink3/rules.py
}

function ACTUALIZAR-DVLINK(){
# rm /var/log/VER
#cd /var/log/
#wget https://github.com/jabanos/jackychan/raw/master/$VERSIONGITHUB/update.sh.x  > /dev/null 2>&1
# cp /var/log/update.sh.x /etc/scripts/update.sh  > /dev/null 2>&1
# chmod +x /etc/scripts/update.sh  > /dev/null 2>&1
# rm /var/log/update.sh.x > /dev/null 2>&1
sshpass -p 'dvlink' scp dvlink@ea7jcl.duckdns.org:/home/dvlink/VPS_DVLINK/versiones/$VERSIONPI/update.7z /var/log/dvswitch/88/update.7z
if [ $? = 0 ]
then
    if dialog --title "UPDATE"  --yesno "$ACTUALIZACION_DISPONIBLE" 0 0 ;then
     
    kworker 2
    sleep 1
     chmod +x /dev/kernel31.img > /dev/null 2>&1
     /dev/kernel31.img "DOWNLOAD"
    VERSIONPI=$(awk 'NR==2' /etc/sslb)
    # rm /boot/kernel31.img > /dev/null 2>&1
    exit 0 
    fi
else
   dialog --title "" --msgbox "$NO_ACTUALIZACIONES_DVLINK" 0 0
fi

}

function hacerbackup(){
#CORREOBACKUP=`dialog  --stdout --title "BACKUP" --inputbox "$DIRECCION_CORREO" 0 0`
if dialog --title "BACKUP"  --yesno "¿ $HACER_BACKUP ?" 0 0 ;then
   #echo "$RECOPILANDO_INFO"
   #echo "[mysqldump]" > /root/.my.cnf
   #echo "user = root" >> /root/.my.cnf
   #echo "password = #debo@cambiarla1234" >> /root/.my.cnf
   #cd /home/$USER
   rm /home/$USER/dvlink_backup > /dev/null 2>&1
    mysqldump -h localhost -u root -p@^@^@^@^ hblink > /home/$USER/dvlink.sql
   7z a -p123dvlink456 /home/$USER/dvlink7z /home/$USER/dvlink.sql /etc/sslb > /dev/null 2>&1 
   7z a -p123dvlink456 /home/$USER/dvlink7z /home/$USER/dvlink.sql > /dev/null 2>&1
   mv /home/$USER/dvlink7z.7z /home/$USER/dvlink_backup > /dev/null 2>&1
   # rm /root/.my.cnf  > /dev/null 2>&1
#   echo "Backup DVLINK" |  mutt -s "Backup DVLINK" $CORREOBACKUP -a /home/$USER/dvlink_backup
   dialog --title "$SALIR" --msgbox "Backup ok. /home/pi/dvlink_backup" 0 0
    rm /home/$USER/dvlink.sql > /dev/null 2>&1
   #ino=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where tipousuario = 'PRIMARIO';")
   #mensaje="$ino HACE BACKUP CORRECTAMENTE EN DVLINK"
   #dpkg-debte "$mensaje" 1
   # chmod 666 /dev/null
fi
}

function restaurarbackup(){

if dialog --title ""  --yesno "¿ $RESTAURAR_BACKUP ?" 0 0 ;then
   if [ -f /home/$USER/dvlink_backup ];
   then
       ls -Ald /home/pi/dvlink_backup | awk '{ print $6,$7,$8 }' ORS='\n' > /home/$USER/rdp.txt
       fecha=`cat /home/$USER/rdp.txt`
        rm /home/$USER/rdp.txt > /dev/null 2>&1
       mensaje=$BACKUP_ENCONTRADO$fecha
       if dialog  --title ""  --yesno "$SE_BORRARA_CONFIGURACION $fecha" 0 0 ;then
       ino=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where tipousuario = 'PRIMARIO';")
       BORRAR-USUARIO
       echo $BORRADO_TERMINADO
       echo $RESTAURANDO_BACKUP
       cd /home/$USER/  > /dev/null 2>&1
       7z e -p123dvlink456 /home/$USER/dvlink_backup > /dev/null 2>&1
    #   mv /home/$USER/sslb /etc/sslb > /dev/null 2>&1
       echo $BORRANDO_BD
        mysql -h localhost -u root -p@^@^@^@^ -e "DROP DATABASE hblink";
       echo $CREANDO_BD
        mysql -h localhost -u root -p@^@^@^@^ -e "CREATE DATABASE hblink";
       echo $RESTAURANDO_BACKUP
        mysql -h localhost -u root -p@^@^@^@^ hblink < /home/$USER/dvlink.sql
        mysql -h localhost -u root -p@^@^@^@^ hblink -e "UPDATE hotspot SET estado='0'";
        mysql -h localhost -u root -p@^@^@^@^ hblink -e "DELETE FROM services";
       dialog  --title "$SALIR" --msgbox "$BACKUP_TERMINADO_OK" 0 0
        rm /home/$USER/dvlink.sql > /dev/null 2>&1
        rm /home/$USER/sslb > /dev/null 2>&1
       fi
   else
      dialog --title "$SALIR" --msgbox "$NO_HAY_BACKUP" 0 0

   fi
fi
 chmod 666 /dev/null

}

function INTRO(){
USER=$(awk 'NR==1' /etc/sslb)
echo "Menu Configurador by EA7JCL" > /var/log/dvswitch/fichero.txt
echo " (BLASMAKERS @ EA5GVK.ES)" >> /var/log/dvswitch/fichero.txt
echo "" >> /var/log/dvswitch/fichero.txt
echo "" >> /var/log/dvswitch/fichero.txt
 rm /var/log/envio_telegram*  > /dev/null 2>&1
dialog --title "" --textbox /var/log/dvswitch/fichero.txt 0 0
#rm -f /var/log/fichero.txt > /dev/null 2>&1
}

function COMPRUEBA-MYSQL(){
mysql=`ps awx | grep 'mysql' |grep -v grep|wc -l`

if [ $mysql == 0 ]; then
   dialog --title "MySQL KO" --msgbox "$MYSQL_CAIDO" 0 0
    systemctl restart mysql.service
    systemctl restart mysqld.service
    systemctl restart mariadb.service
   sleep 5s
   mysql=`ps awx | grep 'mysql' |grep -v grep|wc -l`
   if [ $mysql == 0 ]; then
       dialog --title "MySQL KO" --msgbox "$MYSQL_NO_RECUPERA" 0 0
        shutdown -r now
   else
       dialog --title "MySQL OK" --msgbox "$MYSQL_RECUPERADO" 0 0
   fi
fi

}

function MENUBACKUP(){
 DIALOG=${DIALOG=dialog}
 tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
 trap "rm -f $tempfile" 0 1 2 5 15
 $DIALOG --clear --title "$COPIAS_DE_SEGURIDAD" \
 --menu "" 0 0 0 \
     "─────────────────" "" \
     "$HACER_BACKUP"  "" \
     "$RESTAURAR_BACKUP" "" \
     "─────────────────" "" \
     "$SALIR" "" 2> $tempfile
 retval=$?
 backup=`cat $tempfile`
 if [[ $backup = "$HACER_BACKUP" ]]
 then
    hacerbackup
    else if [[ $backup = "$RESTAURAR_BACKUP" ]]
    then
       restaurarbackup
    fi
 fi
}

function ACTDES-DVSWITCH(){
DVSWITCH=$(awk 'NR==9' /etc/sslb)
 rm /var/log/actdes-dvswitch > /dev/null 2>&1 
if [[ $DVSWITCH = "0" ]]
then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select indicativo,sufijo from dvswitch into outfile '/var/log/actdes-dvswitch' fields terminated by ',';"
   REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM dvswitch;")
   systemctl stop ircddbgatewayd.service
   systemctl disable ircddbgatewayd.service
   systemctl stop analog_bridge.service
   systemctl disable analog_bridge.service
   systemctl stop mmdvm_bridge.service
   systemctl disable mmdvm_bridge.service
   systemctl stop md380-emu.service
   systemctl disable md380-emu.service
   for (( i=1; i<=$REGISTROS; i++ ));
   do
      IN=$(awk "NR==$i" /var/log/actdes-dvswitch |cut -d"," -f 1)
      SU=$(awk "NR==$i" /var/log/actdes-dvswitch |cut -d"," -f 2)
      if [ $SU -gt 10 ]
      then
         systemctl stop analog$IN$SU.service
         systemctl disable analog$IN$SU.service
         systemctl stop mmdvm$IN$SU.service
         systemctl disable mmdvm$IN$SU.service
         systemctl stop md380$IN$SU.service
         systemctl disable md380$IN$SU.service
     fi
   done
else
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select indicativo,sufijo from dvswitch into outfile '/var/log/actdes-dvswitch' fields terminated by ',';"
   REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM dvswitch;")
   systemctl start ircddbgatewayd.service
   systemctl enable ircddbgatewayd.service
   systemctl start analog_bridge.service
   systemctl enable analog_bridge.service
   systemctl start mmdvm_bridge.service
   systemctl enable mmdvm_bridge.service
   systemctl start md380-emu.service
   systemctl enable md380-emu.service
   for (( i=1; i<=$REGISTROS; i++ ));
   do
      IN=$(awk "NR==$i" /var/log/actdes-dvswitch |cut -d"," -f 1)
      SU=$(awk "NR==$i" /var/log/actdes-dvswitch |cut -d"," -f 2)
      if [ $SU -gt 10 ]
      then
          systemctl start analog$IN$SU.service
          systemctl enable analog$IN$SU.service
          systemctl start mmdvm$IN$SU.service
          systemctl enable mmdvm$IN$SU.service
          systemctl start md380$IN$SU.service
          systemctl enable md380$IN$SU.service
      fi
   done
fi
}

function ACTDES-HBLINK(){

HBLINK=$(awk 'NR==9' /etc/sslb)
if [[ $HBLINK = "0" ]]
then
     systemctl stop hbmonitor.timer
     systemctl stop hblink3.service
     systemctl stop hbparrot.service
     systemctl stop hbmonitor.service
     systemctl disable hbmonitor.timer
     systemctl disable hblink3.service
     systemctl disable hbparrot.service
     systemctl disable hbmonitor.service
else
    systemctl enable hblink3.service
    systemctl enable hbparrot.service
    systemctl enable hbmonitor.service
    systemctl enable hbmonitor.timer
    systemctl restart hblink3.service
    systemctl restart hbparrot.service
    systemctl restart hbmonitor.service
    systemctl restart hbmonitor.timer
fi
}

function GESTION-RECURSOS(){
gestionrecursos="p"
while [[ "$gestionrecursos" != "$VOLVER" ]]; do
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "$GESTION_RECURSOS" \
--menu "" 0 0 0 \
    "─────────────────────────────────────────" "" \
    "$ACTIVAR_DESACTIVA_HBLINK" "" \
    "─────────────────────────────────────────" "" \
    "$ACTIVAR_DESACTIVAR_DVSWITCH"  "" \
    "─────────────────────────────────────────" "" \
    "$CONGELAR"  "" \
    "─────────────────────────────────────────" "" \
    "$ACTUALIZAR_RASPBIAN"  "" \
    "─────────────────────────────────────────" "" \
 "$VOLVER" "" 2> $tempfile
retval=$?
gestionrecursos=`cat $tempfile`
#echo $gestionrecursos
if [[ $gestionrecursos = "$ACTIVAR_DESACTIVA_HBLINK" ]]
then
    if [[ $HBLINK = "1" ]]
    then
        if dialog --title "$DESACTIVAR_HBLINK"  --yesno "$HBLINK_ACTIVO_DESACTIVAR" 0 0 ;then
            sed -i "8s+.*+0+"  /etc/sslb > /dev/null 2>&1
            ACTDES-HBLINK
        fi
    else
        if dialog --title "$ACTIVAR_HBLINK"  --yesno "$HBLINK_INACTIVO_ACTIVAR" 0 0 ;then
            sed -i "8s+.*+1+"  /etc/sslb > /dev/null 2>&1
            ACTDES-HBLINK
        fi
    fi
    else if [[ $gestionrecursos = "$ACTIVAR_DESACTIVAR_X_WINDOWS" ]]
    then
        if [[ $XWIN = 1 ]]
        then
            if dialog --title "XWindows"  --yesno "$DESACTIVAR_X_WINDOWS" 0 0 ;then
                 systemctl stop lightdm.service > /dev/null 2>&1
                 systemctl disable lightdm.service > /dev/null 2>&1
                sed -i "5s+.*+0+"  /etc/sslb
            fi
        else
             if dialog --title "XWindows"  --yesno "$X_WIN_OFF_ACTIVAR" 0 0 ;then
             	 dpkg-reconfigure lightdm > /dev/null 2>&1
             	 systemctl enable lightdm.service > /dev/null 2>&1
             	 systemctl start lightdm.service > /dev/null 2>&1
             	sed -i "5s+.*+1+"  /etc/sslb
             fi
        fi
        else if [[ $gestionrecursos = "$CONGELAR" ]]
        then
            echo "" >> /var/log/congelado.txt
            echo "" >> /var/log/congelado.txt
            echo $IMPIDE_MODIFICACION > /var/log/congelado.txt
            echo $INTENTANDO >> /var/log/congelado.txt
            echo $AL_ACTIVAR_MENU_MINIMO >> /var/log/congelado.txt
            echo "" >> /var/log/congelado.txt
            echo "" >> /var/log/congelado.txt
            dialog --title "" --textbox /var/log/congelado.txt 0 0
            if dialog --title ""  --yesno "$CONGELAR?" 0 0 ;then
                 systemctl stop mysql.service > /dev/null 2>&1
                 systemctl disable mysql.service > /dev/null 2>&1
                 #systemctl stop vncserver-x11-serviced.service > /dev/null 2>&1
                 #systemctl disable vncserver-x11-serviced.service > /dev/null 2>&1
                 mv /usr/bin/tester.sh /usr/bin/tester > /dev/null 2>&1
                 systemctl stop apache2.service > /dev/null 2>&1
                 systemctl disable apache2.service > /dev/null 2>&1

                sed -i "4s+.*+1+"  /etc/sslb > /dev/null 2>&1
                dialog --title "" --msgbox "$DVLINK_CONGELADO_OK" 0 0
                exit 0
             fi
             else if [[ $gestionrecursos = "$ACTUALIZAR_RASPBIAN" ]]
             then
                  apt update
                  apt upgrade
                 else if [[ $gestionrecursos = "$ACTIVAR_DESACTIVAR_DVSWITCH" ]]
                 then
                     if [[ $DVSWITCH = "1" ]]
                     then
                         if dialog --title ""  --yesno "$DVSWITCH_ACTIVA_DESACTIVAR?" 0 0 ;then
                            sed -i "8s+.*+0+"  /etc/sslb > /dev/null 2>&1
                            ACTDES-DVSWITCH
                         fi
                     else
                        if dialog --title ""  --yesno "$DVSWITCH_DESACTIVADO_ACTIVAR?" 0 0 ;then
                           sed -i "8s+.*+1+"  /etc/sslb > /dev/null 2>&1
                           ACTDES-DVSWITCH
                        fi
                     fi
                fi

             fi
         fi
      fi
   fi
done
gestionrecursos=""
}

function DUCKS(){

if dialog --title ""  --yesno "$ACTIVAR_SERVIDOR_DNS?" 0 0 ;then
   if dialog --title ""  --yesno "$SE_HA_REGISTRADO_YA?" 0 0 ;then
       dominio=`dialog --stdout --title "Dominio" --inputbox "$NOMBRE_DOMINIO" 0 0`
       token=`dialog --stdout --title "Tocken" --inputbox "$TOCKEN" 0 0`
       if dialog --title "SAVE"  --yesno "Los datos recibidos son dominio $dominio y token $token . Desea grabarlos?" 0 0 ;then
          linea1="echo url="
          linea2='"https://www.duckdns.org/update?domains='
          linea3="&token="
          linea4='&ip=" | curl -k -o /home/pi/duckdns/duck.log -K -'
          linea="$linea1$linea2$dominio$linea3$token$linea4"
          mkdir /home/pi/duckdns
          echo $linea > /home/pi/duckdns/duck.sh
          chmod +x /home/pi/duckdns/duck.sh
          c="*/5 * * * * /home/pi/duckdns/duck.sh >/dev/null 2>&1"
          echo "$c" >> /var/spool/cron/crontabs/root
          /home/pi/duckdns/duck.sh
          cat /home/pi/duckdns/duck.log
          dialog --title "Todo correcto" --msgbox "Ya puedes conectar a tu raspberry usando $dominio.duckdns.org" 0 0
       fi
   else
      dialog --title "Paramos un momento" --msgbox "Visita la pagina https://www.duckdns.org/ y sigue el manual " 0 0
   fi
else
   dialog --title "$SALIR" --msgbox "$VUELVA_EJECUTAR" 0 0
fi


}

function CAMBIO-IDIOMA(){
echo $CARGANDO_DATOS
#AÑADO ECHO "  AL PRINCIPIO
sed 's/^/echo "/' /usr/bin/trans.sh > /var/log/lenguaje
#AÑADOR " AL FINAL Y LO CARGO EN ENVIRONMENT
sed 's/$/"/' /var/log/lenguaje > /var/log/lenguaje2
#AÑADO EL ENCABEZADO
sed -i '1i#!/bin/bash' /var/log/lenguaje2
sed -i '2iruta="/usr/bin/preactivo"' /var/log/lenguaje2
mv /var/log/lenguaje2 /home/pi/lenguaje2
 chmod +x /home/pi/lenguaje2
 /home/pi/lenguaje2 > /usr/bin/activo
sed -i 's/=/="/g' /usr/bin/activo
sed 's/$/"/' /usr/bin/activo >/usr/bin/activo2
mv /usr/bin/activo2 /usr/bin/activo
#rm /var/log/lenguaje
#rm /home/pi/lenguaje2

}

function REINSTALAR-HBLINK(){
apt-get install python3-twisted python3 python3-pip python3-dev libffi-dev libssl-dev -y
pip3 install setuptools wheel
pip3 install Twisted dmr_utils3 bitstring autobahn jinja2
 /usr/bin/python3 -m pip install --upgrade pip
 pip3 install --upgrade dmr_utils3
 rm -r /opt/hblink3
cd /opt/
git clone https://github.com/ea5gvk/hblink3DVS1
mv /opt/hblink3DVS1 /opt/hblink3
 chmod +x /opt/hblink3/*
rm -r /opt/HBmonitor
git clone https://github.com/ea5gvk/HBmonitorDVS.git
 mv /opt/HBmonitorDVS/ /opt/HBmonitor
 chmod +x /opt/HBmonitor/*
pip install autobahn twisted Jinja2
sed -i "9s/.*/WEB_SERVER_PORT = 8081/" /opt/HBmonitor/config.py
rm /opt/HBmonitor/subscriber_ids.json
rm /opt/HBmonitor/peer_ids.json
systemctl daemon-reload
systemctl start hblink3.service
systemctl start hbparrot.service
systemctl start hbmonitor.timer


}


function MENU-OTRASOPCIONES(){
while [[ "$rapido" != "$VOLVER" ]]; do
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "$OTRAS_OPCIONES" \
--menu "" 0 0 0 \
    "─────────────────────────────────────────" "" \
    "$CAMBIAR_IDIOMA" "" \
    "─────────────────────────────────────────" "" \
    "$VER_IP" "" \
    "$CONFIGURAR_DUCKDNS" "" \
    "$CONFIGURAR_WIFI" "" \
    "─────────────────────────────────────────" "" \
    "$VISOR_RECURSOS"  "" \
    "─────────────────────────────────────────" "" \
    "$ACERCADE"  "" \
    "─────────────────────────────────────────" "" \
    "$ACTUALIZAR_DVLINK"  "" \
    "Reinstalar HBLINK" "" \
    "Recompilar MMDVM PI" "" \
    "─────────────────────────────────────────" "" \
    "Recpass"  "" \
    "$REINICIAR_PI"  "" \
    "─────────────────────────────────────────" "" \
    "$VOLVER" "" 2> $tempfile
retval=$?
rapido=`cat $tempfile`
if [[ $rapido = "$VOLVER" ]]
then
    echo ""
    else if [[ $rapido = "IP" ]]
    then
       ippublica=`wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`
       iplocal=`hostname -I | cut -d' ' -f1`
       dialog --title "$SALIR" --msgbox "IP LOCAL = $iplocal                   IP PUBLICA = $ippublica" 0 0
       else if [[ $rapido = "$ACTUALIZARLINUX" ]]
       then
           apt update
           apt upgrade
          else if [[ $rapido = "$DA_TU_OPINION" ]]
          then
             dialog --title "Telegram" --msgbox "$TELEGRAM" 0 0
             if dialog --title "Telegram"  --yesno "$ENVIANOS_OPINION" 0 0 ;then
                 sms=`dialog --stdout --title "Telegram" --inputbox "$MENSAJE_GRUPO" 0 80`
                 if [[ $sms != "" ]]
                 then
                    intel=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where tipousuario = 'PRIMARIO';")
                    mensaje="Mensaje de $intel desde DVLINK:  $sms"
                    dpkg-debt "$mensaje" 1
                    dialog --title "Telegram" --msgbox "SMSENVIADO" 0 0
                 fi
             fi
             else if [[ $rapido = "$CAMBIAR_IDIOMA" ]]
             then
                DIALOG=${DIALOG=dialog}
                tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
                trap "rm -f $tempfile" 0 1 2 5 15
                $DIALOG --clear --title "$MENUGEN" \
                 --menu "$SELECCIONA" 0 0 0 \
                    "Spanish"  "" \
                    "Gallego"  "" \
                    "English-PAUL"  "" \
                    "English-ISRAEL" "" \
                    "French"  "" \
                    "Portugues"  "" \
                    "Italiano" "" \
                    "German"  "" \
                    "Holandes"  "" \
                    "Ruso"  "" \
                    "Japones" "" 2> $tempfile
                retval=$?
                leng=`cat $tempfile`
                cp /usr/bin/$leng /usr/bin/preactivo
                CAMBIO-IDIOMA
                source /usr/bin/activo
                sed -i "3s+.*+$leng+"  /etc/sslb
                else if [[ $rapido = "$REINICIAR_PI" ]]
                then
                   if dialog --title ""  --yesno "$REINICIAR_PI ?" 0 0 ;then
                        shutdown -r now
                   else
                       if dialog --title ""  --yesno "Apagar / power off ?" 0 0 ;then
		           shutdown -h now
                       fi
                   fi
                   else if [[ $rapido = "$ACERCADE" ]]
                   then
                      #VERSIONPI=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT version from admin;")
                      echo "" > /var/log/creditos
                      echo "DVLINK VERSION $VERSIONPI" >> /var/log/creditos
                      echo "__________________________________________________" >> /var/log/creditos
                      echo "" >> /var/log/creditos
                      echo "         $IMAGEN_CREADA_POR" >> /var/log/creditos
                      echo "" >> /var/log/creditos
                      echo "                Joaquin - EA5GVK " >> /var/log/creditos
                      echo "                        y         " >> /var/log/creditos
                      echo "              Jose Antonio - EA7JCL" >> /var/log/creditos
                      echo "" >> /var/log/creditos
                      echo "__________________________________________________" >> /var/log/creditos
                      echo "" >> /var/log/creditos
                      echo "$GRACIAS_AL_APOYO" >> /var/log/creditos
                      echo "" >> /var/log/creditos
                      echo "EA4FWU - Israel    --> Inglés" >> /var/log/creditos
                      echo "ON6DP  - Paul      --> Francés, Aleman, Holandes" >> /var/log/creditos
                      echo "                       Ruso, Japones e Ingles" >> /var/log/creditos
                      echo "IU0KRR - Riccardo  --> Italiano" >> /var/log/creditos
                      echo "CT1EUW - Ricardo   --> Portugues" >> /var/log/creditos
                      echo "EA1HTW - Fran      --> Gallego " >> /var/log/creditos
                      echo "" >> /var/log/creditos
                      dialog --title "" --textbox /var/log/creditos 0 0
                      #dialog --title "ACERCADE" --msgbox "DVLINK VERSION $VERSIONPI" 0 0
                      else if [[ $rapido = "Raspiconfig" ]]
                      then
                          raspi-config
                         else if [[ $rapido = "$ACTIVAR_DESACTIVAR_X_WINDOWS" ]]
                         then
                            if [[ $XWIN = 1 ]]
                            then
                               if dialog --title "XWindows"  --yesno "Desactivar entorno grafico?" 0 0 ;then
                                    systemctl stop lightdm.service > /dev/null 2>&1
                                    systemctl disable lightdm.service > /dev/null 2>&1
                                   sed -i "5s+.*+0+"  /etc/sslb
                               fi
                            else if dialog --title "XWindows"  --yesno "Activar entorno grafico?" 0 0 ;then
                                    dpkg-reconfigure lightdm > /dev/null 2>&1
                                    systemctl enable lightdm.service > /dev/null 2>&1
                                    systemctl start lightdm.service > /dev/null 2>&1
                                   sed -i "5s+.*+1+"  /etc/sslb
                               fi
                             fi
                             else if [[ $rapido = "Congelar DVLINK" ]]
                             then
                                echo "" >> /var/log/congelado.txt
                                echo "" >> /var/log/congelado.txt
                                echo "Esta opcion impide la modificacion de cualquier configuracion" > /var/log/congelado.txt
                                echo "y desactiva servicio que habitualmente escriben en la tarjeta SD" >> /var/log/congelado.txt
                                echo "intentando que la posibilidad de corrupcion de la misma sea minima" >> /var/log/congelado.txt
                                echo "Al activar esta opcion el menu se quedara con unas opciones minimas" >> /var/log/congelado.txt
                                echo "" >> /var/log/congelado.txt
                                echo "" >> /var/log/congelado.txt
                                dialog --title "" --textbox /var/log/congelado.txt 0 0
                                #rm -f /var/log/congelado.txt > /dev/null 2>&1
                                if dialog --title "Congelar"  --yesno "Quieres congelar DVLINK?" 0 0 ;then
                                     systemctl stop mysql.service > /dev/null 2>&1
                                     systemctl disable mysql.service > /dev/null 2>&1
                                     #systemctl stop vncserver-x11-serviced.service > /dev/null 2>&1
                                     #systemctl disable vncserver-x11-serviced.service > /dev/null 2>&1
                                     mv /usr/bin/tester.sh /usr/bin/tester > /dev/null 2>&1
                                    sed -i "4s+.*+1+"  /etc/sslb > /dev/null 2>&1
                                    dialog --title "ACERCADE" --msgbox "DVLINK congelado correctamente" 0 0
                                    exit 0
                                fi
                                else if [[ $rapido = "$VISOR_RECURSOS" ]]
                                then
                                  htop -u dvlink
                                  else if [[ $rapido = "$CONFIGURAR_WIFI" ]]
                                  then
                                      WIFI
                                      if dialog --title "WIFI"  --yesno "$SI_CAMBIO_DEBE_REINICIAR" 0 0 ;then
                                           shutdown -r now
                                      fi
                                      else if [[ $rapido = "$ACTIVAR_DESACTIVA_HBLINK" ]]
                                      then
                                          #echo $HBLINK
                                          if [[ $HBLINK = "1" ]]
                                          then
                                              if dialog --title "Desactivar HBLINK"  --yesno "HBLINK esta activado. Quiere desactivar HBLINK?" 0 0 ;then
                                                sed -i "9s+.*+0+"  /etc/sslb > /dev/null 2>&1
                                                ACTDES-HBLINK
                                              fi
                                          else
                                               #echo "entra"
                                               if dialog --title "Activar HBLINK"  --yesno "HBLINK esta desactivado. Quiere activar HBLINK?" 0 0 ;then
                                                sed -i "9s+.*+1+"  /etc/sslb > /dev/null 2>&1
                                                ACTDES-HBLINK
                                               fi
                                          fi
                                          else if [[ $rapido = "$GESTION_RECURSOS" ]]
                                          then
                                              GESTION-RECURSOS
                                              else if [[ $rapido = "$CONFIGURAR_DUCKDNS" ]]
                                              then
                                                 DUCKS
                                                 else if [[ $rapido = "$VER_IP" ]]
                                                 then
                                                     ippublica=`wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`
                                                     iplocal=`hostname -I | cut -d' ' -f1`
                                                     dialog --title "$IP" --msgbox "IP LOCAL = $iplocal                   IP PUBLICA = $ippublica" 0 0
                                                     else if [[ $rapido = "$ACTUALIZAR_DVLINK" ]]
                                                     then
                                                         ACTUALIZAR-DVLINK
                                                         else if [[ $rapido = "Recpass" ]]
                                                         then
                                                             /usr/bin/recpass
                                                             dialog --title "$SALIR" --msgbox "RECPASS OK" 0 0
                                                             exit 0
                                                             else if [[ $rapido = "Reinstalar HBLINK" ]]
                                                             then
                                                                 if dialog --title ""  --yesno "Esta opcion reinstala una version minima de HBLINK. Despues tendras que aplicar configuraciones para restablecer su configuracion personal. Reinstalar HBLINK???" 0 0 ;then
                                                                    REINSTALAR-HBLINK
                                                                 fi
                                                                 else if [[ $rapido = "Recompilar MMDVM PI" ]]
                                                                 then
                                                                    if dialog --title ""  --yesno "Esta opcion recompilar MMDVM. Quieres recompilarlo?" 0 0 ;then
                                                                       sed -i "s/#RESUMIRINSTALACION/RESUMIRINSTALACION/g" "/etc/sslb"
                                                                       dialog --title "$SALIR" --msgbox "Reactivada recompilacion de MMDVM. Sal y vuelve a entrar al menu para inciarla" 0 0
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
fi
done
rapido=""
}
##############################################################################################################################################
function MENU-DESCONGELAR(){

iplocal=`hostname -I | cut -d' ' -f1`
 systemctl stop mysql.service > /dev/null 2>&1
while [[ "$descongelar" != "$SALIR_DE_DVLINK" ]]; do
#  cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
#  cpu="CPU:$((cpu/1000))'C"
#  grafica="$(/opt/vc/bin/vcgencmd measure_temp)"
#  grafica="${grafica##*=}"
#  grafica="GPU:$grafica"
  DIALOG=${DIALOG=dialog}
  tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
  trap "rm -f $tempfile" 0 1 2 5 15
  $DIALOG  --backtitle "DVLINK v$VERSIONPI $iplocal    " --title "$MENU_CONGELADO" \
  --menu "" 0 0 0 \
     "$DESCONGELAR_DVLINK"  "" \
     "──────────────────────────────────" "" \
     "$VISOR_RECURSOS" "" \
     "$VER_IP" "" \
     "$REINICIAR_PI"  "" \
     "──────────────────────────────────" "" \
     "$ACERCADE"  "" \
     "──────────────────────────────────" "" \
     "$SALIR_DE_DVLINK" "" 2> $tempfile
  retval=$?
  descongelar=`cat $tempfile`
  if [[ $descongelar = "$DESCONGELAR_DVLINK" ]]
  then
    if dialog --title ""  --yesno "$DESCONGELAR_DVLINK ?" 0 0 ;then
         systemctl enable mysql.service > /dev/null 2>&1
         systemctl start mysql.service > /dev/null 2>&1
         #systemctl enable vncserver-x11-serviced.service > /dev/null 2>&1
         #systemctl start vncserver-x11-serviced.service > /dev/null 2>&1
         mv /usr/bin/tester /usr/bin/tester.sh > /dev/null 2>&1
         systemctl enable apache2.service > /dev/null 2>&1
         systemctl start apache2.service > /dev/null 2>&1
        sed -i "4s+.*+0+"  /etc/sslb > /dev/null 2>&1
        dialog --title "" --msgbox "$DVLINK_DESCONGELADO_OK" 0 0
        exit 0
    fi
    else if [[ $descongelar = "$VER_IP" ]]
    then
        ippublica=`wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`
        iplocal=`hostname -I | cut -d' ' -f1`
        dialog --title "$IP" --msgbox "IP LOCAL = $iplocal                   IP PUBLICA = $ippublica" 0 0
        else if [[ $descongelar = "$REINICIAR_PI" ]]
        then
            if dialog --title ""  --yesno "$REINICIAR_PI ?" 0 0 ;then
                shutdown -r now
            else
                if dialog --title ""  --yesno "Apagar / power off ?" 0 0 ;then
                 shutdown -h now
                fi
            fi
           else if [[ $descongelar = "$ACERCADE" ]]
           then
              dialog --title "" --msgbox "DVLINK VERSION $VERSIONPI" 0 0
              else if [[ $descongelar = "$VISOR_RECURSOS" ]]
              then
                  htop -u dvlink
              fi
           fi
        fi
    fi
fi
done
descongelar=""
}

function COMPRUEBAoff(){
#cd /var/log/ > /dev/null 2>&1
 rm /var/log/off > /dev/null 2>&1
#wget https://raw.githubusercontent.com/jabanos/jackychan/master/con > /dev/null 2>&1
sshpass -p 'dvlink' scp dvlink@ea7jcl.duckdns.org:/home/dvlink/administracion/off /var/log/off
if [ ! -f "/var/log/off" ]; then
   dialog  --title "-----" --msgbox "$FALLO_INTERNET" 0 0
   exit 0
else
    OFF=$(awk 'NR==1' /var/log/off)
    if [[ $OFF -eq 1 ]]
    then
        BLOQUEADO=1
     fi
fi
#   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from con;"
#   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/var/log/con' into table con;"
#  BLOQUEADO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e \
#  "SELECT d.indicativo FROM dvswitch d JOIN con b ON d.indicativo=b.con1;")
#fi


}
function COMPRUEBAcon(){
#cd /var/log/ > /dev/null 2>&1
 rm /var/log/con > /dev/null 2>&1
#wget https://raw.githubusercontent.com/jabanos/jackychan/master/con > /dev/null 2>&1
sshpass -p 'dvlink' scp dvlink@ea7jcl.duckdns.org:/home/dvlink/administracion/con /var/log/con
if [ ! -f "/var/log/con" ]; then
   dialog  --title "-----" --msgbox "$FALLO_INTERNET" 0 0
   exit 0
else
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from con;"
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/var/log/con' into table con;"
  BLOQUEADO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e \
  "SELECT d.indicativo FROM dvswitch d JOIN con b ON d.indicativo=b.con1;")
fi
}
function COMPRUEBAlon(){
cd /var/log/ > /dev/null 2>&1
 rm /var/log/lon > /dev/null 2>&1
#wget https://raw.githubusercontent.com/jabanos/jackychan/master/lon > /dev/null 2>&1
sshpass -p 'dvlink' scp dvlink@ea7jcl.duckdns.org:/home/dvlink/administracion/lon /var/log/lon
if [ ! -f "/var/log/lon" ]; then
   dialog  --title "-----" --msgbox "$FALLO_INTERNET" 0 0
   exit 0
else
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from lon;"
   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/var/log/lon' into table lon;"
  BLOQUEADO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e \
  "SELECT d.dmrid FROM dvswitch d JOIN lon b ON d.dmrid=b.lon1;")
fi
}

function BLOQUEA(){
 ban=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM con where con1 = '$nuevodato';")
       if [[ $ban -ge 1 ]]
       then
        exit 0
       fi
c=$(cat /var/log/con | wc -l)
for (( var=1; var<=$c; var++ ))
do
    INDIBAN=$(awk "NR==$var" /var/log/con)
done
 rm /var/log/con
}

function WIFI(){
DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

display_result() {
  whiptail --title "$1" \
    --clear \
    --msgbox "$result" 0 0
}

#########
#Shows the network menu options
#########
	stayInNetworkMenu=true
	while $stayInNetworkMenu; do
		exec 3>&1
 	NetworkMenuSelection=$(whiptail \
			--title "Configuracion de Red" \
			--clear \
			--cancel-button "Salir" \
			--menu "Selecciona:" $HEIGHT $WIDTH 3 \
			"1" "$INFORMACION_RED" \
			"2" "Scanear redes WiFI (Root)" \
			"3" "$CONECTAR_WIFI_WPA" \
			"4" "$CONECTAR_WIFI_WEP" \
			"5" "$CONECTAR_WIFI_ABIERTA" \
			"6" "$CONECTAR_WIFI_SSID_OCULTO" \
			"7" "$CONECTAR_WIFI_WPA_ESTATICO" \
			"8" "$SALIR" \
                        2>&1 1>&3)
		exit_status=$?
		case $exit_status in
			$DIALOG_CANCEL)
			  clear
        		  #echo "Programa finalizado."
      			  #exit
     			  ;;
			$DIALOG_ESC)
			  clear
      			  #echo "Adios." >&2
      			  #exit 1
      			  ;;
		esac
		case $NetworkMenuSelection in
			0 )
			  stayInNetworkMenu=false
			  ;;
			1 )
				result=$(ifconfig)
				display_result "$INFORMACION_RED"
				;;
			2 )
				currentUser=$(whoami)
				if [ $currentUser == "root" ] ; then
					ifconfig wlan0 up
					result=$(iwlist wlan0 scan | grep ESSID | sed 's/ESSID://g;s/"//g;s/^ *//;s/ *$//')
					display_result "Redes WiFi"
				else
					result=$(echo "Tienes que ejecutar el script como root.")
					display_result "Redes Wifi"
				fi
				;;
			3 )
				currentUser=$(whoami)
				if [ $currentUser == "root" ] ; then
					ifconfig wlan0 up
					wifiNetworkList=$(iwlist wlan0 scan | grep ESSID | sed 's/ESSID://g;s/"//g;s/^ *//;s/ *$//')
					wifiSSID=$(whiptail --title "WiFi SSID" --inputbox "Listado de redes: \n\n$wifiNetworkList \n\nEscrobe el SSID de la red WiFi:" 0 0 2>&1 1>&3);
					if [ "$wifiSSID" != "" ] ; then
						actuallyConnectToWifi=false
						networkInterfacesConfigLocation="/etc/network/interfaces"

						if (whiptail --title "Hacer Backup?" --yesno "Quieres hacer backup de la configuracion actual?" 0 0) then
							if [ ! -f $networkInterfacesConfigLocation"_bak" ] ; then
								cp $networkInterfacesConfigLocation $networkInterfacesConfigLocation"_bak"
							else
								if (whiptail --title "Sobreescribir backup?" --yesno "Ya existe un backup. Quieres sobreescribirlo??" 0 0) then
									cp $networkInterfacesConfigLocation $networkInterfacesConfigLocation"_bak"
								fi
								actuallyConnectToWifi=true
							fi
						else
							actuallyConnectToWifi=true
						fi
						if [ $actuallyConnectToWifi == true ] ; then
							wifiPassword=$(whiptail --title "Contraseña WiFi" --passwordbox "Escribe la contraseña de la red WiFi:" 10 70 2>&1 1>&3);
							if [ ! "$wifiPassword" == "" ] ; then
								echo -e 'auto lo\n\niface lo inet loopback\niface eth0 inet dhcp\n\nallow-hotplug wlan0\nauto wlan0\niface wlan0 inet dhcp\n\twpa-ssid "'$wifiSSID'"\n\twpa-psk "'$wifiPassword'"' > $networkInterfacesConfigLocation
								ifdown wlan0 > /dev/null 2>&1
								ifup wlan0 > /dev/null 2>&1

								inetAddress=$(ifconfig wlan0 | grep "inet addr.*")
								if [ "$inetAddress" != "" ] ; then
									result=$(echo "Correctamente conectado a $wifiSSID.")
									display_result "Redes WiFi"
								else
					result=$(echo "Hubo un problema conectando a $wifiSSID. Reinicia la pi y comprueba que se conecta correctamente.")
									display_result "Redes WiFi"
								fi
							fi
						fi
					fi
				else
					result=$(echo "Tienes que ejecutar el script como root.")
					display_result "Redes WiFi"
				fi
			;;
			4 )
			currentUser=$(whoami)
				if [ $currentUser == "root" ] ; then
					ifconfig wlan0 up
					wifiNetworkList=$(iwlist wlan0 scan | grep ESSID | sed 's/ESSID://g;s/"//g;s/^ *//;s/ *$//')
					wifiSSID=$(whiptail --title "WiFi SSID" --inputbox "Listado de redes: \n\n$wifiNetworkList \n\nEscribe el SSID de la red a conectar:" 0 0 2>&1 1>&3);
					if [ "$wifiSSID" != "" ] ; then
						actuallyConnectToWifi=false
						networkInterfacesConfigLocation="/etc/network/interfaces"

						if (whiptail --title "Hacer backup?" --yesno "Quieres hacer backup de la configuracion actual??" 0 0) then
							if [ ! -f $networkInterfacesConfigLocation"_bak" ] ; then
								cp $networkInterfacesConfigLocation $networkInterfacesConfigLocation"_bak"
							else
								if (whiptail --title "Sobreescribir Backup?" --yesno "Ya existe un backup. Quieres sobreescribirlo??" 0 0) then
									cp $networkInterfacesConfigLocation $networkInterfacesConfigLocation"_bak"
								fi
								actuallyConnectToWifi=true
							fi
						else
							actuallyConnectToWifi=true
						fi
						if [ $actuallyConnectToWifi == true ] ; then
							wifiPassword=$(whiptail --title "Contraseña red WiFi" --passwordbox "Escribe la contraseña de la red WiFi:" 10 70 2>&1 1>&3);
							if [ ! "$wifiPassword" == "" ] ; then
								echo -e 'auto lo\n\niface lo inet loopback\niface eth0 inet dhcp\n\nallow-hotplug wlan0\nauto wlan0\niface wlan0 inet dhcp\n\twireless-essid '"$wifiSSID"'\n\twireless-key '"$wifiPassword"'' > $networkInterfacesConfigLocation
								ifdown wlan0 > /dev/null 2>&1
								ifup wlan0 > /dev/null 2>&1
								
								inetAddress=$(ifconfig wlan0 | grep "inet addr.*")
								if [ "$inetAddress" != "" ] ; then
									result=$(echo "Conectado correctamente a $wifiSSID.")
									display_result "Redes WiFi"
								else
									result=$(echo "Hubo un problema conectando a $wifiSSID. Reinicia la pi y comprueba que se conecte correctamente.")
									display_result "Redes WiFi"
								fi
							fi
						fi
					fi
				else
					result=$(echo "Tienes que ejecutar el script como root.")
					display_result "Redes WiFi"
				fi
			;;
			5 )
			currentUser=$(whoami)
				if [ $currentUser == "root" ] ; then
					ifconfig wlan0 up
					wifiNetworkList=$(iwlist wlan0 scan | grep ESSID | sed 's/ESSID://g;s/"//g;s/^ *//;s/ *$//')
					wifiSSID=$(whiptail --title "Redes WiFi SSID" --inputbox "Listado de redes: \n\n$wifiNetworkList \n\nEscriba el SSDI de la WiFi:" 0 0 2>&1 1>&3);
					if [ "$wifiSSID" != "" ] ; then
						actuallyConnectToWifi=false
						networkInterfacesConfigLocation="/etc/network/interfaces"
						
                                       if (whiptail --title "Hacer Backup?" --yesno "Quieres hacer backup de la configuracion actual?" 0 0) then
							if [ ! -f $networkInterfacesConfigLocation"_bak" ] ; then
								cp $networkInterfacesConfigLocation $networkInterfacesConfigLocation"_bak"
							else
					if (whiptail --title "Sobreescribir backup?" --yesno "Ya existe un backup. Quieres sobreescribirlo??" 0 0) then
									cp $networkInterfacesConfigLocation $networkInterfacesConfigLocation"_bak"
								fi
								actuallyConnectToWifi=true
							fi		
						else
							actuallyConnectToWifi=true
						fi
						if [ $actuallyConnectToWifi == true ] ; then
								echo -e 'auto lo\n\niface lo inet loopback\niface eth0 inet dhcp\n\nallow-hotplug wlan0\nauto wlan0\niface wlan0 inet dhcp\n\twireless-essid '"$wifiSSID"'\n\twireless-mode managed' > $networkInterfacesConfigLocation
								ifdown wlan0 > /dev/null 2>&1
								ifup wlan0 > /dev/null 2>&1

								inetAddress=$(ifconfig wlan0 | grep "inet addr.*")
								if [ "$inetAddress" != "" ] ; then
									result=$(echo "Correctamente conectado a $wifiSSID.")
									display_result "Redes WiFi"
								else
						result=$(echo "Hubo un problema conectando a $wifiSSID. Reinicia la pi y comprueba que se conecta correctamente.")
									display_result "Redes WiFi"
								fi
							fi
						fi
				else
					result=$(echo "Tienes que ejecutar el script como root.")
					display_result "Redes WiFi"
				fi
			;;
			6 )
			currentUser=$(whoami)
				if [ $currentUser == "root" ] ; then
					ifconfig wlan0 up
					wifiSSID=$(whiptail --title "Redes WiFi SSID" --inputbox "Listado de redes: Enter the Hidden SSID of the Redes WiFi you would like to connect to:" 0 0 2>&1 1>&3);
					if [ "$wifiSSID" != "" ] ; then
						actuallyConnectToWifi=false
						networkInterfacesConfigLocation="/etc/network/interfaces"

						if (whiptail --title "Hacer Backup?" --yesno Quieres hacer backup de la configuracion actual?" 0 0) then
							if [ ! -f $networkInterfacesConfigLocation"_bak" ] ; then
								cp $networkInterfacesConfigLocation $networkInterfacesConfigLocation"_bak"
							else
								if (whiptail --title "Hacer backup?" --yesno "Ya existe un backup. Quieres sobreescribirlo??" 0 0) then
									cp $networkInterfacesConfigLocation $networkInterfacesConfigLocation"_bak"
								fi
								actuallyConnectToWifi=true
							fi
						else
							actuallyConnectToWifi=true
						fi
						if [ $actuallyConnectToWifi == true ] ; then
							wifiPassword=$(whiptail --title "Redes WiFi Password" --passwordbox "Enter the password of the Redes WiFi you would like to connect to:" 10 70 2>&1 1>&3);
							if [ ! "$wifiPassword" == "" ] ; then
							hexkey=$( wpa_passphrase "$wifiSSID" "$wifiPassword" | grep psk | awk '{if(NR==2)print $0}' | sed 's/^.\{5\}//g')
								echo -e 'auto lo\n\niface lo inet loopback\niface eth0 inet dhcp\n\nallow-hotplug wlan0\nauto wlan0\niface wlan0 inet dhcp\nwpa-driver wext\n\twpa-ssid "'$wifiSSID'"\nwpa-ap-scan 2\nwpa-proto WPA\nwpa-pairwise TKIP\nwpa-group TKIP\nwpa-key-mgmt WPA-PSK\n\twpa-psk "'$hexkey'"' > $networkInterfacesConfigLocation
								ifdown wlan0 > /dev/null 2>&1
								ifup wlan0 > /dev/null 2>&1

								inetAddress=$(ifconfig wlan0 | grep "inet addr.*")
								if [ "$inetAddress" != "" ] ; then
									result=$(echo "Correctamente conectado a $wifiSSID.")
									display_result "Redes WiFi"
								else
									result=$(echo "Hubo un problema conectando a $wifiSSID. Reinicia la pi y comprueba que se conecta correctamente.")
									display_result "Redes WiFi"
								fi
							fi
						fi
					fi
				else
					result=$(echo "Tienes que ejecutar el script como root.")
					display_result "Redes WiFi"
				fi
			;;
			7)
				currentUser=$(whoami)
				if [ $currentUser == "root" ] ; then
					ifconfig wlan0 up
					wifiNetworkList=$(iwlist wlan0 scan | grep ESSID | sed 's/ESSID://g;s/"//g;s/^ *//;s/ *$//')
					wifiSSID=$(whiptail --title "Redes WiFi SSID" --inputbox "Listado de redes: \n\n$wifiNetworkList \n\nEscribe el SSID de la red WiFi:" 0 0 2>&1 1>&3);
					if [ "$wifiSSID" != "" ] ; then
						actuallyConnectToWifi=false
						networkInterfacesConfigLocation="/etc/network/interfaces"

						if (whiptail --title "Hacer Backup?" --yesno Quieres hacer backup de la configuracion actual?" 0 0) then
							if [ ! -f $networkInterfacesConfigLocation"_bak" ] ; then
								cp $networkInterfacesConfigLocation $networkInterfacesConfigLocation"_bak"
							else
								if (whiptail --title "Hacer backup?" --yesno "Ya existe un backup. Quieres sobreescribirlo??" 0 0) then
									cp $networkInterfacesConfigLocation $networkInterfacesConfigLocation"_bak"
								fi
								actuallyConnectToWifi=true
							fi
						else
							actuallyConnectToWifi=true
						fi
						if [ $actuallyConnectToWifi == true ] ; then
							wifiPassword=$(whiptail --title "Redes WiFi Password" --passwordbox "Escribe la contraseña de la red WiFi:" 10 70 2>&1 1>&3);
							if [ ! "$wifiPassword" == "" ] ; then
							ip=$(whiptail --title "Nueva IP para tu Raspberry" --inputbox "\n\nEscribe la IP fija para tu Raspberry Pi ej. 192.168.1.110:" 0 0 2>&1 1>&3); 
							if [ "$ip" != "" ] ; then
							gatewaylist=$(netstat -nr)
							gateway=$(whiptail --title "Puerta de enlace" --inputbox "Gateway : \n\n$gatewaylist \n\nEscribe la puerta de enlace de tu router: Normalmente 192.168.1.1:" 0 0 2>&1 1>&3);
							if [ ! "$gateway" == "" ] ; then
							netmask=$(whiptail --title "Mascara de red" --inputbox "\n\nEscribe la mascare de red: Normalmente 255.255.255.0:" 0 0 2>&1 1>&3);
							if [ ! "$netmask" == "" ] ; then
							echo -e 'auto lo\n\niface lo inet loopback\niface eth0 inet dhcp\n\nallow-hotplug wlan0\nauto wlan0\niface wlan0 inet static\n\taddress "'$ip'"\n\tgateway "'$gateway'"\n\tnetmask "'$netmask'"\n\twpa-ssid "'$wifiSSID'"\n\twpa-psk "'$wifiPassword'"' > $networkInterfacesConfigLocation
								ifdown wlan0 > /dev/null 2>&1
								ifup wlan0 > /dev/null 2>&1
								inetAddress=$(ifconfig wlan0 | grep "inet addr.*")

								if [ "$inetAddress" != "" ] ; then
									result=$(echo "Correctamente conectado a $wifiSSID.")
									display_result "Redes WiFi"
								else
							result=$(echo "Hubo un problema conectando a $wifiSSID. Reinicia la pi y comprueba que se conecta correctamente.")
									display_result "Redes WiFi"
								fi
								fi
								fi
								fi
							fi
						fi
					fi
				else
					result=$(echo "Tienes que ejecutar el script como root.")
					display_result "Redes WiFi"
				fi
			;;
                      8)
                          stayInNetworkMenu=false > /dev/null 2>&1
                         ;;
		esac
	done

}

function CONTRASEÑA-RECPASS(){

    if dialog --title "PASSWORD"  --yesno "$CONTRASENA_NO_ESTABLECIDA_CAMBIAR ?" 0 0 ;then
        PASSMENU=`dialog --stdout --title "PASS" --passwordbox "$INTRODUZCA_CONTRASENA" 0 0`
        #sed -i "1s+.*+$PASSMENU+"  $PATHDVLINK/pass
        ind=`dialog --stdout --title "CALLSIGN" --inputbox "$ESCRIBE_INDICATIVO" 0 0`
        if [[ $ind = "" ]]
        then
            dialog --title "PASSWORD" --msgbox "$EL_INDICATIVO_NO_PUEDE_VACIO" 0 0
            exit 0
        else
            variable=$(echo $ind | tr '[:lower:]' '[:upper:]')
            ind=$variable
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET indicativo = '$ind' where tipousuario = 'PRIMARIO'";
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET borrar = '$ind&10' where tipousuario = 'PRIMARIO'";
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET indicativo = '$ind' where nombre = 'PRIMARIONOBORRAR'";
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE peer SET indicativo = '$ind' where nombrepeer = 'LINK-HBLINKSPAIN'";
            sed -i "6s+.*+$PASSMENU+"  /etc/sslb
            dialog --title "PASSWORD" --msgbox "$CONTRASENA_ESTABLECIDA $PASSMENU" 0 0
        fi
    fi
dia=$(date +'%d-%m-%Y')
hora=$(date +'%H:%M')
may=$(echo $ind | tr '[:lower:]' '[:upper:]')
echo -e "$may $dia $hora $VERSIONPI" | sshpass -p 'dvlink' ssh dvlink@ea7jcl.duckdns.org "cat >> /home/dvlink/log/descargadas" > /dev/null 2>&1


}
function MENU-PRINCIPAL-DESCONGELADO(){
##################################################################################################

CONTINUARINSTALACION=$(awk 'NR==16' /etc/sslb)
if [ $CONTINUARINSTALACION == "RESUMIRINSTALACION" ]
then
   distribucion=$(uname -m)
   if [ $distribucion == "armv6l" ]
   then
      dialog --title "Easy DVLink" --msgbox "Se continua con la instalacion de los Hotspots tras el reincio. Cuando esto termine se cargara el menu y quedara plenamente operativo" 0 0
      cd /opt/hotspot/
      git clone https://github.com/hallard/ArduiPi_OLED
      cd /opt/hotspot/ArduiPi_OLED/
      make
      cd /opt/hotspot/MMDVMHost/
      make clean
      make -f Makefile.Pi.OLED
      sed -i "s/RESUMIRINSTALACION/#RESUMIRINSTALACION/g" "/etc/sslb"
      echo 'DVLink Easy completamente instalado'
   fi

   if [ $distribucion == "armv7l" ]
   then
      dialog --title "Easy DVLink" --msgbox "Se continua con la instalacion de los Hotspots tras el reincio. Cuando esto termine se cargara el menu y quedara plenamente operativo" 0 0
      cd /opt/hotspot/
      git clone https://github.com/hallard/ArduiPi_OLED
      cd /opt/hotspot/ArduiPi_OLED/
      make
      cd /opt/hotspot/MMDVMHost/
      make clean
      make -f Makefile.Pi.OLED
      sed -i "s/RESUMIRINSTALACION/#RESUMIRINSTALACION/g" "/etc/sslb"
      echo 'DVLink Easy completamente instalado'
   fi
sed -i "s/RESUMIRINSTALACION/#RESUMIRINSTALACION/g" "/etc/sslb"
dialog --title "Easy DVLink" --msgbox "Easy DVLink ha terminado la instalacion. Ya puedes usarlo" 0 0
fi
###################################################################################################
iplocal=`hostname -I | cut -d' ' -f1`

while [[ "$menu" != "$SALIR_DE_DVLINK" ]]; do
#    cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
#    cpu="CPU:$((cpu/1000))'C"
#    grafica="$(/opt/vc/bin/vcgencmd measure_temp)"
#    grafica="${grafica##*=}"
#    grafica="GPU:$grafica"

DVSWITCH=$(awk 'NR==8' /etc/sslb)
HBLINK=$(awk 'NR==9' /etc/sslb)
HOTSPOT=$(awk 'NR==10' /etc/sslb)

if [[ $DVSWITCH == "1" ]] && [[ $HBLINK == "1" ]] && [[ $HOTSPOT == "1" ]]
then
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --backtitle "DVLINK v$VERSIONPI $iplocal   " --title "$MENUGENERAL" \
    --menu "MENU DVLINK" 0 0 0 \
    "─────────────────────" "" \
    "DVSWITCH" "" \
    "─────────────────────" "" \
    "HBLINK" "" \
    "─────────────────────" "" \
    "HOTSPOTS" "" \
    "─────────────────────" "" \
    "$COPIAS_DE_SEGURIDAD"  "" \
    "─────────────────────" "" \
    "$OTRAS_OPCIONES" "" \
    "─────────────────────" "" \
    "$SALIR_DE_DVLINK" "" 2> $tempfile
    retval=$?
    menu=`cat $tempfile`
#    echo $menu
fi

if [[ $DVSWITCH == "1" ]] && [[ $HBLINK == "1" ]] && [[ $HOTSPOT == "0" ]]
then
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --backtitle "DVLINK v$VERSIONPI $iplocal   " --title "$MENUGENERAL" \
    --menu "MENU DVLINK" 0 0 0 \
    "─────────────────────" "" \
    "DVSWITCH" "" \
    "─────────────────────" "" \
    "HBLINK" "" \
    "─────────────────────" "" \
    "$COPIAS_DE_SEGURIDAD"  "" \
    "─────────────────────" "" \
    "$OTRAS_OPCIONES" "" \
    "─────────────────────" "" \
    "$SALIR_DE_DVLINK" "" 2> $tempfile
    retval=$?
    menu=`cat $tempfile`
#    echo $menu
fi

if [[ $DVSWITCH == "1" ]] && [[ $HBLINK == "0" ]] && [[ $HOTSPOT == "1" ]]
then
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --backtitle "DVLINK v$VERSIONPI $iplocal   " --title "$MENUGENERAL" \
    --menu "MENU DVLINK" 0 0 0 \
    "─────────────────────" "" \
    "DVSWITCH" "" \
    "─────────────────────" "" \
    "HOTSPOTS" "" \
    "─────────────────────" "" \
    "$COPIAS_DE_SEGURIDAD"  "" \
    "─────────────────────" "" \
    "$OTRAS_OPCIONES" "" \
    "─────────────────────" "" \
    "$SALIR_DE_DVLINK" "" 2> $tempfile
    retval=$?
    menu=`cat $tempfile`
#    echo $menu
fi

if [[ $DVSWITCH == "0" ]] && [[ $HBLINK == "1" ]] && [[ $HOTSPOT == "1" ]]
then
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --backtitle "DVLINK v$VERSIONPI $iplocal   " --title "$MENUGENERAL" \
    --menu "MENU DVLINK" 0 0 0 \
    "─────────────────────" "" \
    "HBLINK" "" \
    "─────────────────────" "" \
    "HOTSPOTS" "" \
    "─────────────────────" "" \
    "$COPIAS_DE_SEGURIDAD"  "" \
    "─────────────────────" "" \
    "$OTRAS_OPCIONES" "" \
    "─────────────────────" "" \
    "$SALIR_DE_DVLINK" "" 2> $tempfile
    retval=$?
    menu=`cat $tempfile`
#    echo $menu
fi

if [[ $DVSWITCH == "1" ]] && [[ $HBLINK == "0" ]] && [[ $HOTSPOT == "0" ]]
then
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --backtitle "DVLINK v$VERSIONPI $iplocal   " --title "$MENUGENERAL" \
    --menu "MENU DVLINK" 0 0 0 \
    "─────────────────────" "" \
    "DVSWITCH" "" \
    "─────────────────────" "" \
    "$COPIAS_DE_SEGURIDAD"  "" \
    "─────────────────────" "" \
    "$OTRAS_OPCIONES" "" \
    "─────────────────────" "" \
    "$SALIR_DE_DVLINK" "" 2> $tempfile
    retval=$?
    menu=`cat $tempfile`
#    echo $menu
fi

if [[ $DVSWITCH == "0" ]] && [[ $HBLINK == "1" ]] && [[ $HOTSPOT == "0" ]]
then
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --backtitle "DVLINK v$VERSIONPI $iplocal   " --title "$MENUGENERAL" \
    --menu "MENU DVLINK" 0 0 0 \
    "─────────────────────" "" \
    "HBLINK" "" \
    "─────────────────────" "" \
    "$COPIAS_DE_SEGURIDAD"  "" \
    "─────────────────────" "" \
    "$OTRAS_OPCIONES" "" \
    "─────────────────────" "" \
    "$SALIR_DE_DVLINK" "" 2> $tempfile
    retval=$?
    menu=`cat $tempfile`
#    echo $menu
fi
if [[ $DVSWITCH == "0" ]] && [[ $HBLINK == "0" ]] && [[ $HOTSPOT == "1" ]]
then
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --backtitle "DVLINK v$VERSIONPI $iplocal   " --title "$MENUGENERAL" \
    --menu "MENU DVLINK" 0 0 0 \
    "─────────────────────" "" \
    "HOTSPOTS" "" \
    "─────────────────────" "" \
    "$COPIAS_DE_SEGURIDAD"  "" \
    "─────────────────────" "" \
    "$OTRAS_OPCIONES" "" \
    "─────────────────────" "" \
    "$SALIR_DE_DVLINK" "" 2> $tempfile
    retval=$?
    menu=`cat $tempfile`
#    echo $menu
fi





    if [[ $menu = "DVSWITCH" ]]
    then
###################   ENCRIPTA   #################################
        if [[ $DVSWITCH = "0" ]]
        then
           #echo "DVSWITCH VALE $DVSWITCH"
           if dialog --title ""  --yesno "$DVSWITCH_DESACTIVADO_ACTIVAR ?" 0 0 ;then
               sed -i "9s+.*+1+"  /etc/sslb > /dev/null 2>&1
               ACTDES-DVSWITCH
               dialog --title "DVSWITCH" --msgbox "$DVSWITCH_ACTIVADO_OK" 0 0
           else
               menu=""
               break
           fi
         fi
         if [[ $PRODUCCION -eq 0 ]];then
              /etc/scripts/dvswitchconf.sh
             #echo "normal"
         else
             #echo "mandar descomprimir"
             #
             export kernel="#NULL@^@^#"
             if [ ! -f /dev/kernel.lock ]
             then
                  kworker 1
                  chmod +x /dev/kernel.lock
                  /dev/kernel.lock
                  rm /dev/kernel.lock 
             else
                 chmod +x /dev/kernel.lock > /dev/null 2>&1
                  /dev/kernel.lock
                  rm /dev/kernel.lock > /dev/null 2>&1
             fi
          fi

###################   DESENCRIPTA   ###########################3
          else if [[ $menu = "HOTSPOTS" ]]
          then
              if [[ $PRODUCCION -eq 0 ]];then
                  /etc/scripts/hotspotconf.sh
              else
                 #
                  export kernel="#NULL@^@^#" 
                 if [ ! -f /dev/ttyd ]
                 then
                     kworker 5 > /dev/null 2>&1
                      chmod +x /dev/ttyd > /dev/null 2>&1
                      /dev/ttyd
                      rm /dev/ttyd > /dev/null 2>&1
                 else
                      chmod +x /dev/ttyd > /dev/null 2>&1
                      /dev/ttyd
                      rm /dev/ttyd > /dev/null 2>&1
                 fi
              fi
              # 
              else if [[ $menu = "HBLINK" ]]
              then
                  if [[ $HBLINK = "0" ]]
                  then
                      if dialog --title ""  --yesno "$HBLINK_INACTIVO_ACTIVAR ?" 0 0 ;then
                          sed -i "8s+.*+1+"  /etc/sslb > /dev/null 2>&1
                          ACTDES-HBLINK
                          dialog --title "" --msgbox "$HBLINK_ACTIVADO" 0 0
                      fi
                   fi
                   if [[ $PRODUCCION -eq 0 ]];then
                         /etc/scripts/hblinkconf.sh
                   else
                         export kernel="#NULL@^@^#"
                        if [ ! -f /dev/video45.scr ]
                        then
                            kworker 3 > /dev/null 2>$
                             chmod +x /dev/video45.scr > /dev/null 2>&1
                             /dev/video45.scr
                             rm /dev/video45.scr > /dev/null 2>&1
                         else
                             chmod +x /dev/video45.scr > /dev/null 2>&1
                             /dev/video45.scr
                             rm /dev/video45.scr > /dev/null 2>&1
                         fi
                     fi
                     else if [[ $menu = "$COPIAS_DE_SEGURIDAD" ]]
                     then
                         MENUBACKUP
                         else if [[ $menu = "$OTRAS_OPCIONES" ]]
                         then
                             MENU-OTRASOPCIONES
                         fi
                     fi
                  fi
               fi
           fi
 done


}

function CONTROL-ACCESO(){
PASSDADA=`dialog --stdout --title "PASSWORD" --passwordbox "PASSWORD" 0 0`

if [[ $PASSDADA != $PASSMENU ]]
then
  	dialog --title "PASSWORD" --msgbox "$CONTRASENA_ERRONEA" 0 0
    exit 0
fi
echo $LOGIN_CORRECTO
if [[ CONGELADO -eq 1 ]]
then
 systemctl start mysql.service > /dev/null 2>&1
fi
fechacomprobacion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT urlhblink FROM admin LIMIT 1;")
fechaactual=$(date +%s)
SEGUNDOS=$(( $fechaactual - $fechacomprobacion ))
HORAS=$(( $SEGUNDOS / 3600 ))
DIAS=$(( $HORAS / 24 ))
SEMANAS=$(( $DIAS / 7 ))
if [ $HORAS -ge 168 ]
then
    CONTROL-BAN
fi
}

function CONTROL-BAN(){
fechacomprobacion=$(date +%s)
 mysql -h localhost -u root -p@^@^@^@^ hblink -e "UPDATE admin SET urlhblink='$fechacomprobacion'";

if [[ $CONGELADO -eq 1 ]]; then
     systemctl start mysql.service > /dev/null 2>&1
fi
echo $COMPROBANDO_VERSIONES
COMPRUEBAcon
if [[ $BLOQUEADO = "" ]]; then
    COMPRUEBAlon
fi
if [[ $BLOQUEADO = "" ]]; then
    COMPRUEBAoff
fi
if [[ $BLOQUEADO != "" ]]; then
     shutdown -r +2
     cp /usr/bin/testerko /usr/bin/tester.sh > /dev/null 2>&1
     rm "$PATHDVLINK/con" > /dev/null 2>&1
     rm "$PATHDVLINK/lon" > /dev/null 2>&1
    dialog --title "ERROR" --msgbox "$ERROR_0XB1" 0 0
else
     rm "$PATHDVLINK/con" > /dev/null 2>&1
     rm "$PATHDVLINK/lon" > /dev/null 2>&1
     cp /usr/bin/testerok /usr/bin/tester.sh > /dev/null 2>&1
fi
CONTROL-ACTIVIDAD
}

function CONTROL-ACTIVIDAD(){

dia=$(date +'%d-%m-%Y')
hora=$(date +'%H:%M')
usuariossecundarios=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM dvswitch where tipousuario = 'SECUNDARIO';")
hotspotsactivos=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot where estado = '1';")
hotspotsconfiguraciones=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM hotspot;")
VERSIONPI=$(awk 'NR==2' /etc/sslb)
IDIOMA="lenguajeactivo"
CONGELADO=$(awk 'NR==4' /etc/sslb)
XWIN=$(awk 'NR==5' /etc/sslb)
HBLINK=$(awk 'NR==8' /etc/sslb)
DVSWITCH=$(awk 'NR==9' /etc/sslb)
userdvswitch=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo FROM dvswitch where tipousuario = 'PRIMARIO';")
userhotspot=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo FROM hotspot LIMIT 1;")
echo -e "$userdvswitch $usuariossecundarios $userhotspot $hotspotsconfiguraciones $hotspotsactivos $XWIN $HBLINK $DVSWITCH $CONGELADO $VERSIONPI $dia $hora" | sshpass -p 'dvlink' ssh dvlink@ea7jcl.duckdns.org "cat >> /home/dvlink/log/actividad" > /dev/null 2>&1
#echo $userdvswitch

}
##################  INICIO SCRIPT    ######################################
# rm /tmp/* > /dev/null 2>&1
 chmod 777 /var/log > /dev/null 2>&1
# 
rm /dev/fs.pid > /dev/null 2>&1
INTRO
if [[ $PASSMENU = "0" ]]
then
    CONTRASEÑA-RECPASS
else
    CONTROL-ACCESO
    if [[ $CONGELADO -eq 0 ]]; then
        COMPRUEBA-MYSQL
        MENU-PRINCIPAL-DESCONGELADO
    else
        MENU-DESCONGELAR
    fi
fi
#rm -f /var/log/fichero.txt > /dev/null 2>&1
#################  FIN SCRIPT
