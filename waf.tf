# Create WAF Web ACL
# Implements AWS WAF (Web Application Firewall) protection for the API
# Uses AWS managed rule sets to protect against common web exploits
resource "aws_wafv2_web_acl" "api_waf" {
  name        = "${var.project_name}-waf"
  description = "WAF for API Gateway"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name               = "AWSManagedRulesCommonRuleSetMetric"
      sampled_requests_enabled  = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name               = "ApiWafMetric"
    sampled_requests_enabled  = true
  }
}

# Associate WAF with API Gateway Stage
resource "aws_wafv2_web_acl_association" "api_waf_association" {
  resource_arn = aws_api_gateway_stage.prod.arn
  web_acl_arn  = aws_wafv2_web_acl.api_waf.arn
}
