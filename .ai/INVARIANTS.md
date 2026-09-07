# Helm invariants

- Frontend and backend image repositories/tags are explicit and independent.
- No template may reference the removed scalar `.Values.image.tag`.
- The data-integrity hook uses the backend image and backend resources.
- Rendered selectors match service/deployment labels; ingress points to the
  chart-owned services; optional migration and observability branches render cleanly.
- Argo CD source remains `git@github.com:devsecopslonghn/card-credit-helm-chart.git` at path `.`.
