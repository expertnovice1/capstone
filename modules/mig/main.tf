
resource "google_compute_region_instance_group_manager" "example" {
  name        = var.mig_name
  base_instance_name = var.mig_name
  version {
    instance_template = var.instance_template
  }
  target_size       = var.target_size
}
