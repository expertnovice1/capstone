module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = "capstone-406620"
  network_name = "capstone-network-001"

  rules = [{
    name                    = "allow-http-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = 5000
    source_ranges           = ["0.0.0.0/0"]
    allow = [{
      protocol = "tcp"
      ports    = ["80"]
    }]
  },
   {
    name                    = "allow-healthcheck-ingress"
    direction               = "INGRESS"
    priority                = 5000
    source_ranges           = ["35.191.0.0/16", "130.211.0.0/22"]
    allow = [{
      protocol = "tcp"
      ports    = ["80"]
    }]
  },
  {
    name                    = "deny-all-ingress"
    direction               = "INGRESS"
    priority                = 65533
    source_ranges           = ["0.0.0.0/0"]
    deny = [{
      protocol = "all"
    }]
  },
  {
    name                    = "deny-all-egress"
    direction               = "EGRESS"
    priority                = 65533
    source_ranges           = ["0.0.0.0/0"]
    deny = [{
      protocol = "all" 
   }]
  }
 ]
}
