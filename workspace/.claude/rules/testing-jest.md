---
paths:
  - "**/*.spec.ts"
  - "**/*.test.ts"
  - "**/*.test.tsx"
---
# Jest guidelines

## Default: exercise real behavior

- Prefer the real implementation and the project's normal test wrapper/providers. Mock nothing by default.
- Mock only a boundary that must be isolated for safety, determinism, speed, or because it is unavailable in the test environment (for example, an external network, clock, cloud service, or unsupported browser API). State the reason for each mock in the test or report.
- Do not mock the package/library whose normal behavior the test is meant to exercise. Prefer integration tests through the real package and the established test wrapper.
- For translated UI, use the standard wrapper/provider with the English test locale. Assert the rendered English behavior; do not mock translation functions or replace translations with key strings when the real i18n setup is available.
- Review mocks in the changed scope and remove those that are unnecessary. Do not sweep unrelated test files or remove a mock that protects an external/destructive boundary.

## Shared mock data and implementations

- If static mock data is genuinely reused by multiple tests, store it once in a descriptive `__mocks__/<fixture-name>.json` file and import it. Keep fixtures representative, minimal, and free of credentials or personal data; do not duplicate large inline objects.
- A JSON fixture is ordinary imported data, not an automatically activated Jest module mock. For a necessary reusable module mock, use the project's Jest manual-mock convention in `__mocks__/<module-name>.<ext>` and explicitly activate it where the configured Jest version/module system requires it.
- Avoid creating shared fixtures for one-off values or sharing mutable objects across tests. Clone/reset fixture data when a test mutates it.

## Test quality

- Structure tests around observable behavior using Arrange–Act–Assert. Keep each test focused and name the behavior and relevant condition.
- Cover meaningful success, boundary, and failure cases. Prefer user-visible effects or contract outcomes over implementation call counts.
- Keep tests deterministic and independent. Clean up timers, spies, temporary resources, and state; reset only what the test changes.
- Do not weaken assertions or change production code when assigned only to test work; report suspected defects separately.
- Discover the actual Jest command/version/config from the repository. Do not invent commands or claim unrun checks passed.

Jest's [manual mock guidance](https://jestjs.io/docs/manual-mocks) describes module mocks under `__mocks__`; this workspace keeps reusable JSON fixtures explicitly imported so test data is not confused with Jest's module-mocking behavior.
