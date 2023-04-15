#!/bin/sh

# Warning: This script is for local development and debugging only

echo "1/4 Update and build local Helm chart dependencies"

helm dependency update
helm dependency build

echo "2/4 Uninstall and delete Helm release if it already exists"
helm uninstall amp --namespace amp-system
kubectl delete ns amp-system

echo "3/4 Install new release"
helm install amp . --create-namespace --namespace amp-system &&

echo "4/4 Print post-installation notes, and perform port forwarding"
export POD_NAME=$(kubectl get pods --namespace amp-system -l "app.kubernetes.io/name=amp-apiserver,app.kubernetes.io/instance=amp" -o jsonpath="{.items[0].metadata.name}") &&
export CONTAINER_PORT=$(kubectl get pod --namespace amp-system $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}") &&
echo "Visit http://127.0.0.1:8170 to use your application" &&
kubectl --namespace amp-system port-forward $POD_NAME 8170:$CONTAINER_PORT
