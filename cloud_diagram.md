# Infrastructure Cloud Diagram

```mermaid
graph TD
    Internet[Internet] -->|HTTPS| WAF[WAF Web ACL]
    WAF -->|Protected Access| APIG[API Gateway]
    APIG -->|Logs| CW[CloudWatch Logs]
    APIG -->|Private Endpoint| VPC[VPC]
    
    subgraph Security
        WAF
        APIKey[API Key]
        UsagePlan[Usage Plan]
    end
    
    subgraph API Gateway
        APIG
        APIKey -->|Controls| UsagePlan
        UsagePlan -->|Restricts| APIG
    end
    
    subgraph Monitoring
        CW
    end
    
    subgraph Network
        VPC
        VPCE[VPC Endpoint]
        VPCE -->|Connects| VPC
    end

style Internet fill:#f9f,stroke:#333,stroke-width:2px
style WAF fill:#ff9,stroke:#333,stroke-width:2px
style APIG fill:#9f9,stroke:#333,stroke-width:2px
style CW fill:#99f,stroke:#333,stroke-width:2px
style VPC fill:#f99,stroke:#333,stroke-width:2px
```

## Components Description

1. **WAF (Web Application Firewall)**
   - Protects API Gateway with AWS managed rules
   - Named: `{project_name}-waf`

2. **API Gateway**
   - Secure REST API implementation
   - Named: `{project_name}-api`
   - Protected by WAF
   - Logs to CloudWatch

3. **Security**
   - API Key authentication
   - Usage plan for API access control
   - IAM policies for resource access

4. **Networking**
   - VPC Endpoint for private API access
   - Security group controls for endpoint access

5. **Monitoring**
   - CloudWatch log group for API logs
   - Access logging enabled

The infrastructure follows AWS best practices with:
- Secure private networking via VPC endpoints
- WAF protection for API endpoints
- API key authentication
- Comprehensive logging
- Usage plan for API consumption control