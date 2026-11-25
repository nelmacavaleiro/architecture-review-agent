# Proposal: Member notification service

Author and team: Member Experience team
Date: 2026-10-27

## Problem and business need
Members receive few timely messages about their accounts. We want to send email and text alerts, such as "a payment has been made into your savings account", and let members choose which alerts they receive.

## Scope (in and out)
In: a preferences page in online banking; sending alerts by email and text message.
Out: marketing messages.

## Proposed design
- A preferences page in online banking, hosted on Azure App Service in UK South.
- A notification service on Azure Functions in UK South. Every five minutes it reads recent transactions and member contact details directly from the core savings system's database, using its managed identity with read-only permissions.
- Messages are sent through the society's existing email and text message supplier, which was assessed by Third-Party Risk in 2025.

## Data
Member name, email address, mobile number, alert preferences and the transaction details included in each message. Preferences are stored in an Azure SQL Managed Instance database in UK South, with backups in UK South and restore tested every quarter.

## Integrations
Core savings system database (read-only). Existing email and text message supplier.

## Security and access
Members sign in to online banking as now. The service uses a managed identity, and the supplier's API key is stored in Azure Key Vault.

## Non-functional needs
The notification service is not part of an important business service. The preferences page will be available 99.5% of the time each month. Restore within 1 working day. Monitoring with alerts to the on-call team. Accessibility testing of the preferences page will be considered in a later phase.

## Options considered
1. Ask the core savings system supplier to add alerts: quoted delivery of 18 months.
2. Receive events from the core system on Service Bus: the core system cannot publish events yet.

## Risks and open questions
- Reading the core database may add load during busy periods.

## Delivery plan
Live in March 2027.
