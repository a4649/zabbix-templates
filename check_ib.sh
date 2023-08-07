#!/bin/sh

PARAM=$1

case "$PARAM" in
   "state") TMP=$(ibstat | grep "State:" | awk '{print $2}')
   if [ "$TMP" == "Active" ]; then echo "1" ; else echo "0" ; fi
   ;;
   "phystate") TMP=$(ibstat | grep "Physical state:" | awk '{print $3}')
   if [ "$TMP" == "LinkUp" ]; then echo "1" ; else echo "0" ; fi
   ;;
   "rate") echo $(ibstat | grep "Rate:" | awk '{print $2}')
   ;;
   "fw") echo $(ibstat `sed 's/-.*/ /'`  | grep "Firmware version:" | awk '{print $3}')
   ;;
esac
