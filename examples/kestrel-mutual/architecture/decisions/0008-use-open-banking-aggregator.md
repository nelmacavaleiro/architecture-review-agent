# ADR-0008 Use an open banking aggregator for affordability checks

Status: Proposed
Date: 2026-10-05
Context: Mortgage affordability checks rely on members uploading bank statements, which is slow and error-prone.
Decision: With the member's consent, use an authorised open banking aggregator to read transaction data from the member's other bank accounts for affordability checks.
Consequences: Faster and more accurate checks. The aggregator would be a new material third party (KM-P07), and the location of its data processing must be confirmed (KM-P01).
