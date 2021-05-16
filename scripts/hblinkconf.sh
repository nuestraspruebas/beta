#!/bin/bash
export NCURSES_NO_UTF8_ACS=1
USER=$(awk 'NR==1' /etc/sslb)
VERSIONPI=$(awk 'NR==2' /etc/sslb)
IDIOMA=$(awk 'NR==3' /etc/sslb)
PRODUCCION=$(awk 'NR==7' /etc/sslb)
HBLINK=$(awk 'NR==8' /etc/sslb)
export NCURSES_NO_UTF8_ACS=1
#cp /root/traduccion/idiomas.sh /dev/idiomas.sh
#cp /root/traduccion/mensajeordenadosok /dev/mensajeordenadosok
source /usr/bin/activo

#<<COMMENT
PATHHB="/opt/hblink3/hblink.cfg"
PATHRULES="/opt/hblink3/rules.py"
PATHCONFIG="/etc/scripts/config"
PATHFICHERO="/var/log/fichero.txt"
#COMMENT

#function IDIOMA(){
#SELECCIONIDIOMA=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT idioma from admin;")
#if [[ $SELECCIONIDIOMA = "" ]]
#then
#   source "Spanish"
#else
#   source $SELECCIONIDIOMA
#fi
#}

#******************************************************************************$
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

