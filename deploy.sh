#!/usr/bin/env bash

#Script deploy burokrat application
states_path="/root/blanks/environments"

git clone git@github.com:la-square/blanks.git
$states_path/system-centOS7-installer.sh 	-n burokrat
$states_path/venv-django-prepair.sh    		-n burokrat
$states_path/psql-init-db.sh             	-n burokrat_db	-u hotdog	-p 12345
$states_path/gunicorn-service-init.sh     	-n burokrat
$states_path/nginx-basic-config.sh
$states_path/nginx-http-server.sh         	-n burokrat
rm -rf /root/blanks
