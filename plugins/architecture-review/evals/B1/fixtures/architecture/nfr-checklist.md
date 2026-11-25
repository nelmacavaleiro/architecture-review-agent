# Kestrel Mutual non-functional requirements

## NFR-01 Availability

Applies to: Member-facing digital services
Target: Available 99.9% of the time each month, excluding planned maintenance announced to members in advance.

## NFR-02 Recovery

Applies to: Systems supporting an important business service
Target: Service restored within 4 hours; no more than 15 minutes of data lost. Recovery tested before go-live and at least once a year.

## NFR-03 Performance

Applies to: Online banking and the mobile app
Target: 95% of page loads and app actions complete within 2 seconds.

## NFR-04 Backups

Applies to: All systems holding member data
Target: Backups kept in UK regions only, and a restore tested at least every quarter.

## NFR-05 Accessibility

Applies to: Member-facing digital services
Target: Meets WCAG 2.2 level AA, tested before go-live.

## NFR-06 Audit retention

Applies to: Systems that change member balances, mortgages or savings
Target: Audit records kept for seven years in the central audit store.

## NFR-07 Monitoring

Applies to: Systems supporting an important business service
Target: Health monitored continuously, with alerts sent to the on-call team within 5 minutes of a failure.
