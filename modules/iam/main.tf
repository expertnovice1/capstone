
resource "google_project_iam_member" "example" {
  #member = ["serviceAccount:sa-capstone@capstone-406620.iam.gserviceaccount.com"]
  #role = "roles/compute.admin" 
  #service_account_id = "projects/capstone-406620/serviceAccounts/sa-capstone@capstone-406620.iam.gserviceaccount.com"
   project = "capstone-406620"
   member = var.member
   #role    = "roles/compute.admin"
   role = var.role
}
