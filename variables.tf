# AWS Region Configuration
# Specifies the AWS region where all resources will be created
# Default is set to us-west-2 (Oregon)
variable "aws_region" {
  description = "AWS Region to deploy resources"
  type        = string
  default     = "us-west-2"
}

# Project Name Configuration
# Defines the name prefix used for all resources
# This ensures consistent naming across the infrastructure
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "secure-api"
}

# Environment Configuration
# Specifies the deployment environment (e.g., prod, dev, staging)
# Used for resource tagging and stage naming
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "domain_name" {
  description = "Domain name for the API"
  type        = string
  default     = "api.example.com"
}

variable "allowed_ip_ranges" {
  description = "List of allowed IP CIDR ranges"
  type        = list(string)
  default     = ["10.0.0.0/8"]
}

variable "vpc_id" {
  description = "VPC ID for endpoint"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for VPC endpoint"
  type        = list(string)
}
