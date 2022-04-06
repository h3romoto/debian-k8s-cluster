#!/bin/bash
echo "Please insert the role that you want this master to have (either MASTER or BACKUP , capital is needed)"
read roles

echo "Please insert the priority that you want this master to have"
read priorities

echo "Please insert the network-facing interface"
read interfaces

echo "Please insert the desired virtual IP"
read virtualIP

IPv4=`ifconfig $interfaces | grep "inet " | sed 's/  \+/ /g' | cut -d ' ' -f 3`


ansible-pull -U https://gitlab+deploy-token-21:v4syHSu6wixz9yTFc2Lv@stogit.cs.stolaf.edu/ansibilize-kubernetes/load-balancing.git \
-e role=$roles \
-e priority=$priorities \
-e host_ip=$IPv4 \
-e interface=$interfaces \
-e vip=$virtualIP
