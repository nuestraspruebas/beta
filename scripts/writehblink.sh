#!/bin/bash
export NCURSES_NO_UTF8_ACS=1
PATHhbwrite="/var/log/generador/hblink.cfg"
PATHRULES="/var/log/generador/rules.py"
source /usr/bin/activo
#####################################################

###########  INICIO CONFIGURACION MINIMA  ###########

function GENERARCONFIGURACIONMINIMA (){

# rm $PATHhbwrite
echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHhbwrite
echo "[GLOBAL]" >> $PATHhbwrite
echo "PATH: ./" >> $PATHhbwrite
echo "PING_TIME: 5" >> $PATHhbwrite
echo "MAX_MISSED: 3" >> $PATHhbwrite
echo "USE_ACL: True" >> $PATHhbwrite
echo "REG_ACL: PERMIT:ALL" >> $PATHhbwrite
echo "SUB_ACL: DENY:1" >> $PATHhbwrite
echo "TGID_TS1_ACL: PERMIT:ALL" >> $PATHhbwrite
echo "TGID_TS2_ACL: PERMIT:ALL" >> $PATHhbwrite
echo "" >> $PATHhbwrite
echo "[REPORTS]" >> $PATHhbwrite
echo "REPORT: True" >> $PATHhbwrite
echo "REPORT_INTERVAL: 10" >> $PATHhbwrite
echo "REPORT_PORT: 4321" >> $PATHhbwrite
echo "REPORT_CLIENTS: 127.0.0.1" >> $PATHhbwrite
echo "" >>$PATHhbwrite
echo "[LOGGER]" >> $PATHhbwrite
echo "LOG_FILE: /var/log/hblink.log" >> $PATHhbwrite
echo "LOG_HANDLERS: file-timed" >> $PATHhbwrite
echo "LOG_LEVEL: DEBUG" >> $PATHhbwrite
echo "LOG_NAME: HBlink" >> $PATHhbwrite
echo "" >> $PATHhbwrite
echo "[ALIASES]" >> $PATHhbwrite
echo "TRY_DOWNLOAD: True" >> $PATHhbwrite
echo "PATH: ./" >> $PATHhbwrite
echo "PEER_FILE: peer_ids.js" >> $PATHhbwrite
echo "SUBSCRIBER_FILE: subscriber_ids.json" >> $PATHhbwrite
echo "TGID_FILE: talkgroup_ids.json" >> $PATHhbwrite
echo "PEER_URL: https://www.radioid.net/static/rptrs.json" >> $PATHhbwrite
echo "SUBSCRIBER_URL: https://www.radioid.net/static/users.json" >> $PATHhbwrite
echo "STALE_DAYS: 7" >> $PATHhbwrite
echo "" >> $PATHhbwrite

}


###########  FIN  CONFIGURACION MINIMA    #########

###########################################################

##########  INICIO WRITE MASTER  ################3

function WRITEMASTER(){
echo "$GENERANDO_MASTER $nombremaster"
echo "" >> $PATHhbwrite
echo "[$nombremaster]" >> $PATHhbwrite
echo "MODE: MASTER" >> $PATHhbwrite
echo "ENABLED: True" >> $PATHhbwrite
echo "REPEAT: True" >> $PATHhbwrite
echo "MAX_PEERS: $numeropeers" >> $PATHhbwrite
echo "EXPORT_AMBE: False" >> $PATHhbwrite
echo "IP:" >> $PATHhbwrite
echo "PORT: $puertolocal" >> $PATHhbwrite
echo "PASSPHRASE: $password" >> $PATHhbwrite
echo "GROUP_HANGTIME: 5" >> $PATHhbwrite
echo "USE_ACL: True" >> $PATHhbwrite
echo "REG_ACL: DENY:1" >> $PATHhbwrite
echo "SUB_ACL: DENY:1" >> $PATHhbwrite
echo "TGID_TS1_ACL: PERMIT:ALL" >> $PATHhbwrite
echo "TGID_TS2_ACL: PERMIT:ALL" >> $PATHhbwrite
echo "" >> $PATHhbwrite
}

