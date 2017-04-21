#!/bin/bash

BXUSER=$user BXPASS=$password BXACCOUNT=1 ./linux.sh

echo "y" | bx cs cluster-rm wordpress
bx cs cluster-create --name wordpress
echo "Creating cluster"
sleep 5m
echo "Creating cluster"
sleep 5m
echo "Creating cluster"
sleep 5m
bx cs workers wordpress
bx cs cluster-config wordpress
$(bx cs cluster-config wordpress | grep -v "Downloading" | grep -v "OK" | grep -v "The")
kubectl get secrets --namespace=default
