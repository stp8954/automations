#!/bin/bash

source globals

kname=$KEYNAME

# aa=`$CLI_CMD sshley list | grep $kname`

#if [ ! -z "$aa" ]; then 
#  echo "key $kname is already present in SL. Please select a non-existing key."
#  exit 1
#fi

echo `date` create_key starting with keyname $kname

# generate the thing first
ssh-keygen -t rsa -b 2048 -f $kname -q -N ""

# add it to the SL account
#$SLCLI_CMD sshkey add $kname -f $kname.pub

#if [ $? -eq 0 ]; then
# echo `date` create_key ... created key $kname in SL and on disk
# exit 0
#else
# echo `date` 'create_key failed :('
# exit 1
#fi
