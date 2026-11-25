# ADR-0006 Use Amazon API Gateway and AWS Lambda for integrations

Status: Accepted
Date: 2024-09-02
Context: Integrations between systems were built as one-off scripts on staff laptops and servers, with no monitoring.
Decision: New integrations between council systems are built as APIs on Amazon API Gateway, with AWS Lambda functions for any processing, and are monitored in Amazon CloudWatch.
Consequences: Integrations are visible and monitored in one place. Older systems that cannot offer APIs, such as the housing system (ADR-0005), still use file exports.
