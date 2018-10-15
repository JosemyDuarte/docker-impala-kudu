#!/bin/bash

/wait-for-it.sh zookeeper:2181 -t 120
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "\n--------------------------------------------"
    echo -e "      Zookeeper not ready! Exiting..."
    echo -e "--------------------------------------------"
    exit $rc
fi

/wait-for-it.sh hadoop:8020 -t 120
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "\n--------------------------------------------"
    echo -e "      HDFS not ready! Exiting..."
    echo -e "--------------------------------------------"
    exit $rc
fi

/start-hive.sh

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

/start-impala.sh
