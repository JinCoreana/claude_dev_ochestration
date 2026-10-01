# Team Marketplace

Shared Claude Code plugin marketplace for the development team. The `dev-team` plugin provides role-specific agents, workflow commands, incident communication guidance, and MCP configuration.

## Install

From Claude Code, add the marketplace from a repository URL or local checkout, then install the plugin:

```text
/plugin marketplace add <git-url-or-local-path>
/plugin install dev-team@team-marketplace
```

For local development, provide the path to this `team-marketplace/` directory. Review workspace settings and trust prompts before accepting them.

## Integrations

- Dynatrace MCP reads `DT_ENVIRONMENT` and `DT_PLATFORM_TOKEN`. Keep credentials in environment/secret storage; never commit or paste them into prompts.
- Atlassian MCP uses its configured OAuth flow; authenticate through Claude Code's `/mcp` interface.
- MR/PR review supports GitLab (`glab`) and GitHub (`gh`) read-only workflows. Authenticate with the relevant CLI. Comments, approvals, merges, and other external writes still require explicit approval.
- Verify current MCP package names/endpoints, CLI options, and Claude Code plugin/Agent Teams behavior in official documentation before changing integration configuration.

## Contents

| Area | Roles / files |
|---|---|
| Implementation | architect, typescript-specialist, frontend-angular, frontend-react, backend-node-dynamo |
| Testing | unit-test-jest, e2e-playwright, acceptance-verifier |
| Review | code-reviewer, mr-reviewer |
| Operations | dynatrace-incident-analyst, incident-comms, jira-agent |
| Commands | team, team-implement, parallel-implement, review-mr, verify-ticket, incident |
| Skills | incident-comms policy scaffold and templates |

Plugin agents and commands may appear under `dev-team:` (for example `/dev-team:team`). Use `/` in Claude Code to inspect installed names.

## Review focus

`mr-reviewer` and `code-reviewer` apply the project's TypeScript, React, and Angular rules; they actively check the listed anti-patterns, OpenAPI-generated contract drift, and unnecessary assertions. For non-trivial algorithms or hot UI paths, they estimate time/space complexity and suggest a concrete alternative when the current approach is needlessly costly. Findings require evidence and should avoid speculative micro-optimizations.

## Development and release

1. Edit plugin content in this repository; workspace/project rules live in the workspace directory.
2. When adding or renaming an agent, command, or skill, check frontmatter, manifest metadata, relative links, and all references.
3. Preview/install from a disposable Claude Code configuration before sharing; do not assume a command exists until confirmed in the target version.
4. Update this guide and workspace setup documentation when roles, commands, integration requirements, or behavior change.

Project/Jira mappings, project-specific commands, and incident cadence/channels/approvers are not configured until their owners confirm them.
