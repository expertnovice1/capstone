module "service-accounts" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "4.2.2"
  project_id = "capstone-406620"
  prefix = "sa-capstone"
  project_roles = [
    "capstone-406620=>roles/compute.admin",
  ]
}
