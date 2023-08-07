#!/bin/bash

STATE="$(systemctl is-active $1)"

if [[ "$1" == "tuned-profile" ]]; then
        PROFILE=$(tuned-adm active | awk '{ print $4 }')
        if [[ "$PROFILE" == "hpc-compute" ]]; then
            echo "1"
            exit
        else
            echo "0"
            exit
        fi
fi

if [[ $STATE == 'active' ]]; then
	echo "1"
else
	echo "0"
fi
