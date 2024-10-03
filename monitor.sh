#!/bin/bash

# Monitoring free Ram space

FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')
TH=500
TO="sushant960kumar@gmail.com"
if [[ $FREE_SPACE -lt $TH ]]
then
        echo "WARNING, RAM is running low $FREE_SPACE %" | mail -s "RAM is low ! " $TO
else
        echo "RAM space is sufficient : $FREE_SPACE M"
fi
