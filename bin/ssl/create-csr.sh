#!/bin/bash 
# 
# Generates a CSR for the given domain name 
# 

hostname=$1 

# Use ssladmin/ for everything else, now wants these exact values. 
COUNTRY=CH
#STATE=ZH
STATE=ZG
CITY=Zug
#CITY=Zurich
ORGANIZATION="ricardo.ch AG"
#ORGANIZATION="Tamedia AG"
openssl req -nodes -newkey rsa:2048 -keyout $hostname.key -out $hostname.csr -subj "/C=${COUNTRY}/ST=${STATE}/L=${CITY}/O=${ORGANIZATION}/OU=${ORGANIZATION}/CN=${hostname}" 

