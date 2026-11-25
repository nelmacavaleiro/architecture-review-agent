# Proposal: Savings rate change tool

Author and team: Savings Operations and Core Systems team
Date: 2026-10-20

## Problem and business need
When the society changes savings rates, staff update spreadsheets and run manual scripts to apply new rates and recalculate interest. This is slow and has caused errors. We want a staff tool to schedule rate changes and apply them to accounts automatically.

## Scope (in and out)
In: scheduling rate changes, applying them to savings accounts, recalculating accrued interest, and notifying members through existing letters.
Out: mortgage rates; the member-facing website.

## Proposed design
- A staff web application hosted on Azure App Service in UK South, available only on the corporate network.
- A new database on SQL Server installed on an Azure virtual machine, following our database hosting standard in ADR-0002.
- A nightly job applies scheduled rate changes and recalculates accrued interest on each account, updating the balance in the core savings system through its API on Azure API Management.

## Data
Account numbers, current and new rates, and accrued interest amounts. No member contact details are held.

Each change is recorded in an audit table in the tool's own database, with the staff member, time, and old and new values. Database administrators can correct audit entries if a mistake is made during a rate change.

## Integrations
Core savings system, through Azure API Management.

## Security and access
Staff sign in with Microsoft Entra ID and multi-factor authentication. Only the Savings Operations team can schedule changes, and a second person must approve each change. The application uses a managed identity.

## Non-functional needs
Savings servicing is an important business service. The nightly job must finish within 2 hours. If it fails, it can be re-run the next morning; recovery of the application within 4 hours with no more than 15 minutes of data lost, tested before go-live using the database's log backups. Backups are kept in UK South. Health monitoring with alerts to the on-call team.

## Options considered
1. Keep spreadsheets: rejected because of errors.
2. Buy a rate management product: too expensive for our size.

## Risks and open questions
- Large rate changes affect many accounts in one night.

## Delivery plan
Build in Q1 2027, first live rate change in Q2 2027.
