#!/bin/bash

# Define colors for terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Helper function to format step headers
function print_step() {
    echo -e "\n${BLUE}➜ $1${NC}"
    sleep 1 
}

# Helper function to format explanatory text
function print_info() {
    echo -e "  ${CYAN}ℹ $1${NC}"
    sleep 2 # A slightly longer pause so the audience can read the explanation
}

echo -e "${YELLOW}======================================================${NC}"
echo -e "${YELLOW}  OpenShift Cluster Autoscaler Demo: Crimson Biologics${NC}"
echo -e "${YELLOW}======================================================${NC}"
sleep 2

print_step "Creating a dedicated project workspace..."
print_info "First, we create an isolated namespace called 'autoscaler-demo'."
print_info "This ensures our test workload is securely separated from production apps."
oc new-project autoscaler-demo 2>/dev/null || oc project autoscaler-demo >/dev/null

print_step "Deploying the scientific workload simulation..."
print_info "We are deploying a standard container image to act as our heavy application."
oc create deployment load-test --image=registry.access.redhat.com/ubi8/httpd-24 >/dev/null
echo "  ✔ Deployment created."

print_step "Configuring heavy resource demands..."
print_info "Here is the trigger: We are explicitly configuring each pod to require 2 full CPU cores."
print_info "Because our current worker nodes only have 4 cores total, this guarantees we will run out of space."
oc set resources deployment load-test --requests=cpu=2000m >/dev/null
echo "  ✔ CPU requests updated to 2000m."

print_step "Submitting the batch job (Scaling to 15 Replicas)..."
print_info "We are now requesting 15 pods. That is a demand for 30 total CPU cores."
print_info "The OpenShift scheduler will instantly realize it cannot fit these pods on the existing nodes..."
oc scale deployment load-test --replicas=15 >/dev/null
echo "  ✔ Deployment scaled."

echo -e "\n${GREEN}✔ Workload deployed successfully!${NC}"
echo -e "${YELLOW}======================================================${NC}"
echo -e "The OpenShift Cluster Autoscaler has detected the unschedulable pods."
echo -e "It is currently talking to the AWS API to provision brand new EC2 instances automatically."
#echo -e "\n${YELLOW}Next Step:${NC} Run the following command to watch the new nodes spin up in real-time:"
#echo -e "${BLUE}oc get pods -o wide -w${NC}\n"
