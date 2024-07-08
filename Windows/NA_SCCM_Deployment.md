**Before you start**

Please complete the following prerequisite steps:

  1. Download the x86 or x64 Nessus Agent Windows package here.
  2. Log in to Tenable.io or Nessus Manager.
  3. Click on Scans.
  4. Click on Agents.
  5. Create the appropriate Agent groups for the agents (e.g. Windows Group 1).
  6. Copy the Agent Linking key and keep it available for the following steps.

**Preparation Phase**

  1. Create a Device Collection
  Before mass deploying the agents, create a Device Collection in SCCM that specifies which of the Windows assets will be included in the package distribution.
  2. In the SCCM interface, click the Assets and Compliance tab on the left navigation menu.
  3. Expand the Overview dropdown and click Devices. Verify that all the intended assets are online and reachable. The online state is indicated by a green checkmark over the   device icon.
  4. After verifying that all the intended assets are online, right-click Device Collections in the left navigation menu and click Create Device Collection.
  5. Give the Device Collection a name and a comment to describe its function.
  6. Click Browse next to “Limiting collection” to determine which systems are available to choose from. Generally, select the All Systems option, but choose whichever is suitable according to the organizational requirements. Click OK and Next to advance to the “Membership Rules” step.
  7. Click Add Rule to determine how the Device Collection will add new members according to the organizational requirements. Possible options include Direct Rule, Query Rule, Include Collections, and Exclude Collections.
  8. Click Next when finished.
  9. Verify that all of the intended devices are included by the rule or rules configured for the Device Collection.
  10. Close the wizard when the Device Collection completes successfully.

**Create an Application for the Insight Agent installer in SCCM**

Now that the Device Collection is in place, create the Application that will hold the Nessus Agent MSI file.

1. In the SCCM interface, click the Software Library tab on the left navigation menu.
2. Expand the Overview dropdown, then expand the Application Management dropdown. Right-click Applications and click Create Application.
3. Give the Application a name and a comment to describe its function.
4. Click Browse next to the “Installation program” to locate the Nessus Agent .msi to push to target assets in the Device Collection.
Note: The .msi must be on a network share that the server can access.
5. After locating the .msi, modify the “Installation program” field with the following, modified as appropriate:
````
msiexec /i NessusAgent-<VERSION_NUMBER>-x64.msi NESSUS_GROUPS="<AGENT_GROUP>" NESSUS_SERVER="sensor.cloud.tenable.com:443" NESSUS_KEY=<LINKING_KEY> /qn

````
_Note: Remember to modify the <VERSION_NUMBER>, <AGENT_GROUP>, and <LINKING_KEY> according to your environment._

6. Click through the remaining steps of the Application wizard with no changes.

**Distribute the Application**

Now that the Application that contains the Nessus Agent installer is configured, distribute it to a Distribution Point. In SCCM, the Distribution Point hosts the Application to deploy to the assets in the Device Collection.

1. Right-click the Application and click Distribute Content. The “Distribute Content Wizard” window displays.
2. In the “Content Destination” step, click Add and select Distribution Point.
3. Select at least one server that will host the Application.
4. Click through the remaining steps of the distribution wizard with no changes.
5. Check the status of the distribution by clicking on the Monitoring tab on the left navigation menu before proceeding to the next step.
6. Navigate to Overview > Distribution Status > Content Status and double-click on the Application to check its progress.

**Deployment Phase**
_IMPORTANT_
Verify the application has completed its distribution before proceeding to the deployment phase.

**Deploy the Application**
After the distribution of the application completes successfully, deploy the Application to the assets in the Device Collection.

1. Right-click the Application and click Deploy. The “Deploy Software Wizard” window displays.
2. Click Browse next to “Collection” to select the Device Collection that was configured earlier. Then click Next.
3. In the “Deployment Settings” step, set the deployment purpose as needed:
4. Available - The program will appear in the SCCM Software Center of the target PC, but will not install until the user clicks Install.
5. Required - The program will install without any action from the user.
6. Click through the remaining steps of the deployment wizard with no changes.
7. Check the Agent connection
    1. Log in to Tenable.io or Nessus Manager.
    2. Click Scans.
    3. Click Agents and verify the deployed agents are present, online, and in the group specified.
