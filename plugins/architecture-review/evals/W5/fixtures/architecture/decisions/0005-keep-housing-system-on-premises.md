# ADR-0005 Keep the housing case management system on premises until 2028

Status: Accepted
Date: 2024-05-13
Context: The housing case management system runs in the council's server room under a contract that ends in March 2028. Moving it early would mean paying for two systems.
Decision: The system stays on premises until the contract ends. Other systems receive housing data from it through a nightly file export, and must not connect to its database directly.
Consequences: Housing data in other systems can be up to a day old. A replacement must be chosen by early 2027.
