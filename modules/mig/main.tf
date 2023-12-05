provider "google" {
  project     = "capstone-406620"
  region      = "us-central1"
}

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

resource "google_compute_region_instance_group_manager" "example" {
  name        = var.mig_name
  base_instance_name = var.mig_name
  version {
    instance_template = var.instance_template
  }
  target_size       = var.target_size
}
