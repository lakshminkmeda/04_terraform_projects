### Project 01: Create VPC, subnets, route tables, security groups, internet gateway, ec2 instances in subnets
### Project 02: Create VPC, subnets, route tables, security groups, internet gateway, ec2 instances in subnets
### Project 03: Create a lambda function using a zip file with multiple Javascript script files

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.44.0"
    }
  }
}
provider "aws" {
  region = "eu-north-1"
}

resource "archive_file" "zipUploadLambda" {
  type = "zip"
  output_path = "${path.module}/project3/lambdazipfile.zip"
  source_dir = "${path.module}/project3"
}

resource "aws_iam_role" "lambda_iam_role" {
  name = "lambda_iam_role"
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}
resource "aws_iam_role_policy" "iam_role_custom_policy" {
  name = "iam_role_custom_policy"
  role = aws_iam_role.lambda_iam_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "*"
        ],
        Resource = "*"
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "lambda_basic_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_iam_role.name
}

resource "aws_lambda_function" "lambda_test" {
  runtime = "nodejs24.x"
  function_name = "zipUploadLambda"
  role = aws_iam_role.lambda_iam_role.arn
  handler = "app.handler"
  filename = "${path.module}/files/lambdazipfile.zip"
}