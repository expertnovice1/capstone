provider "google" {
  project     = "capstone-406620"
  region      = "us-central1"
}

variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "service_account_email" {
  description = "service account email"
}

variable "member" {
  description = "Member for whom to set the IAM policy"
  #type = list(string)
}

variable "role" {
  #type        = list(string)
  description = "List of roles to grant to the member"
}

resource "google_project_iam_member" "example" {
  #member = ["serviceAccount:sa-capstone@capstone-406620.iam.gserviceaccount.com"]
  #role = "roles/compute.admin" 
  #service_account_id = "projects/capstone-406620/serviceAccounts/sa-capstone@capstone-406620.iam.gserviceaccount.com"
   project = "capstone-406620"
   member = var.member
   #role    = "roles/compute.admin"
   role = var.role
}
