#!/bin/bash
# list=`wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`
list=`curl https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`
if [ -z "`grep "bt-tracker" ./config.conf`" ]; then
    sed -i '$a bt-tracker='${list} ./config.conf
    echo add......
else
    sed -i "s@bt-tracker.*@bt-tracker=$list@g" ./config.conf
    echo update......
fi