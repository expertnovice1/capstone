resource "google_compute_firewall" "allow_http" {
  name    = var.name
  project = var.project_id
  network = var.network
/*
  allow {
    protocol = "tcp"
    ports    = [80]
  }

  source_ranges = var.source_ip_ranges
*/
}
