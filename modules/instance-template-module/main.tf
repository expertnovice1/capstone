
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

  service_account {
    email = var.service_account
    scopes = ["cloud-platform"]
  }

  network_interface {
    network = "capstone-network-001"
    subnetwork = "subnet-01"
    access_config {
      // Ephemeral IP
    }
  }

  tags = var.network_tags
}
