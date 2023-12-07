
resource "google_service_account" "example" {
  account_id   = var.service_account_name
  display_name = var.service_account_display_name
  description  = var.service_account_description

  project = var.project_id
}
