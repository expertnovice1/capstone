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

resource "google_compute_health_check" "autohealing" {
  name                = "autohealing-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10 # 50 seconds

  http_health_check {
    request_path = "/healthz"
    port         = "8080"
  }
}

resource "google_compute_target_pool" "default" {
  name = "instance-pool"
}

resource "google_compute_instance_group_manager" "appserver" {
  name = var.mig_name

  base_instance_name = "capstone-mig-instance"
  zone               = "us-central1-a"

  version {
    instance_template  = google_compute_instance_template.example.id
  }


  target_pools = [google_compute_target_pool.default.id]
  target_size  = 2

  named_port {
    name = "customhttp"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_region_health_check.hc.id
    initial_delay_sec = 300
  }
}

resource "google_compute_forwarding_rule" "default" {
  name                  = "website-forwarding-rule"
  region                = "us-central1"
  port_range            = 80
  backend_service       = google_compute_region_backend_service.backend.id
}

resource "google_compute_region_backend_service" "backend" {
  name                  = "website-backend"
  region                = "us-central1"
  load_balancing_scheme = "EXTERNAL"
  health_checks         = [google_compute_region_health_check.hc.id]
  backend {
    group           = google_compute_instance_group_manager.appserver.instance_group
    #balancing_mode  = "UTILIZATION"
    #capacity_scaler = 1.0
  }

}

resource "google_compute_region_health_check" "hc" {
  name               = "check-website-backend"
  check_interval_sec = 1
  timeout_sec        = 1
  region             = "us-central1"

  tcp_health_check {
    port = "80"
  }
}
