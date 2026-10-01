# Workspace instructions

Run Claude Code from this directory. Shared agents, commands, and MCP configuration come from the `dev-team` plugin in the sibling `team-marketplace/` repository. Project-specific guidance lives in `.claude/rules/`.

## Project map

| Folder | Identity | Jira key | Stack / status |
|---|---|---|---|
| `project-1/` | Unconfigured | Unconfigured | Placeholder; repo not present |
| `project-2/` | Unconfigured | Unconfigured | Placeholder; repo not present |
| `project-3/` | Unconfigured | Unconfigured | Placeholder; repo not present |

Do not infer project identity, Jira keys, stack, or commands from folder names. Onboard a repository and complete its `.claude/rules/project-N.md` before implementation.

## Rules and workflow

`.claude/rules/00-general.md` applies across projects. Technology and project guides are path-scoped. Read applicable rules and repository configuration before changing code; report instruction conflicts instead of silently choosing.

1. Confirm the target project, desired outcome, and acceptance criteria. Ask about decisions that materially affect behavior, scope, data, or external commitments.
2. For design/implementation, define contracts and dependencies with `architect` before parallel work.
3. Implement within the project using relevant specialists. Set non-overlapping file ownership and use direct named Agent Team teammates for visible team work.
4. Add/update appropriate tests, run documented checks, and report exact outcomes. Never claim an unrun check passed.
5. Use read-only `code-reviewer` / `mr-reviewer`; when Jira criteria apply, use `acceptance-verifier` for per-AC evidence. TypeScript/React/Angular reviews must check the corresponding anti-pattern rules, OpenAPI contract consistency, and unnecessary type assertions. Assess time/space complexity for non-trivial algorithms and hot paths; suggest a concrete alternative when the current approach is needlessly costly.

## Boundaries

- Confirm one target project. Keep project work inside it unless workspace documentation is explicitly assigned.
- Never read or expose secret files such as `.env*`, private keys, or credential stores. Never commit secrets.
- External or production writes (Jira, GitLab/GitHub, customer communication, deployments, production data) require explicit user approval. Show the proposed action/content before acting.
- Incident analysis is read-only; customer/internal messages are drafts. A human verifies and sends them.
- If a project repo, required MCP, authentication, or runtime environment is unavailable, state the blocker and continue independent read-only work where useful.

## Testing

Jest tests should exercise real code and normal test wrappers by default; add only necessary mocks and import reusable static mock data from `__mocks__/*.json`. Use the existing English translation wrapper for translated UI. Maintained browser E2E uses the installed Cucumber/Gherkin + Playwright integration. Jira AC checks are disposable, may use direct Playwright, and must be cleaned up without editing or committing permanent E2E files. The owner supplies `TEST_BASE_URL`, `E2E_USERNAME`, and `E2E_PASSWORD` through the approved dotenv loader; tests consume environment variables without opening or logging `.env*` contents.

## Jira acceptance criteria

Use criteria as written in Jira. Project-key mappings and AC locations are not configured yet. Never invent or weaken AC. Verification reports list each AC, scenario, PASS/FAIL/BLOCKED, and evidence. Jira writes require approval.

## TypeScript API contracts

Never author `any`; use type assertions only when a concrete invariant is proven and no safer type model fits. For OpenAPI-backed APIs, use generated request/response types and typed clients from the authoritative contract, respecting the repository's generator and generated-file policy. Do not duplicate contract types manually.

## Incident communication

Severity definitions, cadence, channels, and approvers are not yet organization-approved. Consult the plugin's incident-comms skill, ask the incident owner for applicable policy and next-update time, and draft only from confirmed facts.
