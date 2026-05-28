resource "aws_iam_role" "p4_iam_role" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "project4_lambda_function" {
  role          = aws_iam_role.p4_iam_role.arn
  function_name = "p4_lambda_function"
  filename      = data.archive_file.zip_file.output_path
  handler       = "main.handler"
  runtime       = "nodejs24.x"
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  function_name = aws_lambda_function.project4_lambda_function.function_name
  principal     = "apigateway.amazonaws.com"
  action        = "lambda:InvokeFunction"
}