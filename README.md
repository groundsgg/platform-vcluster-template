# platform-vcluster-template

Per-developer vCluster Helm chart for the Grounds platform-dev profile.
Sub-project of [grounds-platform](https://github.com/groundsgg/grounds-platform)
Phase 3.1a (sub-project 2 of 4).

Deploys, inside the developer's own vCluster:

- A Velocity proxy (image: `ghcr.io/groundsgg/velocity`) with `plugin-agones` bundled
- ServiceAccount + Role + RoleBinding for `gameservers.agones.dev`
- A ConfigMap with `GROUNDS_AGONES_*` env vars consumed by `plugin-agones` via `envFrom`
- An optional default Agones `Fleet` (gated by `defaultFleet.enabled`, default `true`) so the
  developer can connect immediately without having pushed a GameServer of their own

The chart is consumed by `grounds-forge`'s `DevClusterReconciler` when it
provisions a `profile=platform` workspace.

## Status

This repo is at the scaffolding stage. The first deployable release
(`0.1.0`) blocks on:

- `groundsgg/plugin-agones` PR #36 (env-var-driven Discovery) being merged + released
- `groundsgg/containers/velocity` bumped to bundle that plugin-agones release

See the spec for the full design:
[`grounds-platform/docs/specs/2026-04-26-platform-vcluster-template.md`](https://github.com/groundsgg/grounds-platform/blob/main/docs/specs/2026-04-26-platform-vcluster-template.md).

## License

Apache-2.0.
