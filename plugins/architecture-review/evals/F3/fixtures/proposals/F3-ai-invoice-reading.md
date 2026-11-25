# Proposal: AI invoice reading

Author and team: Invoicing squad and Data team
Date: 2026-11-18

## Problem and business need
Customers want to upload supplier invoices as PDFs or photos and have the details filled in automatically. Following ADR-009, this proposal describes how we will build it.

## Scope (in and out)
In: upload of supplier invoices; automatic extraction of supplier, dates, amounts and VAT; customer review before saving.
Out: training our own models.

## Proposed design
- An upload screen in the web app and a new Cloud Run service in the London region.
- The service sends each uploaded image to a third-party AI service for extraction. The AI service processes requests in its US region; the supplier states that it does not keep the images or use them for training.
- Extracted details are shown to the customer to check before the bill is saved in the shared PostgreSQL database, with row-level security.
- To help debug extraction errors in the first months, the service writes the full uploaded image and the extracted text to Cloud Logging, kept for 30 days. All engineers can search these logs.

## Data
Supplier invoices, which can include names, addresses, bank account details and amounts. Images and logs are stored in the London region.

## Security and access
The AI service API key is stored in Secret Manager. The upload service uses its own service account.

## Non-functional needs
Extraction should take under 10 seconds for 95% of invoices. Alerts for extraction errors and slow responses go to the on-call engineer.

## Options considered
1. Build our own extraction model: not possible with our team size.
2. An AI service with UK processing: we found none with the same accuracy at a similar price.

## Costs
Estimated GBP 0.01 per invoice read, charged to the customer's plan allowance.

## Risks and open questions
- Extraction accuracy is lower for handwritten invoices.

## Delivery plan
Beta for 200 customers in March 2027.
