---
paths:
  - "**/*.component.ts"
  - "**/*.component.html"
  - "**/*.service.ts"
  - "**/*.module.ts"
  - "**/*.directive.ts"
  - "**/*.pipe.ts"
---
# Angular guidelines

- Follow the installed Angular version and existing architecture. Do not assume standalone components, NgModules, Signals, NgRx, or a specific forms library without checking the project.
- Prefer focused components, typed inputs/outputs, explicit service boundaries, and immutable data updates consistent with the codebase.
- Use the established reactive state/data-fetching approach. Avoid subscriptions that outlive a component; prefer the `async` pipe or lifecycle-aware cleanup supported by the installed version.
- Use reactive or template-driven forms according to existing patterns; validate at the UI and trust server-side validation for enforcement.
- Preserve accessibility: semantic HTML, associated labels, keyboard support, visible focus, and announced validation/errors.
- For backend APIs with an OpenAPI contract, consume the repository-generated request/response types and client. Do not recreate API interfaces by hand. When the backend contract changes, regenerate the frontend client/types from the authoritative spec and report any breaking mismatch.
- Avoid direct DOM access and unsafe HTML unless a reviewed integration requires it.
- Add focused tests for behavior changes and use the project's documented lint, type-check, and test scripts.

## Patterns to reject in new code

- Writing `any`, hiding type errors with suppression, or using unchecked assertions instead of narrowing/validation. API data remains untrusted at runtime even when generated TypeScript types exist.
- Putting substantial business logic, data access, or complex transformations in templates or a component that has multiple unrelated responsibilities. Keep templates readable and move cohesive work to a focused function/service/computed value.
- Calling expensive methods in templates or frequently-run lifecycle hooks. Keep template expressions cheap and pure; profile before adding caches or change-detection workarounds.
- Using `ngDoCheck`, `ngAfterViewChecked`, or manual change-detection calls as routine state synchronization. Prefer normal bindings and supported reactive patterns; use hooks only for a demonstrated integration need.
- Manually subscribing without clear teardown, nesting `.subscribe()` calls, or duplicating subscription state. Prefer template async binding or the project's supported lifecycle cleanup (such as `takeUntilDestroyed` when available).
- Mutating shared input/state objects in place, creating competing sources of truth, or using global state for state that is local to one feature.
- Accessing/manipulating DOM directly when Angular bindings, directives, or renderer APIs fit; bypassing the framework can break safety and lifecycle assumptions.
- Omitting stable tracking for repeated lists or using array position as identity when entries can move/change; use stable domain identity with the version-appropriate control-flow syntax.
- Introducing manual memoization, `OnPush`, Signals, NgRx, or custom change-detection machinery without checking the Angular version, existing architecture, and an actual need.

These are evidence-based review signals, not absolute bans on framework escape hatches. Confirm a concrete defect or cost before filing. See Angular's [style guide](https://angular.dev/style-guide), [lifecycle guidance](https://angular.dev/guide/components/lifecycle), and [slow-computation guidance](https://angular.dev/best-practices/slow-computations).
