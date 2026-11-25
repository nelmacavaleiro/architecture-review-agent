# ADR-0009 Partners read member data from a database replica

Status: Accepted
Date: 2026-08-24
Context: Mortgage broker partners asked for faster access to application status, and building APIs for each partner was slow.
Decision: Approved partners connect directly to a read-only replica of the mortgage origination database, through a private network link.
Consequences: Partners get data quickly without new APIs. Each partner connection must be set up and monitored by the infrastructure team.
