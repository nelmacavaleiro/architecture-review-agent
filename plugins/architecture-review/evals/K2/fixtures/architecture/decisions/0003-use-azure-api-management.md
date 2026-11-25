# ADR-0003 Publish all internal and partner APIs through Azure API Management

Status: Accepted
Date: 2024-05-20
Context: Systems were connecting directly to each other's databases, and partner integrations each had their own security set-up.
Decision: All new internal and partner APIs are published through a single Azure API Management instance, which handles authentication, rate limiting and logging.
Consequences: Integrations are easier to secure and monitor. Teams must publish an API before another system can use their data. The API Management instance becomes a critical component and must be deployed for resilience.
