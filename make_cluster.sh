#!/bin/bash

source globals

echo `date` make_cluster starting with consistency checks

# in v2, all inputs come from globals

if [! -d $CLUSTER_TYPE];then
	echo "make_cluster unknown cluster type $CLUSTER_TYPE .. directory exists?"
	esit 1
fi

if [ -f $MASTERNODE_FILENAME ];then
	echo "make_cluster masternode file $MASTERNODE_FILENAME" already exists.  Please check it to ensure that there is no live cluster there.
	exit 1
fi

if [ -f $SLAVENODE_FILENAME ];then
	echo "make_cluster slavenode file $SLAVENODE_FILENAME" already exists.  Please check it to ensure that there is no live cluster there.
	exit 1
fi

echo `date` make_cluster creating key...
./create_key.sh
if [ $? -ne 0 ]; then
 echo `date` 'create_key failed :('
 exit 1
fi

echo `date` make_cluster provisioning master...
./provision_master.sh &