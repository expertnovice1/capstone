
resource "google_compute_health_check" "example" {
  name               = var.health_check_name
  project            = var.project_id
  check_interval_sec = 5
  timeout_sec        = 5
  tcp_health_check {
    port = 80
  }
}

resource "google_compute_backend_service" "example" {
  name        = var.backend_service_name
  project     = var.project_id
  description = "Backend Service for ALB"

  health_checks = [google_compute_health_check.example.self_link]

  backend {
    group = module.mig1.google_compute_instance_group_manager.example.self_link
  }
}

resource "google_compute_url_map" "example" {
  name            = "example-url-map"
  default_route_action {
    backend_service = google_compute_backend_service.example.self_link
  }
}

resource "google_compute_target_http_proxy" "example" {
  name        = "example-target-http-proxy"
  url_map     = google_compute_url_map.example.self_link
  project     = var.project_id
  description = "Target HTTP Proxy for ALB"
}

resource "google_compute_global_forwarding_rule" "example" {
  name        = var.lb_name
  target      = google_compute_target_http_proxy.example.self_link
  project     = var.project_id
  port_range  = "80"
  description = "Global Forwarding Rule for ALB"
}
