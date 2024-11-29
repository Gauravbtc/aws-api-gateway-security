provider "aws" {
  region = var.aws_region
}

# Create API Gateway REST API
# This resource creates a Regional API Gateway REST API with the specified name
# The API Gateway serves as the main entry point for all API requests
resource "aws_api_gateway_rest_api" "secure_api" {
  name = "${var.project_name}-api"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  minimum_compression_size = -1
}

# Create API Gateway stage with logging
# This stage represents the production environment of the API
# It includes configuration for access logging to CloudWatch
# The stage is associated with a deployment and contains settings for request logging
resource "aws_api_gateway_stage" "prod" {
  deployment_id = aws_api_gateway_deployment.api_deployment.id
  rest_api_id  = aws_api_gateway_rest_api.secure_api.id
  stage_name   = var.environment

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api_logs.arn
    format         = jsonencode({
      requestId        = "$context.requestId"
      ip              = "$context.identity.sourceIp"
      requestTime     = "$context.requestTime"
      httpMethod      = "$context.httpMethod"
      resourcePath    = "$context.resourcePath"
      status         = "$context.status"
      protocol       = "$context.protocol"
      responseLength = "$context.responseLength"
    })
  }
}
