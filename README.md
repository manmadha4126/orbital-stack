# OrbitalStack DevOps Assignment
Orbital stack is a Sscalable IOt Platform to manage fleets of edge devices. This project Implemets a production grade devops architecture and kubernetes, terraform, HElm and Argocd 

## Architecture
Terraform → AWS (VPC, EKS, RDS, S3)
↓
Kubernetes (EKS / kind)
↓
ArgoCD (GitOps)
↓
Helm Charts (Services)
↓
Applications (mqtt, telemetry, ota, device-api)


---

## Services

| Service | Description |
|--------|------------|
| mqtt-broker | Handles device connections |
| telemetry-ingestor | Processes telemetry data |
| ota-controller | Manages firmware updates |
| device-api | Exposes APIs |

---

## GitOps Flow


Developer Push → GitHub Actions → Docker Image Built
→ Helm values updated → Git commit → ArgoCD sync → Deployment


---

## OTA Controller Safety

To prevent firmware corruption:

- **Recreate Strategy**
  - Ensures only one pod exists

- **Leader Election (Lease)**
  - Prevents split-brain

- **preStop Hook**
  - Gracefully drains rollout jobs

---

## Security

- NetworkPolicies enforce zero-trust networking
- External Secrets used instead of plain secrets
- IAM Roles for Service Accounts (IRSA)

---

## Observability

- Prometheus for metrics
- Grafana dashboards
- Loki for logs

---

## Alert Runbooks

### MQTTBrokerDown
- Check pod status
- Restart deployment

### Telemetry Lag
- Check ingestion rate
- Scale pods

### OTA Stalled
- Check rollout logs
- Restart controller

---

## Disaster Recovery

1. Re-run Terraform
2. Install ArgoCD
3. Sync applications
4. System restored

---

## Local Setup


kind create cluster --config kind/cluster.yaml
./scripts/bootstrap-cluster.sh
kubectl apply -f argocd/