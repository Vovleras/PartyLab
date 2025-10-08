#!/bin/bash
set -e

echo " Creando namespaces..."
kubectl create namespace reggaeton || true
kubectl create namespace rock || true
kubectl create namespace techno || true
kubectl create namespace salsa || true

echo "Etiquetando y aplicando taints a los nodos..."
kubectl label nodes k3d-nodo-reggaeton-0 style=urbano --overwrite
kubectl taint nodes k3d-nodo-reggaeton-0 music=perreo-intenso:NoSchedule --overwrite
kubectl label nodes k3d-nodo-rock-0 style=metalero --overwrite
kubectl taint nodes k3d-nodo-rock-0 music=guitarra-electrica:NoSchedule --overwrite
kubectl label nodes k3d-nodo-techno-0 style=electronico --overwrite
kubectl taint nodes k3d-nodo-techno-0 music=bass-boost:NoSchedule --overwrite
kubectl label nodes k3d-nodo-salsa-0 style=latino --overwrite
kubectl taint nodes k3d-nodo-salsa-0 music=sabor-latino:NoSchedule --overwrite

echo " Aplicando pods..."
kubectl apply -f victoria-pod.yaml
kubectl apply -f salome-pod.yaml
kubectl apply -f elkin-pod.yaml


echo " Configuración completa. Verificando..."
kubectl get pods -A