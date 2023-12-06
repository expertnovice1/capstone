module "service-account" {
  source  = "./modules/service-account/"
  project_id = "capstone-406620"
  service_account_name = "sa-capstone"
  service_account_display_name = "sa-capstone"
  service_account_description = "service account for VMs"
}
