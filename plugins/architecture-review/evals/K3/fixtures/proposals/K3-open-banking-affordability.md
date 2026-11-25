# Proposal: Open banking affordability checks

Author and team: Lending Digital team
Date: 2026-11-09

## Problem and business need
Mortgage underwriters check affordability using bank statements that applicants upload. This takes time and statements can be edited. ADR-0008 approved the use of an open banking aggregator, so this proposal sets out how we will deliver it.

## Scope (in and out)
In: asking the applicant's consent, retrieving 12 months of transactions from their other bank accounts through the aggregator, and showing a summary to underwriters.
Out: changes to lending policy.

## Proposed design
- A consent step in the online mortgage application, hosted on Azure App Service in UK South.
- The selected aggregator (referred to here as Supplier A while the procurement is confidential) connects to the applicant's banks and returns transaction data through its API.
- An integration on Azure API Management receives the data and stores a summary in the mortgage origination system's Azure SQL Managed Instance database.
- Events are published on Azure Service Bus.

## Data
Transaction history for the last 12 months, including amounts, dates and payee names. Supplier A has confirmed that all data is hosted in UK data centres. Supplier A's support team may access data from its support centres to resolve incidents; the locations of these centres are listed in its standard terms.

## Integrations
Supplier A's API, published through Azure API Management. Mortgage origination system.

## Security and access
Applicants give consent through Supplier A's authorised consent journey. Our integration uses a managed identity and stores Supplier A's API credentials in Azure Key Vault.

## Non-functional needs
Mortgage applications are an important business service. If Supplier A is unavailable, applicants can upload statements as now, so the service stays within its impact tolerance. The integration will be restored within 4 hours, with no more than 15 minutes of data lost, tested before go-live. Monitoring and alerts go to the on-call team. The consent step will be tested to WCAG 2.2 AA, and applicants can choose to provide statements instead.

## Options considered
1. Keep uploaded statements only: rejected because of the time taken.
2. Build connections to each bank ourselves: not practical.

## Risks and open questions
- We plan to sign the contract with Supplier A on 15 January 2027 so we can start the build. The third-party risk assessment will be completed after go-live, once we have real usage data.

## Delivery plan
Contract in January 2027, build February to April 2027, live in May 2027.
