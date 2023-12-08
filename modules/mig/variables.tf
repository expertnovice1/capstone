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

variable "instance_template_name" {
  type        = string
  description = "Name of the GCP Instance Template"
}

variable "machine_type" {
  type        = string
  description = "Machine type for the instance template"
}

variable "boot_disk_image" {
  type        = string
  description = "Source image for the boot disk"
}

variable "service_account" {
  description = "service account for running the VM"
}

variable "source_image" {
  description = "Source image for the instance"
  default     = "projects/debian-cloud/global/images/debian-11-bullseye-v20231115"
}

variable "disk_size_gb" {
  description = "Size of the boot disk in GB"
  default     = 20
}

variable "network_tags" {
  type        = list(string)
  description = "Network tags for the instance"
}

variable "startup_script" {
  description = "Path to the startup script for installing Nginx"
}
