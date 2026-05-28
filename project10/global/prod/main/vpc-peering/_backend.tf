terraform {
  backend "s3" {
    key            = "global/prod/main/vpc-peering/terraform.tfstate"
    region         = "eu-north-1"
    bucket         = "demo-bucket-terraform-state-files-767976552522-eu-north-1-an"
    dynamodb_table = "terraform-state-lock-file"
    encrypt        = true # Optional, S3 Bucket Server Side Encryption
  }
}