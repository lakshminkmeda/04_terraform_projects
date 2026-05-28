variable "default_tags" {
  description = "Default tags for network resources"
  default = {
    ManagedBy = "Terraform"
    environment = "prod"
    TFRepoDirectory = "global/prod/main"
  }
  type = map(string)
}