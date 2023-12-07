resource "google_compute_network" "example" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "example" {
  name          = var.subnet_name
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.example.self_link
  ip_cidr_range = var.subnet_cidr
}
