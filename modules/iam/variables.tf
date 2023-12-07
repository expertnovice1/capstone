
variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "service_account_email" {
  description = "service account email"
}

variable "member" {
  description = "Member for whom to set the IAM policy"
}

variable "role" {
  description = "List of roles to grant to the member"
}
