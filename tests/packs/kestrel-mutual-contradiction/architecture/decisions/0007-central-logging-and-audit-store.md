# ADR-0007 Central logging and an immutable audit store

Status: Accepted
Date: 2025-06-02
Context: Audit records were held in each application's own database, which made investigations slow and allowed records to be changed (KM-P03).
Decision: Application and security logs go to Azure Monitor Log Analytics. Audit records for changes to member money are written to Azure Blob Storage with an immutability policy, and kept for seven years.
Consequences: Audit records cannot be altered or deleted during the retention period. Teams must send audit events in the agreed format.
