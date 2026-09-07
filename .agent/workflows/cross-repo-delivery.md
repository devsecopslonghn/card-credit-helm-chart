# Cross-repository delivery workflow

Use this file as the lightweight coordinator for changes crossing FE, BE and
the chart. Keep one task/evidence record in the repository that owns the
change; link the other commit SHAs rather than copying the monolith harness.

1. Identify affected repositories. If `shared/` contracts change, update and
   verify both `card-credit-fe/shared` and `card-credit-be/shared`.
2. Change the owning FE/BE source and run its local gate.
3. Push logical FE/BE commits and inspect GitHub Actions quality and image jobs.
4. Confirm GHCR publish under the immutable commit tag.
5. Confirm the successful workflow updates `card-credit-helm-chart/values.yaml`
   with the matching FE/BE repository and tag.
6. Run the chart gate and inspect the rendered image references and hook image.
7. Read the Argo CD Application and workload state when an existing authorized
   dev delivery is being verified. Require the expected chart revision,
   Synced/Healthy, updated/ready replicas and no crash/image-pull errors.
8. Record limitations: image digest/size provenance, live cluster state and
   authenticated financial/MCP behavior are separate evidence scopes.

This workflow is instruction/state only. It adds no coordinator service,
daemon, supervisor or workflow engine.
