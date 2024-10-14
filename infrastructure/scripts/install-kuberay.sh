#!/bin/bash

# Get AWS parameters from Terraform outputs
CLUSTER_NAME=$(terraform output -raw cluster_name)
AWS_REGION=$(terraform output -raw region)
AUTOSCALER_ROLE_ARN=$(terraform output -raw cluster_autoscaler_role_arn)

# Uninstall any existing installations
helm uninstall cluster-autoscaler --namespace kube-system || true
helm uninstall kuberay-operator || true
helm uninstall raycluster || true

# Continue with Helm installs
helm repo add autoscaler https://kubernetes.github.io/autoscaler
helm repo update
helm install cluster-autoscaler autoscaler/cluster-autoscaler \
    --namespace kube-system \
    --set fullnameOverride=cluster-autoscaler \
    --set autoDiscovery.clusterName=${CLUSTER_NAME} \
    --set awsRegion=${AWS_REGION} \
    --set cloudProvider=aws \
    --set rbac.serviceAccount.create=true \
    --set rbac.serviceAccount.name=cluster-autoscaler \
    --set rbac.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn=${AUTOSCALER_ROLE_ARN}

helm repo add kuberay https://ray-project.github.io/kuberay-helm/
helm repo update
helm install kuberay-operator kuberay/kuberay-operator
helm install raycluster kuberay/ray-cluster

