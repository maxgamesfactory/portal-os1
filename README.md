# Portal-OS1

The operating environment for MAX Universe.

Portal-OS1 is the GitHub-native home of the MAX Institute ecosystem and the Portal-OS1 operating system. It provides the runtime coordination layer for identity continuity, simulation and replay, governance enforcement, provider abstraction, and production readiness validation across the MAX ecosystem.

## Architecture

The authoritative system architecture is:

MAX Institute
↓
USS
↓
MANIFOLD
↓
ICV
↓
BEMAX
↓
ICVS
↓
Portal-OS1
↓
MAX-CORE

This repository treats the architecture documentation in `docs/architecture/` as the source of truth for structure, governance, provider integrations, simulation models, release readiness, and acceptance criteria.

When implementation details conflict with those documents, the architecture documents take precedence. Product behavior, deploy checks, policy enforcement, and provider wiring must remain aligned to that authority.

## Repository intent

This repository supports:

- research coordination
- identity continuity
- simulation and replay
- governance enforcement
- provider abstraction
- production readiness validation
- secure deployment and operational recovery

## Governance and identity

- MAX Institute is the research and policy authority.
- USS provides the shared reality layer and system semantics.
- MANIFOLD represents the universe layer and the operating context.
- ICV is the identity layer and ensures continuity and traceability.
- BEMAX is the strategic intelligence layer.
- ICVS is the governance and execution control layer.
- Portal-OS1 coordinates product and runtime operations.
- MAX-CORE remains the platform-neutral core foundation.

All identity, policy, simulation, and governance actions preserve lineage and auditability.

## Core operating principles

- Prefer GitHub-native configuration over vendor-specific automation.
- Keep repository documentation discoverable and searchable in the default GitHub UI.
- Document provider adapters as explicit production interfaces rather than ad hoc integrations.
- Treat identity, provenance, replay, governance, auditability, and recovery as first-class concerns.
- Ensure each model, workflow, and deployment decision can be traced to a policy and a lineage source.
- Use explicit provider states: `CONNECTED`, `DEGRADED`, `STALE`, `BLOCKED`, `DISCONNECTED`, `UNCONFIGURED`.
- Simulations must include inputs, outputs, dependencies, replay rules, provenance rules, and confidence rules.
- Deployment readiness requires secrets, monitoring, alerting, backups, and audit export validation.
- Production changes require documented approval, lifecycle traceability, and rollback capability.

## Simulation and monitoring

- Simulation registration is required before production use.
- Replay must be deterministic, versioned, and provenance-linked.
- Confidence must be explicit, measurable, and auditable.
- Monitoring must include provider health, system state, and policy compliance checks.
- Alerting must be actionable and tied to operational recovery procedures.

## Deployment requirements

Production deployment requires:

- active provider adapters
- registered simulation models
- adopted institute policies
- active monitoring
- active alerting
- verified backups
- verified audit exports
- required secrets present and scoped appropriately

Required secrets:

- `OPENAI_API_KEY`
- `GEMINI_API_KEY`
- `ANTHROPIC_API_KEY`

## Documentation and authority

The repository documentation is organized as follows:

- `docs/architecture/README.md` — architecture overview and source-of-truth document set
- `docs/PORTAL_OS1_ARCHITECTURE_AUTHORITY.md` — architecture authority and review criteria
- `docs/architecture/provider-adapters.md` — provider contracts and lifecycle states
- `docs/architecture/simulation-models.md` — simulation registration and replay requirements
- `docs/architecture/institute-policies.md` — governance and policy controls
- `docs/architecture/deployment-readiness.md` — production readiness, secrets, monitoring, and recovery
- `docs/architecture/acceptance-tests.md` — validation gates and acceptance criteria

## Repository layout

- `apps/` — application and portal runtime surfaces
- `apps/pages/` — mission control and portal experiences
- `apps/worker/` — API transport, governance enforcement, orchestration, and provider integration boundaries
- `icvs/` — workflow automation and governance coordination layer
- `portal-os/` — intelligence, forecasting, recommendations, and operational logic
- `max-core/` — platform-neutral foundation
- `adapters/` — explicit integration boundaries for external service adapters
- `docs/` — architecture, implementation guides, governance, and operational documents
- `src/` — compatibility exports and legacy runtime interfaces

## Definition of done

A change is done only when all of the following are true:

- GitHub-native documentation remains authoritative and up to date.
- Architecture impact is documented in `docs/architecture/` when relevant.
- Provider behavior and error states are clearly defined.
- Simulation lineage and replay requirements are preserved.
- Policy and governance requirements are satisfied.
- Monitoring, alerting, and recovery paths are documented.
- Acceptance tests for the changed capability are defined or updated.
- The change does not introduce undocumented behavior or untracked provider risk.

## MAX Universe V4 narrative

MAX Universe is a governed intelligence ecosystem that unifies identity, knowledge, simulations, governance, operations, and human potential into a single operational reality.

It is not a collection of tools.
It is an operating environment.

A place where:

- Knowledge becomes Intelligence
- Intelligence becomes Understanding
- Understanding becomes Decisions
- Decisions become Action
- Action becomes Reality

Core promise:

- Observe.
- Understand.
- Decide.
- Govern.
- Evolve.

Portal-OS1 is the operating environment. BEMAX is the strategic mind. MAX Institute is the knowledge authority. Together they form the control surface for an intelligent, governed universe.

## Brand direction

- Black glass
- liquid silver
- brushed chrome
- cinematic simplicity
- intelligence and governance by design

## Local development and validation

See the project docs and architecture requirements before introducing changes. The repository expects GitHub-native documentation, explicit provider states, deterministic replay, evidence-backed execution, and production readiness checks.

## Summary

Portal-OS1 is the operating system layer for the MAX Institute ecosystem: a governed runtime for intelligence, identity, simulation, operations, and secure deployment. It is designed to preserve lineage, auditability, and recovery while operationalizing a living, measurable universe.
