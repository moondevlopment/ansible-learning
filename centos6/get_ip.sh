#!/bin/bash

system_list=$(vagrant status|egrep 'client'|awk '{print $1}')

for i in $system_list
do
	sys_ip=$(vagrant ssh $i -c "hostname -I | cut -d' ' -f2" 2>/dev/null)

       echo "$sys_ip"
done
