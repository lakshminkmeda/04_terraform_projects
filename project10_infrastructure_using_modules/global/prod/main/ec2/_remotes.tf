data "terraform_remote_state" "global_prod_main_remote" {
  backend = "s3"
  config = {
    bucket = "demo-bucket-terraform-state-files-767976552522-eu-north-1-an"
    key    = "global/prod/main/terraform.tfstate"
    region = "eu-north-1"
  }
}

data "terraform_remote_state" "eu_north_1_main_prod_remote" {
  backend = "s3"
  config = {
    bucket = "demo-bucket-terraform-state-files-767976552522-eu-north-1-an"
    key    = "eu-north-1/prod/main/terraform.tfstate"
    region = "eu-north-1"
  }
}

data "terraform_remote_state" "us_east_1_main_prod_remote" {
  backend = "s3"
  config = {
    bucket = "demo-bucket-terraform-state-files-767976552522-eu-north-1-an"
    key    = "us-east-1/prod/main/terraform.tfstate"
    region = "eu-north-1"
  }
}