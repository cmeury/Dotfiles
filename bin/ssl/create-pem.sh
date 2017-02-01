#!/bin/bash 
# 
# This scripts expects the private key and downloaded p7b certificate chain in the working directory. 
# It will convert the P7B to a Base64 encoded file and combine it with the private key. The resulting 
# PEM file can be used for 'stud'. 
# 

hostname=$1 
openssl pkcs7 -print_certs -in $hostname.p7b -out $hostname.cer 


