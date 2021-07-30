locals {
  chart_url = "${var.oci_repository}/${var.chart_prefix}/${var.chart_name}:${var.chart_version}"
  complete_helm_login_command = var.helm_login_command == "" ? "" : "${var.helm_login_command} ${var.oci_repository}"
}

terraform {
  required_providers {
    helm = {
      source  = "helm"
    }
  }
}

resource "null_resource" "get_chart" {
  triggers = {
    always_run = local.chart_url
  }

  provisioner "local-exec" {
    interpreter = [
      "/bin/bash",
      "-c"]
    command = <<-EOT
    echo "Fetching ${local.chart_url}"
    export HELM_EXPERIMENTAL_OCI=1
    ${local.complete_helm_login_command}
    helm chart pull ${local.chart_url}
    helm chart export ${local.chart_url} --destination ${var.chart_download_location}/${var.chart_name}-${var.chart_version}
  EOT
  }
}

resource "helm_release" "chart_release" {
  depends_on = [
    null_resource.get_chart,
  ]

  name = var.release_name != "" ? var.release_name : var.chart_name
  namespace = var.release_namespace
  chart = "${var.chart_download_location}/${var.chart_name}-${var.chart_version}/${var.chart_name}"
  force_update = var.release_force_update
}
