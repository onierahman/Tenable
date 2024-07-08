![Tenable](https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tenable.com%2Fwhitepapers&psig=AOvVaw1rs2PcqoTV1G5ogRK25OPV&ust=1720514540407000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCICt8rKGl4cDFQAAAAAdAAAAABAE)
# Tenable
Tenable Resources

Step-by-Step Guide for Central Deployment of Nessus Agents on Linux

**Prepare the Nessus Agent Installation Package:**

  Download the Nessus Agent installation package from the Tenable Downloads page.
  Ensure you select the correct package for your Linux distribution.
  
**  Create a Deployment Script:  **

Write a script to automate the installation and initial configuration of the Nessus agent. Below is an example of a simple deployment script for RPM-based distributions like CentOS, RHEL, or Fedora. Modify this script for your specific environment and requirements.
````
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
````


For Debian-based distributions like Ubuntu, use the .deb package and dpkg command instead of rpm.

**Distribute the Deployment Script:**

Distribute the script and the Nessus agent installation package to the target Linux machines. You can use tools like SCP, Ansible, or any other file transfer method.
Execute the Deployment Script Remotely:

Use SSH or a configuration management tool like Ansible to execute the script on all target machines. For example, using Ansible:

````
---
- name: Deploy Nessus Agents
  hosts: linux_machines
  become: yes
  tasks:
    - name: Install Nessus Agent RPM
      yum:
        name: /path/to/NessusAgent-<version>.rpm
        state: present

    - name: Start Nessus Agent Service
      systemd:
        name: nessusagent
        state: started
        enabled: yes

    - name: Link Nessus Agent to Manager
      command: /opt/nessus_agent/sbin/nessuscli agent link --key=your-activation-code --host=your-nessus-manager.yourdomain.com --port=8834

    - name: Verify Nessus Agent Status
      command: /opt/nessus_agent/sbin/nessuscli agent status
      register: agent_status

    - name: Output Agent Status
      debug:
        msg: "{{ agent_status.stdout_lines }}"
````

**Verify Agent Deployment:**

Check the status of the agents from the Nessus Manager or Tenable.io. You should see the new agents listed and ready for scanning.
Configure Policies and Scans:

Create and configure scanning policies on your Nessus Manager or Tenable.io platform to include the newly added agents.
Schedule regular scans to ensure ongoing vulnerability assessment.

_Notes:
Security Considerations: Ensure that the activation key and other sensitive information are securely managed and not hard-coded in scripts where possible.
Compatibility: Verify the compatibility of the Nessus agent package with your Linux distribution and kernel version.
Central Management Tools: Tools like Ansible, Chef, or Puppet can simplify and streamline the deployment process across multiple systems.
Deploying Nessus agents centrally can greatly enhance your vulnerability management by ensuring all systems are consistently scanned and reported on._
