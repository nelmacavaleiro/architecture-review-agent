# Proposal: Invoice search

Author and team: Platform squad
Date: 2026-11-04

## Problem and business need
Customers with many invoices find the current search slow and limited to invoice numbers. They want to search by client name, amount, date and words in the invoice.

## Scope (in and out)
In: full-text search across invoices and clients in the web app and the public API.
Out: search across other customers' data; changes to reports.

## Proposed design
- A self-managed Elasticsearch cluster of three Compute Engine virtual machines in the London region, run by the Platform squad.
- A new Cloud Run service receives "invoice created" and "invoice updated" events from Pub/Sub and updates the search index.
- Every indexed document includes the tenant identifier. The search service adds a tenant filter to every query, and automated tests check that one customer can never see another customer's results.
- A new search endpoint in the public API, using the existing OAuth 2.0 scopes.

## Data
Copies of invoice numbers, client names, amounts, dates and invoice text, stored on the virtual machines' disks in the London region.

## Security and access
The cluster is only reachable from Fernbill's private network. The search service uses its own service account.

## Options considered
1. PostgreSQL full-text search: simpler, but too slow for our largest customers in testing.
2. A managed search service: not considered in detail.

## Risks and open questions
- The Platform squad has limited experience running Elasticsearch.

## Delivery plan
Release to customers with the most invoices first, in April 2027.
