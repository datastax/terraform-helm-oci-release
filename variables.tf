# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "oci_repository" {
  description = "URL of the OCI repository (e.g. <registry_id>.dkr.ecr.us-east-1.amazonaws.com for AWS ECS)"
}

variable "chart_prefix" {
  description = "Chart prefix (e.g. company/helm)"
}

variable "chart_name" {
  description = "Chart name (e.g. my-chart)"
}

variable "chart_version" {
  description = "Chart version (e.g. 0.1.0-988e9ea)"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "chart_download_location" {
  description = "Temporary directory where to download the chart to"
  default = "/tmp"
}

variable "release_namespace" {
  description = "Kubernetes namespace to install the release to"
  default = "default"
}

variable "release_force_update" {
  description = "Whether to helm install --force"
  default = true
}

variable "release_name" {
  description = "Name of the helm release (leave unset / empty if you want to use the chart name)"
  default = ""
}

variable "helm_login_command" {
  description = "Command to login to the helm registry without the repository URL (e.g. 'echo $REGISTRY_PASSWORD | helm registry login -u AWS --password-stdin'). Leave unset / empty if no login should be performed."
  default = ""
}

variable "kubernetes_config_path" {
  description = "Path to your Kubernetes configuration"
  default = "~/.kube/config"
}