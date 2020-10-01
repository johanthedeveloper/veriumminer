#!/bin/bash

configurationdirectory=/root/veriumminer/
configurationfile="$configurationdirectory"veriumminer.conf
if [ ! -f "$configurationfile" ]; then
    echo "$configurationfile not exist"

    mkdir -p $configurationdirectory

/bin/cat <<EOM >$configurationfile
veriumminer_stratumurl=stratum+tcp://eu.vrm.n3rd3d.com:3402
veriumminer_username=BanaanAppel.donate
veriumminer_password=ThankYou
EOM

chmod +x $configurationfile

fi
