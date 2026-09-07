#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
rendered="$(mktemp)"
trap 'rm -f "$rendered"' EXIT
cd "$repo_root"
helm lint --strict .
helm template card-credit . >"$rendered"
kubectl apply --dry-run=client -f "$rendered" >/dev/null
helm template card-credit . --set dataIntegrityMigration.enabled=false >/dev/null
helm template card-credit . --set observability.enabled=false >/dev/null
echo "Verification passed: card-credit-helm-chart"
