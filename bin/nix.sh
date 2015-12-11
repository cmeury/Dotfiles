#!/bin/bash -e
echo "Preloading libcurl.so.3 and starting nixnote2..."
LD_PRELOAD=libcurl.so.3 nixnote2 

