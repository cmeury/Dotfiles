#!/bin/bash 
# 

hostname=$1 

cat $hostname.crt $hostname.key > $hostname.includesprivatekey.pem


