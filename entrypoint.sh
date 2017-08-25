#!/usr/bin/env bash

set -eu

OMEROHOST=${OMEROHOST:-omero}
REDISHOST=${REDISHOST:-redis}
OMERO_DATA=${OMERO_DATA:-/OMERO}
DBHOST=${DBHOST:-db}
DBNAME=${DBNAME:-postgres}
DBUSER=${DBUSER:-postgres}
DBPASSWORD=${DBPASSWORD:-postgres}

sed -i -re "s/(\"uri\":\s*\"redis:\/\/).*(@).*(:6379\/0\")/\1$REDIS_PASSWORD\2$REDISHOST\3/" /opt/omero/ms/omero-ms-pixel-buffer/conf.json
sed -i -re "s/(\"host\":\s*\").*(\")/\1$OMEROHOST\2/" /opt/omero/ms/omero-ms-pixel-buffer/conf.json
sed -i -re "s#(\"omero\.data\.dir\":\s*\").*(\")#\1$OMERO_DATA\2#" /opt/omero/ms/omero-ms-pixel-buffer/conf.json
sed -i -re "s/(\"omero\.db\.host\":\s*\").*(\")/\1$DBHOST\2/" /opt/omero/ms/omero-ms-pixel-buffer/conf.json
sed -i -re "s/(\"omero\.db\.name\":\s*\").*(\")/\1$DBNAME\2/" /opt/omero/ms/omero-ms-pixel-buffer/conf.json
sed -i -re "s/(\"omero\.db\.user\":\s*\").*(\")/\1$DBUSER\2/" /opt/omero/ms/omero-ms-pixel-buffer/conf.json
sed -i -re "s/(\"omero\.db\.pass\":\s*\").*(\")/\1$DBPASSWORD\2/" /opt/omero/ms/omero-ms-pixel-buffer/conf.json

/opt/omero/ms/omero-ms-pixel-buffer/bin/omero-ms-pixel-buffer -conf /opt/omero/ms/omero-ms-pixel-buffer/conf.json