function EDITAMASTER (){

dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombremaster from master;")
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" --menu "$SELECCIONA_MASTER_EDITAR" 0 0 0   $c 2> $tempfile
retval=$?
MASTER=`cat $tempfile`

nombremaster=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombremaster from master where nombremaster = '$MASTER';")
PUERTOLOCAL=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertolocal from master where nombremaster = '$MASTER';")
password=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from master where nombremaster = '$MASTER';")
numeropeers=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT numeropeers from master where nombremaster = '$MASTER';")

menuconfigura=""
while [ "$menuconfigura" != "$VOLVER" ]; do
   DIALOG=${DIALOG=dialog}
   tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
   trap "rm -f $tempfile" 0 1 2 5 15
   $DIALOG --clear --title "Master" \
   --menu "" 0 0 0 \
     "$NOMBRE_MASTER"  "$nombremaster" \
     "$PUERTO_LOCAL" "$PUERTOLOCAL" \
     "PASSWORD" "$password" \
     "$NUMERO_DE_PEERS" "$numeropeers" \
     "───────────────────────────────" "" \
     "$VOLVER" "" 2> $tempfile
retval=$?
menuconfigura=`cat $tempfile`

if [[ $menuconfigura != "$VOLVER" ]]
then
    nuevodato=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
fi

if [[ $menuconfigura = "$NOMBRE_MASTER" ]]
then
    entrada=$nuevodato
    COMPRUEBA
    while [ $VALIDO -eq 1 ]; do
       nuevodato=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR_NO_ESPECIALES" 0 0`
       entrada=$nuevodato
       COMPRUEBA
    done

     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE master SET nombremaster = '$nuevodato' where nombremaster = '$nombremaster'";
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE rules SET nombremaster = '$nuevodato' where nombremaster = '$nombremaster'";
    nombremaster=$nuevodato
    else if [[ $menuconfigura = "$PUERTO_LOCAL" ]]
    then
        COMPRUEBAPUERTOS
        while [ $ENUSO -eq 1 ]; do
            dialog --title "$SALIR" --msgbox "$PUERTO_LOCAL" 0 0
            nuevodato=`dialog --stdout --title "$MODOEDICION" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
            PUERTOLOCAL=$nuevodato
            COMPRUEBAPUERTOS
        done
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE master SET puertolocal = '$nuevodato' where nombremaster = '$nombremaster'";
        else if [[ $menuconfigura = "PASSWORD" ]]
        then
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE master SET password = '$nuevodato' where nombremaster = '$nombremaster'";
            password=$nuevodato
            else if [[ $menuconfigura = "$NUMERO_DE_PEERS" ]]
            then
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE master SET numeropeers = '$nuevodato' where nombremaster = '$nombremaster'";
                numeropeers=$nuevodato
           fi
        fi
    fi
fi
done

}


function COMPRUEBAPUERTOS(){
ENUSO=1
ENUSO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT EXISTS(SELECT puertolocal from master where puertolocal = '$PUERTOLOCAL');")
if [[ $ENUSO -eq 0 ]]
then
   ENUSO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT EXISTS(SELECT puerto from peer where puerto = '$PUERTOLOCAL');")
fi
if [[ $ENUSO -eq 0 ]]
   then
      ENUSO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT EXISTS(SELECT puertolocal from xlxpeer where puertolocal = '$PUERTOLOCAL');")
fi
if [[ $ENUSO -eq 0 ]]
      then
	 ENUSO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT EXISTS(SELECT puertolocal from openbridge where puertolocal = '$PUERTOLOCAL');")
fi
}

############ CREAR MASTER  ##############3

function CREAMASTER (){
NOMBREMASTER=`dialog --stdout --title "" --inputbox "$ESCRIBE_NOMBRE_MASTER" 0 0`
entrada=$NOMBREMASTER
COMPRUEBA
while [ $VALIDO -eq 1 ]; do
     NOMBREMASTER=`dialog --stdout --title "" --inputbox "$NOMBRE_MASTER" 0 0`
     entrada=$NOMBREMASTER
     COMPRUEBA
done

PUERTOLOCAL=`dialog --stdout --title "" --inputbox "$PUERTO_LOCAL_MASTER" 0 0`
COMPRUEBAPUERTOS
while [ $ENUSO -eq 1 ]; do
      dialog --title "$SALIR" --msgbox "$PUERTO_LOCAL" 0 0
      PUERTOLOCAL=`dialog --stdout --title "" --inputbox "$PUERTO_LOCAL_MASTER" 0 0` 
      COMPRUEBAPUERTOS
done

CONTRASENAMASTER=`dialog --stdout --title "" --inputbox "$ESCRIBE_CONTRASENA_MASTER" 0 0`
PEERMASTER=`dialog --stdout --title "" --inputbox "$CUANTOS_PEER_CON_MASTER" 0 0`
# LLAMADAPRIVADA=`dialog --stdout --title "" --inputbox "$Activate private calls? 1 = yes  0 = no" 0 0`
 rm $PATHFICHERO
 echo "$SE_GENERA_NUEVO_MASTER" > $PATHFICHERO
 echo "" >> $PATHFICHERO
 echo $NOMBRE_MASTER $NOMBREMASTER >> $PATHFICHERO
 echo $PUERTO $PUERTOLOCAL >> $PATHFICHERO
 echo $CONTRASENA $CONTRASENAMASTER >> $PATHFICHERO
 echo "Nº PEERs       : " $PEERMASTER >> $PATHFICHERO
 echo "" >> $PATHFICHERO
 echo "$SE_PEDIRA_CONFIRMACION" >> $PATHFICHERO
 dialog --title "" --textbox $PATHFICHERO 0 0
if dialog --title ""  --yesno "$GRABAR_MASTER" 0 0 ;then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "INSERT INTO master (tipo,nombremaster,puertolocal,password,numeropeers) values ('SECUNDARIO','$NOMBREMASTER','$PUERTOLOCAL','$CONTRASENAMASTER','$PEERMASTER');"
else
   dialog --title "$SALIR" --msgbox "$NO_GUARDADO" 0 0
fi

}
############ FIN CREAR MASTER  ##############3


############  CREA PEER     ##################

function CREAPEER (){
NOMBREPEER=`dialog --stdout --title "" --inputbox "$NOMBRE_PEER" 0 0`
entrada=$NOMBREPEER
COMPRUEBA
while [ $VALIDO -eq 1 ]; do
    NOMBREPEER=`dialog --stdout --title "" --inputbox "NOMBRE_PEER" 0 0`
    entrada=$NOMBREPEER
    COMPRUEBA
done


PUERTOLOCAL=`dialog --stdout --title "" --inputbox "$PUERTO_PEER" 0 0`
COMPRUEBAPUERTOS
while [ $ENUSO -eq 1 ]; do
     dialog --title "$SALIR" --msgbox "$PUERTO_LOCAL" 0 0
     PUERTOLOCAL=`dialog --stdout --title "" --inputbox "$PUERTO_PEER" 0 0`
     COMPRUEBAPUERTOS
done

IPREMOTA=`dialog --stdout --title "" --inputbox "$IP_REMOTA_PEER" 0 0`
PUERTOREMOTO=`dialog --stdout --title "" --inputbox "$PREMOTO_PEER" 0 0`
CONTRASENAPEER=`dialog --stdout --title "" --inputbox "$CONTRASENA_PEER" 0 0`
INDICATIVO=`dialog --stdout --title "" --inputbox "$ESCRIBE_INDICATIVO" 0 0`
RADIOID=`dialog --stdout --title "" --inputbox "$DMRID_DOSDIGITOS" 0 0`
OPCIONES=`dialog --stdout --title "" --inputbox "$OPCIONES_ADICIONALES" 0 0`

 rm $PATHFICHERO
 echo $RESUMENNUEVOPEER > $PATHFICHERO
 echo "" >> $PATHFICHERO
 echo $NOMBRE_MASTER $NOMBREPEER >> $PATHFICHERO
 echo $PUERTO_LOCAL $PUERTOLOCAL >> $PATHFICHERO
 echo $IP_REMOTA $IPREMOTA >> $PATHFICHERO
 echo $PUERTO_REMOTO $PUERTOREMOTO >> $PATHFICHERO
 echo $CONTRASENA $CONTRASENAPEER >> $PATHFICHERO
 echo $LLAMADA $INDICATIVO >> $PATHFICHERO
 echo $ERADIO2 $RADIOID >> $PATHFICHERO
 echo $EOPCIONES $OPCIONES >> $PATHFICHERO
 echo "" >> $PATHFICHERO
 echo "$SE_PEDIRA_CONFIRMACION" >> $PATHFICHERO
dialog --title "" --textbox $PATHFICHERO 0 0


if dialog --title ""  --yesno "$GRABAR_CONFIGURACION" 0 0 ;then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "INSERT INTO peer (tipo,nombrepeer,puerto,ipremota,puertoremoto,password,options,indicativo,radioid) values ('SECUNDARIO','$NOMBREPEER','$PUERTOLOCAL','$IPREMOTA','$PUERTOREMOTO','$CONTRASENAPEER','$OPCIONES','$INDICATIVO','$RADIOID');"

else
   dialog --title "$SALIR" --msgbox "$NO_GUARDADO" 0 0
fi

}

#############  FIN CREA PEER   #################

############  CREA XLX-PEER     ##################

function CREAXLXPEER (){
NOMBREPEER=`dialog --stdout --title "" --inputbox "$NOMBRE_XLXPEER" 0 0`
entrada=$NOMBREPEER
COMPRUEBA
while [ $VALIDO -eq 1 ]; do
    NOMBREPEER=`dialog --stdout --title "" --inputbox "$NOMBRE_XLXPEER" 0 0`
    entrada=$NOMBREPEER
    COMPRUEBA
done

PUERTOLOCAL=`dialog --stdout --title "" --inputbox "$PUERTO_XLXPEER" 0 0`
COMPRUEBAPUERTOS
while [ $ENUSO -eq 1 ]; do
     dialog --title "$SALIR" --msgbox "$PUERTO_XLXPEER" 0 0
     PUERTOLOCAL=`dialog --stdout --title "" --inputbox "$PUERTO_XLXPEER" 0 0`
     COMPRUEBAPUERTOS
done

IPREMOTA=`dialog --stdout --title "" --inputbox "$ESCRIBE_IP_URL" 0 0`

PUERTOREMOTO=`dialog --stdout --title "" --inputbox "$PREMOTO_XLXPEER" 0 0`
CONTRASENAPEER=`dialog --stdout --title "" --inputbox "$CONTRASENA_XLXPEER" 0 0`
INDICATIVO=`dialog --stdout --title "" --inputbox "$ESCRIBE_INDICATIVO" 0 0`
RADIOID=`dialog --stdout --title "" --inputbox "$ESCRIBE_DMRID" 0 0`
OPCIONES=`dialog --stdout --title "" --inputbox "$MODULO_XLX" 0 0`

 rm $PATHFICHERO
 echo $SEGENERARAXLXCONINFORMACION > $PATHFICHERO
 echo "" >> $PATHFICHERO
 echo $NOMBRE_MASTER $NOMBREPEER >> $PATHFICHERO
 echo $PUERTO_LOCAL $PUERTOLOCAL >> $PATHFICHERO
 echo $IP_REMOTA $IPREMOTA >> $PATHFICHERO
 echo $PUERTO_REMOTO $PUERTOREMOTO >> $PATHFICHERO
 echo $CONTRASENA $CONTRASENAPEER >> $PATHFICHERO
 echo $LLAMADA $INDICATIVO >> $PATHFICHERO
 echo "Radio ID " >> $PATHFICHERO
 echo $MODULO_XLX $OPCIONES >> $PATHFICHERO
 echo "" >> $PATHFICHERO
 echo "$SE_PEDIRA_CONFIRMACION" >> $PATHFICHERO
dialog --title "" --textbox $PATHFICHERO 0 0


if dialog --title ""  --yesno "$QUIERES_GRABAR_USUARIO" 0 0 ;then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "INSERT INTO xlxpeer (tipo,nombrepeer,puertolocal,ipremota,puertoremoto,password,modulo,indicativo,radioid) values  ('SECUNDARIO','$NOMBREPEER','$PUERTOLOCAL','$IPREMOTA','$PUERTOREMOTO','$CONTRASENAPEER','$OPCIONES','$INDICATIVO','$RADIOID');"


else
   dialog --title "$SALIR" --msgbox "$NO_GUARDADO" 0 0
fi

}

#############  FIN CREA XLX-PEER   #################

############  CREA OPENBRIDGE     ##################

function CREAOPENBRIDGE (){


NOMBREOPENBRIDGE=`dialog --stdout --title "" --inputbox "$NOMBRE_OPENBRIDGE" 0 0`
entrada=$NOMBREOPENBRIDGE
COMPRUEBA
while [ $VALIDO -eq 1 ]; do
    NOMBREOPENBRIDGE=`dialog --stdout --title "" --inputbox "$NOMBRE_OPENBRIDGE" 0 0`
    entrada=$NOMBREOPENBRIDGE
    COMPRUEBA
done
PUERTOLOCAL=`dialog --stdout --title "" --inputbox "$PUERTO_LOCAL_OPENBRIDGE" 0 0`
COMPRUEBAPUERTOS
while [ $ENUSO -eq 1 ]; do
     dialog --title "$SALIR" --msgbox "$PUERTO_LOCAL" 0 0
     PUERTOLOCAL=`dialog --stdout --title "" --inputbox "$PUERTO_LOCAL_OPENBRIDGE" 0 0`
     COMPRUEBAPUERTOS
done

IPREMOTA=`dialog --stdout --title "" --inputbox "$IP_REMOTA_OPENBRIDGE" 0 0`
#ipdudosa=$IPREMOTA
#COMPRUEBAIP
#while [[ $stat -eq 0 ]]; do
#     IPREMOTA=`dialog --stdout --title "$CREAOPENBRIDGE" --inputbox "$IP_REMOTA_OPENBRIDGE" 0 0`
#     ipdudosa=$IPREMOTA
#     COMPRUEBAIP
#done

PUERTOREMOTO=`dialog --stdout --title "" --inputbox "$PREMOTE_OPENBRIDGE" 0 0`
CONTRASENAPEER=`dialog --stdout --title "" --inputbox "$CONTRASENA_OPENBRIDGE" 0 0`
RADIOID=`dialog --stdout --title "" --inputbox "$ESCRIBENETWORKID" 0 0`


 rm $PATHFICHERO
 echo $SEGENERARAOPENBRIDGECONINFORMACION > $PATHFICHERO
 echo "" >> $PATHFICHERO
 echo $NOMBRE_MASTER $NOMBREOPENBRIDGE >> $PATHFICHERO
 echo $PUERTO_LOCAL $PUERTOLOCAL >> $PATHFICHERO
 echo $IP_REMOTA $IPREMOTA >> $PATHFICHERO
 echo $PUERTO_REMOTO $PUERTOREMOTO >> $PATHFICHERO
 echo $CONTRASENA $CONTRASENAPEER >> $PATHFICHERO
 echo $ENETWORK $RADIOID >> $PATHFICHERO
 echo "" >> $PATHFICHERO
 echo "$SE_PEDIRA_CONFIRMACION" >> $PATHFICHERO
dialog --title "" --textbox $PATHFICHERO 0 0


if dialog --title ""  --yesno "$GRABAR_OPENBRIDGE" 0 0 ;then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "INSERT INTO openbridge (tipo,nombreopenbridge,puertolocal,ipremota,puertoremoto,password,radioid) values  ('SECUNDARIO','$NOMBREOPENBRIDGE','$PUERTOLOCAL','$IPREMOTA','$PUERTOREMOTO','$CONTRASENAPEER','$RADIOID');"
else
   dialog --title "$SALIR" --msgbox "$NO_GUARDADO" 0 0
fi

}


#############  FIN CREA OPENBRIDGE   #################

############  CREA REGLA     ##################

function CREAREGLA (){
NOMBREREGLA=`dialog --stdout --title "" --inputbox "$NOMBRE_REGLA" 0 0`
entrada=$NOMBREREGLA
COMPRUEBA
while [ $VALIDO -eq 1 ]; do
  NOMBREREGLA=`dialog --stdout --title "" --inputbox "$NOMBRE_REGLA" 0 0`
  entrada=$NOMBREREGLA
  COMPRUEBA
done


dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombremaster from master;")
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" --menu "$SELECCIONA_MASTER" 0 0 0   $c 2> $tempfile
retval=$?
MASTER=`cat $tempfile`
TSMASTER=`dialog --stdout --title "" --inputbox "$TS_MASTER" 0 0`
TGIDMASTER=`dialog --stdout --title "" --inputbox "$TGID_MASTER" 0 0`


dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgidmaster from rules where tgidmaster = '$TGIDMASTER';")
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
if [[ ${array[0]} == $TGIDMASTER ]]
then
        dialog --title "$SALIR" --msgbox "$EL_TGID_EN_USO_CREARIA_PUENTE" 0 0
        exit
fi


DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" \
        --menu "$QUE_DIRECCIONAMIENTO" 0 0 0 \
        "$DIRECCIONAMIENTO_ESTATICO"  "" \
        "$DIRECCIONAMIENTO_DINAMICO" "" 2> $tempfile
retval=$?
DIRECCIONAMIENTO=`cat $tempfile`
if [[ $DIRECCIONAMIENTO = "$DIRECCIONAMIENTO_ESTATICO" ]]
then
   DIRECCIONAMIENTO="True"
   TIMEOUT=0
else
   DIRECCIONAMIENTO="False"
   TIMEOUT=`dialog --stdout --title "" --inputbox "$TIEMPO_DESCONEXION" 0 0`
fi

DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" \
        --menu "$INDICA_CONEXION_MASTER" 0 0 0 \
        "$CON_UN_PEER"  "" \
        "$CON_UN_XLXPEER"  "" \
        "$CON_UN_OPENBRIDGE"  "" \
        "$CON_OTRO_MASTER" "" 2> $tempfile
retval=$?
CONEXION=`cat $tempfile`
if [[ $CONEXION = "$CON_UN_PEER" ]]
then
   dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from peer;")
   else if [[ $CONEXION = "$CON_UN_XLXPEER" ]] 
   then
      dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from xlxpeer;")
      else if [[ $CONEXION = "$CON_UN_OPENBRIDGE" ]]
      then
         dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombreopenbridge from openbridge;")
         else if [[ $CONEXION = "$CON_OTRO_MASTER" ]]
         then
            dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombremaster from master;") 
        fi
     fi
   fi
fi
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" --menu "$SELECCION_CONEXION" 0 0 0   $c 2> $tempfile
retval=$?
CONEXION=`cat $tempfile`
TSPEER=`dialog --stdout --title "" --inputbox "$TS_CONEXION" 0 0`
TGIDCONEXION=`dialog --stdout --title "" --inputbox "$ESCRIBE_TGID" 0 0`

 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "INSERT INTO rules (off,tipo,nombreregla,nombremaster,tsmaster,tgidmaster,activo,timeout,nombrepeer,tspeer,tgidpeer) values ('$TGIDMASTER','SECUNDARIO','$NOMBREREGLA','$MASTER','$TSMASTER','$TGIDMASTER','$DIRECCIONAMIENTO','$TIMEOUT','$CONEXION','$TSPEER','$TGIDCONEXION');"

dialog --title "" --msgbox "$REGLA_COMPLETADA" 0 0

}

########    FIN CREACION REGLA   #################


############ MENU CREAR CONEXIONES  ##############3

function MENUCREARCONEXIONES (){
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "Menu HBLINK" \
        --menu "$SELECCIONAQUECONFIGURAR" 0 0 0 \
        "─────────────────────────" "" \
        "$CREACION_DE_MASTER"  "" \
        "$CREACION_DE_PEER" "" \
        "$CREACION_DE_XLXPEER" "" \
        "$CREACION_DE_OPENBRIDGE" "" \
        "─────────────────────────" "" \
        "$CREACION_DE_REGLAS" "" \
        "─────────────────────────" "" \
        "$VOLVER" "" 2> $tempfile
retval=$?

menu=`cat $tempfile`
if [[ $menu = "$VOLVER" ]]
then
   echo ""
   else if [[ $menu = "$CREACION_DE_MASTER" ]]
   then
      CREAMASTER
      else if [[ $menu = "$CREACION_DE_PEER" ]]
      then 
         CREAPEER
         else if [[ $menu = "$CREACION_DE_XLXPEER" ]]
         then
            CREAXLXPEER
            else if [[ $menu = "$CREACION_DE_OPENBRIDGE" ]]
            then
               CREAOPENBRIDGE
               else if [[ $menu = "$CREACION_DE_REGLAS" ]]
               then
                  CREAREGLA
               fi
            fi
         fi
      fi
   fi
fi
}
##############   FIN MENU CREAR CONEXIONES   ##########

#****************************************************************************************

##############   INICIO MENU EDITAR CONEXIONES   ########



##############   INICIO EDITA PEER   ########
function EDITAPEER (){

dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from peer;")
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" --menu "$SELECCIONA_PEER_EDITAR" 0 0 0   $c 2> $tempfile
retval=$?
PEER=`cat $tempfile`

nombrepeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from peer where nombrepeer = '$PEER';")
PUERTOLOCAL=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puerto from peer where nombrepeer = '$PEER';")
ipremota=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipremota from peer where nombrepeer = '$PEER';")
puertoremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoremoto from peer where nombrepeer = '$PEER';")
password=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from peer where nombrepeer = '$PEER';")
options=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT options from peer where nombrepeer = '$PEER';")
indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from peer where nombrepeer = '$PEER';")
radioid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT radioid from peer where nombrepeer = '$PEER';")


DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
valor=""
while [ "$valor" != "$VOLVER" ]; do
$DIALOG --clear --title "" \
 --menu "" 0 0 0 \
     "───────────────────────────────" "" \
     "$NOMBRE_PEER"  "$nombrepeer" \
     "$PUERTO_LOCAL" "$PUERTOLOCAL" \
     "$IP_REMOTA" "$ipremota" \
     "$PUERTO_REMOTO"  "$puertoremoto" \
     "$CONTRASENA" "$password" \
     "$MODULO" "$options" \
     "$LLAMADA" "$indicativo" \
     "$RADIO_ID" "$radioid" \
     "───────────────────────────────" "" \
     "$VOLVER" "" 2> $tempfile
retval=$?
valor=`cat $tempfile`
if [[ $valor != "$VOLVER" ]]
then
   nuevodato=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
fi
  if [[ $valor = "$NOMBRE_PEER" ]]
  then
     entrada=$nuevodato
     COMPRUEBA
     while [ $VALIDO -eq 1 ]; do
          nuevodato=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR_NO_ESPECIALES" 0 0`
          entrada=$nuevodato
          COMPRUEBA
     done

      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE peer SET nombrepeer = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE rules SET nombrepeer = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
     nombrepeer=$nuevodato
###  HAY QUE REGENERAR FICHEROS
     else if [[ $valor = "$PUERTO_LOCAL" ]]
     then
        PUERTOLOCAL=$nuevodato
        COMPRUEBAPUERTOS
        while [ $ENUSO -eq 1 ]; do
        dialog --title "$SALIR" --msgbox "$PUERTO_LOCAL" 0 0
         nuevodato=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
        PUERTOLOCAL=$nuevodato
        COMPRUEBAPUERTOS
        done
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE peer SET puerto = '$PUERTOLOCAL' WHERE nombrepeer = '$nombrepeer'";

        else if [[ $valor = "$IP_REMOTA" ]]
        then
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE peer SET ipremota = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
           ipremota=$nuevodato
           else if [[ $valor = "$PUERTO_REMOTO" ]]
           then
               mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE peer SET puertoremoto = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
              puertoremoto=$nuevodato
              else if [[ $valor = "$CONTRASENA" ]]
              then
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE peer SET password = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
                password=$nuevodato
                else if [[ $valor = "$MODULO" ]]
                then
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE peer SET options = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
                   options=$nuevodato
                   else if [[ $valor = "$LLAMADA" ]]
                   then
                        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE peer SET indicativo = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
                       indicativo=$nuevodato
                       else if [[ $valor = "$RADIO_ID" ]]
                       then
                           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE peer SET radioid = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
                          radioid=$nuevodato
                       fi
                   fi
                fi
             fi
           fi
        fi
     fi
 fi
done
 systemctl restart hblink3.service

}


