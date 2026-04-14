# OrbitalStack DevOps Assignment

## Architecture
Terraform → EKS → ArgoCD → Helm → Services

## GitOps Flow
CI → Image → Helm → ArgoCD Sync

## OTA Safety
Recreate + Lease prevents split-brain

## Observability
Prometheus + Grafana

## Recovery
Terraform + ArgoCD restores system