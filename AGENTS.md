# card-credit-helm-chart working agreement

This repository owns only the Card Credit Helm chart, deployment configuration,
image repositories/tags and Argo CD consumption contract. It does not own FE,
BE or shared application source.

Run `./.agent/gates/verify.sh` before handoff. Image tags are independent under
`image.frontend.tag` and `image.backend.tag`; migration hooks use the backend
image. Do not deploy or sync production from a chart-only change.
