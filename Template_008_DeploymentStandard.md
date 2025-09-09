# Title: Deployment Standard

## Definition:

A software delivery plan is a simple, step-by-step roadmap that shows how a team will create, test, and deliver a software product to its users. It organizes all the important tasks, timelines, and resources needed so that everyone knows what to do, when to do it, and how to reach the project’s goals successfully. In short, it helps teams stay organized and on track from the beginning of a project all the way through to releasing the finished software.

## Purpose:

A software delivery plan ensures "no surprises" when migrating to the next tier and reduces risk when deploying a solution as the plan is circulated with all team members, tested, and followed in the subsequent Staging and Operations releases.

## Requirements/Specifications/Guidelines:

A software deployment plan template, based on industry’s best practices, should provide a clear and detailed blueprint for delivering software to production environments with minimal risk and maximum transparency. 

All deployments will have the following characteristics:

1.  Step-by-Step Checklist: Enumerate all actions to take during deployment, with owner/assignee for each.  A CI/CD or automated deployment will still have a deployment plan, however subject plan's checklist will reference those automated functions that influence the discrete portion of the system being updated.
2.  Integration Environment: Every deployment will be tested, verified, and must pass testing through an Integration Environment.  The Integration Environment does not have to be a 100% clone of Staging or Operations, however truly representative data must be present and execution of the system with that data must be successful.  All architecture components must be present, however they are allowed to co-reside on the same system and ports are authorized to be different if documented in the ACG but must be noted in the plan.
3.  Automation: All deployments will seek agnostic automation for every deployment.  Bash scripts are preferred over manual steps, Ansible is preferred over Bash scripts, and any automation (even if esoteric) is preferred over manual steps.  Note that the sponsor must approve vendor specific automation and subject automation must be addressed in the Application Configuration Guide and Design Document.
4. Testing: All deployments will be tested by the team, a designated tester, and an end-user on every environment the application is anticipated to run on.  Once all testing is complete the deployment can be considered a success.

The team member on scene always retains the authority to abort a deployment, however identification of the problem discovered must be documented and could require re-execution in the Integration Environment.

Expect a rolling deployment strategy, however details regarding various approaches are provided should a different technique be required.

Deployment Strategy: Define the approach (e.g., big bang, blue-green, canary, rolling) and steps for each phase.  Expect all deployments to be Rolling Deployments but do not make assumptions.

Rolling Deployment: New versions are gradually deployed, replacing older versions on a server-by-server or instance-by-instance basis.
+ Pros: Maintains service availability during the update process.
+ Cons: Can be slow, and issues may affect multiple users before the full deployment is complete.

Blue-Green Deployment: Two identical production environments are maintained (Blue for the current version, Green for the new version). The new version is deployed to the inactive Green environment, thoroughly tested, and then traffic is switched from Blue to Green.
+ Pros: Provides a quick rollback option and ensures high availability during the transition.
+ Cons: Requires maintaining two production environments, which can be costly.

Canary Deployment: The new version is released to a small, isolated subset of users first. Their behavior and performance are closely monitored.
+ Pros: Minimizes the impact of bugs by affecting only a small group of users, allowing for early detection and correction.
+ Cons: Requires sophisticated traffic routing and monitoring capabilities.

## Measurable and Actionable:

Performed for every deployment.

## Timeliness:

Performed for every deployment.

## Reference(s)
 + Application Security and Development (ASD) Security Technical Implementation Guide (STIG) Version 6, Release 3, 2025/04/02
    + APSC-DV-003220, The designer must create and update the Design Document for each release of the application. The application design document or configuration guide includes configuration settings, recommendations and best practices that pertain to the secure deployment of the application. 
    + APSC-DV-002930, The ISSO must ensure active vulnerability testing is performed prior to deployment.
    + APSC-DV-003340, At least one application administrator must be registered to receive update notifications, or security alerts, when automated alerts are available.
____________________________________________________________________________________________________________________________________
## **Template**

# Software Deployment Plan

## Name of the Project

### Sponsor Name, Department, Email

### Date ISO 8601

### Latest Version of Document or Project if Synced

## Deployment Overview

### Objective

**Software Name: Identify the software product or version being deployed.  Deployment Objective: State the purpose and expected outcomes of the deployment.  In plain language state the object of the upgrade and reference any significant data points associated with the change.  If due to a security concern or patch identify that reasoning as part of the objective.**

**Utilize a discrete list of changes that will occur in detail, table below provided as a guide.  Each element in this table should be traceable to the Application Configuration Guide (ACG) and Design Document which must be updated post deployment.**

