(echo n; echo p; echo 1; echo ; echo ; echo w) | sudo fdisk /dev/sdc
sudo mkfs -t ext4 /dev/sdc1
sudo mkdir /data && sudo mount /dev/sdc1 /data
uuid="$(sudo -i blkid | sed -n '/sdc1/s/.* UUID=\"\([^\"]*\)\".*/\1/p' )"

cat >> /etc/fstab << EOF
UUID=$uuid   /data  etc4    defaults.nofail,barrier=0   1  2
EOF
