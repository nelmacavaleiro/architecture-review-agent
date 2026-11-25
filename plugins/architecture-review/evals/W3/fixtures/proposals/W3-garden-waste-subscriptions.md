# Proposal: Garden waste subscriptions

Author and team: Waste Services and Digital team
Date: 2026-11-10

## Problem and business need
Residents subscribe to garden waste collections each year by phone or paper form. Staff then enter details by hand into the collection round system. We want residents to subscribe and renew online.

## Scope (in and out)
In: online subscription and renewal, payment, reminders, and sending subscribed addresses to the collection round system.
Out: changes to collection rounds; bulky waste.

## Proposed design
- A subscription service on AWS Lambda behind Amazon API Gateway, in the AWS London region, with a simple web front end.
- Subscriptions are stored in Amazon DynamoDB in the London region. This service is the system of record for garden waste subscriptions.
- Payments use GOV.UK Pay (ADR-0004).
- Renewal reminders are sent through GOV.UK Notify (ADR-0003).
- Each morning, the collection round system reads the list of active subscriptions through the subscription API on Amazon API Gateway (ADR-0006).

## Data
Name, address, email address, phone number, subscription dates and payment references. No card details are held. Data is kept for two years after a subscription ends. All data, including backups, is stored in the AWS London region. A DPIA screening found that a full DPIA is not required; the Data Protection Officer agreed.

## Integrations
GOV.UK Pay; GOV.UK Notify; collection round system through the subscription API (JSON over HTTPS, documented with OpenAPI). Subscription data can be exported as CSV at any time.

## Security and access
Residents do not need an account; they receive a reference number. Staff sign in through Microsoft Entra ID with multi-factor authentication. An independent penetration test will take place before go-live and every year after that.

## Non-functional needs
Available 99.5% of the time, with maintenance outside 7am to 10pm. As the service takes payments, it will be restored within 8 hours with no more than 1 hour of data lost. Pages load within 3 seconds on a mobile connection. Tested to WCAG 2.2 AA before go-live; residents can still subscribe by phone.

## Options considered
1. Add a form to the council website's current content management system: it cannot take payments.
2. A shared garden waste product used by other councils: reviewed, but it does not integrate with our collection round system.

## Costs
Set-up: GBP 40,000. Running: GBP 6,000 a year for hosting, text messages and support, for an expected five years. Exit cost is low, as data can be exported as CSV.

## Risks and open questions
- Demand peaks at renewal time in February.

## Delivery plan
Live for renewals in February 2027.
