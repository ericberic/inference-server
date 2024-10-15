# inference-server

## Quickstart

1. **Install Prerequisites**: Ensure you have `kubectl`, `aws`, and `terraform` installed on your machine.

2. **AWS Account Setup**: Make sure you have an AWS account and have requested any necessary quota increases (e.g., GPU quota).

3. **Terraform Setup**:
   - Navigate to the `terraform` directory.
   - Run `terraform init` to initialize the Terraform configuration.
   - Execute `terraform plan` to review the resources that will be created.
   - Apply the configuration with `terraform apply` to launch the infrastructure.

4. **Kubernetes Configuration**:
   - Run `init.sh` in the `scripts` directory to update Kubernetes configurations with the resources provisioned by AWS.

5. **Install Kubernetes Components**:
   - Execute `install-kubernetes` to use Helm for installing the autoscaler and Kuberay.

## Overview
This project aims to explore a reference architecture that integrates AWS, Terraform, Kubernetes, Helm, Kuberay, Ray, and RayService for the purpose of deploying distributed inference of the open-source Llama model. This initiative is designed to provide a comprehensive and scalable solution that can be easily set up in a production environment.

The goal is to create a zero to one example that adheres to best practices, ensuring that the architecture is not only extensible but also capable of scaling with business needs. By leveraging modern cloud-native technologies, this project seeks to facilitate efficient model inference, enabling organizations to harness the power of AI in their applications.

This endeavor serves both as my own personal learning experience and an opportunity for open contribution.

## Acknowledgments

- Terraform sources based on [https://github.com/hashicorp/learn-terraform-provision-eks-cluster](https://github.com/hashicorp/learn-terraform-provision-eks-cluster) licensed under MPL2
- The IAM policies are configured as recommended by [K8s autoscaler AWS gotchas](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/aws/README.md)
- License: Mozilla Public License 2.0 (MPL 2.0)
