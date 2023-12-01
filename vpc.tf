module "network" {
  source  = "terraform-google-modules/network/google"
  version = "6.0.0"
  # insert the 3 required variables here
  project_id = "capstone-406620"
  network_name = "capstone-network-001"
  subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-central1"
        },
        ]
}
