# card-credit-helm-chart

Standalone Helm chart for the Card Credit frontend and backend.

The chart is intentionally separate from the application repositories:

- `devsecopslonghn/card-credit-fe` publishes the frontend image.
- `devsecopslonghn/card-credit-be` publishes the backend image and MCP server.
- this repository owns Kubernetes templates, values, probes, runtime wiring and
  the data-integrity migration hook.

Render locally with:

```bash
helm lint .
helm template card-credit . --namespace card-credit
```

Frontend and backend image tags are independent under
`image.frontend.tag` and `image.backend.tag`.
