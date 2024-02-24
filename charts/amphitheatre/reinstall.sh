#!/bin/sh

# Warning: This script is for local development and debugging only

echo "1/4 Update and build local Helm chart dependencies"

helm dependency update
helm dependency build

echo "2/4 Uninstall and delete Helm release if it already exists"
helm uninstall amp --namespace amp-system
kubectl delete ns amp-system
sleep 10

echo "3/4 Install new release"
helm install amp . --create-namespace \
    --namespace amp-system \
    --set persistence.storageClass=local-path \
    --set persistence.accessMode=ReadWriteOnce

echo "4/4 Get the application URL"
NODE=$(kubectl get nodes --namespace amp-system -o jsonpath="{.items[0].metadata.name}")
NODE_PORT=$(kubectl get --namespace amp-system -o jsonpath="{.spec.ports[0].nodePort}" services amp-amp-apiserver)
EXTERNAL_IP=$(kubectl get node $NODE -o jsonpath='{.status.addresses[?(@.type=="ExternalIP")].address}')
if [ -z "$EXTERNAL_IP" ]; then
    NODE_IP=$(kubectl get node $NODE -o jsonpath="{.status.addresses[0].address}")
else
    NODE_IP=$EXTERNAL_IP
fi
echo http://$NODE_IP:$NODE_PORT
