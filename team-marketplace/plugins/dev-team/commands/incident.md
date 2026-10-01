---
description: Analyze an incident and prepare communication drafts
argument-hint: <P1|P2|P3|P4> <service/environment> <time window with timezone>
---
Incident: $ARGUMENTS

1. Confirm service/environment, time window/timezone, and severity. Ask for missing information that prevents a useful or safe analysis.
2. Ask `dynatrace-incident-analyst` for read-only evidence, impact, timeline, confirmed findings, hypotheses, and a confirmed-facts summary.
3. Pass only confirmed facts to `incident-comms`. Read the incident-comms skill, confirm audience/stage and approved next-update time, then draft requested internal/customer communications.
4. If a Jira incident ticket is requested, prepare the exact proposed content and obtain explicit approval before creation.

Never send communications, change Dynatrace or production state, or write to Jira without explicit user approval. Label unavailable evidence and policy settings instead of guessing.
