# ADR-0004 Use Microsoft Entra ID for staff and managed identities for services

Status: Accepted
Date: 2024-06-10
Context: Several systems had their own user accounts, and some services connected to databases with passwords stored in configuration files.
Decision: Staff access uses Microsoft Entra ID with multi-factor authentication. Services authenticate with managed identities. Any remaining secrets are stored in Azure Key Vault.
Consequences: Access can be reviewed in one place. Older systems that cannot use Entra ID need a migration plan or an exception (KM-P04).