########  FIN WRITE MASTER #########################

###################################################

#########   INICIO WRITE PEER #####################


function WRITEPEER(){
echo "$GENERANDO_PEER $nombrepeer"
echo "" >> $PATHhbwrite
echo "[$nombrepeer]" >> $PATHhbwrite
echo "MODE: PEER" >> $PATHhbwrite
echo "ENABLED: True" >> $PATHhbwrite
echo "LOOSE: True" >> $PATHhbwrite
echo "EXPORT_AMBE: False" >> $PATHhbwrite
echo "IP:" >> $PATHhbwrite
echo "PORT: $puerto" >> $PATHhbwrite
echo "MASTER_IP: $ipremota" >> $PATHhbwrite
echo "MASTER_PORT: $puertoremoto" >> $PATHhbwrite
echo "PASSPHRASE: $password" >> $PATHhbwrite
echo "RADIO_ID: $radioid" >> $PATHhbwrite
echo "Callsign: $indicativo" >> $PATHhbwrite
echo "RX_FREQ: 449000000" >> $PATHhbwrite
echo "TX_FREQ: 444000000" >> $PATHhbwrite
echo "TX_POWER: 25" >> $PATHhbwrite
echo "COLORCODE: 1" >> $PATHhbwrite
echo "SLOTS: 1" >> $PATHhbwrite
echo "LATITUDE: 38.0000" >> $PATHhbwrite
echo "LONGITUDE: -095.0000" >> $PATHhbwrite
echo "HEIGHT: 75" >> $PATHhbwrite
echo "LOCATION: Anywhere" >> $PATHhbwrite
echo "DESCRIPTION: This is a cool repeater" >> $PATHhbwrite
echo "URL: www.w1abc.org" >> $PATHhbwrite
echo "SOFTWARE_ID: 20191115" >> $PATHhbwrite
echo "PACKAGE_ID: MMDVM_HBlink" >> $PATHhbwrite
echo "GROUP_HANGTIME: 5" >> $PATHhbwrite

if [[ $options = "" ]]
then
   echo "OPTIONS:" >> $PATHhbwrite
else
   echo "OPTIONS:StartRef=$options;RelinkTime=30;Userlink=1" >> $PATHhbwrite
fi

echo "USE_ACL: True" >> $PATHhbwrite
echo "SUB_ACL: DENY:1" >> $PATHhbwrite
echo "TGID_TS1_ACL: PERMIT:ALL" >> $PATHhbwrite
echo "TGID_TS2_ACL: PERMIT:ALL" >> $PATHhbwrite

}
###################################################

#########   FIN WRITE PEER #####################