|Environment    |Architecture Component  | As-Is              | To-Be |Commentary  |
|---------------|------------------------|--------------------|-------|------------|
|Env Staging    |Tomcat application server| 9.0.3             |10.1   | IAVA-4337 Update.|
|Env Staging    |My Fav Application       | 4.3.2             |5.0.1  | Major upgrade.|

### Artifacts

|Artifact                     | Location                    | Description                                        |
|-----------------------------|-----------------------------|----------------------------------------------------|
|Software deployment files    | /some/location/on/server    |Zip file of entire application, structure defined below. |

```
./
├── <version> - deployed to Tomcat container, copy/paste
│   ├── static
│   ├── assets
│   ├── index.html
│   ├── robots.txt
│   ├── manifest.json
│   ├── favicon.ico
│   ├── asset-manifest.json
├── Data - deployed to configuration folder
│   ├── LayerLists
│      ├── *.json - JSON file defining layer for application to access.
│   ├── Org1
│   ├── ESRIAssets
├── Parser - Crontab function
│   ├── capParser.py - Harvester in Python run on crontab.
│   ├── certConfig.json - JSON file referencing server certificates.
│   ├── uiConfig.json - User Interface JSON specification for app.
├── UTILS - WAR deployed to Tomcat container
│   ├── requirements_UTILS.txt - used to build virtual environment.
│   ├── utils17-2.war - Deployed to Tomcat container.
│   ├── configs
│      ├── *.json - Configuration files that support Utility functions.
```

### Timeline

***Deployment Timeline: Specify deployment date(s) and relevant milestones.***

|Environment    |Date / Time |Estimated Duration | Commentary |
|---------------|------------|-------------------|------------|
|Env Operations |2025/10/01 1300 - 1400 | 30 minutes | Update of Tomcat |

### Participants

***Deployment Team: List personnel and roles involved (DevOps, QA, product owner, etc.). Minimally identify the primary admin, any developers involved, primary tester, project manager, and sponsor success will be reported to.***

|Stakeholder    |Role        |Email / Phone      | Commentary |
|---------------|------------|-------------------|------------|
|Joe Smoe       |Project Manager| pm@smoe.inc.com| Notify upon completion.|
|Little Debbie  |Sponsor        | little.debbie@tasty.cakes.com| Notify upon completion, will notify user base via templated message.|
|Mr. Big        |Primary System Admin | mr.big@gmail.com | Executes plan. |
|Mr. Coder      |Developer            | mr.coder@gmail.com | Support deployment, on stand-by, supports admin, and performs initial testing.|
|Mr. Tester     |Designated Tester    | mr.tester@gmail.com | Support deployment, on stand-by, initiates test and compiles results.  Ultimately certifies success.|

### Communication Plan

***Stakeholder Communication Plan: How and when updates will be communicated during deployment.***

|Stakeholder    |Role        |Email / Phone      | Commentary |
|---------------|------------|-------------------|------------|
|Joe Smoe       |Project Manager| pm@smoe.inc.com| Coordinates inputs to Sponsor.|
|Mr. Coder      |Developer      | mr.coder@gmail.com | Conveys status to PM.|
|Mr. Tester     |Designated Tester | mr.tester@gmail.com | Final approval to PM who notifies sponsor of success.|

### Authority

***Approval Authority: Identify people authorized to approve or halt deployment. It should be noted that the team member on scene is ultimately responsible and therefore has ultimate authority to decide how the deployment will progress.  If pressed against time,  you can't beat the clock or run into unexpected issues the person making the deployment may halt and revert to original state at will without concern for admonishment.***

|Stakeholder    |Role        |Email / Phone      | Commentary |
|---------------|------------|-------------------|------------|
|Mr. Big        |Primary System Admin | mr.big@gmail.com | Ultimate authority.|
|Joe Smoe       |Project Manager| pm@smoe.inc.com| May request roll-back if consulted.|

### Risk Management and Contingencies

Perform Risk Assessment: List potential risks, impacts, likelihood, mitigations, and owners.

***Example***
|Risk           |Impact        |Email / Phone      | Commentary |
|---------------|------------|-------------------|------------|
|Mr. Big        |Primary System Admin | mr.big@gmail.com | Ultimate authority.|

## Pre-Deployment Activities

The following are steps necessary to ensure the deployment environment is in a state that it’s acceptable to receive the update.  In the event a backup procedure cannot be performed the deployment will be aborted and administrative teams consulted regarding next steps for the future (resolution of low disk space, availability of mounted file systems, etc.).  If a step is incorrect, a test fails or something unexpected occurs in the deployment the team member executing the deployment has the authority to halt a deployment and roll-back / abort the mission.  Identification of the discrepancy must be resolved and if necessary re-executed in the Integration Environment.

