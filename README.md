# Tenable
Tenable Resources

Step-by-Step Guide for Central Deployment of Nessus Agents on Linux

**Prepare the Nessus Agent Installation Package:**

  Download the Nessus Agent installation package from the Tenable Downloads page.
  Ensure you select the correct package for your Linux distribution.
  
**  Create a Deployment Script:  **

Write a script to automate the installation and initial configuration of the Nessus agent. Below is an example of a simple deployment script for RPM-based distributions like CentOS, RHEL, or Fedora. Modify this script for your specific environment and requirements.

https://github.com/onierahman/Tenable/blob/main/NA_Deployment_Script.bash 

For Debian-based distributions like Ubuntu, use the .deb package and dpkg command instead of rpm.

**Distribute the Deployment Script:**

Distribute the script and the Nessus agent installation package to the target Linux machines. You can use tools like SCP, Ansible, or any other file transfer method.
Execute the Deployment Script Remotely:

Use SSH or a configuration management tool like Ansible to execute the script on all target machines. For example, using Ansible:
https://github.com/onierahman/Tenable/blob/main/Ansible_Playbook.yaml

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
