# Proposal: Partner marketplace

Author and team: Partnerships and Platform squads
Date: 2026-10-26

## Problem and business need
Customers want to find tools that connect to Fernbill, such as accounting and banking apps. Small partners say our OAuth 2.0 set-up is too complex for them, so fewer partners are joining.

## Scope (in and out)
In: a marketplace page listing approved partners; a simpler way for small partners to connect to customer accounts.
Out: payments between Fernbill and partners.

## Proposed design
- A marketplace page in the web app, served by a new Cloud Run service. Partner listings are stored in the shared PostgreSQL database with row-level security, although listings are public.
- When a customer connects a small partner, Fernbill issues the partner a long-lived API key for that customer's account, using the API key mechanism from ADR-007. This gives partners full access to the account, which they need for most integrations.
- Larger partners continue to use OAuth 2.0.

## Data
Partner names, descriptions and logos. API keys are stored hashed in the London region.

## Security and access
Customers can see and revoke connected partners in their settings. Partners are reviewed by the Partnerships team before being listed.

## Non-functional needs
Marketplace page alerts for errors and slow responses go to the on-call engineer. All services log to Cloud Logging in the London region.

## Options considered
1. Keep OAuth 2.0 only: fewer small partners join.
2. Build a simpler OAuth 2.0 set-up guide and sample code: helpful, but partners still find it hard.

## Costs
Negligible extra running cost; the marketplace service scales to zero when idle.

## Risks and open questions
- Partners may share API keys between their own systems.

## Delivery plan
Live in April 2027 with ten launch partners.
