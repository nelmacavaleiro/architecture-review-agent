# Fernbill (fictional)

Fernbill is a fictional UK software company created to test the architecture review agent. It does not represent any real organisation or product.

## Context

- A growing business-to-business software company. Its product lets small businesses create and send invoices, take payments and chase late payers, for a monthly subscription.
- One platform serves all customers, so each customer's data must be kept separate from every other customer's.
- Runs on Google Cloud in the London region, and releases changes to production several times a day.
- Main architecture concerns: keeping customers' data separate, fast and safe releases, monitoring, and the cost of serving each customer.

## Files

| File | Contents |
|---|---|
| `architecture.md` | Eight principles and nine architecture decision records (ADRs) in one file |

This organisation uses the single-file option described in [01-input-format.md](../../docs/01-input-format.md). It has no NFR checklist, so the agent should review non-functional needs against general good practice and label those findings accordingly.
