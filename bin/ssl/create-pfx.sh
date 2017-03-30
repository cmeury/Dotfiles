#!/bin/bash 
# 
# This scripts expects the private key and downloaded certificate chain and bundle in the working directory. 
# It will convert the P7B to a Base64 encoded file and combine it with the private key. The resulting 
# PKCS12 file can be used for ssl termination. 
# 

hostname=$1 
openssl pkcs12 -export -out $hostname.pfx -inkey $hostname.key -in $hostname.crt -certfile $hostname.ca-bundle

