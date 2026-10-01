---
description: Review a GitLab or GitHub change request without posting
argument-hint: <MR/PR number or URL>
---
Review: $ARGUMENTS

Use `mr-reviewer` for a read-only review. Detect the host from the provided URL or ask if it is ambiguous. Use only the matching available read-only CLI (`glab` or `gh`) and report if authentication/tooling is unavailable. Read relevant project rules and Jira acceptance criteria when requested.

Return summary, verdict, actionable findings with file/line evidence, and draft comments. Do not post comments, approve, merge, push, or change labels/status without explicit user approval.
