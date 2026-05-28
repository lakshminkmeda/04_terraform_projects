resource "aws_api_gateway_rest_api" "p4_apigateway" {
  name        = "p4APIGateway"
  description = "Trigger API for p4 Lambda function"
}

resource "aws_api_gateway_resource" "resource" {
  rest_api_id = aws_api_gateway_rest_api.p4_apigateway.id
  parent_id   = aws_api_gateway_rest_api.p4_apigateway.root_resource_id
  path_part   = "p4resource"
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = aws_api_gateway_rest_api.p4_apigateway.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "apigw_lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.p4_apigateway.id
  resource_id             = aws_api_gateway_resource.resource.id
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  http_method             = aws_api_gateway_method.method.http_method
  uri = aws_lambda_function.project4_lambda_function.invoke_arn
}