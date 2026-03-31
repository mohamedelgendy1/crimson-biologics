# Crimson Biologics — Infrastructure as Code

This repository contains the infrastructure-as-code (IaC) and GitOps configuration for **Crimson Biologics**, covering OpenShift cluster provisioning, cluster management manifests, Ansible Automation Platform (AAP) playbooks, and GitOps workflows.

---

## Repository Structure

```
crimson-biologics/
├── aap-playbooks/          # Ansible Automation Platform playbooks
├── cb-gitops/              # GitOps configuration and manifests
├── ocp-cluster-manifests/  # OpenShift cluster resource manifests
├── openshift-ipi/          # OpenShift Installer-Provisioned Infrastructure (IPI) configs
└── projects/               # Project-specific configurations
```

### `aap-playbooks/`
Ansible playbooks for automating operational tasks via Red Hat Ansible Automation Platform (AAP). These playbooks handle configuration management, provisioning workflows, and post-install automation across the OpenShift environment.

### `cb-gitops/`
GitOps manifests and configuration for continuous delivery using a GitOps approach (e.g., ArgoCD or OpenShift GitOps). This directory drives the declarative desired state of applications and cluster resources.

### `ocp-cluster-manifests/`
Day-2 OpenShift cluster resource manifests, including operators, custom resources, RBAC policies, namespaces, and other cluster-level configurations applied after initial provisioning.

### `openshift-ipi/`
Configuration files for deploying OpenShift clusters using the **Installer-Provisioned Infrastructure (IPI)** method. This typically includes `install-config.yaml` and related shell scripts for bootstrapping clusters on supported cloud or on-prem platforms.

### `projects/`
Project-specific resources and configurations scoped to individual teams or application workloads running on the cluster.

---

## Tech Stack

| Technology | Purpose |
|---|---|
| **OpenShift (OCP)** | Container platform |
| **Ansible / AAP** | Automation & configuration management |
| **GitOps (ArgoCD / OpenShift GitOps)** | Continuous delivery |

---

## Prerequisites

- Red Hat OpenShift Container Platform (4.x+)
- Ansible Automation Platform (AAP) 2.x
- OpenShift CLI (`oc`) installed and authenticated
- `openshift-install` binary (for IPI provisioning)
- Access to a supported cloud provider or on-prem infrastructure

---

## The Participants

- Mohamed Hassan
- Mahmoud Abdelfattah
- Hind Salman
- Mohamed Elgendy