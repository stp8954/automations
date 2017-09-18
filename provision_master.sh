#!/bin/bash

source globals

master_fn=$MASTERNODE_FILENAME


hname=$MASTER_HOSTNAME
dmn=$DOMAIN
kname=$KEYNAME


currentTime=$(date)
before=$(date +%s)

disk=$MASTER_DISK
sku=$MASTER_SKU
resource-group=$RESOURCE_GROUP
cci_os=$MASTER_OS

echo `date` .. starting to provision VM ${hname}.${dmn} 

status=$(az vm create \
  --resource-group $resource-group \
  --name $hname \
  --image $cci_os \
  --size $sku \
  --data-disk-sizes-gb $disk \
  --generate-ssh-keys \
  --custom-data /mnt/c/data/github/automations/custom-data.txt)