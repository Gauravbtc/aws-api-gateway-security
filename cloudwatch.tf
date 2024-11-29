# Create CloudWatch log group
# Configures logging for API Gateway access logs
# Retains logs for 30 days for monitoring and troubleshooting
resource "aws_cloudwatch_log_group" "api_logs" {
  name              = "/aws/apigateway/${var.project_name}"
  retention_in_days = 30

  tags = local.common_tags
}

# Enable X-Ray tracing
# Configures API Gateway method settings for detailed request tracing
# Helps with debugging and performance monitoring
resource "aws_api_gateway_method_settings" "api_settings" {
  rest_api_id = aws_api_gateway_rest_api.secure_api.id
  stage_name  = aws_api_gateway_stage.prod.stage_name
  method_path = "*/*"

  settings {
    metrics_enabled        = true
    logging_level         = "INFO"
    data_trace_enabled    = true
    throttling_burst_limit = 100
    throttling_rate_limit  = 50
  }
}
