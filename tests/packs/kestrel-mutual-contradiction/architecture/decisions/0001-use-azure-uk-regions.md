# ADR-0001 Use Microsoft Azure in UK regions as the main cloud platform

Status: Accepted
Date: 2024-02-12
Context: The society's data centre lease ends in 2027, and new services were being built on several different hosting arrangements. Member data must stay in the UK (KM-P01).
Decision: New systems run on Microsoft Azure, using UK South as the primary region and UK West as the secondary region. Other cloud providers need an approved exception.
Consequences: Teams build skills in one platform. Services that need a second region for resilience must use UK West, which may not offer every service available in UK South, so this must be checked during design.
