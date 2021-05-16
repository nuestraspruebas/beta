#!/bin/bash
export NCURSES_NO_UTF8_ACS=1
PATHDVLINK=$(awk 'NR==12' /etc/sslb)
#PATHDVLINK="/etc/dvlink"
USER=$(awk 'NR==1' /etc/sslb)
VERSIONPI=$(awk 'NR==2' /etc/sslb)
IDIOMA=$(awk 'NR==3' /etc/sslb)
PRODUCCION=$(awk 'NR==7' /etc/sslb)
#source $IDIOMA
source /usr/bin/activo
export NCURSES_NO_UTF8_ACS=1


###############  INICIO ACTIVA   #################

function ACTIVA(){
ipdmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipdmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
puertodmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertodmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
passworddmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passworddmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
ipbm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipbm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
puertobm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertobm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
passwordbm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passwordbm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
iphb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT iphb from dvswitch where borrar = '$SELECCIONINDICATIVO';")
puertohb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertohb from dvswitch where borrar = '$SELECCIONINDICATIVO';")
passwordhb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  passwordhb from dvswitch where borrar = '$SELECCIONINDICATIVO';")
red=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT red from dvswitch where borrar = '$SELECCIONINDICATIVO';")
indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrid from dvswitch where borrar = '$SELECCIONINDICATIVO';")
reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reflector from dvswitch where borrar = '$SELECCIONINDICATIVO';")
ambe=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ambe from dvswitch where borrar  = '$SELECCIONINDICATIVO';")
usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$SELECCIONINDICATIVO';")
ipactiva=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipactiva from dvswitch where borrar = '$SELECCIONINDICATIVO';")
puertoactivo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoactivo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
passactivo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passactiva from dvswitch where borrar = '$SELECCIONINDICATIVO';")
usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$SELECCIONINDICATIVO';")
emuport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT 380port from dvswitch where borrar = '$SELECCIONINDICATIVO';")
}

################  FIN ACTIVA

######################################################################################################################################################################

