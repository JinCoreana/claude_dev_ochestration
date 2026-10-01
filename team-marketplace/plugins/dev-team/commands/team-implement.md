---
description: Implement a feature with a visible Claude Code Agent Team
argument-hint: <project-1|project-2|project-3> <feature or JIRA-KEY>
---
Target: $ARGUMENTS

Follow `/team` for the shared Agent Team workflow. This entry point is optimized for implementation:

1. Confirm project, ticket/requirements, acceptance criteria, repository state, and applicable rules. Do not edit if the target repository is absent or unconfirmed.
2. Ask read-only `architect` to define design, API/type/data contract, dependencies, risks, and non-overlapping file ownership. Wait for the plan before implementation.
3. Add plan tasks to the shared task list. Spawn 2–4 relevant direct named teammates with exact deliverables, file boundaries, dependencies, and checks discovered from the repo. Do not use nested agents.
4. Select implementation and test roles based on actual stack: TypeScript cross-layer, Angular/React UI, Node/DynamoDB backend, Jest unit tests, Playwright E2E. Do not assign duplicate or irrelevant roles.
5. Wait for work to finish. The lead resolves integration conflicts, runs documented checks, and assigns a read-only `code-reviewer` teammate.
6. If a Jira ticket is involved, verify every actual AC with `acceptance-verifier`; report PASS/FAIL/BLOCKED evidence.
7. Summarize edits, checks, review findings, unresolved risks, and each teammate's result. Jira/GitLab/customer-channel writes require explicit approval.

Agent Teams intended to show panes require a tmux session with `teammateMode` set to `tmux`. If unavailable, stop and direct the user to start `./scripts/launch-team.sh`; do not imply work was delegated.
