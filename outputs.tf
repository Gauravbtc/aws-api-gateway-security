output "api_endpoint" {
  description = "API Gateway endpoint URL"
  value       = aws_api_gateway_stage.prod.invoke_url
}

output "api_key" {
  description = "API Key"
  value       = aws_api_gateway_api_key.api_key.value
  sensitive   = true
}

output "domain_name" {
  description = "Custom domain name"
  value       = aws_api_gateway_domain_name.api_domain.domain_name
}
