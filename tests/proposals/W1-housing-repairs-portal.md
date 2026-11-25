# Proposal: Housing repairs portal

Author and team: Housing Services and Digital team
Date: 2026-11-03

## Problem and business need
Council tenants report repairs by phone, which causes long waits at busy times. Tenants want to report repairs online, add photos and see progress. Repairs officers want fewer calls.

## Scope (in and out)
In: online repair reports with photos, progress updates, and a staff screen to assign repairs to contractors.
Out: changes to the housing case management system; rent accounts.

## Proposed design
- Repair report forms built with the council's low-code form builder, following ADR-0007, so the housing team can change questions without developers.
- A repairs database on Amazon RDS for PostgreSQL in the AWS London region.
- Each night, the portal loads tenant names, addresses, tenancy references and contact details from the housing system's file export (ADR-0005).
- Repairs officers can update a tenant's phone number or email address in the portal when a tenant tells them it has changed, so repairs are not delayed. These changes stay in the portal database.
- Progress updates are sent to tenants by email and text message through GOV.UK Notify.

## Data
Tenant name, address, tenancy reference, contact details, repair details and photos. Some photos may show the inside of tenants' homes. Data is kept for six years after the repair is closed. All data is stored in the AWS London region. A DPIA has been completed and approved by the Data Protection Officer.

## Integrations
- Housing system nightly file export (incoming only).
- GOV.UK Notify.
- Contractors receive repair details through a secure email from the portal.

## Security and access
Tenants create an account with email and password and verify their tenancy reference. Staff sign in through Microsoft Entra ID with multi-factor authentication.

## Non-functional needs
Available 99.5% of the time, with maintenance outside 7am to 10pm. Pages load within 3 seconds on a mobile connection. Restore within 2 working days with no more than 24 hours of data lost. Tested to WCAG 2.2 AA before go-live; tenants can still report repairs by phone. Independent penetration test before go-live.

## Options considered
1. Add online reporting to the housing system: the supplier quoted a high cost and the system is being replaced in 2028.
2. Buy a repairs product: the shortlisted products did not integrate with the housing system.

## Costs
Set-up: GBP 85,000. Running: GBP 18,000 a year for hosting, Notify text messages and support, for an expected five years.

## Risks and open questions
- Contractors may not read secure emails promptly.

## Delivery plan
Live in June 2027.
