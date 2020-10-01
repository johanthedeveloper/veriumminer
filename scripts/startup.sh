#!/bin/bash

#setup config file
/usr/libexec/veriumminer/setupconfig.sh

#look config file
source /root/veriumminer/veriumminer.conf

echo "$veriumminer_stratumurl"
echo "$veriumminer_username"
echo "$veriumminer_password"

proccount=$(nproc --all)
echo "Prcessor count: $proccount"

#start mining
cpuminer -n 1048576 -o "$veriumminer_stratumurl" -u "$veriumminer_username" -p "$veriumminer_password" -t 0 -1 $proccount --cpu-affinity-stride 1 --cpu-affinity-default-index 0 --cpu-affinity-oneway-index 3

#sleep script
sleep infinity

printf "Shutdown\n";
