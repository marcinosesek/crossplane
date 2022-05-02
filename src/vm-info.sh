#!/bin/bash

echo """
    docker  : `docker version | grep Version | awk '{print $2}'`
    kind    : `kind version | awk '{print $2}'`
    kubectl : `kubectl version --client -o json | jq .clientVersion.gitVersion | sed 's/\"//g'`
    helm    : `helm version --short`
"""