
module "network" {
  source = "./modules/vpc/"
  project_id              = "capstone-406620"
  region                  = "us-central1"
  vpc_name                = "capstone-network-001"
  subnet_name             = "subnet-01"
  subnet_cidr             = "10.10.10.0/24" 
}
