module "vm_instance_template" {
  source  = "./modules/instance-template-module/"
  instance_template_name = "example-instance-template"
  machine_type           = "n1-standard-1"
  boot_disk_image        = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20210913"
  network_tags           = ["web", "app"]
  startup_script          = "./startup-script.sh"
}