function WRITEXLXPEER(){
echo "$GENERANDO_XLXPEER $nombrepeer"
echo "" >> $PATHhbwrite
echo "[$nombrepeer]" >> $PATHhbwrite
echo "MODE: XLXPEER" >> $PATHhbwrite
echo "ENABLED: True" >> $PATHhbwrite
echo "LOOSE: True" >> $PATHhbwrite
echo "EXPORT_AMBE: False" >> $PATHhbwrite
echo "IP: " >> $PATHhbwrite
echo "PORT: $puerto" >> $PATHhbwrite
echo "MASTER_IP: $ipremota" >> $PATHhbwrite
echo "MASTER_PORT: $puertoremoto" >> $PATHhbwrite
echo "PASSPHRASE: $password" >> $PATHhbwrite
echo "CALLSIGN: $indicativo" >> $PATHhbwrite
echo "RADIO_ID: $radioid" >> $PATHhbwrite
echo "RX_FREQ: 449000000" >> $PATHhbwrite
echo "TX_FREQ: 444000000" >> $PATHhbwrite
echo "TX_POWER: 25" >> $PATHhbwrite
echo "COLORCODE: 1" >> $PATHhbwrite
echo "SLOTS: 1" >> $PATHhbwrite
echo "LATITUDE: 38.0000" >> $PATHhbwrite
echo "LONGITUDE: -095.0000" >> $PATHhbwrite
echo "HEIGHT: 75" >> $PATHhbwrite
echo "LOCATION: Anywhere" >> $PATHhbwrite
echo "DESCRIPTION: This is a cool repeater" >> $PATHhbwrite
echo "URL: www.w1abc.org" >> $PATHhbwrite
echo "SOFTWARE_ID: 20191115" >> $PATHhbwrite
echo "PACKAGE_ID: MMDVM" >> $PATHhbwrite
echo "GROUP_HANGTIME: 5" >> $PATHhbwrite

#if [[ $options = "" ]]
#then
   echo "OPTIONS:" >> $PATHhbwrite
#else
#   echo "OPTIONS:StartRef=$options;RelinkTime=30;Userlink=1" >> $PATHhbwrite
#fi
echo "XLXMODULE:$options" >> $PATHhbwrite
echo "USE_ACL: True" >> $PATHhbwrite
echo "SUB_ACL: DENY:1" >> $PATHhbwrite
echo "TGID_TS1_ACL: PERMIT:ALL" >> $PATHhbwrite
echo "TGID_TS2_ACL: PERMIT:ALL" >> $PATHhbwrite

}
###################################################

#########   INICIO OPENBRIDGE #####################


function WRITEOPENBRIDGE(){
echo "$GENERANDO_OPENBRIDGE $nombrepeer"
echo "" >> $PATHhbwrite
echo "[$nombrepeer]" >> $PATHhbwrite
echo "MODE: OPENBRIDGE" >> $PATHhbwrite
echo "ENABLED: True" >> $PATHhbwrite
echo "IP:" >> $PATHhbwrite
echo "PORT: $puertolocal" >> $PATHhbwrite
echo "NETWORK_ID: $radioid" >> $PATHhbwrite
echo "PASSPHRASE: $password" >> $PATHhbwrite
echo "TARGET_IP: $ipremota" >> $PATHhbwrite
echo "TARGET_PORT: $puertoremoto" >> $PATHhbwrite
echo "USE_ACL: True" >> $PATHhbwrite
echo "SUB_ACL: DENY:1" >> $PATHhbwrite
echo "TGID_ACL: PERMIT:ALL" >> $PATHhbwrite

}
#########   FIN OPENBRIDGE #####################

###################################################


#########   INICIO REGLAS    #####################


function REGLABASE(){

echo "#           Configuracion by EA7JCL & BLASMAKERS &  EA5GVK.ES)" > $PATHRULES
echo "BRIDGES = {" >> $PATHRULES

}

function WRITERULE(){

consulta=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DISTINCT tgidmaster FROM rules WHERE off <> '$tgidmaster';")
echo "$GENERANDO_REGLA $nombreregla"
array=($(for k in $consulta;do echo $k;done))
c=""
for k in ${array[@]}
do
    c=$c"$k,"
done
RESULTADO=$(expr "$c" : '\(.*\).')

if [[ $activo = "True" ]]
then
   type="NONE"
else
   type="ON"
fi
#echo " ]," >> $PATHRULES
echo " '$nombreregla': [" >> $PATHRULES
echo "     {'SYSTEM': '$nombremaster',    'TS': $tsmaster, 'TGID': $tgidmaster,    'ACTIVE': $activo, 'TIMEOUT': $timeout, 'TO_TYPE': '$type',  'ON': [$tgidmaster], 'OFF': [$RESULTADO], 'RESET': [$tgidmaster]}," >> $PATHRULES
echo "     {'SYSTEM': '$nombrepeer',    'TS': $tspeer, 'TGID': $tgidpeer, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," >> $PATHRULES

}

