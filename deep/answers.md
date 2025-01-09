# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning
Reasons to adopt: This approach ensures even distribution of observations among boats, which balances storage and processing load.
Reasons not to adopt: Queries for specific time ranges will require querying all boats, making range queries inefficient.

## Partitioning by Hour
Reasons to adopt: Allows efficient range queries for specific time periods, as data is organized by time. This can minimize query overhead.
Reasons not to adopt: Data distribution may be uneven if observations are concentrated in specific hours, potentially overloading certain boats.

## Partitioning by Hash Value
Reasons to adopt: Distributes data evenly across boats, ensuring balanced storage. Efficient for pinpointing specific observations.
Reasons not to adopt: Makes range queries inefficient because hash values are not sequential, requiring queries across all boats.
