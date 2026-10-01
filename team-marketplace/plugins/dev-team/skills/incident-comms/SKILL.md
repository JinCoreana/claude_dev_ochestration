---
name: incident-comms
description: Policy and templates for drafting internal and customer incident communications; drafts only
---
# Incident communication guide

This skill governs drafts only. A human verifies facts, chooses approved recipients/channels, and sends. Never send, post, or imply that a draft has been sent.

## Policy configuration

The cadence, channels, and approvers below are organization-specific and have not been confirmed. Treat them as unset until an owner supplies policy. Do not promise an update deadline based on this table. Ask for the approved next-update time for each incident draft.

| Severity | Working definition (confirm locally) | Cadence / channel / approver |
|---|---|---|
| P1 | Broad outage or severe loss of a critical service | Not configured |
| P2 | Major degradation with significant customer impact | Not configured |
| P3 | Limited degradation with workaround or low impact | Not configured |
| P4 | Minimal impact or informational event | Not configured |

## Draft workflow
1. Confirm severity, stage (initial / update / resolved / postmortem), audience, service, timezone, facts, known impact, and approved next-update time.
2. Use only confirmed facts. If a cause is suspected, label it as under investigation internally and omit it from customer text unless confirmed and approved.
3. Select the matching template below. Replace every `{{placeholder}}`. Use `[NEEDS CONFIRMATION: field]` for unknown material facts; remove irrelevant fields only when safe.
4. Review the draft for audience, clarity, privacy, promises, and unsupported claims. Keep external language plain and concise; internal drafts may include technical details appropriate to recipients.
5. Return the draft plus unresolved fields. A human approves recipients and sends it.

## Template selection
- Initial: `templates/p1-initial.md` or `templates/p2-initial.md`; P3/P4 initial communications need an approved policy-specific draft.
- Update: `templates/update.md`
- Resolved: `templates/resolved.md`
- Internal summary: `templates/internal-summary.md`
- Postmortem: `templates/postmortem.md`

## Always
- No blame, speculation, raw sensitive data, secrets, or unnecessary internal architecture in external text.
- Do not promise an ETA or resolution time unless explicitly confirmed and approved.
- For updates, use a specific next-update time supplied by the incident owner; if unavailable, ask instead of inventing one.
- Record timezone and distinguish detection, start, mitigation, and resolution times when known.

## Maintaining this skill
An incident owner should approve severity definitions, notification deadlines, cadence, channels, and approvers before they are recorded here. Update templates and this index together; keep examples clearly marked as examples.
