---
description: Plan and implement independent feature work with visible Agent Team teammates
argument-hint: <project-1|project-2|project-3> <feature or JIRA-KEY>
---
Target: $ARGUMENTS

Use the Agent Team workflow in `/team-implement`. Parallelize only independent tasks with separate file ownership. Confirm the project and requirements, get the architect's contract and breakdown before implementation, then assign relevant direct named teammates and track dependencies in the shared task list.

Require a tmux session with `teammateMode` set to `tmux`; if unavailable, stop and direct the user to `./scripts/launch-team.sh`. Do not use nested agents or silently replace visible teammates with hidden subagents. The lead integrates, runs documented checks, obtains a read-only review, and reports results. External writes require explicit user approval.
