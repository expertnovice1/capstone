variable "name" {
  description = "name of firewall rule"
}

variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "region" {
  description = "GCP region"
}

variable "network" {
  description = "Name of the VPC network"
}

variable "source_ip_ranges" {
  type        = list(string)
  description = "Source IP ranges for ingress rules"
}

variable "allowed_ports" {
  type        = list(number)
  description = "List of allowed ports for ingress rules"
}
