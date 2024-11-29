# Create VPC Endpoint for API Gateway
# This endpoint allows private communication between the VPC and API Gateway
# It enables secure access to the API without traversing the public internet
resource "aws_vpc_endpoint" "api_gateway" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.aws_region}.execute-api"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.subnet_ids

  security_group_ids = [aws_security_group.api_endpoint_sg.id]

  private_dns_enabled = true
}

# Security Group for VPC Endpoint
# Defines inbound and outbound traffic rules for the VPC endpoint
# Controls which resources can communicate with the API Gateway endpoint
resource "aws_security_group" "api_endpoint_sg" {
  name        = "${var.project_name}-endpoint-sg"
  description = "Security group for API Gateway VPC endpoint"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_ranges
  }
}
