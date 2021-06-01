
#/bin/bash
export NCURSES_NO_UTF8_ACS=1
EASY_CONF_FILE="/tmp/Easy_Conf_File"
CONF_FILE="/etc/scripts/Conf_File"
GIT="raw.githubusercontent.com/nuestraspruebas/beta/"

function INTRO(){
echo "Menu Configurador by EA7JCL" > /tmp/intro.txt
echo "        (EA5GVK.ES)       " >> /tmp/intro.txt
echo "" >> /var/log/dvswitch/intro.txt
echo "" >> /var/log/dvswitch/intro.txt
dialog --title "" --textbox /tmp/intro.txt 0 0
rm -f /tmp/intro.txt > /dev/null 2>&1
}

function INTRO_MENU(){
intro=""
while [ "$intro" != "Salir / Exit" ]; do
   DIALOG=${DIALOG=dialog}
   tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
   trap "rm -f $tempfile" 0 1 2 5 15
   $DIALOG --clear --title "Easy DVLink" \
   --menu "" 0 0 0 \
     "Configurar instalador / configure installer"  "" \
     "───────────────────────────────────────────────" "" \
     "Empezar instalacion / start installation" "" \
     "───────────────────────────────────────────────" "" \
     "Salir / Exit" "" 2> $tempfile
retval=$?
intro=`cat $tempfile`


if [[ $intro = "Configurar instalador / configure installer" ]]
then
    CONFIGURA
    else if [[ $intro = "Empezar instalacion / start installation" ]]
    then
        INSTALAR
        else if [[ $intro = "Salir / Exit" ]]
        then
          echo "Adios / Bye"
        fi
    fi
fi
done
}
function CONFIGURA (){

if [ -f $CONF_FILE ];
then
    cp $CONF_FILE $EASY_CONF_FILE
fi
if [ -f $EASY_CONF_FILE ];
then
VPS=$(awk 'NR==1' $EASY_CONF_FILE)
TTYD=$(awk 'NR==2' $EASY_CONF_FILE)
DVSWITCH=$(awk 'NR==3' $EASY_CONF_FILE)
HBLINK=$(awk 'NR==4' $EASY_CONF_FILE)
HOTSPOT=$(awk 'NR==5' $EASY_CONF_FILE)
else
VPS="NO"
TTYD="NO"
DVSWITCH="NO"
HBLINK="NO"
HOTSPOT="NO"
cat <<EOF >> $EASY_CONF_FILE
$VPS
$TTYD
$DVSWITCH
$HBLINK
$HOTSPOT
EOF


fi
menuconfigura=""
while [ "$menuconfigura" != "Volver / Back" ]; do
   DIALOG=${DIALOG=dialog}
   tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
   trap "rm -f $tempfile" 0 1 2 5 15
   $DIALOG --clear --title "Easy DVLink" \
   --menu "" 0 0 0 \
     "Se instalara en un VPS / It will be installed on a VPS"  "$VPS" \
     "───────────────────────────────────────────────────────────────" "" \
     "Instalar configurador Web / Install web configurator" "$TTYD" \
     "───────────────────────────────────────────────────────────────" "" \
     "Instalar DVSWITCH / Install DVSWITCH" "$DVSWITCH" \
     "───────────────────────────────────────────────────────────────" "" \
     "Instalar HBLINK / install HBLINK" "$HBLINK" \
     "───────────────────────────────────────────────────────────────" "" \
     "Instalar HOTSPOT / install HOTSPOT" "$HOTSPOT" \
     "───────────────────────────────────────────────────────────────" "" \
     "Volver / Back" "" 2> $tempfile

retval=$?
menuconfigura=`cat $tempfile`


if [[ $menuconfigura == "Se instalara en un VPS / It will be installed on a VPS" ]]
then
    if [[ $VPS == "NO" ]]
    then
       VPS="SI/YES"
       sed -i "1s#.*#SI/YES#" $EASY_CONF_FILE
    else
       VPS="NO"
       sed -i "1s#.*#NO#" $EASY_CONF_FILE
    fi
    else if  [[ $menuconfigura = "Instalar configurador Web / Install web configurator" ]]
    then
        if [[ $TTYD == "NO" ]]
        then
            TTYD="SI/YES"
            sed -i "2s#.*#SI/YES#" $EASY_CONF_FILE
        else
            TTYD="NO"
            sed -i "2s#.*#NO#" $EASY_CONF_FILE
        fi
        else if [[ $menuconfigura == "Instalar DVSWITCH / Install DVSWITCH" ]]
        then
           if [[ $DVSWITCH == "NO" ]]
           then
               DVSWITCH="SI/YES"
               sed -i "3s#.*#SI/YES#" $EASY_CONF_FILE
           else
               DVSWITCH="NO"
               sed -i "3s#.*#NO#" $EASY_CONF_FILE
           fi
           else if [[ $menuconfigura == "Instalar HBLINK / install HBLINK" ]]
           then
               if [[ $HBLINK == "NO" ]]
               then
                   HBLINK="SI/YES"
                   sed -i "4s#.*#SI/YES#" $EASY_CONF_FILE
               else
                   HBLINK="NO"
                   sed -i "4s#.*#NO#" $EASY_CONF_FILE
               fi
               else if [[ $menuconfigura == "Instalar HOTSPOT / install HOTSPOT" ]]
               then
                   if [[ $HOTSPOT == "NO" ]]
                   then
                       HOTSPOT="SI/YES"
                       sed -i "5s#.*#SI/YES#" $EASY_CONF_FILE
                   else
                       HOTSPOT="NO"
                       sed -i "5s#.*#NO#" $EASY_CONF_FILE
                   fi
               fi
           fi
       fi
    fi
fi
done
}
function INSTALAR (){
ruta="$GIT/main/scripts/disclaimer"

#wget -P /tmp/ https://raw.githubusercontent.com/nuestraspruebas/beta/main/scripts/disclaimer  > /dev/null 2>&1
wget -P /tmp/ $ruta
dialog --title "" --textbox /tmp/disclaimer 0 0
rm -f /tmp/disclaimer > /dev/null 2>&1
if dialog --title " Iniciamos la instalacion / we started the installation"  --yesno "Esta seguro / Are you sure" 0 0 ;then
#https://raw.githubusercontent.com/nuestraspruebas/beta/main/instalador/instalador.sh
    ruta=$GIT"main/instalador/instalador.sh"
    wget -P /tmp/ $ruta
    #wget -P /tmp/ https://raw.githubusercontent.com/nuestraspruebas/beta/main/instalador/instalador.sh  > /dev/null 2>&1
    chmod +x /tmp/instalador.sh
    /tmp/instalador.sh
    #dialog --title "Easy DVLink" --msgbox "Instalacion finalizada / Installation finished" 0 0
else
    dialog --title "Easy DVLink" --msgbox "Easy DVLink no se instalara / Easy DVLink will not install" 0 0
fi

}

if [[ $(which dialog) != "" ]]
then
    INTRO
    INTRO_MENU
else
    clear
    read -p "Es necesario intalar dialog instalar (yes/no) -  Do I need to install dialog to install? yes / no: " instalar
    if [[ $instalar == "yes" ]]
    then
         apt install -y dialog
         dialog --title "Easy DVLink" --msgbox "Dialog instalado correctamente. Ejecute de nuevo el instalador / Dialog installed correctly. Run the installer again" 0 0
    fi
fi



