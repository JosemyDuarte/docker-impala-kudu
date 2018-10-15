#!/bin/bash

echo -e "\n---------------------------------------"

echo -e	"Starting Hive Metastore..."
supervisorctl start hive-metastore

########################################
#	HIVE
########################################
/wait-for-it.sh localhost:9083 -t 120
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "\n---------------------------------------"
    echo -e "     HIVE not ready! Exiting..."
    echo -e "---------------------------------------"
    exit $rc
fi
