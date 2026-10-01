---
description: Verify a Jira ticket's actual acceptance criteria and report evidence
argument-hint: <JIRA-KEY> [project]
---
Verify: $ARGUMENTS

Use `acceptance-verifier` to retrieve the ticket's actual AC, map each criterion to verification, and produce a PASS/FAIL/BLOCKED matrix. Write disposable acceptance E2E test file(s) only; do not edit the project's maintained Cucumber/Gherkin suite, shared E2E files, configuration, or product code. Run the documented test command against the configured test URL, then remove only the temporary files/artifacts created and confirm no AC test remains staged or committed. Do not invent AC/commands, expose dotenv credentials, or weaken assertions. Report blockers and evidence. Posting results to Jira requires explicit user approval.
