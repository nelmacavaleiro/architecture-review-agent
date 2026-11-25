# Proposal: Branch appointment booking

Author and team: Member Experience team
Date: 2026-11-16

## Problem and business need
Members phone branches to book mortgage and savings appointments, and branches keep separate paper diaries. Members want to book online, and branches want one shared view of appointments.

## Scope (in and out)
In: online booking, rescheduling and cancelling of branch appointments; a staff view of each branch's diary; reminder messages.
Out: video appointments; changes to mortgage or savings processes.

## Proposed design
- A booking page in online banking and on the public website, hosted on Azure App Service in UK South, with a standby deployment in UK West.
- Appointment data is stored in an Azure SQL Managed Instance database with a failover group to UK West, following ADR-0005.
- The booking service publishes an API through Azure API Management, which the staff diary view uses.
- Reminder requests are sent as messages on Azure Service Bus to the existing notification service.

## Data
Member name, membership number, contact details, branch, appointment time and reason (mortgage or savings). Data is kept for 12 months after the appointment and then deleted. All data, including backups, is stored in UK South and UK West.

## Integrations
- Existing notification service, through Azure Service Bus.
- Staff diary view, through the booking API on Azure API Management.

## Security and access
Members sign in to online banking as now; non-members booking on the public website give contact details only. Staff sign in with Microsoft Entra ID and multi-factor authentication. The service uses a managed identity, and secrets are held in Azure Key Vault. Logs go to Azure Monitor Log Analytics.

## Non-functional needs
Appointment booking is not an important business service, as members can still phone their branch. Availability of 99.9% each month; 95% of page loads within 2 seconds. Restore within 8 hours with no more than 1 hour of data lost. Backups kept in UK regions and restore tested every quarter. Health monitoring with alerts to the on-call team within 5 minutes. Tested to WCAG 2.2 AA before go-live, and members can still book by phone or in branch.

## Options considered
1. Buy a booking product: rejected because the shortlisted products host data outside the UK.
2. Shared calendar in Microsoft 365: does not support member self-service.

## Risks and open questions
- Branch staff will need training on the new diary view.

## Delivery plan
Pilot in three branches in April 2027, all branches by July 2027.
