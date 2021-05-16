#!/bin/bash

#Borra las carpetas por si se quiere reinstalar
     rm -r /opt/hblink3 > /dev/null 2>&1
     rm -r /opt/HBmonitor > /dev/null 2>&1
     rm -r /opt/dmr_utils3 > /dev/null 2>&1
#instala dmrutils3
     cd /opt
    git clone https://github.com/HBLink-org/dmr_utils3.git
#     mv /dev/shmz/dmr_utils3 /opt
     apt-get install python3-pip -y
     pip3 install --upgrade .
#instala hblink
     cd /opt
    git clone https://github.com/ea5gvk/hblink3DVS1
#     mv /dev/shmz/hblink3DVS1 /opt/hblink3
     mv hblink3DVS1 hblink3
     chmod +x /opt/hblink3/install.sh
     ./install.sh
#instala hbmonitor
     cd /opt
    git clone https://github.com/ea5gvk/HBmonitorDVS.git
#   mv /dev/shmz/HBmonitorDVS /opt/hbmonitor
    mv HBmonitorDVS hbmonitor
     chmod +x /opt/hbmonitor/install.sh
     cd /opt/hbmonitor
     ./install.sh
     wget https://database.radioid.net/static/rptrs.json
     cp rptrs.json peer_ids.json
     wget https://database.radioid.net/static/users.json
     cp users.json subscriber_ids.json
     cp /opt/hbmonitor/peer_ids.json /opt/hblink3/peer_ids.json
     cp /opt/hbmonitor/subscriber_ids.json /opt/hblink3/subscriber_ids.json

     cp /dev/shmz/servicios/hbmonrun /usr/bin/hbmonrun
     chmod +x /usr/bin/hbmonrun
     cp /dev/shmz/servicios/resethb /usr/bin/resethb
     chmod +x /usr/bin/resethb

#instala servicios
     cp /dev/shmz/servicios/hblink3.service /etc/systemd/system/
     cp /dev/shmz/servicios/hbparrot.service /etc/systemd/system/
     #cambia puerto hbmonitor a 8081
     sed -i "9s/.*/WEB_SERVER_PORT = 8081/" /opt/hbmonitor/config.py
#activa servicios
     systemctl daemon-reload
     systemctl enable hblink3.service
     systemctl start hblink3.service
     systemctl enable hbparrot.service
     systemctl start hbparrot.service

     cp /dev/shmz/servicios/hbmonrun.service /etc/systemd/system/hbmonrun.service
     systemctl daemon-reload
     systemctl enable hbmonrun.service
     systemctl start hbmonrun.service
     chmod +x /usr/bin/hbmonrun

