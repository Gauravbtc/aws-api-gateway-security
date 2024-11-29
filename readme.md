# Secure API Gateway Infrastructure

This Terraform configuration establishes a secure API Gateway infrastructure with the following components:

## Core Components
- Regional API Gateway with compression enabled
- Production stage with logging configuration
- VPC endpoint for private API access

## Security Features
- API key authentication
- Usage plans with rate limiting and quotas
- WAF protection with AWS managed rules
- Security groups controlling endpoint access

## Monitoring and Logging
- CloudWatch logging with 30-day retention
- X-Ray tracing for request monitoring
- Access logs in JSON format

## Configuration
The infrastructure can be customized through variables in `variables.tf`, including:
- AWS region selection
- Project naming
- Environment specification

All resources are tagged consistently and follow AWS best practices for security and monitoring.