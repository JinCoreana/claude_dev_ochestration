---
paths:
  - "**/*.tsx"
  - "**/*.jsx"
---
# React guidelines

- Follow the installed React version and existing framework conventions. Prefer function components and Hooks.
- Inspect existing routing, server-state, local-state, form, and styling choices before editing. Do not add a second state/data-fetching solution without a concrete requirement.
- Keep components focused; derive values rather than synchronizing duplicate state. Use effects for external synchronization, not ordinary calculations or event handling.
- Use stable keys and preserve component identity. Avoid unnecessary memoization unless supported by profiling or established conventions.
- Handle loading, empty, error, and success states for asynchronous UI.
- For backend APIs with an OpenAPI contract, consume the repository-generated request/response types and client. Do not recreate API interfaces by hand. When the backend contract changes, regenerate the frontend client/types from the authoritative spec and report any breaking mismatch.
- Preserve accessibility with semantic markup, labels, keyboard behavior, focus management, and useful validation messages.
- Avoid unsafe HTML and hard-coded secrets. Add focused tests and run documented project checks for behavior changes.

## Patterns to reject in new code

- Calling Hooks conditionally, in loops, after an early return, in callbacks/event handlers, or from ordinary functions. Keep Hooks at the top level of components/custom Hooks, except APIs with explicit version-specific exceptions in official React documentation (such as `use` where supported).
- Using an Effect to derive render data, mirror props into state, sequence state updates, or perform work caused by a specific user event. Derive during render, use the event handler, or synchronize with an external system as appropriate.
- Duplicating state that can be derived from props/state, or maintaining two sources of truth for the same value.
- Mutating props, state, context, or arrays/objects used for rendering in place.
- Using array index or generated-per-render/random keys when items can be inserted, removed, or reordered; use stable domain identity.
- Defining component types inside another component when that recreates component identity and resets child state. Move reusable/stable components to module scope.
- Using refs for values that affect rendered output, or using effects as a general event bus/state orchestration system.
- Adding `useMemo`, `useCallback`, or `memo` everywhere without a measured performance need or a concrete identity requirement. Preserve them when they solve an observed issue.
- Adding fetch Effects with missing cleanup, race protection, or error/loading state when the app already has a standard data-fetching layer. Reuse the configured framework/client/cache.

Treat these as review signals, not blind pattern matching: confirm behavior and the installed React version before labeling a finding. The official React guidance explains [Hook call rules](https://react.dev/reference/rules/rules-of-hooks), [when Effects are needed](https://react.dev/learn/you-might-not-need-an-effect), and [component purity/immutability](https://react.dev/reference/rules/components-and-hooks-must-be-pure).
