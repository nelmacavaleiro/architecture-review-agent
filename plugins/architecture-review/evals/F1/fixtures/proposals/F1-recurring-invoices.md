# Proposal: Recurring invoices

Author and team: Invoicing squad
Date: 2026-11-11

## Problem and business need
Many customers send the same invoice every month, such as a retainer or rent. They create each one by hand. Recurring invoices are the most requested feature in customer feedback.

## Scope (in and out)
In: setting up a schedule to create and send an invoice automatically; pausing and ending schedules; the same features in the public API.
Out: automatic card payments for recurring invoices.

## Proposed design
- A new table, recurring_schedules, in the shared PostgreSQL database, holding the schedule, the template invoice and the tenant identifier.
- To release quickly, row-level security will be added to the new table in a later release, once the feature is stable. Until then, the service filters by tenant identifier in its queries.
- A Cloud Run job runs every hour, creates due invoices and publishes an "invoice created" event on Pub/Sub, which the existing email service already handles.
- In the same release, the existing invoices.due_date column is renamed to payment_due_date, to match the wording in the new feature. The rename and the new code are deployed together.
- New public API endpoints for schedules, using the existing OAuth 2.0 scopes.

## Data
Schedule settings and template invoices, which include customers' clients' names, addresses and email addresses. Stored in Cloud SQL in the London region.

## Security and access
Customers manage schedules in the web app and through the API, as for other invoice features.

## Non-functional needs
The hourly job must finish within 15 minutes. Logs, metrics and traces go to Cloud Logging and Cloud Monitoring, with alerts for job failures and for invoices not sent within two hours of their due time.

## Options considered
1. A scheduler service on a virtual machine: rejected, as Cloud Run jobs are managed.
2. Pub/Sub delayed messages for each schedule: harder to pause and change.

## Costs
Estimated extra running cost of GBP 0.02 per customer a month, mainly for the hourly job.

## Risks and open questions
- Customers may set schedules on dates that do not exist in some months, such as the 31st.

## Delivery plan
Release to 5% of customers behind a feature flag in February 2027, then to everyone in March.
