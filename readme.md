## Speedtest for influx
##### or any other programm 

This script parses the ouput of speedtest-cli and lets you use the variables for anything you like.

|varname|value|
|-------|-----|
|${pingvalue}|ping in ms|
|${upload} | upload in Mbit/s|
|${download} | download in Mbit/s|
 
 
 script will install ./speedtest-cli from github if it does not exist
 
 ### installation 
  
 ##### wget
````bash
 wget -O influxspeedtest.sh https://raw.githubusercontent.com/littleCdev/influxspeedtest/master/influxspeedtest.sh
 chmod +x influxspeedtest.sh
````
 
##### curl
````bash
curl -Lo influxspeedtest.sh https://raw.githubusercontent.com/littleCdev/influxspeedtest/master/influxspeedtest.sh
chmod +x influxspeedtest.sh
````