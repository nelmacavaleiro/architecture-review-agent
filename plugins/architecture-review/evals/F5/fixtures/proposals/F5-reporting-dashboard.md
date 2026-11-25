# Proposal: Reporting dashboard improvements

Author and team: Reporting squad
Date: 2026-11-20

## Problem and business need
Customers want to see who owes them money and how long invoices take to be paid. The current reports page shows only totals.

## Scope (in and out)
In: new charts for amounts owed by client, average days to payment, and overdue invoices; the same figures in the public API.
Out: forecasting; changes to how invoices are stored.

## Proposed design
- New charts in the web app's reports page, served by the existing reporting service on Cloud Run.
- Figures are calculated from the BigQuery datasets in the London region (ADR-006), using views that filter by tenant identifier. The reporting service can only query these views, not the underlying tables.
- New public API endpoints for the same figures, using the existing OAuth 2.0 reporting scope.
- Released behind a feature flag, first to 10% of customers.

## Data
No new data. Figures come from the nightly reporting copy and can be up to a day old, as for current reports.

## Security and access
As for current reports. Access to the BigQuery views is limited to the reporting service's service account.

## Non-functional needs
Charts load within 3 seconds for 95% of customers. Logs, metrics and traces go to Cloud Logging and Cloud Monitoring, with alerts for errors and slow queries.

## Options considered
1. Calculate figures from the main database: rejected, as ADR-006 moved heavy reports off it.

## Costs
Estimated extra BigQuery cost of GBP 0.005 per customer a month, based on current report usage.

## Risks and open questions
- Some customers may expect figures to update instantly.

## Delivery plan
Release in February 2027.
