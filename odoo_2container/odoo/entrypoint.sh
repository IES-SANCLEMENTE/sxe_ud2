#!/bin/bash

#Arrancamos servicios
service ssh start

#Movemos el archivo de configuración para que sea accesible desde el anfitrión
mv /opt/odoo/odoo.conf /opt/odoo/conf/odoo.conf

#Creamos el archivo de log y cambiamos propietario
touch /var/log/odoo/odoo.log
chown odoo /var/log/odoo/odoo.log

#Arranca odoo (while: la primera vez no arranca bien)
while [[ ! $(service odoo.sh start) ]];do continue;done

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