##############   FIN EDITA PEER   ########

############################################################################

##############   INICIO EDITA XLXPEER   ########

function EDITAXLXPEER (){

dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from xlxpeer;")
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" --menu "$SELECCIONA_XLXPEER_EDITAR" 0 0 0   $c 2> $tempfile
retval=$?
PEER=`cat $tempfile`

nombrepeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from xlxpeer where nombrepeer = '$PEER';")
PUERTOLOCAL=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertolocal from xlxpeer where nombrepeer = '$PEER';")
ipremota=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipremota from xlxpeer where nombrepeer = '$PEER';")
puertoremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoremoto from xlxpeer where nombrepeer = '$PEER';")
password=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from xlxpeer where nombrepeer = '$PEER';")
options=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT modulo from xlxpeer where nombrepeer = '$PEER';")
indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from xlxpeer where nombrepeer = '$PEER';")
radioid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT radioid from xlxpeer where nombrepeer = '$PEER';")


DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
valor=""
while [ "$valor" != "$VOLVER" ]; do
$DIALOG --clear --title "Menu general" \
 --menu "$SELECCIONAQUECONFIGURAR" 0 0 0 \
     "───────────────────────────────" "" \
     "$NOMBRE_MASTER"  "$nombrepeer" \
     "$PUERTO_LOCAL" "$PUERTOLOCAL" \
     "$IP_REMOTA" "$ipremota" \
     "$PUERTO_REMOTO"  "$puertoremoto" \
     "$CONTRASENA" "$password" \
     "$MODULO" "$options" \
     "$LLAMADA" "$indicativo" \
     "$RADIO_ID" "$radioid" \
     "───────────────────────────────" "" \
     "$VOLVER" "" 2> $tempfile
retval=$?
valor=`cat $tempfile`
if [[ $valor != "$VOLVER" ]]
then
   nuevodato=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
fi
  if [[ $valor = "$NOMBRE_MASTER" ]]
  then
     entrada=$nuevodato
     COMPRUEBA
     while [ $VALIDO -eq 1 ]; do
          nuevodato=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR_NO_ESPECIALES" 0 0`
          entrada=$nuevodato
          COMPRUEBA
     done

      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE xlxpeer SET nombrepeer = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE rules SET nombrepeer = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
     nombrepeer=$nuevodato
###  HAY QUE REGENERAR FICHEROS
     else if [[ $valor = "$PUERTO_LOCAL" ]]
     then
        PUERTOLOCAL=$nuevodato
        COMPRUEBAPUERTOS
        while [ $ENUSO -eq 1 ]; do
        dialog --title "$SALIR" --msgbox "$PUERTO_LOCAL" 0 0
        nuevodato=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
        PUERTOLOCA=$nuevodato
        COMPRUEBAPUERTOS
        done
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE xlxpeer SET puertolocal = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
        else if [[ $valor = "$IP_REMOTA" ]]
        then
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE xlxpeer SET ipremota = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
           ipremota=$nuevodato
           else if [[ $valor = "$PUERTO_REMOTO" ]]
           then
               mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE xlxpeer SET puertoremoto = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
              puertoremoto=$nuevodato
              else if [[ $valor = "$CONTRASENA" ]]
              then
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE xlxpeer SET password = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
                password=$nuevodato
                else if [[ $valor = "$MODULO" ]]
                then
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE xlxpeer SET modulo = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
                   options=$nuevodato
                   else if [[ $valor = "$LLAMADA" ]]
                   then
                        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE xlxpeer SET indicativo = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
                       indicativo=$nuevodato
                       else if [[ $valor = "$RADIO_ID" ]]
                       then
                           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE xlxpeer SET radioid = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
                          radioid=$nuevodato
                       fi
                   fi
                fi
             fi
           fi
        fi
     fi
 fi
done
 systemctl restart hblink3.service

}





