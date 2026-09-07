# Evidence: multi-repository delivery chain

- task ID: 2026-09-07-multi-repo-delivery
- repositories: `card-credit-fe`, `card-credit-be`, `card-credit-helm-chart`; legacy `card-credit` is archived historical source.
- delivery map: FE/BE source and local `shared/` contract copies -> repository gates -> GitHub Actions -> GHCR immutable SHA images -> chart `values.yaml` tag commits -> Argo CD Application -> dev rollout.
- cross-repo dependency: shared contracts are currently duplicated under `shared/` in FE and BE; contract changes must be mirrored and verified in both repositories. No package registry dependency exists.
- checks: FE gate and CI `34119920669` PASS; BE gate and CI `34119924897` PASS; chart gate PASS; chart revision `4d25083`; `kubectl -n argocd get application card-credit` reports `Succeeded Synced Healthy`; FE/BE deployments are 1/1; public `/login`, backend `/health` and `/ready` return HTTP 200.
- image evidence: final FE tag `29fa6b6` is 96,586,149 bytes pulled (down from 231,099,240); final BE tag `d2cee5e` is 77,915,569 bytes pulled after retaining `/shared`; compressed registry layer sums are 96,573,541 and 77,901,666 bytes respectively.
- stale reference review: active chart/GitOps uses `card-credit-helm-chart`, `card-credit-fe`, `card-credit-be` and independent tags; no active `.Values.image.tag` or old Card Credit chart URL remains. Other platform charts may legitimately use their own `.Values.image.tag`.
- important failure fixed: first split BE deployment crashed with missing `@card-credit/contracts`; runner now copies `/shared` and the corrected rollout is healthy.
- limitations: no production deploy or authenticated financial/MCP business smoke; Argo CLI DNS was unavailable, so Kubernetes API status was used.
- final result: PASS
