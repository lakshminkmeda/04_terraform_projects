variable "default_tags" {
  default = {
    TFRepoDirectory = "us-east-1/prod/main"
  }
  type = map(string)
}

variable "vpc_cidr" {
  default = "10.103.0.0/16"
  type    = string
}
variable "availability_zones" {
  default = ["us-east-1d", "us-east-1b", "us-east-1c"]
  type    = list(string)
}
variable "public_subnet_cidr" {
  default = ["10.103.0.0/20", "10.103.16.0/20", "10.103.32.0/20"]
  type    = list(string)
}
variable "private_subnet_cidr" {
  default = ["10.103.128.0/20", "10.103.144.0/20", "10.103.160.0/20"]
  type    = list(string)
}