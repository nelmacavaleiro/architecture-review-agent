# ADR-0005 Use Azure SQL Managed Instance for transactional data

Status: Accepted
Date: 2025-01-27
Context: Running SQL Server on virtual machines (ADR-0002) created a large patching and backup workload, and failover tests were slow to arrange.
Decision: New transactional databases use Azure SQL Managed Instance, with a failover group to UK West. Existing databases move as their systems are next changed.
Consequences: Patching, backups and failover are handled by the platform. Some instance-level settings are no longer available to teams.
Supersedes: ADR-0002
