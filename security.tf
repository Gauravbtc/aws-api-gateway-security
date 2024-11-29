# Create API Key
# Generates an API key for client authentication
# This key must be included in requests to access the API
resource "aws_api_gateway_api_key" "api_key" {
  name = "${var.project_name}-key"
}

# Create Usage Plan
# Defines throttling and quota limits for API usage
# Controls how many requests clients can make within specified time periods
resource "aws_api_gateway_usage_plan" "api_usage_plan" {
  name = "${var.project_name}-usage-plan"

  api_stages {
    api_id = aws_api_gateway_rest_api.secure_api.id
    stage  = aws_api_gateway_stage.prod.stage_name
  }

  quota_settings {
    limit  = 1000
    period = "DAY"
  }

  throttle_settings {
    burst_limit = 100
    rate_limit  = 50
  }
}

# Associate API Key with Usage Plan
resource "aws_api_gateway_usage_plan_key" "api_usage_plan_key" {
  key_id        = aws_api_gateway_api_key.api_key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.api_usage_plan.id
}

# Resource Policy for API Gateway
# Defines the IAM policy that controls access to the API Gateway
# Specifies which principals can invoke the API and under what conditions
resource "aws_api_gateway_rest_api_policy" "api_policy" {
  rest_api_id = aws_api_gateway_rest_api.secure_api.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "execute-api:Invoke"
        Resource = "${aws_api_gateway_rest_api.secure_api.execution_arn}/*"
        Condition = {
          IpAddress = {
            "aws:SourceIp": var.allowed_ip_ranges
          }
        }
      }
    ]
  })
}
