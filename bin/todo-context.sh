#!/bin/bash -e
CTX=$1
# Calling todo.sh with specified context in argument 1
shift
todo.sh $@ $CTX
