# Proposal: Partner data feed for mortgage brokers

Author and team: Intermediary Lending team
Date: 2026-11-12

## Problem and business need
Mortgage brokers phone our intermediary desk many times a day to check application status. Our largest broker partner wants to see status updates in its own system.

## Scope (in and out)
In: giving one broker partner access to application status for the applications it submitted.
Out: other partners; changes to application decisions.

## Proposed design
- Following ADR-0009, the broker partner connects through a private network link to a read-only replica of the mortgage origination database in UK South.
- A database view limits the partner to its own applications and to status fields only.

## Data
Application reference, applicant surname, status and date of last change. All data stays in UK South. The broker is a UK firm, already assessed by Third-Party Risk in 2025, and its staff access data only from the UK.

## Integrations
Private network link between the broker's systems and Kestrel's Azure network.

## Security and access
The partner has its own read-only database account, limited to the status view. Its credentials are stored in Azure Key Vault and rotated every 90 days. Access is logged to Azure Monitor Log Analytics.

## Non-functional needs
This is not part of an important business service; brokers can still phone the desk. The replica is restored within 8 hours. Monitoring with alerts to the on-call team.

## Options considered
1. Build an API on Azure API Management: would take three months longer.

## Costs
Private network link and replica: about GBP 2,000 a month.

## Risks and open questions
- Database changes in the origination system may break the partner's queries.

## Delivery plan
Live in February 2027.
