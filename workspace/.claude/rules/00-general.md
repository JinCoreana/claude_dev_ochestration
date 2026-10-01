# General engineering rules

These rules apply to all projects. Project-specific and technology-specific rules add detail; when instructions conflict, stop and tell the lead which rules conflict instead of silently choosing.

## Scope and safety
- Confirm the target project before editing. Keep project work inside that project and respect assigned file ownership.
- Read relevant code, tests, configuration, and project rules before changing behavior. Prefer small changes that fit established patterns.
- Never read, print, copy, or modify secret files or credentials, including `.env*`, private keys, and credential stores. If secret content is accidentally exposed, do not repeat it; alert the lead.
- Validate untrusted input at system boundaries. Do not log secrets, tokens, personal data, or full sensitive payloads.
- External writes (Jira, GitLab, customer channels, deployments, or production data) require explicit user approval. Drafting or reading may be allowed by the task.

## TypeScript and quality
- In authored TypeScript, never use `any`, including explicit and implicit `any`. Use `unknown` at untrusted boundaries and narrow it. Do not suppress the rule with `@ts-ignore`, broad casts, or disable comments; fix the type model or isolate the boundary safely.
- Use type assertions (`as`, angle-bracket assertions, non-null `!`) only when necessary and when a concrete invariant has been established that the compiler cannot represent. Prefer inference, generics, discriminated unions, type guards, and runtime validation. Keep any unavoidable assertion narrow and explain why it is sound.
- Use the project's configured TypeScript version and compiler options. Keep `strict` and `noImplicitAny` enabled for TypeScript projects unless a documented compatibility constraint prevents it; never turn them off to get a change through. Types do not validate runtime data.
- For API work, treat the backend contract as the source of truth. If an OpenAPI spec is supplied, inspect the existing generation pipeline and regenerate synchronized frontend request/response types and typed clients using repository tooling; never hand-copy contract types or edit generated output. If no generator exists, set up a reproducible generation path using the project's dependency conventions and report the chosen tool/command and ownership of the spec.
- Match existing formatting, architecture, dependency versions, and error-handling conventions. Do not add dependencies or broaden scope without need.
- Write or update focused tests alongside behavior changes when assigned. Never weaken a requirement or assertion just to pass.
- Run only checks documented by the project or explicitly requested. Report exact commands, pass/fail/blocked status, and any checks not run; never claim unrun checks passed.

## Git conventions
- Branch convention: `feature/<JIRA-KEY>-<short-description>` when a ticket exists; otherwise follow repository policy.
- Commit convention: Conventional Commits with a Jira key when available, e.g. `feat(PROJECT1-123): add search filter`. Do not invent a key.
- Do not commit, push, merge, or alter Git history unless explicitly requested.

## Completion report
State the outcome, files changed, relevant behavior or contract changes, checks and results, and unresolved risks/questions. Separate observed facts from assumptions.

## TypeScript reference
Follow TypeScript's guidance on [`any`, `unknown`, and type assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html); this workspace applies the stricter local rule that authored `any` is prohibited.
