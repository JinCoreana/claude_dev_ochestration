---
paths:
  - "**/server/**"
  - "**/backend/**"
  - "**/api/**"
  - "**/*.handler.ts"
---
# Node.js and DynamoDB guidelines

- Follow the repository's Node.js version, module system, framework, AWS SDK version, and client abstraction. Prefer AWS SDK v3 when already used; do not migrate dependencies as incidental work.
- Define and review the access pattern before writing a DynamoDB operation. Never use `Scan` for routine application access; use `Get` or `Query` with a known partition key and index. Add an index only when the access pattern requires it and its operational cost is understood.
- Handle pagination (`LastEvaluatedKey`) where results can exceed one response. Bound result sizes and avoid N+1 request patterns.
- Use conditional writes for actual invariants, idempotency, or optimistic concurrency requirements. Do not apply one mechanically to every write.
- Validate and authorize requests before data access. Enforce tenant/owner scoping in the persistence query itself where applicable.
- Treat database records and external payloads as untrusted runtime data; validate or narrow them before relying on them.
- Keep the OpenAPI document (or the repository's designated API schema) synchronized with API behavior. When a contract changes, regenerate dependent clients/types using the documented pipeline and report compatibility/breaking changes; do not edit generated outputs manually.
- Map storage and dependency errors to stable API errors without leaking internal details. Use timeouts/retries according to the existing client policy and avoid unsafe retrying of non-idempotent operations.
- Do not log secrets, tokens, personal data, or full request/record payloads.
- Test access patterns and edge cases with the project's established local DynamoDB, integration, or mock strategy. Do not assume which strategy is installed.
