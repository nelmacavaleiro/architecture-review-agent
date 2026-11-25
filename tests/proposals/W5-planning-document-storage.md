# Proposal: Planning document storage

Author and team: Planning and ICT Infrastructure team
Date: 2026-10-06

## Problem and business need
Planning applications include large drawings and reports. The current document store is full and slow, and planning officers wait several minutes to open large drawings.

## Scope (in and out)
In: storage of planning application documents; a document management product for planning officers.
Out: the public planning portal; changes to how applications are decided.

## Proposed design
- A new storage server installed in the council's server room, with 200 TB of capacity. Our estimate shows that storing large drawings on-site is cheaper than cloud storage over five years.
- A document management product installed on a virtual server in the server room. It stores documents in its own internal file format, and the supplier does not offer a bulk export tool.
- Planning officers open documents from the document management product.

## Data
Planning documents, which include applicants' names and addresses and sometimes personal information in supporting statements. Stored in the council's server room in Wrenford, with backups to the council's second site. A DPIA has been completed.

## Integrations
The planning case system links to documents by reference number.

## Security and access
Planning officers sign in through Microsoft Entra ID. Access is limited to the Planning team.

## Non-functional needs
Documents open within 5 seconds. Restore within 2 working days with no more than 24 hours of data lost. The supplier has provided a WCAG 2.2 AA conformance report for the officer interface, and we will test it before go-live.

## Options considered
1. Amazon S3 storage in the London region: higher yearly cost for this volume, based on our estimate.
2. Keep the current store: not possible, as it is full.

## Costs
Set-up: GBP 140,000 for the server, licences and installation. Running: GBP 22,000 a year for support and power. The server will need replacing after five years, at a similar cost.

## Risks and open questions
- Space and cooling in the server room are limited.

## Delivery plan
Installed by May 2027.