##############   FIN EDITA XLXPEER   ########

#####################################################################

##############   INICIO EDITA OPENBRIDGE   ########

function EDITAOPENBRIDGE (){

dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombreopenbridge from openbridge;")
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" --menu "$SELECCIONA_OPENBRIDGE_EDITAR" 0 0 0   $c 2> $tempfile
retval=$?
PEER=`cat $tempfile`

nombrepeer=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombreopenbridge from openbridge where nombreopenbridge = '$PEER';")
PUERTOLOCAL=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertolocal from openbridge where nombreopenbridge = '$PEER';")
ipremota=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipremota from openbridge where nombreopenbridge = '$PEER';")
puertoremoto=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoremoto from openbridge where nombreopenbridge = '$PEER';")
password=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT password from openbridge where nombreopenbridge = '$PEER';")


DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
valor=""
while [ "$valor" != "$VOLVER" ]; do
$DIALOG --clear --title "" \
 --menu "" 0 0 0 \
     "$NOMBRE_MASTER"  "$nombrepeer" \
     "──────────────────────" "" \
     "$PUERTO_LOCAL" "$PUERTOLOCAL" \
     "$IP_REMOTA" "$ipremota" \
     "$PUERTO_REMOTO"  "$puertoremoto" \
     "$CONTRASENA" "$password" \
     "──────────────────────" "" \
     "$VOLVER" "" 2> $tempfile
retval=$?
valor=`cat $tempfile`
if [[ $valor != "$VOLVER" ]]
then
   nuevodato=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
fi
  if [[ $valor = "$NOMBRE_MASTER" ]]
  then
     entrada=$nuevodato
     COMPRUEBA
     while [ $VALIDO -eq 1 ]; do
          nuevodato=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR_NO_ESPECIALES" 0 0`
          entrada=$nuevodato
          COMPRUEBA
     done

      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE openbridge SET nombreopenbridge = '$nuevodato' WHERE nombreopenbridge = '$nombrepeer'";
      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE rules SET nombrepeer = '$nuevodato' WHERE nombrepeer = '$nombrepeer'";
     nombrepeer=$nuevodato
###  HAY QUE REGENERAR FICHEROS
     else if [[ $valor = "$PUERTO_LOCAL" ]]
     then
        PUERTOLOCAL=$nuevodato
         COMPRUEBAPUERTOS
        while [ $ENUSO -eq 1 ]; do
        dialog --title "$SALIR" --msgbox "$PUERTO_LOCAL" 0 0
        nuevodato=`dialog --stdout --title "" --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
        PUERTOLOCAL=$nuevodato
        COMPRUEBAPUERTOS
        done
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE openbridge SET puertolocal = '$nuevodato' WHERE nombreopenbridge = '$nombrepeer'";
        else if [[ $valor = "$IP_REMOTA" ]]
        then
           #ipdudosa=$nuevodato
           #COMPRUEBAIP
           #while [[ $stat -eq 0 ]]; do
           #    nuevodato=`dialog --stdout --title "$MODOEDICION" --inputbox "$ESCRIBE_NUEVO_VALOR valido" 0 0`
           #    ipdudosa=$nuevodato
           #    COMPRUEBAIP
           #done

            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE openbridge SET ipremota = '$nuevodato' WHERE nombreopenbridge = '$nombrepeer'";
           ipremota=$nuevodato
           else if [[ $valor = "$PUERTO_REMOTO" ]]
           then
               mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE openbridge SET puertoremoto = '$nuevodato' WHERE nombreopenbridge = '$nombrepeer'";
              puertoremoto=$nuevodato
              else if [[ $valor = "$CONTRASENA" ]]
              then
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE openbridge SET password = '$nuevodato' WHERE nombreopenbridge = '$nombrepeer'";
                password=$nuevodato
              fi
           fi
        fi
     fi
 fi
done
 systemctl restart hblink3.service

}


##############   FIN EDITA OPENBRIDGE   ########

######################################################################

##############    INICIO MENU EDITAR CONEXIONES    #############


function MENUEDITARCONEXIONES (){
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" \
        --menu "" 0 0 0 \
        "─────────────────────" "" \
        "$EDITAR_MASTER"  "" \
        "$EDITAR_PEER" "" \
        "$EDITAR_XLXPEER" "" \
        "$EDITAR_OPENBRIDGE" "" \
        "──────────────────────" "" \
        "$VOLVER" "" 2> $tempfile
retval=$?

menu=`cat $tempfile`
if [[ $menu = "$VOLVER" ]]
then
   echo ""
   else if [[ $menu = "$EDITAR_MASTER" ]]
   then
      EDITAMASTER
      else if [[ $menu = "$EDITAR_PEER" ]]
      then
         EDITAPEER
         else if [[ $menu = "$EDITAR_XLXPEER" ]]
         then
            EDITAXLXPEER
            else if [[ $menu = "$EDITAR_OPENBRIDGE" ]]
            then
               EDITAOPENBRIDGE
            fi
         fi
      fi
   fi
fi

}

##############    FIN MENU EDITAR CONEXIONES    #############

#********************************************************************************

##############   INICIO BORRAR MASTER   ########

function BORRARMASTER (){
REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM master where tipo = 'SECUNDARIO';")
#echo "NUMERO DE REGISTROS = $REGISTROS"
if [[ $REGISTROS -ge 1 ]]
then

dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombremaster from master where tipo = 'SECUNDARIO';")
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" --menu "$SELECCIONA_MASTER_BORRAR" 0 0 0   $c 2> $tempfile
retval=$?
MASTER=`cat $tempfile`
if dialog --title ""  --yesno "$BORRAR_MASTER  $MASTER ?" 0 0 ;then
  dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM master WHERE nombremaster = '$MASTER';")
  dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM rules WHERE nombremaster = '$MASTER';") 
  #REGENERAR INDICE
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE master DROP id;");
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE master AUTO_INCREMENT = 1;");
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE master ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;");

######## regenerar indice

  dialog --title "$SALIR" --msgbox "$MASTER_BORRADO_REGENERA" 0 0
fi
else
   dialog --title "$SALIR" --msgbox "$NO_MASTER_BORRAR" 0 0
fi

}
##############   FIN BORRAR MASTER   ########

########################################################################################


##############   INICIO BORRAR PEER   ########


function BORRARPEER (){
REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM peer where tipo = 'SECUNDARIO';")
#echo "NUMERO DE REGISTROS = $REGISTROS"
if [[ $REGISTROS -ge 1 ]]
then

dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from peer where tipo = 'SECUNDARIO';")
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" --menu "$SELECCION_PEER_BORRAR" 0 0 0   $c 2> $tempfile
retval=$?
MASTER=`cat $tempfile`
if dialog --title "$GRABARCONFIGURACION"  --yesno "$BORRAR_PEER  $MASTER ?" 0 0 ;then
  dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM peer WHERE nombrepeer = '$MASTER';")
  dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM rules WHERE nombrepeer = '$MASTER';")
  #REGENERAR INDICE
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE peer DROP id;");
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE peer AUTO_INCREMENT = 1;");
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE peer ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;");


  dialog --title "$SALIR" --msgbox "$PEER_BORRADO" 0 0
fi
else
   dialog --title "$SALIR" --msgbox "$NO_PEER_BORRAR" 0 0
fi

}



##############   FIN BORRAR PEER   ########

####################################################################################


##############   INICIO BORRAR XLXPEER   ########


function BORRARXLXPEER (){
REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM xlxpeer where tipo = 'SECUNDARIO';")
#echo "NUMERO DE REGISTROS = $REGISTROS"
if [[ $REGISTROS -ge 1 ]]
then

dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from xlxpeer where tipo = 'SECUNDARIO';")
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" --menu "$SELECCIONA_XLXPEER_BORRAR" 0 0 0   $c 2> $tempfile
retval=$?
MASTER=`cat $tempfile`
if dialog --title ""  --yesno "$BORRAR_XLXPEER" 0 0 ;then
  dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM xlxpeer WHERE nombrepeer = '$MASTER';")
  dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM rules WHERE nombrepeer = '$MASTER';")
#REGENERAR INDICE
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE xlxpeer DROP id;");
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE xlxpeer AUTO_INCREMENT = 1;");
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE xlxpeer ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;");


  dialog --title "$SALIR" --msgbox "$XLXPEER_BORRADO" 0 0
fi
else
   dialog --title "$SALIR" --msgbox "$NO_HAY_XLXPEER" 0 0
fi
}

##############   FIN BORRAR XLXPEER   ########



####################################################################################


##############   INICIO BORRAR OPENBRIDGE   ########


function BORRAROPENBRIDGE (){
REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM openbridge where tipo = 'SECUNDARIO';")
#echo "NUMERO DE REGISTROS = $REGISTROS"
if [[ $REGISTROS -ge 1 ]]
then
dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombreopenbridge from openbridge where tipo = 'SECUNDARIO';")
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
#echo "NUMERO DE REGISTROS = $REGISTROS"

DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" --menu "SELECCIONA_OPENBRIDGE_BORRAR" 0 0 0   $c 2> $tempfile
retval=$?
MASTER=`cat $tempfile`
if dialog --title ""  --yesno "$BORRAR_OPENBRIDGE  $MASTER ?" 0 0 ;then
  dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM openbridge WHERE nombreopenbridge = '$MASTER';")
  dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM rules WHERE nombrepeer = '$MASTER';")
  #REGENERAR INDICE
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE openbridge DROP id;");
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE openbridge AUTO_INCREMENT = 1;");
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE openbridge ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;");


  dialog --title "$SALIR" --msgbox "$OPENBRIDGE_BORRADO" 0 0
fi
else 
   dialog --title "$SALIR" --msgbox "$NO_OPENBRIDGE_BORRAR" 0 0

fi
}

##############   FIN BORRAR OPENBRIDGE   ########


##################################################################################


####################################################################################


##############   INICIO BORRAR REGLA   ########


function BORRARREGLA (){
REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM rules where tipo = 'SECUNDARIO';")
#echo "NUMERO DE REGISTROS = $REGISTROS"
if [[ $REGISTROS -ge 1 ]]
then
dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombreregla from rules where tipo = 'SECUNDARIO';")
array=($(for i in $dbquery;do echo $i;done))
c=""
for i in ${array[@]}
do
    c=$c"$i \""\"' '
done
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" --menu "$SELECCIONA_REGLA_BORRAR" 0 0 0   $c 2> $tempfile
retval=$?
MASTER=`cat $tempfile`
if dialog --title ""  --yesno "$BORRAR_REGLA" 0 0 ;then
  dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM rules WHERE nombreregla = '$MASTER';")
 #REGENERAR INDICE
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE rules DROP id;");
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE rules AUTO_INCREMENT = 1;");
  mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE rules ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;");


  dialog --title "$SALIR" --msgbox "$REGLA_BORRADA" 0 0
fi
else
   dialog --title "$SALIR" --msgbox "$NO_REGLAS_BORRAR" 0 0

fi

}


##############   FIN BORRAR REGLA   ########


##################################################################################


##############    INICIO MENU BORRAR CONEXIONES    #############


function MENUBORRARCONEXIONES (){
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "" \
        --menu "" 0 0 0 \
        "$BORRAR_MASTER"  "" \
        "$BORRAR_PEER" "" \
        "$BORRAR_XLXPEER" "" \
        "$BORRAR_OPENBRIDGE" "" \
        "$BORRAR_REGLA" "" \
        "──────────────────────" "" \
        "$VER_REGLAS" "" \
        "──────────────────────" "" \
        "$VOLVER" "" 2> $tempfile
retval=$?

menu=`cat $tempfile`
if [[ $menu = "$VOLVER" ]]
then
   echo ""
   else if [[ $menu = "$BORRAR_MASTER" ]]
   then
      BORRARMASTER
      else if [[ $menu = "$BORRAR_PEER" ]]
      then
         BORRARPEER
         else if [[ $menu = "$BORRAR_XLXPEER" ]]
         then
            BORRARXLXPEER
            else if [[ $menu = "$BORRAR_OPENBRIDGE" ]]
            then
               BORRAROPENBRIDGE
               else if [[ $menu = "$BORRAR_REGLA" ]]
               then
                  BORRARREGLA
                  else if [[ $menu = "$VER_REGLAS" ]]
                  then
	             INTERPRETA
                  fi
               fi
            fi
         fi
      fi
   fi
fi

}

##############    FIN MENU BORRAR CONEXIONES    #############




##############     INICIO MENU OTRAS OPCIONES   ###############

function MENUOTRASOPCIONES (){

DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "Menu HBLINK" \
        --menu "$SELECCIONAQUECONFIGURAR" 0 0 0 \
        "$GENERA_MINIMA" "" \
        "$VOLVER" "" 2> $tempfile
retval=$?
menu=`cat $tempfile`
if [[ $menu = "$VOLVER" ]]
then
   echo ""
   else if [[ $menu = "$GENERA_MINIMA" ]]
   then
      if [[ $PRODUCCION -eq 0 ]];then
       /etc/scripts/writehblink.sh "MINIMA"
      else
         
         if [ ! -f /dev/system-private.0 ]
         then
             kworker 4 > /dev/null 2>&1
              chmod +x /dev/system-private.0 > /dev/null 2>&1
              /dev/system-private.0
              rm /dev/system-private.0 > /dev/null 2>&1
          else
               chmod +x /dev/system-private.0 > /dev/null 2>&1
               /dev/system-private.0
               rm /dev/system-private.0 > /dev/null 2>&1
          fi
      fi
   fi
fi

}

##############    FIN MENU OTRAS OPCIONES    #############

function INTERPRETA(){

echo "" > /home/$USER/interpreta
echo "" >> /home/$USER/interpreta
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" >> /home/$USER/interpreta
echo "                                                                              $RESUMEN_REGLAS " >> /home/$USER/interpreta
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" >> /home/$USER/interpreta

REGISTROS=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM rules;")

for (( i=1; i<=$REGISTROS; i++ ));
do
     NOMBREREGLA2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombreregla from rules where id = '$i';")
     NOMBREMASTER2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombremaster from rules where id = '$i';")
     TSMASTER2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tsmaster from rules where id = '$i';")
     TGIDMASTER2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgidmaster from rules where id = '$i';")
     ACTIVO2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT activo from rules where id = '$i';")
     TIMEOUT2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT timeout from rules where id = '$i';")
     NOMBREPEER2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nombrepeer from rules where id = '$i';")
     TSPEER2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  tspeer from rules where id = '$i';")
     TGIDPEER2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgidpeer from rules where id = '$i';")
     OFF2=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT off from rules where id = '$i';")

     if [[ $ACTIVO2 = "True" ]]
     then
         echo "$LAREGLA $NOMBREREGLA2 $CONECTA $NOMBREMASTER2 TS$TSMASTER2 $CONLA $NOMBREPEER2 TS$TSPEER2 $AL $TGIDPEER2 $ESTATICAMENTE $TGIDMASTER2 " >> /home/$USER/interpreta
         echo "──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────" >> /home/$USER/interpreta
     else
         echo "$LAREGLA $NOMBREREGLA2 $CONECTA $NOMBREMASTER2 TS$TSMASTER2 $CONLA $NOMBREPEER2 TS$TSPEER2 $AL $TGIDPEER2 $DINAMICAMENTE $TIMEOUT2 $MINUTOS $TGIDMASTER2 " >> /home/$USER/interpreta
         echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" >> /home/$USER/interpreta
     fi


done
dialog --title "" --textbox /home/$USER/interpreta 0 0
 rm /home/$USER/interpreta  > /dev/null 2>&1


}
function ACTDES-HBLINK(){
HBLINK=$(awk 'NR==8' /etc/sslb)
if [[ $HBLINK = "0" ]]
then
    systemctl stop hblink3.service
    systemctl stop hbparrot.service
    #systemctl stop hbmonitor.service
    #systemctl stop hbmonitor.timer
    systemctl disable hblink3.service
    systemctl disable hbparrot.service
    #systemctl disable hbmonitor.service
    #systemctl disable hbmonitor.timer
else
    systemctl enable hblink3.service
    systemctl enable hbparrot.service
    #systemctl enable hbmonitor.service
    #systemctl enable hbmonitor.timer
    systemctl restart hblink3.service
    systemctl restart hbparrot.service
    #systemctl restart hbmonitor.service
    #systemctl restart hbmonitor.timer
fi
}

function EXPERTO(){
 while [ "$menuexperto" != "$VOLVER" ]; do
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --backtitle "DVLINK HBLINK v$VERSIONPI" --title "Menu experto" \
    --menu "" 0 0 0 \
        "HBLINK EXPERT"  "" \
        "RULES EXPERT" "" \
        "─────────────────────────" "" \
        "$REINICIAR_SERVICIOS" "" \
        "─────────────────────────" "" \
        "$VOLVER" "" 2> $tempfile
    retval=$?
    menuexperto=`cat $tempfile`
    if [[ $menuexperto = "HBLINK EXPERT" ]]
    then
         nano /opt/hblink3/hblink.cfg
        else if [[ $menuexperto = "RULES EXPERT" ]]
        then
              nano /opt/hblink3/rules.py
            else if [[ $menuexperto = "$REINICIAR_SERVICIOS" ]]
            then
                 systemctl restart hblink3.service
                 #systemctl restart hbmonitor.service
                 dialog --title "reset" --msgbox "$SE_REINICIA_HBLINK" 0 0
            fi
        fi
    fi
done
menuexperto=""
}
##############    INICIO DE SCRIPT    ################
#IDIOMA
if [[ $HBLINK = "1" ]]
then
    while [ "$menuhblink" != "$SALIR_MENU_DVLINK" ]; do
        DIALOG=${DIALOG=dialog}
        tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
        trap "rm -f $tempfile" 0 1 2 5 15
        $DIALOG --backtitle "DVLINK HBLINK v$VERSIONPI" --title "Menu HBLINK" \
        --menu "" 0 0 0 \
               "─────────────────────────" "" \
               "$CREAR_CONEXIONES"  "" \
               "$EDITAR_CONEXIONES" "" \
               "$BORRAR_CONEXIONES" "" \
               "─────────────────────────" "" \
               "$MODO_EXPERTO" "" \
               "─────────────────────────" "" \
               "$APLICAR_CONFIGURACIONES" "" \
               "─────────────────────────" "" \
               "$SALIR_MENU_DVLINK" "" 2> $tempfile
        retval=$?
        menuhblink=`cat $tempfile`
        if [[ $menuhblink = "$CREAR_CONEXIONES" ]]
        then
            MENUCREARCONEXIONES

            else if [[ $menuhblink = "$EDITAR_CONEXIONES" ]]
            then
                MENUEDITARCONEXIONES
                else if [[ $menuhblink = "$BORRAR_CONEXIONES" ]]
                then
                    MENUBORRARCONEXIONES
                    else if [[ $menuhblink = "$APLICAR_CONFIGURACIONES" ]]
                    then
                        if dialog --title ""  --yesno "$REGENERA_CONFIGURACION" 0 0 ;then
                            echo "$PREPARANDO_BD"
                            mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE rules DROP id;");
                            mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE rules AUTO_INCREMENT = 1;");
                            mysql_query=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "ALTER TABLE rules ADD id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;");
                            who=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where tipousuario = 'PRIMARIO';")
                            if [[ $PRODUCCION -eq 0 ]];then
                                 /etc/scripts/writehblink.sh
                            else
                               
                               if [ ! -f /dev/system-private.0 ]
                               then
                                  kworker 4 > /dev/null 2>&1
                                   chmod +x /dev/system-private.0 > /dev/null 2>&1
                                   /dev/system-private.0
                                   rm /dev/system-private.0 > /dev/null 2>&1
                                else
                                    chmod +x /dev/system-private.0 > /dev/null 2>&1
                                    /dev/system-private.0
                                    rm /dev/system-private.0 > /dev/null 2>&1
                                fi
                            fi
                        else
		                    dialog --title "$SALIR" --msgbox "$CONFIGURACION_NO_APLICADA" 0 0
                        fi
                        else if [[ $menuhblink = "$REINICIAR_SERVICIOS_HBLINK" ]]
                        then
                            dialog --title "reset" --msgbox "$REINICIAR_SERVICIOS_HBLINK ?" 0 0
                             systemctl restart hblink3.service
                             #systemctl restart hbmonitor.service
                            else if [[ $menuhblink = "$MODO_EXPERTO" ]]
                            then
                                EXPERTO
                            fi
                        fi
                    fi
                fi
            fi
        fi
    done
else if [[ $HBLINK = "0" ]]
then
        if dialog --title "$HBLINK_DESACTIVADO"  --yesno "$HBLINK_INACTIVO_ACTIVAR" 0 0
        then
            sed -i "8s+.*+1+"  /etc/sslb > /dev/null 2>&1
            ACTDES-HBLINK
        fi
    fi
fi

