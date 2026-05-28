data "terraform_remote_state" "global_remote" {
  backend = "s3"
  config = {
    bucket = "demo-bucket-terraform-state-files-767976552522-eu-north-1-an"
    key    = "global/terraform.tfstate"
    region = "eu-north-1"
  }
}

data "terraform_remote_state" "global_prod_main_remote" {
  backend = "s3"
  config = {
    bucket = "demo-bucket-terraform-state-files-767976552522-eu-north-1-an"
    key    = "global/prod/main/terraform.tfstate"
    region = "eu-north-1"
  }
}
