#!/bin/bash

# Variables
NESSUS_AGENT_PACKAGE="NessusAgent-<version>.rpm"
NESSUS_MANAGER_HOSTNAME="your-nessus-manager.yourdomain.com"
ACTIVATION_CODE="your-activation-code"

# Install Nessus Agent
sudo rpm -ivh $NESSUS_AGENT_PACKAGE

# Start and Enable Nessus Agent Service
sudo systemctl start nessusagent
sudo systemctl enable nessusagent

# Link the Agent to the Nessus Manager or Tenable.io
sudo /opt/nessus_agent/sbin/nessuscli agent link --key=$ACTIVATION_CODE --host=$NESSUS_MANAGER_HOSTNAME --port=8834

# Confirm the Agent is Linked
sudo /opt/nessus_agent/sbin/nessuscli agent status
