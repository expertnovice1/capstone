module "managed_instance_group" {
  source            = "./modules/mig/"
  project_id = "capstone-406620"
  region = "us-central1"
  distribution_policy_zones = ["us-central1-f", "us-central1-c"]
  #instance_template = google_compute_instance_template.example.name
  instance_template = "projects/capstone-406620/global/instanceTemplates/example-instance-template"
  mig_name              = "group1"
  target_size              = 2
  instance_template_name = "example-instance-template"
  machine_type           = "n1-standard-1"
  boot_disk_image        = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20210913"
  network_tags           = ["web", "app"]
  startup_script          = "./startup-script.sh"
  service_account = "sa-capstone@capstone-406620.iam.gserviceaccount.com"
}
