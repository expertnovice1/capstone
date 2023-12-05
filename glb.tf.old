module "lb-http" {
  source  = "GoogleCloudPlatform/lb-http/google"
  version = "10.0.0"
  project = "capstone-406620"
  name = "capstone-glb"
   backends = {
    default = {
      port                            = var.service_port
      protocol                        = "HTTP"
      port_name                       = var.service_port_name
      timeout_sec                     = 10
      enable_cdn                      = false


      health_check = {
        request_path        = "/"
        port                = var.service_port
      }

      log_config = {
        enable = true
        sample_rate = 1.0
      }

      groups = [
        {
          # Each node pool instance group should be added to the backend.
          group                        = var.backend
        },
      ]

      iap_config = {
        enable               = false
      }
    }
  }
}