### Configuration Items for Deployment

Ensure the following list of installation files are available and ready for your deployment (pre-staged for download):

|Configuration Item          |Filename                |Comments              |
|----------------------------|------------------------|----------------------|
|Tomcat 10                   |./apache-tomcat-10.3.tgz| /mnt/staging_software|
|Java 8                      |./jre-8.3.tgz           | /mnt/staging_software|
|Tomcat 10 Configurations    |https://gitlab.org/myconfigs | Download from repository.|
|WAR files for web apps      |Copy from existing Tomcat 9 | /usr/local/tomcat9/webapps|

### Backup Procedures:

Perform a backup of EVERY component involved, influenced by or potentially changed by the deployment.  This includes databases, configuration files, software, and logs.  Following the example of the Tomcat upgrade above the following are sample instructions one might develop.

***Example***
1. Perform backup of Tomcat, first stop application server and then backup.

  + `sudo /usr/share/tomcat9/bin/shutdown.sh`
  + `/usr/bin/ps -ef | grep -i tomcat`
  + `sudo /usr/bin/netstat -tulnp | grep tomcat`
  + Verify port 8??? is not listening.
  + `/usr/bin/tar cvfz /usr/share/tomcat9 /mnt/backups/20250904_tomcat9.tgz`

2. Perform backup of data related to Tomcat instance and applications that run on it, stop PostgreSQL first and ensure it is no longer running:

  + `/usr/lib/postgresql/9.0/bin/pg_dump -f ~/my_sql.psql some_db -U postgres >> /mnt/backups/20250904_pgsqlLog.log 2>&1`
  + `cp /usr/lib/postgresql/9.0/cfg/pg_hba.conf /mnt/backups/20250904_pg_hba.conf`
  + `sudo systemctl stop postgresql`
  + `sudo systemctl status postgresql`
  + `/usr/bin/ps -ef | grep -i post`
  + `sudo /usr/bin/netstat -tulnp | grep tomcat`
  + Verify port 5432 is not listening.

3. Perform a backup for SystemD files:

  + `mkdir -p /mnt/backups/20250904_systemd`
  + `cp /etc/systemd/system/tomcat* /mnt/backups/20250904_systemd`

### Environment Readiness

Validate all target variables in the environment.  An example is provided below that aligns with the Tomcat upgrade.

***Example***
1. Perform analysis of disk space to ensure you're not close to 100% on any volume, inspect results if all disks are at less than 91% continue deployment.

  + `/usr/bin/df -h`

2. Find out if any other team members are on the system.  If so determine why and coordinate to ensure no conflicts can arise.

  + `/usr/bin/who`

3. Visually confirm backups are in place.

  + `/usr/bin/ls -alrtH /mnt/backups/202509*`

4. Move the current Tomcat 9 to another name to ensure instant restoration.

  + `/usr/bin/mv /usr/share/tomcat9 /usr/share/20250904_tomcat9`

5. Ensure proper version of Java is present:

  + `java -version`
  + If not the correct version (version 8) performs a backup of Java and deploys the new Java with the appropriate instructions.

6. If all tests have passed initiate deployment.

### Rollback

