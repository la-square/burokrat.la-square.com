#!/usr/bin/env bash

#Script deploy burokrat application
states_path="/root/blanks-deploy"

git clone git@github.com:la-square/blanks-deploy.git
$states_path/system/centOS7-installer.sh 	 	-n burokrat
$states_path/python35/django-prepair.sh    		-n burokrat
$states_path/postgres/psql-init-db.sh           -n burokrat_db	-u hotdog	-p 12345
$states_path/gunicorn/gunicorn-service-init.sh  -n burokrat
$states_path/nginx/nginx-basic-config.sh
$states_path/nginx/nginx-http-server.sh         -n burokrat
rm -rf $states_path
