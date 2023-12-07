variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "region" {
  description = "GCP region"
}

variable "lb_name" {
  description = "Name of the External Load Balancer"
}

variable "mig_name" {
  description = "Name of the Managed Instance Group"
}

variable "target_size" {
  description = "Target size of the Managed Instance Group"
}

variable "backend_service_name" {
  description = "Name of the Backend Service"
}

variable "health_check_name" {
  description = "Name of the Health Check"
}
