# ADR-0002 Host transactional databases on SQL Server virtual machines

Status: Superseded
Date: 2024-03-04
Context: Early Azure workloads needed SQL Server features that teams believed were not available in managed services at the time.
Decision: Transactional databases run on SQL Server installed on Azure virtual machines, managed by the infrastructure team.
Consequences: The infrastructure team is responsible for patching, backups and failover.
Superseded by: ADR-0005
