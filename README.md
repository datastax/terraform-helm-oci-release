# OCI Helm Release Terraform Module

## Description

This module enables you to deploy Helm releases based on charts stored in OCI compliant registries.

## Example

```hcl
module "helm-oci-release" {
  source = "github.com/FRosner/terraform-helm-oci-release"

  helm_login_command = "echo $REGISTRY_PW | helm registry login -u AWS --password-stdin"
  
  # This will pull the chart 123456.dkr.ecr.us-east-1.amazonaws.com/mycorp/helm/my-chart:1.0.0
  oci_repository = "123456.dkr.ecr.us-east-1.amazonaws.com"
  chart_prefix = "mycorp/helm"
  chart_name = "my-chart"
  chart_version = 1.0.0
}
```