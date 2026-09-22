# Application runtime contract

Backend/frontend/migration have separate tokenless ServiceAccounts with no RBAC grants.
The deployed backend was verified to run as UID 100/GID 101; these are explicit
while retaining the same image digest. Frontend still needs root and nginx startup
capabilities; restricted Pod Security is audit/warn only until a compatible image is built.
Existing writer fencing, node placement and application credentials are unchanged.

Production image tags contain `commit@sha256:digest`. Release automation must update
the complete tag-and-digest value, not just a commit tag. Do not retain a stale digest
when changing an image. Future UID changes must match the replacement image.

The data integrity hook is opt-in and has no automatic retry. Before enabling it for
a release, take a native database backup, verify restore ownership and inspect its
DDL for partial-commit behavior. An unrelated Argo sync must not repeat a migration.
Disabling the hook does not roll back prior database changes. Revert a workload-only
change without re-enabling the migration hook.
