variable "default_tags" {
  default = {
    TFRepoDirectory = "eu-north-1/prod/main"
  }
  type = map(string)
}

variable "vpc_cidr" {
  default = "10.101.0.0/16"
  type    = string
}
variable "availability_zones" {
  default = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  type    = list(string)
}
variable "public_subnet_cidr" {
  default = ["10.101.0.0/20", "10.101.16.0/20", "10.101.32.0/20"]
  type    = list(string)
}
variable "private_subnet_cidr" {
  default = ["10.101.128.0/20", "10.101.144.0/20", "10.101.160.0/20"]
  type    = list(string)
}