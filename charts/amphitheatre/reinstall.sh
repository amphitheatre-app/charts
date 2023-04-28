#!/bin/sh

# Warning: This script is for local development and debugging only

echo "1/4 Update and build local Helm chart dependencies"

helm dependency update
helm dependency build

echo "2/4 Uninstall and delete Helm release if it already exists"
helm uninstall amp --namespace amp-system
kubectl delete ns amp-system
sleep 30

echo "3/4 Install new release"
helm install amp . --create-namespace --namespace amp-system