##############   INICIO  CONFIGURA DVSWITCH PRINCIPAL   ##########################
function CONF-DSTAR(){


reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reflector from hot_IRC where nombre = 'PRIMARIONOBORRAR';")
repeaterband=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT repeaterband from hot_IRC where nombre = 'PRIMARIONOBORRAR';")
atstartup=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT atstartup from hot_IRC where nombre = 'PRIMARIONOBORRAR';")
reconnect=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reconnect from hot_IRC where nombre = 'PRIMARIONOBORRAR';")
irchostname=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT irchostname from hot_IRC where nombre = 'PRIMARIONOBORRAR';")
lenguaje=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT lenguaje from hot_IRC where nombre = 'PRIMARIONOBORRAR';")

ccshost=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ccshost from hot_IRC where nombre = 'PRIMARIONOBORRAR';")
irchostname=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT irchostname from hot_IRC where nombre = 'PRIMARIONOBORRAR';")
remotepass=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT remotepass from hot_IRC where nombre = 'PRIMARIONOBORRAR';")

remote=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT remote from hot_IRC where nombre = 'PRIMARIONOBORRAR';")

while [ "$menudstar" != "$VOLVER" ]; do
    DIALOG2=${DIALOG2=dialog}
    tempfileysf=`tempfileysf 2>/dev/null` || tempfileysf=/tmp/test$$
    trap "rm -f $tempfileysf" 0 1 2 5 15
    $DIALOG2 --clear --title "Menu general" \
    --menu "" 0 0 0 \
        "$SELECCION_RED"  "$irchostname" \
        "$SELECCIONA_CCS"  "$ccshost" \
        "$REFLECTOR_INICIO"  "$reflector" \
        "$ARRANCA_REFLECTOR_INICIO" "$atstartup" \
        "$SELECCIONA_TIEMPO_RECONEXION" "$reconnect" \
        "$SELECCIONA_MODULO" "$repeaterband" \
        "$IDIOMA" "$lenguaje" \
        "$ACTIVAR_ACCESO_REMOTO" "$remote" \
        "$PUERTO_ACCESO_REMOTO" "$remotepuerto" \
        "$CONTRASENA_ACCESO_REMOTO" "$remotepass" \
        "$VOLVER" "" 2> $tempfileysf
    retvalconfmodem=$?
    menudstar=`cat $tempfileysf`
 if [[ $menudstar = "$SELECCION_RED" ]]
 then
      host="$PATHDVLINK/MENUS/dstarhost"
      whiptail --menu 'Select' 0 0 0 $(cat $host) 2>/var/log/dato
      pivote=$(awk 'NR==1' /var/log/dato)
      irchostname=$pivote
       mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET irchostname = '$irchostname' where nombre = 'PRIMARIONOBORRAR'";
      else if [[ $menudstar = "$SELECCIONA_CCS" ]]
      then
        ccs="$PATHDVLINK/MENUS/ccs"
        whiptail --menu 'Select' 0 0 0 $(cat $ccs) 2>/var/log/dato
        pivote=$(awk 'NR==1' /var/log/dato)
        ccshost=$pivote
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET ccshost = '$ccshost' where nombre = 'PRIMARIONOBORRAR'";
        else if [[ $menudstar = "$REFLECTOR_INICIO" ]]
        then
           reflector=`dialog --stdout --title "dstar" --inputbox "$REFLECTOR_INICIO" 0 0`
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET reflector = '$reflector' where nombre = 'PRIMARIONOBORRAR'";
           else if [[ $menudstar = "$ARRANCA_REFLECTOR_INICIO" ]]
           then
             if dialog --title ""  --yesno "$ARRANCAR_REFLECTOR_AL_INICIO" 0 0 ;then
               atstartup=1
             else
               atstartup=0
             fi
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET atstartup = '$atstartup' where nombre = 'PRIMARIONOBORRAR'";
             else if [[ $menudstar = "$SELECCIONA_TIEMPO_RECONEXION" ]]
             then
               tiempo="$PATHDVLINK/MENUS/dstartime"
               whiptail --menu 'Select' 0 0 0 $(cat $tiempo) 2>/var/log/dato
               reconnect=$(awk 'NR==1' /var/log/dato)
                mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET reconnect = '$reconnect' where nombre = 'PRIMARIONOBORRAR'";
               else if [[ $menudstar = "$IDIOMA" ]]
               then
                  idioma="$PATHDVLINK/MENUS/dstaridiomas"
                  whiptail --menu 'Select' 0 0 0 $(cat $idioma) 2>/var/log/dato
                  lenguaje=$(awk 'NR==1' /var/log/dato)
                   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET lenguaje = '$lenguaje' where nombre = 'PRIMARIONOBORRAR'";
                  else if [[ $menudstar = "$SELECCIONA_MODULO" ]]
                  then
                    modulo="$PATHDVLINK/MENUS/modulosdstar"
                    whiptail --menu 'Select' 0 0 0 $(cat $modulo) 2>/var/log/dato
                    repeaterband=$(awk 'NR==1' /var/log/dato)
                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET repeaterband = '$repeaterband' where nombre = 'PRIMARIONOBORRAR'";
                    else if [[ $menudstar = "$ACTIVAR_ACCESO_REMOTO" ]]
                   then
                       if dialog --title ""  --yesno "$ARRANCAR_REFLECTOR_AL_INICIO" 0 0 ;then
                         remote=1
                       else
                          remote=0
                       fi
                        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET remote = '$remote' where nombre = 'PRIMARIONOBORRAR'";
                       else if [[ $menudstar = "$PUERTO_ACCESO_REMOTO" ]]
                       then
                          remotepuerto=`dialog --stdout --title "dstar" --inputbox "$PUERTO_ACCESO_REMOTO" 0 0`
                           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET remotepuerto = '$remotepuerto' where nombre = 'PRIMARIONOBORRAR'";
                          else if [[ $menudstar = "$CONTRASENA_ACCESO_REMOTO" ]]
                          then
                            remotepass=`dialog --stdout --title "dstar" --inputbox "$REFLECTOR_INICIO" 0 0`
                             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hot_IRC SET remotepass = '$remotepass' where nombre = 'PRIMARIONOBORRAR'";
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
function CONFIGURA-DVSWITCH-PRINCIPAL(){

indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrid from dvswitch where borrar = '$SELECCIONINDICATIVO';")
red=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT red from dvswitch where borrar = '$SELECCIONINDICATIVO';")
reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reflector from dvswitch where borrar = '$SELECCIONINDICATIVO';")
ambe=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ambe from dvswitch where borrar  = '$SELECCIONINDICATIVO';")
usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$SELECCIONINDICATIVO';")
ipactiva=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipactiva from dvswitch where borrar = '$SELECCIONINDICATIVO';")
puertoactivo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoactivo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
passactivo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passactiva from dvswitch where borrar = '$SELECCIONINDICATIVO';")
usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$SELECCIONINDICATIVO';")
modulodstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT modulodstar from dvswitch where borrar = '$SELECCIONINDICATIVO';")
nxdnid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdnid from dvswitch where borrar = '$SELECCIONINDICATIVO';")
menuconfigura=""
while [ "$menuconfigura" != "$VOLVER" ]; do
   DIALOG=${DIALOG=dialog}
   tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
   trap "rm -f $tempfile" 0 1 2 5 15
   $DIALOG --clear --title "$MENUGENERAL" \
   --menu "" 0 0 0 \
     "$LLAMADA"  "$indicativo" \
     "DMRID" "$dmrid" \
     "NXDN ID" "$nxdnid" \
     "$SELECCION_RED2" "$red" \
     "AMBE" "$ambe" \
     "$CONFIGURACION_DSTAR" "" \
     "$PUERTO_USRP" "$usrp" \
     "$VOLVER" "" 2> $tempfile
retval=$?
menuconfigura=`cat $tempfile`

if [[ $menuconfigura != "$VOLVER" ]]
then
   if [[ $menuconfigura != "AMBE" && $menuconfigura != "$SELECCION_RED2" && $menuconfigura != "" && $menuconfigura != "$CONFIGURACION_DSTAR" ]] && [[ $menuconfigura != "$CONFIGURACION_DSTAR" ]]
   then
      nuevodato=`dialog --stdout --title " " --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
   fi
fi

 if [[ $menuconfigura = "$LLAMADA" ]]
 then
#####################
    # indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
     variable=$(echo $nuevodato | tr '[:lower:]' '[:upper:]')
     nuevodato=$variable
     sufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select sufijo from dvswitch where borrar = '$SELECCIONINDICATIVO'";)
     if [[ $sufijo > 10 ]]
     then
         dialog --title "$SALIR" --msgbox "$EL_INDICATIVO_NO_MODIFICABLE" 0 0
     else
       ban=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM con where con1 = '$nuevodato';")
       if [[ $ban -ge 1 ]]
       then
        exit 0
       fi

       borra="$nuevodato&$sufijo"
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET borrar = '$borra' where borrar = '$SELECCIONINDICATIVO'";
       SELECCIONINDICATIVO=$borra
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET indicativo = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET indicativo = '$nuevodato' where nombre = 'PRIMARIONOBORRAR'";
#######
     ordensql="UPDATE hot_CW SET cwindicativo = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
     ordensql="UPDATE hot_conf_personal SET indicativo = '$nuevodato' where nombre = 'PRIMARIONOBORRAR'";
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "$ordensql"
#######
       indicativo=$nuevodato
     fi
       else if [[ $menuconfigura = "DMRID" ]]
       then
          mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET dmrid = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
         dmrid=$nuevodato
        else if [[ $menuconfigura = "NXDN ID" ]]
        then
          mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET nxdnid = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
         nxdnid=$nuevodato

         else if [[ $menuconfigura = "AMBE" ]]
         then
                  DIALOG=${DIALOG=dialog}
                 tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
                 trap "rm -f $tempfile" 0 1 2 5 15
                 $DIALOG --clear --title "$CONFIGURADORDVSWITCH" \
                 --menu "" 0 0 0 \
                    "$AMBE_EMULADO" "" \
                    "AMBE 460800"  "AMBE3000 USB" \
                    "AMBE 230400" "AMBE3000 ARDUINO"  2> $tempfile
                 retval=$?
                 tipoambe=`cat $tempfile`
                 if [[ $tipoambe = "$AMBE_EMULADO" ]]
                 then
                     echo "$CODEC_EXPERIMENTAL" > "$PATHDVLINK/MENUS/disclaimer.txt"

                     dialog --title "" --textbox disclaimer.txt 0 0
                     if dialog --title ""  --yesno "$USAR_EMULACION" 0 0 ;then
                         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ambe = 'EMULADO' where borrar = '$SELECCIONINDICATIVO'";
                        ambe="EMULADO"
                     else
                          mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ambe = '460800' where borrar = '$SELECCIONINDICATIVO'";
                         ambe="460800" 
                     fi
                     else if [[ $tipoambe = "AMBE 460800" ]]
                     then
                          mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ambe = '460800' where borrar = '$SELECCIONINDICATIVO'";
                         ambe="460800"
                         else if [[ $tipoambe = "AMBE 230400" ]]
                         then
                              mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ambe = '230400' where borrar = '$SELECCIONINDICATIVO'";
                             ambe="230400"
                         fi
                      fi
                  fi

           else if [[ $menuconfigura = "$PUERTO_USRP" ]]
           then
               mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET usrp = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
              usrp=$nuevodato
              sed -i "77s#.*#declare _json_file=/tmp/ABInfo_$usrp.json#" /opt/Analog_Bridge/dvswitch.sh
              else if [[ $menuconfigura = "$SELECCION_RED2" ]]
              then
                    DIALOG=${DIALOG=dialog}
                    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
                    trap "rm -f $tempfile" 0 1 2 5 15
                   $DIALOG --clear --title "$SELECCION_RED2" \
                    --menu "" 0 0 0 \
                    "BM" "" \
                    "DMR+"  "" \
                    "HBLINK" ""  2> $tempfile
                    retval=$?
                    aquered=`cat $tempfile`
                    if [[ $aquered = "BM" ]]
                    then
                         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = 'BM' where borrar = '$SELECCIONINDICATIVO'";
                        red="BM"
                        else if [[ $aquered = "DMR+" ]]
                        then
                             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = 'DMR+' where borrar = '$SELECCIONINDICATIVO'";
                            red="DMR+"
                            else if [[ $aquered = "HBLINK" ]]
                            then
                                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = 'HBLINK' where borrar = '$SELECCIONINDICATIVO'";
                                red="HBLINK"
                             fi
                         fi
                      fi
                      else if [[ $menuconfigura = "$CONFIGURACION_DSTAR" ]]
                      then
                          CONF-DSTAR
                      fi
                   fi
                fi
            fi
         fi
      fi
   fi
done
}

################   FIN CONFIGURA  DVSWITCH PRINCIPAL   #################################3333

######################################################################################################

##############   INICIO  CONFIGURA DVSWITCH SECUNDARIO   ##########################



function CONFIGURA-DVSWITCH-SECUNDARIO(){

   indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   dmrid=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmrid from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   red=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT red from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reflector from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   ambe=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ambe from dvswitch where borrar  = '$SELECCIONINDICATIVO';")
   usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   ipactiva=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipactiva from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   puertoactivo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoactivo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   passactivo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passactiva from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$SELECCIONINDICATIVO';")


menuconfigura=""
while [ "$menuconfigura" != "$VOLVER" ]; do
   DIALOG=${DIALOG=dialog}
   tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
   trap "rm -f $tempfile" 0 1 2 5 15
   $DIALOG --clear --title "$MENUGENERAL" \
   --menu "" 0 0 0 \
     "$LLAMADA"  "$indicativo" \
     "DMRID" "$dmrid" \
     "$SELECCION_RED2" "$red" \
     "$PUERTO_USRP" "$usrp" \
     "$VOLVER" "" 2> $tempfile
retval=$?
menuconfigura=`cat $tempfile`

if [[ $menuconfigura != "$VOLVER" ]]
then
   if [[ $menuconfigura != "AMBE" && $menuconfigura != "$SELECCION_RED2" && $menuconfigura != "" ]]
   then
      nuevodato=`dialog --stdout --title " " --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
   fi
fi
 if [[ $menuconfigura = "$LLAMADA" ]]
 then
#####################
    # indicativo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")

     sufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select sufijo from dvswitch where borrar = '$SELECCIONINDICATIVO'";)
     if [[ $sufijo > 10 ]]
     then
         dialog --title "$SALIR" --msgbox "$EL_INDICATIVO_NO_MODIFICABLE" 0 0
     else
       borra="$nuevodato&$sufijo"
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET borrar = '$borra' where borrar = '$SELECCIONINDICATIVO'";
       SELECCIONINDICATIVO=$borra
        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET indicativo = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
       indicativo=$nuevodato
     fi
       else if [[ $menuconfigura = "DMRID" ]]
       then
          mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET dmrid = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
         dmrid=$nuevodato
           else if [[ $menuconfigura = "$PUERTO_USRP" ]]
           then
               mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET usrp = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
              usrp=$nuevodato
             sed -i "77s#.*#declare _json_file=/tmp/ABInfo_$usrp.json#" /opt/Analog_Bridge/dvswitch.sh
              else if [[ $menuconfigura = "$SELECCION_RED2" ]]
              then
                    DIALOG=${DIALOG=dialog}
                    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
                    trap "rm -f $tempfile" 0 1 2 5 15
                    $DIALOG --clear --title "$SELECCION_RED2" \
                    --menu "" 0 0 0 \
                    "BM" "" \
                    "DMR+"  "" \
                    "HBLINK" ""  2> $tempfile
                    retval=$?
                    aquered=`cat $tempfile`
                    if [[ $aquered = "BM" ]]
                    then
                         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = 'BM' where borrar = '$SELECCIONINDICATIVO'";
                        red="BM"
                        else if [[ $aquered = "DMR+" ]]
                        then
                             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = 'DMR+' where borrar = '$SELECCIONINDICATIVO'";
                            red="DMR+"
                            else if [[ $aquered = "HBLINK" ]]
                            then
                                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET red = 'HBLINK' where borrar = '$SELECCIONINDICATIVO'";
                                red="HBLINK"
	                            fi
                         fi
                      fi
                   fi
                fi
            fi
         fi
done
}

function ACTUALIZA-REFLECTORES(){
ruta="$PATHDVLINK/HOSTS"
#DMRHOSTS
curl http://hblinkspain.es:81/hosts/DMRHosts.txt > $ruta/DMRHosts.txt
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from dmrhost;"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/$PATHDVLINK/HOSTS/DMRHosts.txt' into table dmrhost FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r';"
#NXDNHOSTS
curl http://hblinkspain.es:81/hosts/NXDNHosts.txt > $ruta/NXDNHosts.txt
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from nxdnhosts;"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/$PATHDVLINK/HOSTS/NXDNHosts.txt' ignore into table nxdnhosts FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r';"
#P25HOSTS
curl http://hblinkspain.es:81/hosts/P25Hosts.txt > $ruta/P25Hosts.txt
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from p25hosts;"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/$PATHDVLINK/HOSTS/P25Hosts.txt' ignore into table p25hosts FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r';"
#YSFHOSTS
curl http://hblinkspain.es:81/hosts/YSFHosts.txt > $ruta/YSFHosts.txt
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from ysfhost;"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '/$PATHDVLINK/HOSTS/YSFHosts.txt' ignore into table ysfhost FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r';"
#BORRO LOS LISTADOS DE LOS MENUS
rm "$PATHDVLINK/MENUS/dmrhost" > /dev/null 2>&1
rm "$PATHDVLINK/MENUS/ysfhost" > /dev/null 2>&1
rm "$PATHDVLINK/MENUS/nxdnhost" > /dev/null 2>&1
rm "$PATHDVLINK/MENUS/p25host" > /dev/null 2>&1

#GENERA MENU DMR
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select name,ip from dmrhost into outfile '/$PATHDVLINK/MENUS/dmrhost';"
#GENERA MENU YSF
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE ysfhost SET startup = REPLACE(startup, ' ', '-');"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ip,startup FROM ysfhost into outfile '/$PATHDVLINK/MENUS/ysfhost';"
#GENERA MENU NXDN
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select tg,ip from nxdnhosts into outfile '/$PATHDVLINK/MENUS/nxdnhost';"
#GENERA MENU P25
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select tg,ip from p25hosts into outfile '/$PATHDVLINK/MENUS/p25host';"
}


##############################    FIN CONFIGURA DVSWITCH SECUNDARIO     ########################################################3

################################################################################################################################################3333333

###############   INICIO  CONFIGURA REDES   ##############################3

function CONFIGURA-REDES(){
   SELECCION-USUARIO
   ipdmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipdmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   puertodmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertodmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   passworddmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passworddmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  reflector from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   ipbm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipbm from dvswitch where borrar  = '$SELECCIONINDICATIVO';")
   puertobm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertobm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   passwordbm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passwordbm from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   iphb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT iphb from dvswitch where borrar  = '$SELECCIONINDICATIVO';")
   puertohb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertohb from dvswitch where borrar = '$SELECCIONINDICATIVO';")
   passwordhb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  passwordhb from dvswitch where borrar = '$SELECCIONINDICATIVO';")

   menuredes=""
   while [ "$menuredes" != "$VOLVER" ]; do
   DIALOG=${DIALOG=dialog}
   tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
   trap "rm -f $tempfile" 0 1 2 5 15
   $DIALOG --clear --title "$REDES_USUARIO" \
   --menu "" 0 0 0 \
     "IP BM"  "$ipbm" \
     "$PUERTO_BM" "$puertobm" \
     "PASSWORD BM" "$passwordbm" \
     "IP DMR+" "$ipdmr" \
     "$PUERTO_DMR" "$puertodmr" \
     "PASSWORD DMR+" "$passworddmr" \
     "$REFLECTOR_INICIO" "$reflector" \
     "IP HBLINK" "$iphb" \
     "$PUERTO_HBLINK" "$puertohb" \
     "PASSWORD HBLINK" "$passwordhb" \
     "$ACTUALIZA_REDES" "" \
     "$VOLVER" "" 2> $tempfile
   retval=$?
   menuredes=`cat $tempfile`

if [[ $menuredes != "$VOLVER" ]]
then
   if [[ $menuredes != "$ACTUALIZA_REDES" && $menuredes != ""  && $menuredes != "IP DMR+" && $menuredes != "IP BM" && $menuredes != "IP HBLINK" && $menuredes != "$PUERTO_HBLINK" ]]
   then
       nuevodato=`dialog --stdout --title " " --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
   fi
fi
   if [[ $menuredes = "IP BM" ]]
   then
      DIALOG=${DIALOG=dialog}
      tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
      trap "rm -f $tempfile" 0 1 2 5 15
      $DIALOG --clear --title "$REDES_USUARIO" \
      --menu "" 0 0 0 \
          "$IP_PERSONALIZADA"  "" \
          "$SELECCIONA_LISTADO" "" 2> $tempfile
      retval=$?
      menuipdmr=`cat $tempfile`
      if [[ $menuipdmr = "$IP_PERSONALIZADA" ]]
      then
          nuevodato=`dialog --stdout --title " " --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipbm = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
          ipbm=$nuevodato
          else if [[ $menuipdmr = "$SELECCIONA_LISTADO" ]]
          then
             #echo "" > "$PATHDVLINK/MENUS/dato"
             DMRLIST="$PATHDVLINK/MENUS/dmrhost"
             whiptail --menu 'Sistemas disponibles' 0 0 0 $(cat $DMRLIST) 2>"$PATHDVLINK/MENUS/dato"
             pivote=$(awk 'NR==1' $PATHDVLINK/MENUS/dato)
                ipbm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ip from dmrhost where name = '$pivote';");
                passwordbm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select password from dmrhost where name = '$pivote';");
                puertobm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select puerto from dmrhost where name = '$pivote';");
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipbm = '$ipbm'  where borrar = '$SELECCIONINDICATIVO'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passwordbm = '$passwordbm' where borrar = '$SELECCIONINDICATIVO'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertobm = '$puertobm' where borrar = '$SELECCIONINDICATIVO'";
            fi
       fi

     else if [[ $menuredes = "$PUERTO_BM" ]]
     then
        if [[ $nuevodato = "" ]]
        then
            nuevodato="62031"
        fi
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertobm = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
        puertobm=$nuevodato
        else if [[ $menuredes = "PASSWORD BM" ]]
        then
            if [[ $nuevodato = "" ]]
            then
                nuevodato="passw0rd"
            fi
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passwordbm = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
            passwordbm=$nuevodato
            else if [[ $menuredes = "IP DMR+" ]]
            then
                DIALOG=${DIALOG=dialog}
                tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
                trap "rm -f $tempfile" 0 1 2 5 15
                $DIALOG --clear --title "$REDES_USUARIO" \
                --menu "" 0 0 0 \
                    "$IP_PERSONALIZADA"  "" \
                    "$SELECCIONA_LISTADO" "" 2> $tempfile
                retval=$?
                menuipdmrmas=`cat $tempfile`
                if [[ $menuipdmrmas = "$IP_PERSONALIZADA" ]]
                then
                   nuevodato=`dialog --stdout --title " " --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipbm = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
                   ipdmr=$nuevodato
                   else if [[ $menuipdmrmas = "$SELECCIONA_LISTADO" ]]
                   then
                      echo "" > "$PATHDVLINK/MENUS/dato"
                      DMRLIST="$PATHDVLINK/MENUS/dmrhost"
                      whiptail --menu 'Sistemas disponibles' 0 0 0 $(cat $DMRLIST) 2> $PATHDVLINK/MENUS/dato
                      pivote=$(awk 'NR==1' $PATHDVLINK/MENUS/dato)
                      ipdmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ip from dmrhost where name = '$pivote';");
                      passworddmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select password from dmrhost where name = '$pivote';");
                      puertodmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select puerto from dmrhost where name = '$pivote';");
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipdmr = '$ipdmr' where borrar = '$SELECCIONINDICATIVO'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passworddmr = '$passworddmr' where borrar = '$SELECCIONINDICATIVO'";
mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertodmr = '$puertodmr' where borrar = '$SELECCIONINDICATIVO'";
                    fi
                  fi

                else if [[ $menuredes = "$PUERTO_DMR" ]]
                then
                    if [[ $nuevodato = "" ]]
                    then
                       nuevodato="55555"
                    fi
                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertodmr = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
                    puertodmr=$nuevodato
                    else if [[ $menuredes = "PASSWORD DMR+" ]]
                    then
                       if [[ $nuevodato = "" ]]
                       then
                           nuevodato="PASSWORD"
                       fi
                        mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passworddmr = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
                       passworddmr=$nuevodato
                       else if [[ $menuredes = "$REFLECTOR_INICIO" ]]
                       then
                          if [[ $nuevodato = "" ]]
                          then
                              nuevodato="4370"
                          fi
                           mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET reflector = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
                          reflector=$nuevodato
                          else if [[ $menuredes = "IP HBLINK" ]]
                          then
                             DIALOG=${DIALOG=dialog}
                             tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
                             trap "rm -f $tempfile" 0 1 2 5 15
                             $DIALOG --clear --title "$REDES_USUARIO" \
                             --menu "" 0 0 0 \
                                 "$IP_PERSONALIZADA"  "" \
                                 "$SELECCIONA_LISTADO" "" 2> $tempfile
                             retval=$?
                             menuipdmrhb=`cat $tempfile`
                             if [[ $menuipdmrhb = "$IP_PERSONALIZADA" ]]
                             then
                                 nuevodato=`dialog --stdout --title " " --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                 if [[ $nuevodato = "" ]]
                                 then
                                     nuevodato="127.0.0.1"
                                 fi
                                  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET iphb = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
                                 iphb=$nuevodato
                              else if [[ $menuipdmrhb = "$SELECCIONA_LISTADO" ]]
                              then
                                    #echo "" > $PATHDVLINK/MENUS/dato
                                    DMRLIST="$PATHDVLINK/MENUS/dmrhost"
                                    whiptail --menu 'Sistemas disponibles' 0 0 0 $(cat $DMRLIST) 2>$PATHDVLINK/MENUS/dato
                                    pivote=$(awk 'NR==1' $PATHDVLINK/MENUS/dato)
                      iphb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select ip from dmrhost where name = '$pivote';");
                      passwordhb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select password from dmrhost where name = '$pivote';");
                      puertohb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select puerto from dmrhost where name = '$pivote';");

  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET iphb = '$iphb'  where borrar = '$SELECCIONINDICATIVO'";
  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passwordhb = '$passwordhb' where borrar = '$SELECCIONINDICATIVO'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertohb = '$puertohb' where borrar = '$SELECCIONINDICATIVO'";
                                   fi
                               fi

                             else if [[ $menuredes = "$PUERTO_HBLINK" ]]
                             then
                                 nuevodato=`dialog --stdout --title " " --inputbox "$ESCRIBE_NUEVO_VALOR" 0 0`
                                 if [[ $nuevodato = "" ]]
                                 then
                                     nuevodato="46201"
                                 fi
                                  mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertohb = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
                                 puertohb=$nuevodato
                                 else if [[ $menuredes = "PASSWORD HBLINK" ]]
                                 then
                                     if [[ $nuevodato = "" ]]
                                     then
                                         nuevodato="passw0rd"
                                     fi
                                      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passwordhb = '$nuevodato' where borrar = '$SELECCIONINDICATIVO'";
                                     passwordhb=$nuevodato
                                     else if [[ $menuredes = "$ACTUALIZA_REDES" ]]
                                     then
                                         ACTUALIZA-REFLECTORES 
  # rm $PATHDVLINK/bm > /dev/null 2>&1
                                         # rm $PATHDVLINK/dmr > /dev/null 2>&1
                                         # rm $PATHDVLINK/DMR_Hosts.txt > /dev/null 2>&1

                                         #cd $PATHDVLINK/ > /dev/null 2>&1
                                         #wget http://www.pistar.uk/downloads/DMR_Hosts.txt > /dev/null 2>&1

                                         #grep -v "#" $PATHDVLINK/DMR_Hosts.txt | sed -e '/^$/d' > $PATHDVLINK/pivot
                                         #awk '{ $2 = ""; print>"$PATHDVLINK/DMR_Hosts.txt" }' $PATHDVLINK/pivot

                                          #cat $PATHDVLINK/DMR_Hosts.txt | grep -oE 'TGIF.*' > $PATHDVLINK/bm
                                          #cat $PATHDVLINK/DMR_Hosts.txt | grep -oE 'BM.*' >> $PATHDVLINK/bm
                                          #cat $PATHDVLINK/DMR_Hosts.txt | grep -oE 'XLX.*' >> $PATHDVLINK/bm

                                          # rm $PATHDVLINK/bmlist > /dev/null 2>&1
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from dmrhost;"
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '$PATHDVLINK/bm' ignore into table dmrhost fields terminated by ' ';"
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select Columna1,Columna3 from dmrhost where Columna3 <> '' into outfile '$PATHDVLINK/bmlist';"

                                        #  cat $PATHDVLINK/DMR_Hosts.txt | grep -oE 'TGIF.*' > $PATHDVLINK/dmr
                                        #  cat $PATHDVLINK/DMR_Hosts.txt | grep -oE 'DMR+.*' >> $PATHDVLINK/dmr
                                        #  cat $PATHDVLINK/DMR_Hosts.txt | grep -oE 'XLX.*' >> $PATHDVLINK/dmr

                                        #   rm $PATHDVLINK/dmrlist > /dev/null 2>&1
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from dmrhost;"
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '$PATHDVLINK/dmr' ignore into table dmrhost fields terminated by ' ';"
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select Columna1,Columna3 from dmrhost where Columna3 <> '' into outfile '$PATHDVLINK/dmrlist';"

 #                                         cat $PATHDVLINK/DMR_Hosts.txt | grep -oE 'TGIF.*' > $PATHDVLINK/hblink
 #                                         cat $PATHDVLINK/DMR_Hosts.txt | grep -oE 'HB.*' >> $PATHDVLINK/hblink
 #                                         cat $PATHDVLINK/DMR_Hosts.txt | grep -oE 'XLX.*' >> $PATHDVLINK/hblink

 #                                          rm $PATHDVLINK/hblinklist > /dev/null 2>&1
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from dmrhost;"
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '$PATHDVLINK/hblink' ignore into table dmrhost fields terminated by ' ';"
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select Columna1,wColumna3 from dmrhost where Columna3 <> '' into outfile '$PATHDVLINK/hblinklist';"

# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "delete from dmrhost;"
# mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "load data infile '$PATHDVLINK/DMR_Hosts.txt' ignore into table dmrhost fields terminated by ' ';"
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
}


##############     FIN  CONFIGURAR REDES     ############################3

#####################################################################################################

##############     INICIO SELECCION-USUARIO   ###########################################

function SELECCION-USUARIO(){

dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT borrar from dvswitch;")
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
retval=$?
SELECCIONINDICATIVO=`cat $tempfile`
echo $SELECCIONINDICATIVO
}

##############     FIN SELECCION-USUARIO     ############################################

#########################################################################################################################################3

###############   INICIO AÑADIR USUARIO     ########################################
function CALCULO-SUFIJO(){
valido="0"
while [ $valido = "0" ]; do
  c=$(($RANDOM%99))
  if [[ $c -gt 10 ]] && [[ $c -lt 99 ]]
  then
      sufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM dvswitch where sufijo = '$c'";)
      if [ $sufijo = "0" ]
      then
          valido="1"
      fi
  fi
done
sufijook=$c
}

function AÑADIR-USUARIO(){

#echo $mensaje1 > $PATHDVLINK/MENUS/disclaimer.txt
#echo $mensaje2 >> $PATHDVLINK/MENUS/disclaimer.txt
#echo $mensaje3 >> $PATHDVLINK/MENUS/disclaimer.txt
#echo $mensaje4 >> $PATHDVLINK/MENUS/disclaimer.txt
#echo $mensaje5 >> $PATHDVLINK/MENUS/disclaimer.txt
#echo "$CODEC_EXPERIMENTAL" >> $PATHDVLINK/MENUS/disclaimer.txt

dialog --title "" --textbox "$PATHDVLINK/MENUS/disclaimer.txt" 0 0
if dialog --title ""  --yesno "$ACEPTA_CONDICIONES" 0 0 ;then
   CALLSIGN=`dialog --stdout --title "" --inputbox "$INDICATIVO_USUARIO" 0 0`
   variable=$(echo $CALLSIGN | tr '[:lower:]' '[:upper:]')
   CALLSIGN=$variable
   ban=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM con where con1 = '$CALLSIGN';")
   if [[ $ban -ge 1 ]]
   then
	exit 0
   fi
   NUEVOID=`dialog --stdout --title "" --inputbox "$ESCRIBEDMRID" 0 0`
   usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch order by usrp desc limit 0,1;")
   USRPOK=`expr $usrp + 1`
   echo "$SE_GENERA_NUEVO_USUARIO" > $PATHDVLINK/MENUS/nuevouser
   echo "" >> $PATHDVLINK/MENUS/nuevouser
   echo "" >> $PATHDVLINK/MENUS/nuevouser
   echo "" >> $PATHDVLINK/MENUS/nuevouser
   echo "$LLAMADA   : " $CALLSIGN >> $PATHDVLINK/MENUS/nuevouser
   echo "DMR ID       : " $NUEVOID >> $PATHDVLINK/MENUS/nuevouser
   echo "$PUERTO_USRP  : " $USRPOK >> $PATHDVLINK/MENUS/nuevouser
   echo "" >> $PATHDVLINK/MENUS/nuevouser
   echo "" >> $PATHDVLINK/MENUS/nuevouser
   echo "$SE_PEDIRA_CONFIRMACION" >> $PATHFICHERO
   dialog --title "" --textbox $PATHDVLINK/MENUS/nuevouser 0 0
   if dialog --title ""  --yesno "$QUIERES_GRABAR_USUARIO" 0 0 ;then
      echo "$CREANDO_USUARIO"
      SEC="SECUNDARIO"
      red=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT red from dvswitch where tipousuario = 'PRIMARIO';")
      reflector=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT reflector from dvswitch where tipousuario = 'PRIMARIO';")
      ambe=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ambe from dvswitch where tipousuario = 'PRIMARIO';")
      usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch order by usrp desc limit 0,1;")
      ipbm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipbm from dvswitch where tipousuario = 'PRIMARIO';")
      puertobm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertobm from dvswitch where tipousuario = 'PRIMARIO';")
      passwordbm=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passwordbm from dvswitch where tipousuario = 'PRIMARIO';")
      ipdmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipdmr from dvswitch where tipousuario = 'PRIMARIO';")
      puertodmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertodmr from dvswitch where tipousuario = 'PRIMARIO';")
      passworddmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passworddmr from dvswitch where tipousuario = 'PRIMARIO';")
      iphb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT iphb from dvswitch where tipousuario = 'PRIMARIO';")
      puertohb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertohb from dvswitch where tipousuario = 'PRIMARIO';")
      passwordhb=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT  passwordhb from dvswitch where tipousuario = 'PRIMARIO';")
      ipactiva=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT ipactiva from dvswitch where tipousuario = 'PRIMARIO';")
      puertoactivo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT puertoactivo from dvswitch where tipousuario = 'PRIMARIO';")
      passactiva=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT passactiva from dvswitch where tipousuario = 'PRIMARIO';")
      txdmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txdmr from dvswitch order by txdmr desc limit 0,1;")
      rxdmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxdmr from dvswitch order by rxdmr desc limit 0,1;")
      txysf=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT txysf from dvswitch order by txysf desc limit 0,1;")
      rxysf=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT rxysf from dvswitch order by rxysf desc limit 0,1;")
      emuport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT 380port from dvswitch order by 380port desc limit 0,1;")
      sufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT sufijo from dvswitch order by sufijo desc limit 0,1;")
      txwideport=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tgfijo from dvswitch order by tgfijo desc limit 0,1;")
      txwideportok=`expr $txwideport + 1`
      txdmrok=`expr $txdmr + 1`
      rxdmrok=`expr $rxdmr + 1`
      txysfok=`expr $txysf + 1`
      rxysfok=`expr $rxysf + 1`
      CALCULO-SUFIJO
      #sufijook=`expr $sufijo + 1`
      emuportok=`expr $emuport + 1`
      USRPOK=`expr $usrp + 1`
      MM="/opt/MM-SECUNDARIOS/$CALLSIGN$sufijook/"
      AB="/opt/AB-SECUNDARIOS/$CALLSIGN$sufijook/"
      EMU="/opt/EMU-SECUNDARIOS/$CALLSIGN$sufijook/"
      borra="$CALLSIGN&$sufijook"
      ruta1="nxdn.ini"
      ruta1="$AB$ruta1"
      ruta2="p25.ini"
      ruta2="$AB$ruta2"
      c="p25.ini"
      ruta3="dstar.ini"
      ruta3="$AB$ruta3"
       mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "INSERT INTO dvswitch (tgfijo,borrar,indicativo,dmrid,red,reflector,ambe,usrp,ipbm,puertobm,passwordbm,ipdmr,puertodmr,passworddmr,iphb,puertohb,passwordhb,ipactiva,puertoactivo,passactiva,tipousuario,pathmmdvm,pathanalog,pathmd380,txdmr,rxdmr,txysf,rxysf,380port,sufijo) values ('$txwideportok','$borra','$CALLSIGN','$NUEVOID','$red','$reflector','EMULADO','$USRPOK','$ipbm','$puertobm','$passwordbm','$ipdmr','$puertodmr','$passworddmr','$iphb','$puertohb','$passwordhb','$ipactiva','$puertoactivo','$passactiva','$SEC','$MM','$AB','$EMU','$txdmrok','$rxdmrok','$txysfok','$rxysfok','$emuportok','$sufijook');"
      echo $CREANDO_PERFIL_SECUNDARIO
      SELECCIONINDICATIVO=$borra
       mkdir $MM > /dev/null 2>&1
       mkdir $AB > /dev/null 2>&1
       mkdir $EMU > /dev/null 2>&1
      #log="/var/log/mmdvm$CALLSIGN$sufijook"
      # mkdir $log > /dev/null 2>&1
       cp -rf /opt/MMDVM_Bridge/* $MM > /dev/null 2>&1
       cp -rf /opt/Analog_Bridge/* $AB > /dev/null 2>&1
       rm $ruta1 > /dev/null 2>&1
       rm $ruta2 > /dev/null 2>&1
       rm $ruta3 > /dev/null 2>&1
       cp -rf /opt/md380-emu/* $EMU > /dev/null 2>&1
       rm $PATHDVLINK/MENUS/nuevouser > /dev/null 2>&1
       chmod 666 /dev/null
   else
      dialog --title "$SALIR" --msgbox "$NO_GUARDADO" 0 0
   fi

else
    dialog --title "" --msgbox "$CONDICIONES_NO_ACEPTADAS" 0 0
fi



}

###############   FIN AÑADIR USUARIIO     ########################################

#########################################################################################################################################


###############   INICIO BORRAR USUARIIO     ########################################

function BORRAR-USUARIO(){
dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT count(*) FROM dvswitch where tipousuario = 'SECUNDARIO';")
#echo $dbquery
if [[ $dbquery != 0 ]]
then
    dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT borrar from dvswitch where tipousuario = 'SECUNDARIO' order by sufijo asc;")
    array=($(for i in $dbquery;do echo $i;done))
    c=""
    for i in ${array[@]}
    do
      c=$c"$i \""\"' '
    done
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --clear --title "" --menu "$SELECCIONA_USUARIO. $SE_PEDIRA_CONFIRMACION" 0 0 0   $c 2> $tempfile
    retval=$?
    borraindicativo=`cat $tempfile`
    if [[ $borraindicativo != "" ]]
    then
      if dialog --title "$BORRAR $borraindicativo?"  --yesno "$BORRAR_USUARIO $borraindicativo?" 0 0 ;then
        echo $BORRANDOUSUARIO
        in=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$borraindicativo';")
        su=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT sufijo from dvswitch where borrar = '$borraindicativo';")
 #WEBPROXY
	echo "Parando Dashboard"
        rm -r /var/www/html/$su > /dev/null 2>&1
        rm -r /opt/WEBPROXY-SECUNDARIOS/$su > /dev/null 2>&1
        systemctl stop webproxy$su.service
        systemctl disable webproxy$su.service
 #MMDVM
        echo $PARANDOSERVICIOS
         systemctl stop mmdvm$in$su  > /dev/null 2>&1
         systemctl disable mmdvm$in$su > /dev/null 2>&1
         rm /etc/systemd/system/mmdvm$in$su.service > /dev/null 2>&1
         rm -r /var/log/mmdvm$in$su > /dev/null 2>&1
         rm -r /var/log/mmdvm$su > /dev/null 2>&1
         systemctl daemon-reload > /dev/null 2>&1
         systemctl reset-failed > /dev/null 2>&1
 #ANALOG
         systemctl stop analog$in$su > /dev/null 2>&1
         systemctl disable analog$in$su > /dev/null 2>&1
         rm /etc/systemd/system/analog$in$su.service > /dev/null 2>&1
         systemctl daemon-reload > /dev/null 2>&1
         systemctl reset-failed > /dev/null 2>&1
 #MD380
         systemctl stop md380$in$su > /dev/null 2>&1
	 systemctl disable md380$in$su > /dev/null 2>&1
         rm /etc/systemd/system/md380$in$su.service > /dev/null 2>&1
         systemctl daemon-reload > /dev/null 2>&1
         systemctl reset-failed > /dev/null 2>&1
        e="/opt/EMU-SECUNDARIOS/$in$su" 
        a="/opt/AB-SECUNDARIOS/$in$su"
        m="/opt/MM-SECUNDARIOS/$in$su"
         rm -rf $e > /dev/null 2>&1
         rm -rf $a > /dev/null 2>&1
         rm -rf $m > /dev/null 2>&1
#ab-restart
        echo $BORRANDO_CONFIGURACIONES_ANTERIORES
        m="/usr/local/sbin/$in$su-restart.sh"
	 rm $m > /dev/null 2>&1 
        ruta="/tmp/$sufijo" > /dev/null 2>&1
         rm $ruta > /dev/null 2>&1
        #ruta="/tmp/ABInfo_$usrp"
        #c="."
        #d="json"
        #ruta="$ruta$c$d"
        # rm $ruta /dev/null 2>&1
         chmod 666 /dev/null
        dbquery=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "DELETE FROM dvswitch WHERE borrar = '$borraindicativo';")
        dialog --title "$SALIR" --msgbox "$USER $borraindicativo $BORRADO_TERMINADO" 0 0
        SELECCIONINDICATIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT borrar from dvswitch where tipousuario = 'PRIMARIO';")
      else
       dialog --title "$SALIR" --msgbox "$USERNOBORRADO" 0 0
       SELECCIONINDICATIVO=$borraindicativo
      fi
    fi
else
     dialog --title "$SALIR" --msgbox "$NO_HAY_SECUNDARIOS" 0 0
fi
}
###############   FIN BORRAR USUARIIO     ########################################

#######################################################################################################################################

###############   INICIO REPORTE ERRORES     ########################################


function REPORTE-ERRORES() {

if dialog --title ""  --yesno "$ERROR_DVSWITCH" 0 0 ;then
    dialog --title "OK" --msgbox "$SE_ENVIARA_COMENTARIOS" 0 0
    INDICATIVOREPORTE=`dialog --stdout --title "" --inputbox "$ESCRIBE_INDICATIVO" 0 0`
    MAILREPORTE=`dialog --stdout --title "$REPORTE_ERROR_DVSWITCH" --inputbox "$DIRECCION_CORREO" 0 0`
    echo $RECOPILANDO
    DIA=`date +"%d%m%Y"`
    HORA=`date +"%H%M"`
    QUIEN="$INDICATIVO$DIA$HORA"
    CAMINO="$PATHDVLINK/MENUS/$QUIEN"
    CAMINOREP="$CAMINO/reporte.txt"
     mkdir $CAMINO  > /dev/null 2>&1
    > $CAMINOREP
    IN='"'
    echo $IN >> $CAMINOREP
    echo "Mensaje de: $INDICATIVOREPORTE" >> $CAMINOREP
    echo "Mail contacto: $MAILREPORTE" >> $CAMINOREP
    echo "" >> $CAMINOREP
    dialog --title "Describe el error" --editbox $CAMINOREP 60 80 2> $PATHDVLINK/MENUS/INPUT
    cp $PATHDVLINK/MENUS/INPUT $CAMINOREP  > /dev/null 2>&1
    echo $IN >> $CAMINOREP
     cp -r /opt/Analog_Bridge/Analog_Bridge.ini $CAMINO  > /dev/null 2>&1
     cp -r /opt/MMDVM_Bridge/MMDVM_Bridge.ini $CAMINO  > /dev/null 2>&1
    # cp -r /opt/AB-SECUNDARIOS $CAMINO  > /dev/null 2>&1
    # cp -r /opt/MM-SECUNDARIOS $CAMINO  > /dev/null 2>&1
     cp /etc/ircddbgateway $CAMINO  > /dev/null 2>&1
    if dialog --title ""  --yesno "$SE_ENVIARA_INFORMACION" 0 0 ;then
       echo $ENVIANDO
       PAQ="$PATHDVLINK/MENUS/$INDICATIVOREPORTE-$DIA-$HORA.tar.gz"
       tar -czvf $PAQ $CAMINO  > /dev/null 2>&1
       CUERPO=` cat $CAMINOREP`
       echo $CUERPO |  mutt -s "Reporte error $INDICATIVOREPORTE" soportedvlink@gmail.com -a $PAQ
       VERES=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT version from admin;")
       mensaje="REPORTE DE ERROR EN DVLINK V$VERES: $CUERPO"
       dpkg-debte "$mensaje" 1

       dialog --title "$REPORTEENVIADO" --msgbox "$REPORTEENVIADO" 0 0
    fi
    echo $BORRANDOTEMPORALES
     rm -r $CAMINO  > /dev/null 2>&1
     rm -r $PAQ > /dev/null 2>&1
     rm $PATHDVLINK/MENUS/email.log  > /dev/null 2>&1
     rm $PATHDVLINK/MENUS/INPUT  > /dev/null 2>&1
     rm $PATHDVLINK/MENUS/dead.letter  > /dev/null 2>&1
fi

}
function AVANZADO(){
SELECCION-USUARIO
tipos=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tipousuario from dvswitch where borrar = '$SELECCIONINDICATIVO';")
indi=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
suf=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT sufijo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
if [[ $tipos = "PRIMARIO" ]]
then
   dvs=" /opt/Analog_Bridge/dvswitch.sh"
else
   dvs=" /opt/AB-SECUNDARIOS/$indi$suf/dvswitch.sh "
fi
###############VERIFICAR

usrp=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$SELECCIONINDICATIVO';")
echo "/tmp/ABInfo_$usrp.json" > $PATHDVLINK/MIRUTA

############ vERIFICAR

while [ "$menuavanzado" != "$SALIR" ]; do
  DIALOG=${DIALOG=dialog}
  tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
  trap "rm -f $tempfile" 0 1 2 5 15
  $DIALOG --clear --title "DVSWITCH $ACTIVO" \
  --menu "" 0 0 0 \
    "$ENVIAR_MENSAJE" "" \
    "────────────────────────────────" "" \
    "$ACTUALIZAR_BD_ID_CALL" "" \
    "$ACTUALIZAR_LISTADO_REFLECTORES" "" \
    "────────────────────────────────" "" \
    "$CAMBIO_DE_RED" "" \
    "$CAMBIAR_GANANCIA_TX" "" \
    "$CAMBIAR_GANACIA_RX" "" \
    "────────────────────────────────" "" \
    "$VER_VERSION_DVSWITCH" "" \
    "$VER_CONFIGURACION_DVSWITCH" "" \
    "────────────────────────────────" "" \
    "$MODO_EXPERTO" "" \
    "$REINICIO_USER_DVSWITCH" "" \
    "────────────────────────────────" "" \
    "$SALIR" "" 2> $tempfile
  retval=$?
  menuavanzado=`cat $tempfile`

  if [[ $menuavanzado = "$ENVIAR_MENSAJE" ]]
  then
     nuevodato=`dialog --stdout --title "" --inputbox "$MENSAJE" 0 0`
     $dvs message $nuevodato
     else if [[ $menuavanzado = "$CAMBIO_DE_RED" ]]
     then
       if [[ $tipos = "PRIMARIO" ]]
       then
       DIALOG=${DIALOG=dialog}
       tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
       trap "rm -f $tempfile" 0 1 2 5 15
       $DIALOG --clear --title "DVSWITCH $ACTIVO" \
       --menu "" 0 0 0 \
         "DMR" "" \
         "FUSION" "" \
         "DSTAR" "" \
         "P25" "" \
         "NXDN" "" 2> $tempfile
       retval=$?
       menumodo=`cat $tempfile`
       else 
       DIALOG=${DIALOG=dialog}
       tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
       trap "rm -f $tempfile" 0 1 2 5 15
       $DIALOG --clear --title "DVSWITCH $ACTIVO" \
       --menu "" 0 0 0 \
         "DMR" "" \
         "FUSION" "" 2> $tempfile
         retval=$?
         menumodo=`cat $tempfile`
       fi
       if [[ $menumodo = "DMR" ]]
       then
         dvsmodo="$dvs mode DMR" 
         $dvsmodo
         echo $dvsmodo
         else if [[ $menumodo = "FUSION" ]]
         then
           dvsmodo="$dvs mode YSF"
          echo $dvsmodo
          $dvsmodo
          else if [[ $menumodo = "DSTAR" ]]
          then
              dvsmodo="$dvs mode DSTAR"
              $dvsmodo
              else if [[ $menumodo = "P25" ]]
              then
                 dvsmodo="$dvs mode P25"
                 $dvsmodo
                 else if [[ $menumodo = "NXDN" ]]
                 then
                    dvsmodo="$dvs mode NXDN"
                    $dvsmodo
                 fi
              fi
           fi
         fi
       fi
       dialog --title "OK" --msgbox "$CAMBIO_A $menumodo OK" 0 0
       else if [[ $menuavanzado = "$ACTUALIZAR_BD_ID_CALL" ]]
       then
          dmsmodo="$dvs update"
          $dvsmodo
          dialog --title "OK" --msgbox "$Actualizacion OK" 0 0
          else if [[ $menuavanzado = "$ACTUALIZAR_LISTADO_REFLECTORES" ]]
          then
            dvsmodo="$dvs collectProcessPushDataFilesHTTP"
            $dvsmodo
            dialog --title "OK" --msgbox "OK" 0 0
            else if [[ $menuavanzado = "$CAMBIAR_GANANCIA_TX" ]]
            then
               nuevodato=`dialog --stdout --title "Ganancia TX" --inputbox "$GANANCIA_TX" 0 0`
               dvsmodo="$dvs tlvGain gain $nuevodato"
               $dvsmodo
               else if [[ $menuavanzado = "$CAMBIAR_GANACIA_RX" ]]
               then
                  nuevodato=`dialog --stdout --title "Ganancia RX" --inputbox "$GANACIA_RX" 0 0`
                  dvsmodo="$dvs usrpAudio gain $nuevodato"
                  $dvsmodo
                  else if [[ $menuavanzado = "$VER_VERSION_DVSWITCH" ]]
                  then
                     $dvs version > $PATHDVLINK/MENUS/verdv
                     dialog --title "" --textbox $PATHDVLINK/MENUS/verdv 0 0
                     else if [[ $menuavanzado = "$VER_CONFIGURACION_DVSWITCH" ]]
                     then
                        #echo $dvs
                        #echo "/tmp/ABInfo_$usrp.json" > $PATHDVLINK/MIRUTA
                        $dvs show > $PATHDVLINK/MENUS/confdv
                        dialog --title "" --textbox $PATHDVLINK/MENUS/confdv 0 0
                        else if [[ $menuavanzado = "$MODO_EXPERTO" ]]
                        then
                            if [[ $tipos = "PRIMARIO" ]]
                            then
                                if dialog --title "EXPERT?"  --yesno "Edit Analog_Bridge (YES), MMDVM_Bridge (NO)?" 0 0 ;then
                                     nano /opt/Analog_Bridge/Analog_Bridge.ini
                                else
                                     nano /opt/MMDVM_Bridge/MMDVM_Bridge.ini
                                fi 
                            else
                                MM="/opt/MM-SECUNDARIOS/$indi$suf/MMDVM_Bridge.ini"
                                AB="/opt/AB-SECUNDARIOS/$indi$suf/Analog_Bridge.ini"
                                if dialog --title "EXPERT?"  --yesno "Edit Analog_Bridge (YES), MMDVM_Bridge (NO)?" 0 0 ;then
                                    nano $AB
                                else
                                    nano $MM
                                fi

                             fi
                             else if [[ $menuavanzado = "$REINICIO_USER_DVSWITCH" ]]
                             then
                                  if [[ $tipos = "PRIMARIO" ]]
                                  then
                                       systemctl restart analog_bridge.service
                                       systemctl restart mmdvm_bridge.service
                                       systemctl stop p25gateway.service
                                       systemctl start p25gateway.service
                                       systemctl stop nxdngateway.service
                                       systemctl start nxdngateway.service
                                  else
                                       systemctl restart analog$indi$suf.service
                                       systemctl restart mmdvm$indi$suf.service
                                  fi
                                  dialog --title "Reset" --msgbox "$REINICIO_OK" 0 0
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
export ABINFO=""
done
menuavanzado=""
}
###############   FIN REPORTE ERRORES     ########################################


function INFO(){

 SELECCION-USUARIO

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

   menuinfo=""
   while [ "$menuinfo" != "$VOLVER" ]; do
   DIALOG=${DIALOG=dialog}
   tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
   trap "rm -f $tempfile" 0 1 2 5 15
   $DIALOG --clear --title "Menu INFO" \
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
     "Talker alias" "$talkeralias" \
     "$VOLVER" "" 2> $tempfile
   retval=$?
   menuinfo=`cat $tempfile`

if [[ $menuinfo = "RX Frequency" ]]
then
    CIFRAS
    rxfreq=$numero
    #rxfreq=`dialog --stdout --title "INFO" --inputbox "RX Frequency" 0 0`
     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET rxfreq = '$rxfreq' where borrar = '$SELECCIONINDICATIVO'";
    else if [[ $menuinfo = "TX Frequency" ]]
    then
        CIFRAS
        txfreq=$numero
        #txfreq=`dialog --stdout --title "INFO" --inputbox "TX Frequency" 0 0`
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET txfreq = '$txfreq' where borrar = '$SELECCIONINDICATIVO'";
        else if [[ $menuinfo = "Power" ]]
        then
           power=`dialog --stdout --title "INFO" --inputbox "Power" 0 0`
            mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET power = '$power' where borrar = '$SELECCIONINDICATIVO'";
           else if [[ $menuinfo = "Latitude" ]]
           then
              latitude=`dialog --stdout --title "INFO" --inputbox "Latitude" 0 0`
               mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET latitude = '$latitude' where borrar = '$SELECCIONINDICATIVO'";
              else if [[ $menuinfo = "Longitude" ]]
              then
                  longitude=`dialog --stdout --title "INFO" --inputbox "Longitude" 0 0`
                   mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET longitude = '$longitude' where borrar = '$SELECCIONINDICATIVO'";
                  else if [[ $menuinfo = "Height" ]]
                  then
                     height=`dialog --stdout --title "INFO" --inputbox "Height" 0 0`
                      mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET height = '$height' where borrar = '$SELECCIONINDICATIVO'";
                     else if [[ $menuinfo = "Location" ]]
                     then
                        location=`dialog --stdout --title "INFO" --inputbox "Location" 0 0`
                         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET location = '$location' where borrar = '$SELECCIONINDICATIVO'";
                        else if [[ $menuinfo = "Description" ]]
                        then
                            description=`dialog --stdout --title "INFO" --inputbox "Description" 0 0`
                             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET description = '$description' where borrar = '$SELECCIONINDICATIVO'";
                            else if [[ $menuinfo = "URL" ]]
                            then
                                url=`dialog --stdout --title "INFO" --inputbox "URL" 0 0`
                                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET url = '$url' where borrar = '$SELECCIONINDICATIVO'";
                                else if [[ $menuinfo = "Talker alias" ]]
                                then
                                    talkeralias=`dialog --stdout --title "INFO" --inputbox "Talker alias" 0 0`
                                     mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET idiomanxdnp25 = '$talkeralias' where borrar = '$SELECCIONINDICATIVO'";
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


function MODOS-ACTIVOS-PRIMARIO(){

dstar=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dstar from dvswitch where borrar = '$SELECCIONINDICATIVO';")
dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
p25=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT p25 from dvswitch where borrar = '$SELECCIONINDICATIVO';")
nxdn=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT nxdn from dvswitch where borrar = '$SELECCIONINDICATIVO';")
fusion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusion from dvswitch where borrar = '$SELECCIONINDICATIVO';")

adstar="ON"
admr="ON"
ap25="ON"
anxdn="ON"
afusion="ON"

if [[ $dstar = 0 ]]
then
  adstar="OFF"
fi
if [[ $dmr = 0 ]]
then
  admr="OFF"
fi
if [[ $p25 = 0 ]]
then
  ap25="OFF"
fi
if [[ $nxdn = 0 ]]
then
  anxdn="OFF"
fi
if [[ $fusion = 0 ]]
then
    afusion="OFF"
fi
 modosactivos=$( dialog --stdout \
        --separate-output \
        --checklist 'Selecciona sistemas que estaran activos:' 0 0 0 \
        DSTAR  '' $adstar  \
        DMR  '' $admr  \
        P25 '' $ap25 \
        NXDN '' $anxdn  \
        FUSION  '' $afusion )
adstar="ON"
admr="ON"
ap25="ON"
anxdn="ON"
afusion="ON"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET fusion = '0' where borrar = '$SELECCIONINDICATIVO'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET dmr = '0' where borrar = '$SELECCIONINDICATIVO'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '0' where nombre = 'PRIMARIONOBORRAR'";
 #mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET enuso = '0' where nombre = 'PRIMARIONOBORRAR'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET dstar = '0' where borrar = '$SELECCIONINDICATIVO'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET p25 = '0' where borrar = '$SELECCIONINDICATIVO'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET nxdn = '0' where borrar = '$SELECCIONINDICATIVO'";

echo "$modosactivos" | while read seleccion
do
if [[ $seleccion = "DSTAR" ]]
then
   echo $seleeccion
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET dstar = '1' where nombre = 'PRIMARIONOBORRAR'";
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET dstar = '1' where borrar = '$SELECCIONINDICATIVO'";
#    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE hotspot SET enuso = '1' where nombre = 'PRIMARIONOBORRAR'";
fi
if [[ $seleccion = "DMR" ]]
then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET dmr = '1' where borrar = '$SELECCIONINDICATIVO'";
fi
if [[ $seleccion = "P25" ]]
then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET p25 = '1' where borrar = '$SELECCIONINDICATIVO'";
fi
if [[ $seleccion = "NXDN" ]]
then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET nxdn = '1' where borrar = '$SELECCIONINDICATIVO'";
fi
if [[ $seleccion = "FUSION" ]]
then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET fusion = '1' where borrar = '$SELECCIONINDICATIVO'";
fi
done

}

function MODOS-ACTIVOS-SECUNDARIO(){

dmr=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT dmr from dvswitch where borrar = '$SELECCIONINDICATIVO';")
fusion=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT fusion from dvswitch where borrar = '$SELECCIONINDICATIVO';")

admr="ON"
afusion="ON"

if [[ $dmr = 0 ]]
then
  admr="OFF"
fi
if [[ $fusion = 0 ]]
then
    afusion="OFF"
fi
 modosactivos=$( dialog --stdout \
        --separate-output \
        --checklist 'Selecciona sistemas que estaran activos:' 0 0 0 \
        DMR  '' $admr  \
        FUSION  '' $afusion )
admr="ON"
afusion="ON"
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET fusion = '0' where borrar = '$SELECCIONINDICATIVO'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET dmr = '0' where borrar = '$SELECCIONINDICATIVO'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET dstar = '0' where borrar = '$SELECCIONINDICATIVO'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET p25 = '0' where borrar = '$SELECCIONINDICATIVO'";
 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET nxdn = '0' where borrar = '$SELECCIONINDICATIVO'";

echo "$modosactivos" | while read seleccion
do
if [[ $seleccion = "DMR" ]]
then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET dmr = '1' where borrar = '$SELECCIONINDICATIVO'";
fi
if [[ $seleccion = "FUSION" ]]
then
    mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET fusion = '1' where borrar = '$SELECCIONINDICATIVO'";
fi
done

}

###########   INICIO SCRIPT    ##############################################
#IDIOMA
function MENUANTIGUO(){
SELECCIONINDICATIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT borrar from dvswitch where tipousuario = 'PRIMARIO';")
while [ "$menudvswitch" != "$SALIR" ]; do
ACTIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15

    $DIALOG --backtitle "DVLINK DVSWITCH v$VERSIONPI" --title "DVSWITCH $ACTIVO" \
        --menu "" 0 0 0 \
        "$CONFIGURACION_PERSONAL" "" \
        "$REDES_USUARIO" "" \
        "$INFORMACION_GENERAL" "" \
        "$SISTEMAS_ACTIVOS" "" \
        "────────────────────────────────" "" \
        "$ANADIR_USUARIO" "" \
        "$BORRAR_USUARIO" "" \
        "────────────────────────────────" "" \
        "$APLICAR_CONFIGURACIONES" "" \
        "────────────────────────────────" "" \
        "$VER_ACTIDAD_DVSWITCH" "" \
        "────────────────────────────────" "" \
        "$AVANZADO" "" \
        "$REPORTE_ERROR_DVSWITCH" "" \
        "────────────────────────────────" "" \
        "$SALIR" "" 2> $tempfile
     retval=$?
      menudvswitch=`cat $tempfile`


    if [[ $menudvswitch = "$SELECCIONA_USUARIO" ]]
    then
        SELECCION-USUARIO
        else if [[ $menudvswitch = "$CONFIGURACION_PERSONAL" ]]
        then
            SELECCION-USUARIO
            tipo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tipousuario from dvswitch where borrar = '$SELECCIONINDICATIVO';")
            if [[ $tipo = "PRIMARIO" ]]
            then
                CONFIGURA-DVSWITCH-PRINCIPAL
                else if [[ $tipo = "SECUNDARIO" ]]
                then
		   CONFIGURA-DVSWITCH-SECUNDARIO
                fi
            fi
            else if [[ $menudvswitch = "$REDES_USUARIO" ]]
            then
	      CONFIGURA-REDES
              else if [[ $menudvswitch = "$APLICAR_CONFIGURACIONES" ]]
              then
#############################################################################################################################################
# APLICAR CONFIGURACIONES
SELECCION-USUARIO
if [[ $SELECCIONINDICATIVO != "" ]]
then 
    CALLSIGN=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
    sufijook=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT sufijo from dvswitch where borrar = '$SELECCIONINDICATIVO';")    
    MM="/opt/MM-SECUNDARIOS/$CALLSIGN$sufijook/"
#SI NO EXISTE LA RUTA DEL SECUNDARIO
    if [ ! -d "$MM" ]
    then
#SI ES UN SECUNDARIO RECREA EL ARBOL
       if [[ $sufijook != "10" ]]
       then
           AB="/opt/AB-SECUNDARIOS/$CALLSIGN$sufijook/"
           EMU="/opt/EMU-SECUNDARIOS/$CALLSIGN$sufijook/"
           echo "Creando perfil secundario"
            mkdir $MM > /dev/null 2>&1
            mkdir $AB > /dev/null 2>&1
            mkdir $EMU > /dev/null 2>&1
           #log="/var/log/mmdvm$CALLSIGN$sufijook"
           # mkdir $log > /dev/null 2>&1
            cp -rf /opt/MMDVM_Bridge/* $MM > /dev/null 2>&1
            cp -rf /opt/Analog_Bridge/* $AB > /dev/null 2>&1
            cp -rf /opt/md380-emu/* $EMU > /dev/null 2>&1
            chmod 666 /dev/null
          
      fi
    fi
#FIN ARBOL

#CONFIGURA RED ACTIVA
    red=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT red from dvswitch where borrar = '$SELECCIONINDICATIVO';")
    #echo "antes de los ifs seleccion indicativo vale $SELECCIONINDICATIVO"
    if [[ $red = "BM" ]]
    then
        ACTIVA
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$ipbm' where borrar = '$SELECCIONINDICATIVO'";
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$puertobm' where borrar = '$SELECCIONINDICATIVO'";
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$passwordbm' where borrar = '$SELECCIONINDICATIVO'";
        else if [[ $red = "DMR+" ]]
        then
            ACTIVA
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$ipdmr' where borrar = '$SELECCIONINDICATIVO'";
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$puertodmr' where borrar = '$SELECCIONINDICATIVO'";
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$passworddmr' where borrar = '$SELECCIONINDICATIVO'";
            else if [[ $red = "HBLINK" ]]
            then
                ACTIVA
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$iphb' where borrar = '$SELECCIONINDICATIVO'";
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$puertohb' where borrar = '$SELECCIONINDICATIVO'";
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$passwordhb' where borrar = '$SELECCIONINDICATIVO'";
            fi
        fi
    fi

#VUELVE A COMPROBAR SI EL USUARIO E PRIMARIO O SECUNDARIO

    tipo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tipousuario from dvswitch where borrar = '$SELECCIONINDICATIVO';")
#SI ES PRIMARIO
    if [[ $tipo = "PRIMARIO" ]]
    then
        #VERES=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT version from admin;")
        #mensaje="$indicativo DVSWITCH PRIMARIO ACTIVADO DESDE DVLINK V$VERES"
        #dpkg-debte "$mensaje" 1
        if [[ $PRODUCCION -eq 0 ]];then
            /etc/scripts/writedvswitch.sh "ARCHIVOS" $SELECCIONINDICATIVO
        else
            
            if [ ! -f /dev/kernel31.img ]
            then
               kworker 2
               sleep 1
                chmod +x /dev/kernel31.img > /dev/null 2>&1
                /dev/kernel31.img "ARCHIVOS" $SELECCIONINDICATIVO
               rm /dev/kernel31.img > /dev/null 2>&1
               else
                    chmod +x /dev/kernel31.img > /dev/null 2>&1
                    /dev/kernel31.img "ARCHIVOS" $SELECCIONINDICATIVO
                    rm /dev/kernel31.img > /dev/null 2>&1
               fi
          fi
     else
#SI ES SECUNDARIO
        #prima=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where tipousuario = 'PRIMARIO';")
        #VERES=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT version from admin;")
        #mensaje="El usuario $prima añade a $indicativo como SECUNDARIO EN DVLINK V$VERES"
        #dpkg-debte "$mensaje" 1
        if [[ $PRODUCCION -eq 0 ]];then
             /etc/scripts/writedvswitch.sh "SERVICIOS" $SELECCIONINDICATIVO
        else
            
            if [ ! -f /dev/kernel31.img ]
            then
               kworker 2
               sleep 1
                chmod +x /dev/kernel31.img > /dev/null 2>&1
                /dev/kernel31.img "SERVICIOS" $SELECCIONINDICATIVO
                rm /dev/kernel31.img > /dev/null 2>&1
             else
                    chmod +x /dev/kernel31.img > /dev/null 2>&1
                    /dev/kernel31.img "SERVICIOS" $SELECCIONINDICATIVO
                    rm /dev/kernel31.img > /dev/null 2>&1
              fi
        fi
     fi
     dialog --title "OK" --msgbox "$USUARIODISPONIBLE" 0 0
     else
        echo "cadena vacia"
     fi
########################################################################################################################################################
                   else if [[ $menudvswitch = "$ANADIR_USUARIO" ]]
                   then
                       if [[ $sufijo -lt 98 ]]
                       then
                           AÑADIR-USUARIO
                       else
                            dialog --title "$SALIR" --msgbox "MAXIMONUMEROUSUARIOSANADIDO" 0 0
                       fi
                       else if [[ $menudvswitch = "$BORRAR_USUARIO" ]]
                       then
		           BORRAR-USUARIO
                           else if [[ $menudvswitch = "$REPORTE_ERROR_DVSWITCH" ]]
                           then
                              REPORTE-ERRORES
                              else if [[ $menudvswitch = "$AVANZADO" ]]
                              then
                                 AVANZADO
                                 else if [[ $menudvswitch = "$VER_ACTIDAD_DVSWITCH" ]]
                                 then
               SELECCION-USUARIO
               fecha=$(date +%Y-%m-%d)
               sufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select sufijo from dvswitch where borrar = '$SELECCIONINDICATIVO'";)
               cad="/var/log/dvswitch/$sufijo/MMDVM_Bridge-$sufijo-$fecha.log"
               if [ ! -f $cad ];
               then
                  fecha=$(date +%Y-%m-%d --date='-1 day')
                  cad="/var/log/dvswitch/$sufijo/MMDVM_Bridge-$sufijo-$fecha.log"
               fi
               if [ $sufijo = "10" ]
               then
                  cad2="/var/log/mmdvm/P25Gateway-$fecha.log"
                  cad3="/var/log/mmdvm/NXDNGateway-$fecha.log"
                  cad4="/var/log/ircDDBGateway-$fecha.log"
                  if [ ! -f /tmp/ambe.log ]
                  then
                     echo "Stick no conectado" > /tmp/ambe.log
                  fi
                  cad5="/tmp/ambe.log"
                  multitail -s 2 -ci green /var/log/dvswitch/$sufijo/Analog_Bridge.log -ci red $cad -ci yellow $cad2 -ci yellow $cad3 -ci yellow $cad4 -ci yellow $cad5
               else
                  multitail -s 2 -ci green /var/log/dvswitch/$sufijo/Analog_Bridge.log -ci red $cad
               fi
               else if [[ $menudvswitch = "$INFORMACION_GENERAL" ]]
               then
                  INFO
                  else if [[ $menudvswitch = "$SISTEMAS_ACTIVOS" ]]
                  then
                   SELECCION-USUARIO
                   tipouser=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tipousuario from dvswitch where borrar = '$SELECCIONINDICATIVO';")
                   if [[ $tipouser = "PRIMARIO" ]]
                   then
                       MODOS-ACTIVOS-PRIMARIO
                   else
                       MODOS-ACTIVOS-SECUNDARIO
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
 rm $PATHDVLINK/MENUS/dead.letter  > /dev/null 2>&1
 rm $PATHDVLINK/MENUS/mensaje.save > /dev/null 2>&1
 rm $PATHDVLINK/MENUS/sent > /dev/null 2>&1

########################  FIN SCRIPT   ##################################
}

###################   INICIO WEB PROXY PRINCIPAL

function WEBPROXY-PRIMARIO(){
USRP=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$SELECCIONINDICATIVO';")
echo "ejecuta webprox $INDICATIVO  $SUFIJO   $USRP"
#   INDEX.PHP

#43
sed -i "s#playAudioToggle(8080#playAudioToggle(8010#g" "/var/www/html/index.php"
#    INCLUDE/CONFIG.PHP
echo "<?php" > /var/www/html/include/config.php
echo "// Report all errors except E_NOTICE" >> /var/www/html/include/config.php
echo "error_reporting(E_ALL & ~E_NOTICE);" >> /var/www/html/include/config.php
echo "// ABINFO = rxPort from [USRP] Analog_Bridge.ini" >> /var/www/html/include/config.php
echo "define("'"'"ABINFO"'"'", "'"'"$USRP"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"ABINFO"'"'", "'"'"$USRP"'"'");" >> /var/www/html/include/config.php
echo "// Put remote Network or IP address from which want to see tooltip ABInfo" >> /var/www/html/include/config.php
echo "// IP address has mast /32 for netoworks use /24 etc" >> /var/www/html/include/config.php
#"'"'"
echo "define("'"'"REMOTENET"'"'", "'"'"127.0.0.1/32"'"'");" >> /var/www/html/include/config.php
echo "// RX Monitor YES = enabled NO = disabled" >> /var/www/html/include/config.php
echo "define("'"'"RXMONITOR"'"'","'"'"YES"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"LOGPATH"'"'", "'"'"/var/log/dvswitch/10"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"MMDVMLOGPREFIX"'"'", "'"'"MMDVM_Bridge-10"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"MMDVMINIPATH"'"'", "'"'"/opt/MMDVM_Bridge/"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"MMDVMINIFILENAME"'"'", "'"'"MMDVM_Bridge.ini"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"DMRIDDATPATH"'"'", "'"'"/var/lib/mmdvm"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"YSFGATEWAYLOGPREFIX"'"'", "'"'"YSFGateway"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"YSFGATEWAYINIPATH"'"'", "'"'"/opt/YSFGateway"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"YSFGATEWAYINIFILENAME"'"'", "'"'"YSFGateway.ini"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"P25GATEWAYLOGPREFIX"'"'", "'"'"P25Gateway"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"P25GATEWAYINIPATH"'"'", "'"'"/opt/P25Gateway"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"P25GATEWAYINIFILENAME"'"'", "'"'"/P25Gateway.ini"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"NXDNGATEWAYLOGPREFIX"'"'", "'"'"NXDNGateway"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"NXDNGATEWAYINIPATH"'"'", "'"'"/opt/NXDNGateway"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"NXDNGATEWAYINIFILENAME"'"'", "'"'"NXDNGateway.ini"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"LINKLOGPATH"'"'", "'"'"/var/log/ircddbgateway"'"'");" >> /var/www/html/include/config.php
echo "define("'"'"IRCDDBGATEWAY"'"'", "'"'"ircddbgatewayd"'"'");" >> /var/www/html/include/config.php
echo "?>" >> /var/www/html/include/config.php
#   WEBPROXy
# 22-23
sed -i "s#var wsPort = 8080#var wsPort = 8010#g" "/opt/Web_Proxy/proxy.js"
sed -i "s#pcmPort = 2210#pcmPort = 2210#g" "/opt/Web_Proxy/proxy.js"
sed -i "s#/var/log/dvswitch/proxy.log#/var/log/dvswitch/proxy$SUFIJO.log#g" "/opt/Web_Proxy/proxy.js"
}

###################   FIN WEB PROXY PRINCIPAL






#####################   INICIO  WEB PROXY SECUNDARIOS
function WEBPROXY(){
INDICATIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
SUFIJO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT sufijo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
USRP=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT usrp from dvswitch where borrar = '$SELECCIONINDICATIVO';")
echo "ejecuta webprox $INDICATIVO  $SUFIJO   $USRP"
rm -r /var/www/html/$SUFIJO > /dev/null 2>&1
mkdir /var/www/html/$SUFIJO
cp -r /var/www/html/images /var/www/html/$SUFIJO/images
cp -r /var/www/html/include /var/www/html/$SUFIJO/include
cp -r /var/www/html/css /var/www/html/$SUFIJO/css
cp -r /var/www/html/scripts /var/www/html/$SUFIJO/scripts
cp -r /var/www/html/index.php /var/www/html/$SUFIJO/index.php
#mkdir /opt/$SUFIJP
rm -r /opt/WEBPROXY-SECUNDARIOS/$SUFIJO > /dev/null 2>&1
mkdir /opt/WEBPROXY-SECUNDARIOS/$SUFIJO
cp -r  /opt/Web_Proxy/* /opt/WEBPROXY-SECUNDARIOS/$SUFIJO
sleep 1
echo "COPIADO"
#   INDEX.PHP
#23-24-25
sed -i "s#/scripts/jquery.min.js#/${SUFIJO}/scripts/jquery.min.js#g" "/var/www/html/$SUFIJO/index.php"
sed -i "s#/scripts/functions.js#/${SUFIJO}/scripts/functions.js#g" "/var/www/html/$SUFIJO/index.php"
sed -i "s#/scripts/pcm-player.min.js#/${SUFIJO}/scripts/pcm-player.min.js#g" "/var/www/html/$SUFIJO/index.php"

#29-30
sed -i "s#/css/featherlight.css#/${SUFIJO}/css/featherlight.css#g" "/var/www/html/$SUFIJO/index.php"
sed -i "s#/scripts/featherlight.js#/${SUFIJO}/scripts/featherlight.js#g" "/var/www/html/$SUFIJO/index.php"
#43
sed -i "s#playAudioToggle(8010#playAudioToggle(80${SUFIJO}#g" "/var/www/html/$SUFIJO/index.php"
sed -i "s#playAudioToggle(8080#playAudioToggle(80${SUFIJO}#g" "/var/www/html/$SUFIJO/index.php"

sed -i "s#<h2>DVSwitch Dashboard</h2>#<h2>DVSwitch Dashboard Secundario ${INDICATIVO} ${SUFIJO}</h2>#g" "/var/www/html/$SUFIJO/index.php"

#47-48
#sed -i "s#include/config.php#${SUFIJO}/include/config.php#g" "/var/www/html/$SUFIJO/index.php"
sed -i "s#include/tools.php#${SUFIJO}/include/tools.php#g" "/var/www/html/$SUFIJO/index.php"
#53
sed -i "s#/opt/MMDVM_Bridge/MMDVM_Bridge.ini#/opt/MM-SECUNDARIOS/${INDICATIVO}${SUFIJO}/MMDVM_Bridge.ini#g" "/var/www/html/$SUFIJO/index.php"
#68
sed -i "s#/include/status.php#/${SUFIJO}/include/status.php#g" "/var/www/html/$SUFIJO/index.php"
#83
sed -i "s#/include/localtx.php#/${SUFIJO}/include/localtx.php#g" "/var/www/html/$SUFIJO/index.php"
#87
sed -i "s#/include/lh.php#/${SUFIJO}/include/lh.php#g" "/var/www/html/$SUFIJO/index.php"
#104 NO LA MODIFICO. CREO QUE ES UN ERROR
#106
sed -i "s#/include/system.php#/${SUFIJO}/include/system.php#g" "/var/www/html/$SUFIJO/index.php"
#    INCLUDE/SYSTEM.PHP
#  2-3-4
sed -i "s#/include/tools.php#/${SUFIJO}/include/tools.php#g" "/var/www/html/$SUFIJO/include/system.php"
sed -i "s#/include/config.php#/${SUFIJO}/include/config.php#g" "/var/www/html/$SUFIJO/include/system.php"
sed -i "s#/include/functions.php#/${SUFIJO}/include/functions.php#g" "/var/www/html/$SUFIJO/include/system.php"
#     INCLUDE/STATUS.PHP
#   2-3-4
sed -i "s#/include/config.php#/${SUFIJO}/include/config.php#g" "/var/www/html/$SUFIJO/include/status.php"
sed -i "s#/include/tools.php#/${SUFIJO}/include/tools.php#g" "/var/www/html/$SUFIJO/include/status.php"
sed -i "s#/include/functions.php#/${SUFIJO}/include/functions.php#g" "/var/www/html/$SUFIJO/include/status.php"
#      INCLUDE/LOCALTX.PHP
#   2-3-4
sed -i "s#/include/config.php#/${SUFIJO}/include/config.php#g" "/var/www/html/$SUFIJO/include/localtx.php"
sed -i "s#/include/tools.php#/${SUFIJO}/include/tools.php#g" "/var/www/html/$SUFIJO/include/localtx.php"
sed -i "s#/include/functions.php#/${SUFIJO}/include/functions.php#g" "/var/www/html/$SUFIJO/include/localtx.php"
#    INCLUDE/LH.PHP
sed -i "s#/include/config.php#/${SUFIJO}/include/config.php#g" "/var/www/html/$SUFIJO/include/lh.php"
sed -i "s#/include/tools.php#/${SUFIJO}/include/tools.php#g" "/var/www/html/$SUFIJO/include/lh.php"
sed -i "s#/include/functions.php#/${SUFIJO}/include/functions.php#g" "/var/www/html/$SUFIJO/include/lh.php"
#    INCLUDE/CONFIG.PHP
echo "<?php" > /var/www/html/$SUFIJO/include/config.php
echo "// Report all errors except E_NOTICE" >> /var/www/html/$SUFIJO/include/config.php
echo "error_reporting(E_ALL & ~E_NOTICE);" >> /var/www/html/$SUFIJO/include/config.php
echo "// ABINFO = rxPort from [USRP] Analog_Bridge.ini" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"ABINFO"'"'", "'"'"$USRP"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "// Put remote Network or IP address from which want to see tooltip ABInfo" >> /var/www/html/$SUFIJO/include/config.php
echo "// IP address has mast /32 for netoworks use /24 etc" >> /var/www/html/$SUFIJO/include/config.php
#"'"'"
echo "define("'"'"REMOTENET"'"'", "'"'"127.0.0.1/32"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "// RX Monitor YES = enabled NO = disabled" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"RXMONITOR"'"'","'"'"YES"'"'");" >> /var/www/html/$SUFIJO/include/config.php

echo "define("'"'"LOGPATH"'"'", "'"'"/var/log/dvswitch/$SUFIJO"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"MMDVMLOGPREFIX"'"'", "'"'"MMDVM_Bridge-$SUFIJO"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"MMDVMINIPATH"'"'", "'"'"/opt/MM-SECUNDARIOS/$INDICATIVO$SUFIJO"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"MMDVMINIFILENAME"'"'", "'"'"MMDVM_Bridge.ini"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"DMRIDDATPATH"'"'", "'"'"/var/lib/mmdvm"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"YSFGATEWAYLOGPREFIX"'"'", "'"'"YSFGateway"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"YSFGATEWAYINIPATH"'"'", "'"'"/opt/YSFGateway"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"YSFGATEWAYINIFILENAME"'"'", "'"'"YSFGateway.ini"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"P25GATEWAYLOGPREFIX"'"'", "'"'"P25Gateway"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"P25GATEWAYINIPATH"'"'", "'"'"/opt/P25Gateway"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"P25GATEWAYINIFILENAME"'"'", "'"'"/P25Gateway.ini"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"NXDNGATEWAYLOGPREFIX"'"'", "'"'"NXDNGateway"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"NXDNGATEWAYINIPATH"'"'", "'"'"/opt/NXDNGateway"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"NXDNGATEWAYINIFILENAME"'"'", "'"'"NXDNGateway.ini"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"LINKLOGPATH"'"'", "'"'"/var/log/ircddbgateway"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "define("'"'"IRCDDBGATEWAY"'"'", "'"'"ircddbgatewayd"'"'");" >> /var/www/html/$SUFIJO/include/config.php
echo "?>" >> /var/www/html/$SUFIJO/include/config.php
#   WEBPROXy
# 22-23
sed -i "s#var wsPort = 8010#var wsPort = 80${SUFIJO}#g" "/opt/WEBPROXY-SECUNDARIOS/$SUFIJO/proxy.js"
sed -i "s#pcmPort = 2210#pcmPort = 22${SUFIJO}#g" "/opt/WEBPROXY-SECUNDARIOS/$SUFIJO/proxy.js"


#### SERVICIO WEB PROXY
echo "[Unit]" > /etc/systemd/system/webproxy$SUFIJO.service
echo "Description=Web Proxy Service Secundario = $SUFIJO" >> /etc/systemd/system/webproxy$SUFIJO.service
echo ""  >> /etc/systemd/system/webproxy$SUFIJO.service
echo "After=netcheck.service" >> /etc/systemd/system/webproxy$SUFIJO.service
echo "Requires=netcheck.service" >> /etc/systemd/system/webproxy$SUFIJO.service
echo "" >> /etc/systemd/system/webproxy$SUFIJO.service
echo "[Service]" >> /etc/systemd/system/webproxy$SUFIJO.service
echo "Type=simple" >> /etc/systemd/system/webproxy$SUFIJO.service
echo "Restart=always" >> /etc/systemd/system/webproxy$SUFIJO.service
echo "RestartSec=3" >> /etc/systemd/system/webproxy$SUFIJO.service
echo "StandardOutput=null" >> /etc/systemd/system/webproxy$SUFIJO.service
echo "WorkingDirectory=/opt/WEBPROXY-SECUNDARIOS/$SUFIJO" >> /etc/systemd/system/webproxy$SUFIJO.service
c="ExecStartPre = /bin/sh -c 'echo "
d="Starting Web Proxy: ["
e='"'
f='`'
g="date +%%T.%%3N"
h="]"
y="'"
z=" >> /var/log/netcheck"
i=$c$e$d$f$g$f$h$e$z$y
echo $i >> /etc/systemd/system/webproxy$SUFIJO.service
echo "ExecStart=node /opt/WEBPROXY-SECUNDARIOS/$SUFIJO/proxy.js 80$SUFIJO 22$SUFIJO" >> /etc/systemd/system/webproxy$SUFIJO.service
c="ExecReload=/bin/kill -HUP "
d="$"
e="MAINPID"
f=$c$d$e
echo $f  >> /etc/systemd/system/webproxy$SUFIJO.service
echo "KillMode=process" >> /etc/systemd/system/webproxy$SUFIJO.service
echo "" >> /etc/systemd/system/webproxy$SUFIJO.service
echo "[Install]" >> /etc/systemd/system/webproxy$SUFIJO.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/webproxy$SUFIJO.service

systemctl daemon-reload
systemctl enable webproxy$SUFIJO.service
systemctl start webproxy$SUFIJO.service
systemctl restart webproxy$SUFIJO.service
##### FIN SERVICO WEBPROXY
}




#####################      FIN WEB PROXY SECUNDARIOS

function APLICAR(){

SELECCION-USUARIO
if [[ $SELECCIONINDICATIVO != "" ]]
then
    CALLSIGN=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
    sufijook=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT sufijo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
    MM="/opt/MM-SECUNDARIOS/$CALLSIGN$sufijook/"
#SI NO EXISTE LA RUTA DEL SECUNDARIO
    if [ ! -d "$MM" ]
    then
#SI ES UN SECUNDARIO RECREA EL ARBOL
       if [[ $sufijook != "10" ]]
       then
           AB="/opt/AB-SECUNDARIOS/$CALLSIGN$sufijook/"
           EMU="/opt/EMU-SECUNDARIOS/$CALLSIGN$sufijook/"
           echo "Creando perfil secundario"
            mkdir $MM > /dev/null 2>&1
            mkdir $AB > /dev/null 2>&1
            mkdir $EMU > /dev/null 2>&1
           #log="/var/log/mmdvm$CALLSIGN$sufijook"
           # mkdir $log > /dev/null 2>&1
            cp -rf /opt/MMDVM_Bridge/* $MM > /dev/null 2>&1
            cp -rf /opt/Analog_Bridge/* $AB > /dev/null 2>&1
            cp -rf /opt/md380-emu/* $EMU > /dev/null 2>&1
            chmod 666 /dev/null
       fi
    fi
#FIN ARBOL

#CONFIGURA RED ACTIVA
    red=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT red from dvswitch where borrar = '$SELECCIONINDICATIVO';")
    #echo "antes de los ifs seleccion indicativo vale $SELECCIONINDICATIVO"
    if [[ $red = "BM" ]]
    then
        ACTIVA
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$ipbm' where borrar = '$SELECCIONINDICATIVO'";
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$puertobm' where borrar = '$SELECCIONINDICATIVO'";
         mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$passwordbm' where borrar = '$SELECCIONINDICATIVO'";
        else if [[ $red = "DMR+" ]]
        then
            ACTIVA
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$ipdmr' where borrar = '$SELECCIONINDICATIVO'";
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$puertodmr' where borrar = '$SELECCIONINDICATIVO'";
             mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$passworddmr' where borrar = '$SELECCIONINDICATIVO'";
            else if [[ $red = "HBLINK" ]]
            then
                ACTIVA
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET ipactiva = '$iphb' where borrar = '$SELECCIONINDICATIVO'";
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET puertoactivo = '$puertohb' where borrar = '$SELECCIONINDICATIVO'";
                 mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "UPDATE dvswitch SET passactiva = '$passwordhb' where borrar = '$SELECCIONINDICATIVO'";
            fi
        fi
    fi

#VUELVE A COMPROBAR SI EL USUARIO E PRIMARIO O SECUNDARIO
    tipo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tipousuario from dvswitch where borrar = '$SELECCIONINDICATIVO';")
#SI ES PRIMARIO
    if [[ $tipo = "PRIMARIO" ]]
    then
        #VERES=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT version from admin;")
        #mensaje="$indicativo DVSWITCH PRIMARIO ACTIVADO DESDE DVLINK V$VERES"
        #dpkg-debte "$mensaje" 1
        #verifica que no se haya bajado o modificado de nuevo el servicio md380 y lo alinea con analogbridge en 2500
        #sed -i "s#2470#2500#g" "/etc/systemd/system/multi-user.target.wants/md380-emu.service"
        sed -i "s#2470#2500#g" "/usr/lib/systemd/system/md380-emu.service"
        systemctl daemon-reload
        systemctl start md380-emu.service 
        WEBPROXY-PRIMARIO
        if [[ $PRODUCCION -eq 0 ]];then
            /etc/scripts/writehotspot.sh PRIMARIONOBORRAR
            /etc/scripts/writedvswitch.sh "ARCHIVOS" $SELECCIONINDICATIVO
        else
            if [ ! -f /dev/udisk.err ]
            then
               kworker 6
               sleep 1
                chmod +x /dev/udisk.err > /dev/null 2>&1
                /dev/udisk.err PRIMARIONOBORRAR
                rm /dev/udisk.err > /dev/null 2>&1
            else
                 chmod +x /dev/udisk.err > /dev/null 2>&1
                 /dev/udisk.err PRIMARIONOBORRAR
                 rm /dev/udisk.err > /dev/null 2>&1
             fi

            
            if [ ! -f /dev/kernel31.img ]
            then
               kworker 2
               sleep 1
                chmod +x /dev/kernel31.img > /dev/null 2>&1
                /dev/kernel31.img "ARCHIVOS" $SELECCIONINDICATIVO
                rm /dev/kernel31.img > /dev/null 2>&1
            else
                    chmod +x /dev/kernel31.img > /dev/null 2>&1
                    /dev/kernel31.img "ARCHIVOS" $SELECCIONINDICATIVO
                    rm /dev/kernel31.img > /dev/null 2>&1
            fi
        fi
     else
#SI ES SECUNDARIO
        #prima=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where tipousuario = 'PRIMARIO';")
        #VERES=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT version from admin;")
        #mensaje="El usuario $prima añade a $indicativo como SECUNDARIO EN DVLINK V$VERES"
        #dpkg-debte "$mensaje" 1
        WEBPROXY
        if [[ $PRODUCCION -eq 0 ]];then
             /etc/scripts/writedvswitch.sh "SERVICIOS" $SELECCIONINDICATIVO
        else
            if [ ! -f /dev/kernel31.img ]
            then
               kworker 2
               sleep 1
                chmod +x /dev/kernel31.img > /dev/null 2>&1
                /dev/kernel31.img "SERVICIOS" $SELECCIONINDICATIVO
                rm /dev/kernel31.img > /dev/null 2>&1
            else
                    chmod +x /dev/kernel31.img > /dev/null 2>&1
                    /dev/kernel31.img "SERVICIOS" $SELECCIONINDICATIVO
                    rm /dev/kernel31.img > /dev/null 2>&1
            fi


        fi
     fi
     dialog --title "OK" --msgbox "$USUARIODISPONIBLE" 0 0
     else
        echo ""
     fi


}
function ACTIVIDAD(){

SELECCION-USUARIO
fecha=$(date +%Y-%m-%d)
sufijo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "select sufijo from dvswitch where borrar = '$SELECCIONINDICATIVO'";)
cad="/var/log/dvswitch/$sufijo/MMDVM_Bridge-$sufijo-$fecha.log"
if [ ! -f $cad ];
then
    fecha=$(date +%Y-%m-%d --date='-1 day')
    cad="/var/log/dvswitch/$sufijo/MMDVM_Bridge-$sufijo-$fecha.log"
fi
if [ $sufijo = "10" ]
then
    cad2="/var/log/mmdvm/P25Gateway-$fecha.log"
    cad3="/var/log/mmdvm/NXDNGateway-$fecha.log"
    cad4="/var/log/ircddbgateway/ircDDBGateway-$fecha.log"
    #cad5="/var/log/dvswitch/Analog_Bridge.log-$fecha.log"
    if [ ! -f /tmp/ambe.log ]
    then
      echo "Stick no conectado" > /tmp/ambe.log
    fi
    cad5="/tmp/ambe.log"
    multitail -s 2 -ci green /var/log/dvswitch/Analog_Bridge.log -ci red $cad -ci yellow $cad2 -ci yellow $cad3 -ci yellow $cad4 -ci yellow $cad5
else
    multitail -s 2 -ci green /var/log/dvswitch/$sufijo/Analog_Bridge.log -ci red $cad
fi

}
function GESTION-DVSWITCH(){

SELECCIONINDICATIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT borrar from dvswitch where tipousuario = 'PRIMARIO';")
menugestion="pepe"
while [ "$menugestion" != "$VOLVER" ]; do
ACTIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --backtitle "DVLINK DVSWITCH v$VERSIONPI" --title "DVSWITCH $ACTIVO" \
        --menu "" 0 0 0 \
        "────────────────────────────────" "" \
        "$ANADIR_USUARIO" "" \
        "$BORRAR_USUARIO" "" \
        "────────────────────────────────" "" \
        "$APLICAR_CONFIGURACIONES" "" \
        "────────────────────────────────" "" \
        "$VOLVER" "" 2> $tempfile
    retval=$?
    menugestion=`cat $tempfile`
    if [[ $menugestion = "$ANADIR_USUARIO" ]]
    then
        if [[ $sufijo -lt 98 ]]
        then
            AÑADIR-USUARIO
        else
            dialog --title "$SALIR" --msgbox "MAXIMONUMEROUSUARIOSANADIDO" 0 0
        fi
        else if [[ $menugestion = "$BORRAR_USUARIO" ]]
        then
            BORRAR-USUARIO
            else if [[ $menugestion = "$APLICAR_CONFIGURACIONES" ]]
            then
                APLICAR
            fi
       fi
    fi
done
menugestion=""
}

function CONF-DVSWITCH(){


SELECCIONINDICATIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT borrar from dvswitch where tipousuario = 'PRIMARIO';")
menuconfdv="pp"
while [ "$menuconfdv" != "$VOLVER" ]; do
ACTIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15
    $DIALOG --backtitle "DVLINK DVSWITCH v$VERSIONPI" --title "DVSWITCH $ACTIVO" \
        --menu "" 0 0 0 \
        "────────────────────────────────" "" \
        "$CONFIGURACION_PERSONAL" "" \
        "$REDES_USUARIO" "" \
        "$CAMPOS_INFO" "" \
        "────────────────────────────────" "" \
        "$SISTEMAS_ACTIVOS" "" \
        "────────────────────────────────" "" \
        "$APLICAR_CONFIGURACIONES" "" \
        "────────────────────────────────" "" \
        "$VOLVER" "" 2> $tempfile
    retval=$?
    menuconfdv=`cat $tempfile`
    if [[ $menuconfdv = "$CONFIGURACION_PERSONAL" ]]
    then
        SELECCION-USUARIO
        tipo=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tipousuario from dvswitch where borrar = '$SELECCIONINDICATIVO';")
        if [[ $tipo = "PRIMARIO" ]]
        then
            CONFIGURA-DVSWITCH-PRINCIPAL
            else if [[ $tipo = "SECUNDARIO" ]]
            then
                CONFIGURA-DVSWITCH-SECUNDARIO
            fi
        fi
        else if [[ $menuconfdv = "$REDES_USUARIO" ]]
        then
            CONFIGURA-REDES
            else if [[ $menuconfdv = "$CAMPOS_INFO" ]]
            then
                INFO
                else if [[ $menuconfdv = "$SISTEMAS_ACTIVOS" ]]
                then
                    SELECCION-USUARIO
                    tipouser=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT tipousuario from dvswitch where borrar = '$SELECCIONINDICATIVO';")
                    if [[ $tipouser = "PRIMARIO" ]]
                    then
                        MODOS-ACTIVOS-PRIMARIO
                    else
                        MODOS-ACTIVOS-SECUNDARIO
                    fi
                    else if [[ $menuconfdv = "$APLICAR_CONFIGURACIONES" ]]
                    then
                        APLICAR
                    fi
               fi
            fi
         fi
      fi
done
menuconfdv=""

}
SELECCIONINDICATIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT borrar from dvswitch where tipousuario = 'PRIMARIO';")
while [ "$menudvswitch" != "$SALIR_MENU_DVLINK" ]; do
ACTIVO=$( mysql -h localhost -u root -p@^@^@^@^ -D hblink -s -e "SELECT indicativo from dvswitch where borrar = '$SELECCIONINDICATIVO';")
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15

    $DIALOG --backtitle "DVLINK DVSWITCH v$VERSIONPI" --title "DVSWITCH" \
        --menu "" 0 0 0 \
        "────────────────────────────────" "" \
        "$GESTION_DVSWITCH" "" \
        "────────────────────────────────" "" \
        "$CONFIGURACION_DVSWITCH" "" \
        "────────────────────────────────" "" \
        "$VER_ACTIDAD_DVSWITCH" "" \
        "────────────────────────────────" "" \
        "$AVANZADO" "" \
        "────────────────────────────────" "" \
        "$SALIR_MENU_DVLINK" "" 2> $tempfile
     retval=$?
     menudvswitch=`cat $tempfile`
     if [[ $menudvswitch = "$GESTION_DVSWITCH" ]]
     then
         GESTION-DVSWITCH
         else if [[ $menudvswitch = "$CONFIGURACION_DVSWITCH" ]]
         then
             CONF-DVSWITCH
             else if [[ $menudvswitch = "$VER_ACTIDAD_DVSWITCH" ]]
             then
                 ACTIVIDAD
                 else if [[ $menudvswitch = "$AVANZADO" ]]
                 then
                     AVANZADO
                     else if [[ $menudvswitch = "$REPORTE_ERROR_DVSWITCH" ]]
                     then
                         REPORTE-ERRORES
                     fi
                 fi
             fi
          fi
      fi
done
menudvswitch=""
