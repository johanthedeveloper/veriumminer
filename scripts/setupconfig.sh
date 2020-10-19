#!/bin/bash

configurationdirectory=/root/veriumminer/
configurationfile="$configurationdirectory"veriumminer.conf
if [ ! -f "$configurationfile" ]; then
    echo "$configurationfile not exist"

    mkdir -p $configurationdirectory

/bin/cat <<EOM >$configurationfile
veriumminer_stratumurl=stratum+tcp://eu.vrm.mining-pool.ovh:3037
veriumminer_username=JohanTheDeveloper.donate
veriumminer_password=ThankYou
EOM

chmod +x $configurationfile

fi
