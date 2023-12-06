provider "google" {
  project     = "capstone-406620"
  region      = "us-central1"
}

#variable "admin_credentials" {
#  description = "Path to the JSON file containing credentials for an account with IAM permissions to create a service account"
#}

variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "service_account_name" {
  description = "Name of the Service Account"
}

variable "service_account_display_name" {
  description = "Display name for the Service Account"
}

variable "service_account_description" {
  description = "Description for the Service Account"
}

resource "google_service_account" "example" {
  account_id   = var.service_account_name
  display_name = var.service_account_display_name
  description  = var.service_account_description

  project = var.project_id
}
#
#resource "google_service_account_key" "example" {
#  service_account_id = google_service_account.example.email
#  project            = var.project_id
#}
