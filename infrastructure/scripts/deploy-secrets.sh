#!/bin/bash

# Be sure to set HF_TOKEN with the Hugging Face API token for read access
kubectl create secret generic hf-secret --from-literal=hf_api_token=${HF_TOKEN} --dry-run=client -o yaml | kubectl apply -f -