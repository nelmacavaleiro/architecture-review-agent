# Proposal: Mortgage document upload

Author and team: Lending Digital team
Date: 2026-11-02

## Problem and business need
Mortgage applicants currently email their documents or post them to a branch. Emails are often missed, and staff spend time chasing and re-keying information. We want applicants to upload documents securely in online banking, and have key details read automatically.

## Scope (in and out)
In: upload of identity documents, payslips and bank statements during a mortgage application; automatic reading of key details; passing documents to the mortgage origination system.
Out: changes to the affordability rules; documents for savings accounts.

## Proposed design
- A new upload page in online banking, hosted on Azure App Service in UK South.
- Uploaded files are stored in Azure Blob Storage in UK South.
- Files are sent to Azure AI Document Intelligence, deployed in the West Europe region, to read names, addresses, income figures and account numbers. We chose West Europe because a preview feature we want to use is offered there first.
- Extracted details and the documents are passed to the mortgage origination system through Azure API Management.
- An event is published on Azure Service Bus when an application has all its documents.

## Data
Identity documents, payslips and bank statements, which contain names, addresses, dates of birth, income and account details. Documents are kept for the life of the mortgage application and then for seven years. Storage is geo-redundant, so a copy is also kept in UK West.

## Integrations
- Mortgage origination system, through Azure API Management.
- Azure Service Bus for the "documents complete" event.

## Security and access
Applicants sign in to online banking as now. The upload service uses a managed identity to reach storage and Document Intelligence. Secrets are held in Azure Key Vault. Staff access to documents is through the mortgage origination system only.

## Non-functional needs
Availability of 99.9% each month, in line with online banking. Pages should load within 2 seconds. Accessibility testing to WCAG 2.2 AA will be done before go-live, and applicants can still bring documents to a branch.

Recovery: to be confirmed with the infrastructure team.

## Options considered
1. Keep email and post: rejected because of the delays.
2. Manual review of uploads without automatic reading: possible, but saves less staff time.

## Risks and open questions
- The preview feature may change before general availability.

## Delivery plan
Build in January and February 2027, pilot with mortgage brokers in March 2027.
