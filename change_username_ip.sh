#!/bin/bash

echo "Enter your ansible controller server user_name"
read user_name

echo ""

sleep 1

echo "Enter network address of you ip, only first three octet, such as 192.168.1 or 10.0.0"
read ip_net_addr


for i in {centos6,centos7,ubuntu}
do
	

        sed -i "s/moon/${user_name}/g" ./$i/Vagrantfile
	sed -i "s/10.0.0/${ip_net_addr}/g" ./$i/Vagrantfile
done
