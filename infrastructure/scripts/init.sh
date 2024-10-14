#!/bin/bash

# Set the AWS region
AWS_REGION="us-east-2"

# Extract the EKS cluster name from the Terraform output
# Modify the grep pattern depending on how your output is formatted
CLUSTER_NAME=$(terraform output -raw cluster_name)

if [ -z "$CLUSTER_NAME" ]; then
  echo "Error: Unable to find the EKS cluster name from Terraform output."
  exit 1
fi

# Update the kubeconfig for kubectl using AWS CLI
echo "Updating kubeconfig for EKS cluster: $CLUSTER_NAME in region: $AWS_REGION"

aws eks --region $AWS_REGION update-kubeconfig --name $CLUSTER_NAME

if [ $? -eq 0 ]; then
  echo "Kubeconfig updated successfully!"
else
  echo "Failed to update kubeconfig."
  exit 1
fi
