#!/bin/bash

influxhost="localhost"
influxdb="telegraf"
influxhostname="cheetahstorage"
influxtag="speedtest"

cd "$(dirname "$0")";
pingvalue=0
upload=0
download=0

#check if speedtest is installed
file="./speedtest-cli"
if [ ! -f "$file" ]; then
   wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
   chmod +x speedtest-cli 
fi

#run speedtest
result=`./speedtest-cli --simple`

#parse output
while read -r line;
do
 case "$line" in
  *Ping:* ) pingvalue=`echo "$line" | awk '/^Ping:/ {print $2}'`;;
  *Download:* ) download=`echo "$line" | awk '/^Download:/ {print $2}'`;;
  *Upload:* ) upload=`echo "$line" | awk '/^Upload:/ {print $2}'`;;
  * ) ;;
 esac
done <<< "$result"

#post to influxdb or whatever you like
curl -s -i -XPOST "http://${influxhost}:8086/write?db=${influxdb}" --data-binary "${influxtag},host=${influxhostname} upload=${upload},download=${download},ping=${pingvalue}" > /dev/null

