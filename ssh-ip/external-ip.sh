#!/bin/bash
IPFILE=$HOME/Dropbox/raspberry/ip_rasp/ipexternal
[[ -f $IPFILE ]] || echo 0.0.0.0 > $IPFILE


#Option:
#1. Crond refresh: About 5 min

ACTUALIP=$(curl -s ipinfo.io/ip)

#echo $ACTUALIP > $IPFILE

OLDIP=$(cat $IPFILE)

if [ "$ACTUALIP" != "$OLDIP" ]; then
	echo $ACTUALIP > $IPFILE
fi


#Note: It works if you have Dropboxd process on background , so you can see the actual IP on file "ipexternal.txt" 
