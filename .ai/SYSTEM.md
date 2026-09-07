# Helm delivery context

- Ownership: `Chart.yaml`, `values.yaml` and `templates/` for the Card Credit workload.
- Inputs: immutable FE/BE GHCR tags written by the FE/BE CI workflows.
- Consumer: Argo CD Application `argocd/card-credit`, repo `card-credit-helm-chart`, path `.`.
- Verification authority: `helm lint --strict`, `helm template`, and client-side Kubernetes manifest validation.
