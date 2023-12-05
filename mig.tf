module "mig1" {
  source            = "./modules/mig/"
  project_id = "capstone-406620"
  region = "us-central1"
  distribution_policy_zones = ["us-central1-f", "us-central1-c"]
  instance_template = "projects/capstone-406620/global/instanceTemplates/example-instance-template"
  mig_name              = "group1"
  target_size              = 2
  #service_port      = 80
  #service_port_name = "http"
  #http_health_check = false
  #target_pools      = ["${module.gce-lb-fr.target_pool}"]
  #target_tags       = ["allow-service1"]
  #ssh_source_ranges = ["0.0.0.0/0"]
}
