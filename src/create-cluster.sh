#!/bin/bash

K8S_VERSION="v1.23.4"
CLUSTER_NAME="kind"
USER_NAME="vagrant"
KUBECONFIG="/home/${USER_NAME}/.kube/config"

kind create cluster --image kindest/node:${K8S_VERSION} --name ${CLUSTER_NAME} --kubeconfig=${KUBECONFIG} --wait 5m

kubectl cluster-info --context ${CLUSTER_NAME}-${CLUSTER_NAME} --kubeconfig ${KUBECONFIG}

chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}/.kube/*