# Create SSL Certificate
resource "aws_acm_certificate" "api_cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  tags = local.common_tags

  lifecycle {
    create_before_destroy = true
  }
}

# Create Custom Domain
resource "aws_api_gateway_domain_name" "api_domain" {
  domain_name              = var.domain_name
  regional_certificate_arn = aws_acm_certificate.api_cert.arn

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
