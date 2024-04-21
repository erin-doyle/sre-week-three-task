# Ticketing system considerations

## Problems
1. recurring obsolete issues
2. a lack of clear prioritization for incoming issues

## Options
To address these issues we have the following options to consider:

1. Consider migrating to another alert management system, such as DataDog, that provides the ability to set thresholds that can
  - group events by specified criteria such as zone
  - only trigger an alert the first time events meet the threshold criteria or only re-trigger alerts after some additionally specified threshold
  - specify the priority level for a given alert
2. If we can possibly modify the alert management application ourselves then the above requirements should be added to the application
3. If the alert management application cannot be modified ourselves we could consider adding a sidecar application to replace the current integration with our ticketing system.
This application would provide the following capabilities:
  - provide the ability to set additional grouping and threshold criteria for how often to create a ticket for a given alert occurence
  - provide the ability to set the priority of a given alert
  - keeping the number of alerts that have had tickets created in memory can then be used to decide when to create a ticket for a specific alert

## Considerations
We should look into the above options and put together a cost/time estimate for each.  Then we can decide which approach will be the best fit for us at this time.
