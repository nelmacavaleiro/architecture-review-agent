# Fernbill architecture

# Principles

## FB-P01 Customers' data is always kept separate

Type: Mandatory
Statement: No customer can see or change another customer's data, through the product, the API, support tools or reports.
Rationale: Customers trust us with their invoices and their own clients' details. A single leak between customers would be a serious breach and could end the business.
Implications: Every table holding customer data has a tenant identifier, and the database enforces separation with row-level security (see ADR-003). Support tools that can view more than one customer's data must log every access.
Exceptions: None.

## FB-P02 Customer data stays in the UK

Type: Mandatory
Statement: Customer data, including backups, logs and reporting copies, is stored and processed only in the Google Cloud London region.
Rationale: Our contracts promise UK hosting, and many customers chose us for this reason.
Implications: New services, storage and third-party tools that receive customer data must confirm where data is stored and processed.
Exceptions: Only with written approval from the Chief Technology Officer and the Data Protection Officer, and only where customer contracts allow.

## FB-P03 Card details never touch our systems

Type: Mandatory
Statement: Payment card details are entered only on our payment provider's hosted pages and are never sent to, stored on or logged by Fernbill systems.
Rationale: Keeps our PCI DSS obligations as small as possible and reduces the impact of any breach.
Implications: Payment features must use the payment provider's hosted checkout (see ADR-005). Logs must not capture payment form data.
Exceptions: None.

## FB-P04 Everything we run is observable

Type: Mandatory
Statement: Every service sends structured logs, metrics and traces to the central monitoring tools, and has alerts for failures that affect customers.
Rationale: We release often, so we must spot problems quickly and see which customers are affected.
Implications: Logs and traces include the tenant identifier but never card details or passwords. New services must define their alerts before going live.
Exceptions: Only with approval from the Head of Platform.

## FB-P05 Every feature is available through the public API

Type: Guidance
Statement: New features are built so that customers and partners can use them through the public API, not only through the web app.
Rationale: Many customers connect Fernbill to their accounting and banking tools, and partners build on our API.
Implications: Proposals should describe the API changes for each new feature, and how existing API users will be affected.
Exceptions: Discussed at the weekly architecture review.

## FB-P06 Ship small changes that can be reversed

Type: Guidance
Statement: Changes are released in small steps, behind feature flags where useful, and can be turned off or rolled back quickly.
Rationale: Small changes are easier to test and safer to release several times a day.
Implications: Database changes must work with both the old and new versions of the code during a release. Large features should be released gradually, starting with a small group of customers.
Exceptions: Discussed at the weekly architecture review.

## FB-P07 Know the cost of serving each customer

Type: Guidance
Statement: Teams know what their services cost to run, and how that cost grows as customers are added.
Rationale: Our prices are per customer, so costs that grow faster than customer numbers reduce our margin.
Implications: Cloud resources are labelled by service and team. Proposals should estimate running costs and how they change with the number of customers.
Exceptions: Discussed at the weekly architecture review.

## FB-P08 Prefer serverless and managed services

Type: Guidance
Statement: Use serverless and managed Google Cloud services before running our own servers or clusters.
Rationale: A small platform team cannot look after many servers, and managed services scale with demand.
Implications: Proposals that need virtual machines or self-managed clusters should explain why a managed service is not suitable.
Exceptions: Discussed at the weekly architecture review.

# Decisions

## ADR-001 Use Google Cloud in the London region

Status: Accepted
Date: 2023-04-03
Context: Fernbill needed a cloud provider with a UK region and managed services suited to a small team.
Decision: All services run on Google Cloud in the London region (europe-west2).
Consequences: One provider to manage. Any service not available in the London region needs a different design or an approved exception (FB-P02).

## ADR-002 Run application services on Cloud Run

Status: Accepted
Date: 2023-04-17
Context: The team wanted to deploy containers without managing servers or a Kubernetes cluster.
Decision: Application services run as containers on Cloud Run.
Consequences: Services scale automatically, including to zero when idle. Long-running background jobs need a different approach, such as Cloud Run jobs.

## ADR-003 Use one shared PostgreSQL database with row-level security

Status: Accepted
Date: 2023-05-08
Context: We considered a separate database for each customer and one shared database. Separate databases would be simpler to isolate but far more expensive and harder to manage as customer numbers grow.
Decision: Customer data is held in one shared Cloud SQL for PostgreSQL database. Every table holding customer data has a tenant identifier, and PostgreSQL row-level security restricts each request to one tenant.
Consequences: Lower cost per customer. Isolation depends on row-level security being applied to every table, so new tables must be checked in code review (FB-P01).

## ADR-004 Use Pub/Sub for events between services

Status: Accepted
Date: 2023-09-11
Context: Services needed to react to events, such as an invoice being paid, without calling each other directly.
Decision: Services publish and receive events through Google Cloud Pub/Sub.
Consequences: Services are less dependent on each other. Receivers must handle duplicate messages.

## ADR-005 Use the payment provider's hosted checkout

Status: Accepted
Date: 2023-10-02
Context: Customers want their own clients to pay invoices by card. Handling card details ourselves would bring us fully into PCI DSS scope.
Decision: Card payments use our payment provider's hosted checkout pages. Fernbill receives only payment confirmations and references.
Consequences: Our PCI DSS scope stays small (FB-P03). The checkout design is limited to what the provider allows.

## ADR-006 Use BigQuery for customer reports

Status: Accepted
Date: 2024-06-24
Context: Large reports were slowing down the main database during working hours.
Decision: Customer data is copied every night to BigQuery datasets in the London region, and reports read from BigQuery.
Consequences: The main database is protected from heavy queries. Reports can be up to a day out of date. The reporting copy must keep customers' data separate as strictly as the main database (FB-P01).

## ADR-007 Use API keys for the public API

Status: Superseded
Date: 2023-06-12
Context: Early partners needed simple access to the public API.
Decision: Partners authenticate with a long-lived API key for each customer account.
Consequences: Simple to use, but keys are hard to rotate and give full access to the account.
Superseded by: ADR-008

## ADR-008 Use OAuth 2.0 for the public API

Status: Accepted
Date: 2025-02-10
Context: Long-lived API keys (ADR-007) gave partners full access and were rarely rotated.
Decision: The public API uses OAuth 2.0. Customers grant partners access with limited scopes, and tokens expire.
Consequences: Customers control what each partner can do. Existing partners using API keys must move to OAuth 2.0 by the published deadline.
Supersedes: ADR-007

## ADR-009 Use a third-party AI service to read supplier invoices

Status: Proposed
Date: 2026-10-19
Context: Customers want to upload supplier invoices as PDFs or photos and have the details filled in automatically.
Decision: Send uploaded invoice images to a third-party AI service to extract the supplier, amounts and dates.
Consequences: Saves customers time. The AI service would receive customer data, so where it stores and processes data must be confirmed against FB-P02, and whether it keeps or learns from the data must be checked.
