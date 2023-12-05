provider "google" {
  project     = "capstone-406620"
  region      = "us-central1"
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

resource "google_compute_instance_template" "example" {
  name        = var.instance_template_name
  description = "Instance Template for VM instances"

  machine_type = var.machine_type

  disk {
    boot       = true
    auto_delete = true
    source_image = var.source_image
    disk_size_gb = var.disk_size_gb
  }

  metadata_startup_script = file(var.startup_script)

  network_interface {
    network = "capstone-network-001"
    subnetwork = "subnet-01"
    access_config {
      // Ephemeral IP
    }
  }

  tags = var.network_tags
}
