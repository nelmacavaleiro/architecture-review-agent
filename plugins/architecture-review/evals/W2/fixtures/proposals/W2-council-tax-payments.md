# Proposal: Council tax online payments

Author and team: Revenues and Digital team
Date: 2026-10-13

## Problem and business need
Residents can pay council tax online only through an old payment page that is no longer supported by its supplier. We need a new way for residents to make one-off council tax payments online.

## Scope (in and out)
In: one-off card payments for council tax, with the payment recorded against the resident's council tax account.
Out: Direct Debit set-up; business rates.

## Proposed design
- A new payment page built by the Digital team on AWS in the London region, using AWS Lambda behind Amazon API Gateway.
- The page collects the resident's card details and sends them to the card payment gateway provided by the council's bank, which processes the payment.
- Successful payments are sent to the council tax system through an API on Amazon API Gateway, following ADR-0006.
- Receipts are sent by email through GOV.UK Notify.

## Data
Council tax account number, name, email address and payment amount. Card details are passed to the bank's gateway and are not stored. Data is stored in the AWS London region for seven years, in line with financial records rules. A DPIA screening found that a full DPIA is not required.

## Integrations
Bank's card payment gateway; council tax system API; GOV.UK Notify.

## Security and access
No resident account is needed. Staff reports are available through Microsoft Entra ID with multi-factor authentication. An independent penetration test will take place before go-live and every year after that.

## Non-functional needs
Available 99.5% of the time, with maintenance outside 7am to 10pm. Restore within 8 hours with no more than 1 hour of data lost. Pages load within 3 seconds. Tested to WCAG 2.2 AA before go-live; residents can still pay by phone or at the Post Office.

## Options considered
1. GOV.UK Pay: considered, but Finance prefers to keep all card income with the council's bank to simplify reconciliation.
2. Replace the old page with the same supplier's new product: higher yearly fees.

## Risks and open questions
- Handling card details in our own page will need checking against card industry security standards.

## Delivery plan
Live before annual bills are sent in March 2027.
