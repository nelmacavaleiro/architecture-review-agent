# Proposal: Resident chatbot

Author and team: Customer Services and Digital team
Date: 2026-11-17

## Problem and business need
The customer contact centre receives many calls with general questions, such as bin collection days and opening times. We want a chatbot on the council website to answer these questions at any time.

## Scope (in and out)
In: a chatbot on the website that answers general questions using the website's content, and helps residents start common requests, such as reporting a missed bin or a housing problem.
Out: payments; changes to back-office systems.

## Proposed design
- A software-as-a-service chatbot product, added to the council website with a short script.
- The product uses a large language model provided by the supplier to answer questions from the website's pages.
- When a resident starts a request, the chatbot asks for their name, address and a description of the problem, and passes this to staff by email.
- The supplier hosts the service and all conversation data in its US data centres. UK hosting is available at extra cost, which is not included in the budget.

## Data
Conversation text, which may include names, addresses, contact details and descriptions of housing and personal circumstances. Conversations are kept by the supplier for 12 months. A DPIA is not needed, because the chatbot mainly answers general questions.

## Integrations
Council website (embedded script). Staff email.

## Security and access
Staff manage the chatbot through the supplier's admin site, signing in with Microsoft Entra ID. The supplier provides an independent penetration test report every year.

## Non-functional needs
Supplier commits to 99.9% availability. The supplier has provided a WCAG 2.2 AA conformance report, and the council will test the chatbot on its website before go-live.

To make savings, the general enquiries phone line will close when the chatbot goes live.

## Options considered
1. Improve website search: helps, but does not reduce calls as much.
2. Build our own chatbot: not affordable.

## Costs
Set-up: GBP 12,000. Running: GBP 30,000 a year on a three-year contract. Expected savings from closing the phone line: GBP 90,000 a year.

## Risks and open questions
- The chatbot may give wrong answers. The supplier says this is rare.

## Delivery plan
Live in April 2027.
