#!/bin/bash

code_dir="~/vagrant-project/ansible/ansible-learning"
echo "enter your controler server user_name"
read user_name

for i in {centos6,centos7,ubuntu}
do
	

        sed -i "s/moon/${user_name}/g" ./$i/Vagrantfile
done
