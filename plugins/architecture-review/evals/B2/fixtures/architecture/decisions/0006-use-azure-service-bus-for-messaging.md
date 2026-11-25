# ADR-0006 Use Azure Service Bus for messaging between systems

Status: Accepted
Date: 2025-03-17
Context: Teams needed a way for systems to react to events, such as a mortgage completion, without calling each other directly.
Decision: Asynchronous messages and events between systems use Azure Service Bus, with the Premium tier for any flow that supports an important business service.
Consequences: Systems are less dependent on each other being available at the same time. Teams must handle duplicate and out-of-order messages.
