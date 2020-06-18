#!/bin/sh
# Using this script because github action passess the arguments as strings
# instead of array
npm i @parkhub/aws-api-gateway @parkhub/config

echo ">>> Running sls $@"

sls $@

echo ">>> Compleated"
