---
date:
  created: 2025-02-23
categories:
  - research-diary
  - paper
---

# Notes on checkpointing/recovery in message passing systems

<!-- more -->

### Terminologies
1. Process:-
2. Message:-
3. (Non)Volatile Storage:-

In order to make systems fault tolerant, checkpointing is employed. In this method different
processes periodically checkpoint their state into a non-volatile storage. In the presence of
a failure the checkpointed state is use to recover the processes to a earlier consistent state.

Things to optimize:-

1. (Time spent in checkpointing) / (Time spent in processing).
2. Size of the checkpointed state.
3. Minimize the progress loss during recovery.
4. Minimize recovery time.


Checkpointing requires
