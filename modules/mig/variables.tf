variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "region" {
  description = "GCP region"
}

variable "distribution_policy_zones" {
  type = list(string)
  description = "List of zones for instances"
}

variable "mig_name" {
  description = "Name of the Managed Instance Group"
}

variable "target_size" {
  description = "Target size of the Managed Instance Group"
}

variable "instance_template" {
  description = "instance template name"
}