If the deployment fails for any reason, remove newly introduced content and restore data using `mv` commands to restore based on the action performed in the pre-deployment check.

  + `/usr/bin/mv /usr/share/20250904_tomcat9 /usr/share/tomcat9`
  + `/usr/bin/ls -alrtH /usr/share/tomcat9
  + `sudo systemctl start postgresql`
  + `sudo systemctl status postgresql`
  + `/usr/bin/ps -ef | grep -i post`
  + Verify port 5432 is listening.
  + `sudo /usr/share/tomcat9/bin/start.sh`
  + `/usr/bin/ps -ef | grep -i tomcat`
  + `sudo /usr/bin/netstat -tulnp | grep tomcat`
  + Verify port 8??? is listening.
  + Restore any systemd files altered.
  + `cp /mnt/backups/20250905_systemd/* /etc/systemd/system/`
  + Consult designated tester and other team members that services are working.

## Deployment Steps

Deployment Strategy: Rolling deployment, each environment is iteratively engaged and the instructions executed.

### Step-by-Step Checklist

=============================

#### Running With JRE 8 Or Later

 Current environment supports JRE 8.* currently, no additional installation required.

=============================

#### Deploy Tomcat 10

1. Verify downloaded Tomcat 10 package is available.

2. Unpack the binary distribution so that it resides in its own directory.

   + `mkdir -p /usr/local/tomcat10`
   + `tar xvfz /mnt/staging_software/apache-tomcat-10.tgz /usr/local/tomcat10`

3. Configure Environment Variables

Tomcat is a Java application and does not use environment variables directly.  Environment variables are used by the Tomcat startup scripts. The scripts use the environment variables to prepare the command that starts Tomcat.  The CATALINA_HOME environment variable should be set to the location of the root directory of the "binary" distribution of Tomcat.  The Tomcat startup scripts have some logic to set this variable automatically if it is absent, based on the location of the startup script in *nix and on the current directory in Windows. That logic might not work in all circumstances, so setting the variable explicitly is recommended.

Copy the current release configuration settings to the new Tomcat 10 deployment:

  + `cp -r /usr/local/tomcat9/conf /usr/local/tomcat10/`
  + `cp -r /usr/local/tomcat9/logs usr/local/tomcat10/`
  + `cp -r /usr/local/tomcat9/webapps usr/local/tomcat10/`
  + `cp -r /usr/local/tomcat9/work usr/local/tomcat10/`

Edit the setenv.sh script to rename CATALINA_BASE location as follows:

  + # setenv.sh in /usr/local/tomcat10/bin/setenv.sh
  + `export CATALINA_BASE="/usr/local/tomcat10"`

If running Tomcat as a service define CATALINA_BASE within the Environment section of your Tomcat systemd service file as follows (tomcat.service):

In `/etc/systemd/system/`:

  + `[Service]`
  + `Environment=CATALINA_BASE=/usr/local/tomcat10`

This is the recommended location for custom systemd unit files or for overriding existing ones. If you create a tomcat.service file in this directory, it will take precedence over the one in /lib/systemd/system/ or /usr/lib/systemd/system/. This allows you to customize Tomcat's systemd service without affecting the package-provided files.

4. Set JRE_HOME and JAVA_HOME:

These variables are used to specify location of a Java Runtime Environment or of a Java Development Kit that is used to start Tomcat.  The JRE_HOME variable is used to specify location of a JRE. The JAVA_HOME variable is used to specify location of a JDK.

The recommended place to specify these variables is a "setenv" script. See below.

5. Using the "setenv" script.

Apart from CATALINA_HOME and CATALINA_BASE, all environment variables can be specified in the "setenv" script. The script is placed either into CATALINA_BASE/bin or into CATALINA_HOME/bin directory and is named setenv.bat (on Windows) or setenv.sh (on *nix). The file must be readable.  By default, the setenv script file is absent. If the script file is present both in CATALINA_BASE and in CATALINA_HOME, the one in CATALINA_BASE is
preferred.

On *nix, $CATALINA_BASE/bin/setenv.sh:

  + `JRE_HOME=/usr/java/latest`
  + `CATALINA_PID="/run/tomcat.pid"`

**Verify the copy function from Tomcat 9 to Tomcat 10 transitioned expected environment variables in setenv.sh.**

6. Startup Services

  + `sudo systemctl start postgresql`
  + `sudo systemctl status postgresql`
  + `/usr/bin/ps -ef | grep -i post`
  + Verify port 5432 is listening.
  + `sudo /usr/share/tomcat10/bin/start.sh`
  + `/usr/bin/ps -ef | grep -i tomcat`
  + `sudo /usr/bin/netstat -tulnp | grep tomcat`
  + Verify port 8??? is listening.
  + Open local browser and access http://localhost:8080/
  + Consult designated tester and other team members that services are working.

### Rollback Plan

See previous section regarding rollbacks.

## Post-Deployment Activities

### Smoke Testing/Validation

Perform Immediate validation checks and user journey tests.

#### Test Plan
 
If available execute the Test Plan with the designated Tester for the project.

#### Administrative Checks (minimal)

1. Check the Java in use, should be 8+.

  + `java -version`

2. Check version of Tomcat Deployed should be 10+.

  + `/usr/share/tomcat9/bin/version.sh`

3. Verify PostgreSQL is up and running.

  + `sudo systemctl status postgresql`
  + `/usr/bin/ps -ef | grep -i post`
  + Verify port 5432 is listening.
  + `sudo /usr/share/tomcat9/bin/start.sh`

4. Verify Tomcat 10 is up and running.
  + `/usr/bin/ps -ef | grep -i tomcat`
  + `sudo /usr/bin/netstat -tulnp | grep tomcat`
  + Verify port 8??? is listening.
  + Open browser on local machine and verify https://localhost:8080 responds.

### Stakeholder Notification

Confirm deployment completion and report results. Utilize the Communication Plan above and issue inputs to team members regarding status.

### Documentation Update

Capture “lessons learned” and retrospective notes to update the deployment plan for next time.  Ensure notes indicated below are propagated to the Sprint Retrospective.