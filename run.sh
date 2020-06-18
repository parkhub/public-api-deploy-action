#!/bin/sh
# Using this script because github action passess the arguments as strings
# instead of array
echo ">>> Running sls $@"
ls -al node_modules
sls $@
ls -al node_modules
echo ">>> Compleated"