function FINREGLA(){

echo " ]" >> $PATHRULES
echo "}" >> $PATHRULES
echo "" >> $PATHRULES

coma="'"

echo $coma$coma$coma >> $PATHRULES
echo "list the names of each system that should bridge unit to unit (individual) calls." >> $PATHRULES
echo $coma$coma$coma >> $PATHRULES




###
nombremaster=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombremaster from master where id = '1';")
UNIT=$coma$nombremaster$coma

REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM master;")
for (( i=2; i<=$REGISTROS; i++ ));
do
  UNIT=$UNIT","
  nombremaster=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombremaster from master where id = '$i';")
  UNIT=$UNIT$coma$nombremaster$coma
done


###

###
REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM openbridge;")
for (( i=1; i<=$REGISTROS; i++ ));
do
  UNIT=$UNIT","
  nombrepeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombreopenbridge from openbridge where id = '$i';")
  UNIT=$UNIT$coma$nombrepeer$coma 
done

###



echo "UNIT = [$UNIT]" >> $PATHRULES
echo "" >> $PATHRULES

echo $coma$coma$coma >> $PATHRULES
echo "This is for testing the syntax of the file. It won't eliminate all errors, but running this file" >> $PATHRULES
echo "like it were a Python program itself will tell you if the syntax is correct!" >> $PATHRULES
echo $coma$coma$coma >> $PATHRULES
echo "" >> $PATHRULES


echo "if __name__ == '__main__':" >> $PATHRULES
echo "    from pprint import pprint" >> $PATHRULES
echo "    pprint(BRIDGES)" >> $PATHRULES
}

##########   FIN   REGLAS      #####################

function SQLPEER(){

REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM peer;")
for (( i=1; i<=$REGISTROS; i++ ));
do
  nombrepeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from peer where id = '$i';")
  puerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puerto from peer where id = '$i';")
  ipremota=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipremota from peer where id = '$i';")
  puertoremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoremoto from peer where id = '$i';")
  password=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from peer where id = '$i';")
  options=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT options from peer where id = '$i';") 
  indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from peer where id = '$i';")
  radioid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  radioid from peer where id = '$i';")
  WRITEPEER

done

}

function SQLXLXPEER(){

REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM xlxpeer;")
for (( i=1; i<=$REGISTROS; i++ ));
do
  nombrepeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from xlxpeer where id = '$i';")
  puerto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertolocal from xlxpeer where id = '$i';")
  ipremota=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipremota from xlxpeer where id = '$i';")

  puertoremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoremoto from xlxpeer where id = '$i';")
  password=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from xlxpeer where id = '$i';")
  options=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT modulo from xlxpeer where id = '$i';")
  indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from xlxpeer where id = '$i';")
  radioid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  radioid from xlxpeer where id = '$i';")
  WRITEXLXPEER

done

}

function SQLOPENBRIDGE(){

REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM openbridge;")
for (( i=1; i<=$REGISTROS; i++ ));
do
  nombrepeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombreopenbridge from openbridge where id = '$i';")
  ipremota=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipremota from openbridge where id = '$i';")
  puertoremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoremoto from openbridge where id = '$i';")
  password=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from openbridge where id = '$i';")
  puertolocal=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertolocal from openbridge where id = '$i';")
  radioid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  radioid from openbridge where id = '$i';")
  WRITEOPENBRIDGE

done

}

function SQLMASTER(){

REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM master;")
for (( i=1; i<=$REGISTROS; i++ ));
do
  nombremaster=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombremaster from master where id = '$i';")
  password=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from master where id = '$i';")
  puertolocal=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertolocal from master where id = '$i';")
  numeropeers=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  numeropeers from master where id = '$i';")
  WRITEMASTER

done

}

