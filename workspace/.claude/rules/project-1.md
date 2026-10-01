---
paths:
  - "project-1/**"
---
# Project 1 guide

Project identity and repository-specific facts are not configured yet. Do not infer them from this folder name. Before project work, inspect the repository itself and confirm that it is the intended target.

## Onboarding facts to record
- Repository URL/name and team owner
- Jira project key, where acceptance criteria live, and workflow conventions
- Languages, framework/runtime versions, package manager, and lockfile
- Install, lint, type-check, unit, integration, E2E, build, and local-run commands (copy from repository configuration)
- Application entry points, architecture, and important directories
- API contracts, data stores, DynamoDB tables/indexes and access patterns if applicable
- Test data, environment requirements, and safe test-account setup (never store credentials here)
- Branch/MR process and required reviewers/checks

Until confirmed, do not invent commands, schemas, endpoints, credentials, Jira keys, or deployment steps. Never run commands that could reach production or modify external systems without explicit approval.

## Project-specific decisions
Add concise, verified conventions here as they are discovered. Avoid duplicating common rules from `00-general.md` and technology rules.
