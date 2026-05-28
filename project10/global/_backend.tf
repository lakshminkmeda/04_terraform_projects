terraform {
  backend "s3" {
    key            = "global/terraform.tfstate"
    region         = "eu-north-1"
    bucket         = "demo-bucket-terraform-state-files-767976552522-eu-north-1-an"
    dynamodb_table = "terraform-state-lock-file"
    encrypt        = true # S3, server side encryption
  }
}