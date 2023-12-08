resource "google_compute_firewall" "http-fw" {
  name    = "ingress-80-allow"
  network = "capstone-network-001"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  priority = 5000
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "terraform-firewall-resource-hc" {
  name    = "ingress-healthcheck-allow"
  network = "capstone-network-001"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  priority = 5000
  direction = "INGRESS"
  source_ranges = ["35.191.0.0/16", "130.211.0.0/22"]
}

resource "google_compute_firewall" "ingress-iap-ssh" {
  name    = "ingress-iap-ssh"
  network = "capstone-network-001"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  priority = 1000
  direction = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
}

resource "google_compute_firewall" "ingress-deny-all" {
  name    = "ingress-deny-all"
  network = "capstone-network-001"

  deny {
    protocol = "all"
  }
  priority = 65533
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "egress-deny-all" {
  name    = "egress-deny-all"
  network = "capstone-network-001"

  deny {
    protocol = "all"
  }
  priority = 65533
  direction = "EGRESS"
  destination_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "egress-to-internet" {
  name    = "egress-to-internet"
  network = "capstone-network-001"

  allow {
    protocol = "tcp"
    ports = ["80", "443"]
  }
  priority = 1000
  direction = "EGRESS"
  destination_ranges = ["0.0.0.0/0"]
}