function SQLRULES(){

REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM rules;")
#echo " [" >> $PATHRULES

for (( i=1; i<=$REGISTROS; i++ ));
do
  if [[ $i -lt  $REGISTROS ]]
  then

     nombreregla=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombreregla from rules where id = '$i';")
     nombremaster=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombremaster from rules where id = '$i';")
     tsmaster=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tsmaster from rules where id = '$i';")
     tgidmaster=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgidmaster from rules where id = '$i';")
     activo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT activo from rules where id = '$i';")
     timeout=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT timeout from rules where id = '$i';")
     nombrepeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from rules where id = '$i';")
     tspeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  tspeer from rules where id = '$i';")
     tgidpeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgidpeer from rules where id = '$i';")
     off=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT off from rules where id = '$i';")
     consulta=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DISTINCT tgidmaster FROM rules WHERE off <> '$tgidmaster';")


     array=($(for k in $consulta;do echo $k;done))
     echo "$GENERANDO_REGLA $nombreregla"
     c=""
     for k in ${array[@]}
     do
       c=$c"$k,"
     done
     RESULTADO=$(expr "$c" : '\(.*\).')
     if [[ $activo = "True" ]]
     then
        type="NONE"
     else
        type="ON"
     fi

     echo " '$nombreregla': [" >> $PATHRULES
     echo "     {'SYSTEM': '$nombremaster',    'TS': $tsmaster, 'TGID': $tgidmaster,    'ACTIVE': $activo, 'TIMEOUT': $timeout, 'TO_TYPE': '$type',  'ON': [$tgidmaster], 'OFF': [$RESULTADO], 'RESET': [$tgidmaster]}," >> $PATHRULES

     echo "     {'SYSTEM': '$nombrepeer',    'TS': $tspeer, 'TGID': $tgidpeer, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," >> $PATHRULES
     echo "]," >> $PATHRULES 

  else

     nombreregla=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombreregla from rules where id = '$i';")
     nombremaster=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombremaster from rules where id = '$i';")
     tsmaster=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tsmaster from rules where id = '$i';")
     tgidmaster=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgidmaster from rules where id = '$i';")
     activo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT activo from rules where id = '$i';")
     timeout=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT timeout from rules where id = '$i';")
     nombrepeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from rules where id = '$i';")
     tspeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  tspeer from rules where id = '$i';")
     tgidpeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgidpeer from rules where id = '$i';")
     off=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT off from rules where id = '$i';")
     consulta=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT DISTINCT tgidmaster FROM rules WHERE off <> '$tgidmaster';")

     WRITERULE

   fi
done

}

function REGENERA-INDICES(){
  
mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE master DROP id");
mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE master AUTO_INCREMENT = 1");
mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE master ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST");

mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE peer DROP id");
mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE peer AUTO_INCREMENT = 1");
mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE peer ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST");

mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE xlxpeer  DROP id");
mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE xlxpeer AUTO_INCREMENT = 1");
mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE xlxpeer ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST");

mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE rules DROP id");
mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE rules AUTO_INCREMENT = 1");
mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE rules ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST");

mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE openbridge DROP id");
mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE openbridge AUTO_INCREMENT = 1");
mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE openbridge ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST");

}
#########   INICIO SCRIPT #####################
#REGENERAR INDICE
#mysql_query("ALTER TABLE tablename DROP id");
#mysql_query("ALTER TABLE tablename AUTO_INCREMENT = 1");
#mysql_query("ALTER TABLE tablename ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST");
######## regenerar indice



 rm /var/log/generador/* > /dev/null 2>&1
REGENERA-INDICES
GENERARCONFIGURACIONMINIMA
SQLMASTER
SQLPEER
SQLXLXPEER
SQLOPENBRIDGE

REGLABASE
SQLRULES
FINREGLA

 cp /var/log/generador/hblink.cfg /opt/hblink3/hblink.cfg > /dev/null 2>&1
 cp /var/log/generador/rules.py /opt/hblink3/rules.py > /dev/null 2>&1
 systemctl restart hblink3.service 
for i in $(seq 0 30 100) ; do sleep 1; echo $i | dialog --no-lines --gauge "$INICIANDO_HBLINK" 10 70 0; done
 #systemctl restart hbmonitor.service
for i in $(seq 0 30 100) ; do sleep 1; echo $i | dialog --no-lines --gauge "$INICIANDO_DASHBOARD" 10 70 0; done



