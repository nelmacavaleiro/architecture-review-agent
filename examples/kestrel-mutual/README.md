# Kestrel Mutual Building Society (fictional)

Kestrel Mutual is a fictional UK building society created to test the architecture review agent. It does not represent any real organisation.

## Context

- Owned by its members. Offers mortgages, savings accounts, a branch network and online banking.
- Regulated by the Prudential Regulation Authority (PRA) and the Financial Conduct Authority (FCA).
- Runs most new systems on Microsoft Azure, in the UK South region with UK West as the secondary region.
- Main architecture concerns: keeping member data in the UK, operational resilience of important business services, audit trails for changes to member money, and managing third-party suppliers.

## Files

| File | Contents |
|---|---|
| `architecture/principles.md` | Eight principles in one file |
| `architecture/decisions/` | Eight architecture decision records (ADRs), one per file |
| `architecture/nfr-checklist.md` | Seven non-functional requirements |

This organisation uses the folder layout described in [01-input-format.md](../../docs/01-input-format.md).
