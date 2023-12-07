module "iam-binding" {
  source = "./modules/iam/"
  project_id        = "capstone-406620"
  role             = "roles/compute.admin"
  service_account_email = "sa-capstone@capstone-406620.iam.gserviceaccount.com"
  member = "serviceAccount:sa-capstone@capstone-406620.iam.gserviceaccount.com"
}
