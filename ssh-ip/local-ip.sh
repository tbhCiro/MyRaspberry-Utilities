#!/bin/bash

#Option: 
#1. Crond refresh: About 5 min

IPFILE=$HOME/Dropbox/raspberry/iplocale
[[ -f $IPFILE ]] || echo 0.0.0.0 > $IPFILE

ACTUALIP=$( networkctl status wlp2s0 | awk '/     Address: / {print $NF}')
OLDIP=$(cat $IPFILE)


if [ "$ACTUALIP" != "$OLDIP" ]; then
	echo $ACTUALIP > $IPFILE
fi

#Note: It works if you have Dropboxd process on background and you can see the actual IP on file "iplocale.txt"  
