---
description: Run a project task with named, visible Agent Team teammates
argument-hint: <project-1|project-2|project-3> <task>
---
Target and task: $ARGUMENTS

Use Claude Code Agent Teams with named direct teammates. Do not silently substitute hidden subagents for teammates intended to appear in tmux panes.

1. Confirm the target is exactly one configured project. Read workspace instructions and relevant project/technology rules. If the repo is missing or its identity is unconfirmed, stop before project edits and ask for onboarding information.
2. For implementation/design tasks, assign `architect` first as read-only. For review or research, define separate non-overlapping questions instead.
3. Confirm requirements and acceptance criteria; retrieve Jira criteria with `jira-agent` when a ticket key is supplied. Do not invent missing criteria.
4. Create a shared task list. Assign 2–4 direct named teammates only when work is independent and parallelism helps. Give each a concrete deliverable, dependencies, exact file ownership, applicable rules, and completion report format. Never allow nested agent spawning.
5. Choose roles based on repository facts: `typescript-specialist` for shared/cross-layer TypeScript work, `frontend-angular` or `frontend-react` for framework UI, `backend-node-dynamo` for Node/DynamoDB, `unit-test-jest` or `e2e-playwright` for tests. Avoid duplicate ownership and omit irrelevant roles.
6. Track dependencies and blockers. Teammates report exact checks run; the lead integrates changes and runs documented checks that are relevant and permitted.
7. Assign `code-reviewer` read-only after implementation. For Jira acceptance work, use `acceptance-verifier` to produce a per-AC matrix.
8. Summarize changes, check results, review findings, teammate outcomes, and unresolved risks. Any external write requires explicit user approval.

If the session is not in tmux with Agent Teams configured, explain that a fresh session via `./scripts/launch-team.sh` is required; do not claim teammates were launched.
