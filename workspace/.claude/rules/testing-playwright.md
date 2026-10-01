---
paths:
  - "**/e2e/**"
  - "**/*.e2e.ts"
  - "**/playwright.config.*"
  - "**/*.feature"
---
# Playwright, Cucumber, and Gherkin guidelines

## Existing E2E suite

- Preserve the project's existing Cucumber + Gherkin + Playwright integration. Do not replace its runner, add another Cucumber/Playwright adapter, or create a parallel step-definition framework.
- Write maintained E2E scenarios as readable English Gherkin `.feature` files using `Feature`, `Scenario`/`Scenario Outline`, and concise `Given` / `When` / `Then` steps. Reuse existing step definitions, World/context, fixtures, hooks, page objects, tags, and reporting.
- Keep Gherkin focused on business behavior, not implementation details or selectors. `Given` establishes state, `When` describes the action, and `Then` checks an observable user or external-system outcome.
- Add a new step definition only when the wording describes genuinely new reusable behavior. Avoid duplicate/ambiguous steps; follow existing step-expression conventions.
- For browser interaction, use accessible roles, labels, and text first; use stable `data-testid` selectors only when semantic locators are unsuitable. Keep synchronization condition-based and never use arbitrary sleeps.
- Keep scenarios independent and test data uniquely scoped. Clean up data created by the scenario; never mutate production/shared data.

## Test target and authentication

- Use only the explicitly configured test environment from `TEST_BASE_URL`. Never default to production or guess a URL.
- Obtain login values from the test runner's dotenv/secret-loading setup via `E2E_USERNAME` and `E2E_PASSWORD`. The owner supplies these values in the approved local dotenv/secret store.
- Never open, print, log, commit, or copy `.env*`, credentials, cookies, tokens, or authenticated storage state. Tests should read the already-loaded `process.env` values. If required variables are unavailable, stop before navigating/authenticating and report BLOCKED without revealing values.
- If Playwright writes `storageState` or other auth artifacts, verify the path is ignored/untracked and never include it in commits or reports.

## Jira acceptance verification

- Acceptance-only E2E checks are disposable. Do not edit or append to the project's maintained `.feature` files, step definitions, shared E2E files, or runner configuration.
- Create a uniquely named temporary test under a location recognized by the existing runner (for example, a temporary subdirectory beneath its configured E2E test root). It may be a direct Playwright test rather than Gherkin; use Gherkin only if it is the only supported route in that project.
- Map each actual Jira AC to `[AC-n]` test names and observable outcomes. Do not invent or weaken criteria.
- Run only the documented targeted command and target test environment. Remove only the temporary files/artifacts created for this verification afterward; do not run broad cleanup commands. Confirm the temporary test is gone and no acceptance-test change remains staged or committed. Preserve the result matrix/evidence in the response, not as a permanent project test.
- If the runner cannot execute an isolated temporary test without modifying permanent E2E configuration/files, do not alter those files; report BLOCKED and provide the AC-to-scenario mapping.

Discover the actual Cucumber/Playwright commands and paths from project configuration. Official references: [Gherkin](https://cucumber.io/docs/gherkin/reference/), [Playwright configuration](https://playwright.dev/docs/test-configuration), and [Playwright authentication](https://playwright.dev/docs/auth).
