# Kestrel Mutual architecture principles

## KM-P01 Member data stays in the UK

Type: Mandatory
Statement: Personal data about members is stored and processed only in UK data centres, including backups and copies used for testing.
Rationale: The Board has set this as part of the society's risk appetite, and members have been told their data stays in the UK.
Implications: Azure services must be deployed in UK South or UK West. Suppliers must confirm in writing where member data is stored and processed, including support access from outside the UK.
Exceptions: Only with written approval from the Data Protection Officer and the Chief Risk Officer.

## KM-P02 Important business services stay within impact tolerance

Type: Mandatory
Statement: Any change that supports an important business service must show how the service will stay within its impact tolerance during a severe but plausible disruption.
Rationale: The society has identified its important business services and set impact tolerances under the PRA and FCA operational resilience rules.
Implications: Proposals must name the important business services they affect, describe failover and recovery, and state how recovery will be tested before go-live.
Exceptions: None. A change that cannot meet the tolerance must be escalated to the Operational Resilience Committee.

## KM-P03 Every change to member money is auditable

Type: Mandatory
Statement: Every transaction or change affecting a member's balance, mortgage or savings account produces an audit record that cannot be altered or deleted.
Rationale: Audit trails support complaint handling, fraud investigation and regulatory reporting.
Implications: Audit records must include who or what made the change, when, and the values before and after. They are written to the central audit store (see ADR-0007).
Exceptions: Only with written approval from the Head of Internal Audit.

## KM-P04 Least privilege and strong authentication

Type: Mandatory
Statement: People and services are given only the access they need, and every login uses strong authentication.
Rationale: Limits the damage from compromised accounts and supports access reviews.
Implications: Staff sign in through Microsoft Entra ID with multi-factor authentication. Services use managed identities. Secrets are kept in Azure Key Vault, never in code or configuration files. Shared accounts are not allowed.
Exceptions: Only with written approval from the Chief Information Security Officer.

## KM-P05 Prefer managed Azure services

Type: Guidance
Statement: Use managed Azure services before building or hosting our own equivalents.
Rationale: Reduces patching and maintenance work, and makes resilience easier to achieve.
Implications: Proposals that host their own databases, queues or gateways on virtual machines should explain why a managed service is not suitable.
Exceptions: Discussed at the architecture review board.

## KM-P06 Systems integrate through the API gateway

Type: Guidance
Statement: Systems share data through published APIs on the API gateway, not by reading each other's databases.
Rationale: Keeps systems independent, so each can change without breaking others, and gives one place to secure and monitor integrations.
Implications: New APIs are published through Azure API Management (see ADR-0003). Asynchronous events use the messaging service (see ADR-0006).
Exceptions: Discussed at the architecture review board.

## KM-P07 Material third parties are assessed before use

Type: Mandatory
Statement: A new supplier that will handle member data or support an important business service is assessed by Third-Party Risk before a contract is signed.
Rationale: The society remains responsible for services it outsources, and some arrangements must be notified to the regulators.
Implications: Proposals must name new suppliers, describe what they will do and what data they will access, and show that a third-party risk assessment has started.
Exceptions: None.

## KM-P08 Digital journeys work for all members

Type: Guidance
Statement: Member-facing digital journeys meet WCAG 2.2 level AA and offer another way to complete the task, such as a branch or telephone.
Rationale: Supports good outcomes for all members, including those in vulnerable circumstances, in line with the FCA Consumer Duty.
Implications: Proposals for member-facing services should describe accessibility testing and the alternative channel.
Exceptions: Discussed with the Head of Member Experience.
