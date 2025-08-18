# Title: Configuration Management Standard

## Definition:

Software Configuration Management (SCM) is the process of keeping track of and controlling all the changes made to software throughout its development and use. In simple terms, it helps teams manage updates to the software, including code, documents, and settings, so that everything stays organized, consistent, and reliable.

In Software Configuration Management (SCM), the terms branch, trunk, and tag represent key concepts used in version control to organize and manage changes in the codebase:

Trunk: This is the main line of development where the most current and stable code resides. It represents the official version of the software that is under continuous development. Developers usually merge their completed and tested changes into the trunk.

Branch: A branch is a separate copy of the code created from the trunk (or another branch) to work on new features, bug fixes, or experiments without affecting the main codebase. Branches allow teams to develop or test changes in isolation. Once the work is stable and approved, it is merged back into the trunk. Branches can be short-lived (feature branches) or long-lived (release or maintenance branches).

Tag: A tag is a snapshot of the code at a specific point in time, often marking a release version like 1.0 or 2.1. Unlike branches, tags are typically immutable, meaning they are not changed after creation. Tags help identify important milestones, releases, or checkpoints in the code history.

Together, these concepts help teams manage multiple concurrent development efforts, maintain stable release versions, and track important states of the project efficiently. For example, the trunk holds ongoing development, branches are used for isolated changes, and tags mark stable releases or versions for future reference.

## Requirements/Specifications/Guidelines:

A Software Configuration Management (SCM) plan details how to manage and control changes to software products throughout their lifecycle. Its requirements generally include:

+ Configuration Management Objectives: Clearly state goals such as maintaining version consistency, traceability, and change control.

+ Configuration Identification: Define all software components to be managed (code, documents, libraries, tools) with unique identifiers for effective tracking.

+ Configuration Control: Establish procedures for submitting, reviewing, approving, and implementing changes, including authority roles.

+ Configuration Status Accounting: Specify how changes and current status of components will be recorded, reported, and tracked.

+ Configuration Audits and Reviews: Outline how audits will be conducted to ensure components meet standards and baseline requirements.

+ Tools and Technologies: Identify version control systems, build tools, and configuration management software that will be used.

+ Roles and Responsibilities: Define who is responsible for managing configuration activities, approvals, and implementation.

+ Change Management Process: Describe how change requests are handled, assessed for impact, and executed with minimal disruption.

+ Training and Documentation: Include plans for training personnel and maintaining up-to-date configuration documentation.

+ Risk Management: Identify potential risks related to configuration and strategies to mitigate them.

This structured approach ensures software integrity, supports collaboration, minimizes errors, and helps meet regulatory or organizational requirements throughout the software lifecycle.

## Measurable and Actionable:

Software Configuration Management (SCM) is measurable through a variety of metrics and Key Performance Indicators (KPIs) that assess how effectively the SCM process is maintaining control, accuracy, and consistency of the software and related configuration items. Common measurable aspects include:

+ Compliance Rate: The degree to which configuration changes and processes adhere to defined SCM policies and standards.

+ Frequency of Updates: How often configuration items and records are updated, reflecting active management.

+ Number of Unauthorized Changes: Count of changes made without proper approval, indicating control lapses.

+ Change Success Rate: Percentage of changes implemented without causing incidents or requiring rollback.

+ Average Time to Identify and Correct Configuration Discrepancies: Measures responsiveness and efficiency of the SCM team.

+ Audit Coverage: Percentage of configuration items audited within a specified period to verify correctness.

+ Incident Impact Rate Due to Configuration Issues: Number or percentage of service incidents linked to configuration errors.

By regularly tracking these metrics, organizations can evaluate the effectiveness of their SCM processes, identify areas for improvement, and demonstrate compliance and risk management efforts. This data-driven approach ensures software integrity and supports reliable development and deployment cycles.

## Purpose:

SCM ensures that everyone knows what version of the software is being worked on, who made changes, and what those changes are. This helps avoid mistakes like overwriting work, losing important files, or introducing bugs. It also makes it easier to fix problems, roll back to earlier versions if needed, and keep software running smoothly over time. SCM is essential for teamwork, quality control, and managing complex software projects effectively.

## Timeliness:

SCM should occur ANY time a change is made to code using a Branch, Trunk, Tag methodology.

## Reference(s)
 + Application Security and Development (ASD) Security Technical Implementation Guide (STIG) Version 6, Release 3, 2025/04/02 
    + ASPC-DV-002995, The Configuration Management (CM) repository must be properly patched and STIG compliant.
    + APSC-DV-003000, Access privileges to the Configuration Management (CM) repository must be reviewed every three months.
    + APSC-DV-003010, A Software Configuration Management (SCM) plan describing the configuration control and change management process of application objects developed by the organization and the roles and responsibilities of the organization must be created and maintained.
    + APSC-DV-003020, A Configuration Control Board (CCB) that meets at least every release cycle, for managing the Configuration Management (CM) process must be established.
    + APSC-DV-003190, Flaws found during a code review must be tracked in a defect tracking system and utilize configuration management.
 + [Defense Agency Univerisy (DAU)](https://www.dau.edu/acquipedia-article/configuration-management-cm)
 + [Federal Shared Services](https://ussm.gsa.gov/assets/files/M3-Playbook-Configuration-Management-Plan-Template.docx)
____________________________________________________________________________________________________________________________________
## **Template**

## [Software Application Name] Software Configuration Management Plan

### Project Background:

### Purpose and Scope:

### Assumptions and Constraints:

### Roles and Responsibilities:

### Configuration Management Strategy

#### Configuration Management Strategy Overview
Describe the Configuration Management Strategy for the project. Suggested text is provided below.  The Configuration Management Strategy describes the planned activities to accomplish the setup and management of project environments related to the project.

##### Documentation Repositories
Describe the overall strategy for the overall project’s usage of documentation repositories.

##### Technical Environments
Describe the overall strategy for the project’s technical environments.  Example, Dev, Test, Prod and additional environment as needed.

##### Development Environment
Describe the development environment that the project will use and its purpose.

##### Test Environment
Describe the test environment that the project will use and its purpose.

##### Training Environment
Describe the training environment that the project will use and its purpose.  Is there an environment used to test new functionality that doesn't interfere with normal operations.  Is this environment used to train new users of capability?

##### Pre-Production (Staging) Environment
Describe the pre-production environment that the project will use and its purpose.  Primary concern of this element is the Staging environment which should be described in detail.  Describe the process workflow used to perform updates, notify end-users of downtime, and methods used to update that environment whether it is: by-hand, automated, or a hybrid implementation.  Use plain language but provide a diagram of execution.

***Example:***

|Environment|Network Name|Server Name          |Ports         |Purpose / Function        |Description|
|-----------|------------|---------------------------------------------------------------|-----------|
|Operational|Ocean domain|ws-las.ocean.navy.mil|443           |Proxy Server              |Apache instance that serves as proxy server for all incoming requests.|

##### Production (Operations) Environment
Describe the production environment that the project will use and its purpose. Primary concern of this element is the actual operational environment that the workload for the customer executes on.

***Example:***

|Environment|Network Name|Server Name          |Ports         |Purpose / Function        |Description|
|-----------|------------|---------------------------------------------------------------|-----------|
|Operational|Ocean domain|ws-las.ocean.navy.mil|443           |Proxy Server              |Apache instance that serves as proxy server for all incoming requests.|

#### Tools Used for Environment Management
Describe the tools used to management the environment.  If you use CI/CD pipelines a basic one paragraph description with location information is sufficient, however a diagram showing the workflow or Mermaid input is a minimal requirement.

If you use a code repository such as Git and/or an artifact repository such as JFrog's Artifactory that must be explained with locations referenced.

***Example:***

|Environment|Network Name|Server Name|Purpose / Function|Description|
|-----------|------------|-----------|------------------|-----------|
|CI/CD      |Cosmo DEV   |DarkStar   |Jenkins Server    |Overall runtime environment for CI/CD pipeline to include SonarQube and basic formatting expectations.|
|SCM        |Cosmo DEV   |cosmo-git  |Git Server        |Code repository for project and all configuration files within the project.|

#### Environment Access

Who has access to the environment, what role?  Enumerate the roles first and then identify positions that fill that role (do not include employee names unless you are comfortable with that level of detail). The environment name should correlate to the Tools used for environment management.

***Example:***

|Role       |Position Name | Environment Name | Description of Responsibility|
|-----------|--------------|------------------|------------------------------|
|CI/CD Admin|System Admin Senior  |CI/CD             |Primary admin responsible for the health, daily functionality, upgrades, backups and maintenance of the CI/CD Server.  Facilitates requests from the team for new functions and maintains existing functions.|
|CI/CD Admin|System Admin Junior  |CI/CD             |Secondary admin responsible for the health and support to the Senior Admin for the CI/CD system. |

#### Environment Schedule

Describe the environment's schedule.  This comes in four-parts:

+ Data Schedule

Describe in details using the example table below how data is moved / transferred to the various environments.  If a consistent mechanism is used only one overall environment description is required.

***Example:***

Data is transferred with *harvester* scripts via cronjob to shell script invocation to Python code which reads content from disk and updates data stores based on the table described below.  The scripts are maintained in a Git repository, see environment description, and changes to the scripts are deployed to each environment.  

|Data Concept           |Method                       |Source            |Target                        | Description|
|-----------------------|-----------------------------|------------------|------------------------------|------------|
|Global NetCDF Transfer |cronjob harvester for ERDDAP | ws-las3 cron -l  | ws-las5 ERDDAP server        |Update the ERDDAP application by invoking the ERDDAP dataset Java program to update datasets.xml|
|Global Sonar  Transfer |cronjob harvester for PostgreSQL | ws-las3 cron -l  | ws-las6 PostgreSQL server|Update the PostgreSQL geospatial database by invoking Python code that reads Sonar data, creates SQL updates statements, and updates the database which ESRI Portal receives. |

+ Backup Schedule

Describe in detail how data is backed up for the project.

***Example:***

Data is backed up via the `/blah/blah` mount point which is a multi-disk redundant Storage Area Network (SAN) server the customer has deemed sufficient for data backups.

All code is maintained in a Git repository, see environments.

All persistent functions like ESRI Portal for ArcGIS are saved after a shutdown (weekly) to `/blah/blah`.

+ Update Communication Plan and Schedule

Describe, in detail, the communicate methods and any scheduled time for deployments / updates that would affect customers' ability to use the software package.

+ Routine Downtime

Describe, in detail, how the various human and computer components of this system are notified of routine downtime.


#### Environment Maintenance

Describe the overall strategy for maintaining the project's environments.  This should be at a high level and reference more detailed documentation, like processes or procedures.

### Configuration Items

Identify the CIs to be managed and controlled and specify a means of identifying changes to the CIs and related baselines. At a minimum, project work products, the system itself, all COTS software and hardware for the system (or application) to function, and any support software developed in-house or by contractor should be a CI. For development projects, the provider’s “release” of the hosted product should be considered a CI; significant configuration settings related to the hosted product should be tracked as separate CIs.

#### Configuration Item Class: Documentation

Indicate the location of project documentation to support discovery by the customer and the team.  Detail each location and specify the importance of that documentation.

***Example:***

|Name                      |Function                        |Location                  |
|--------------------------|--------------------------------|--------------------------|
|Project Management Plan   |Overall project plan for this project.| Flank Speed, MS Teams, Team Name `url here`|
|Deliverables              |All deliverables provided to the customer| Artifactory `url here`|
|POA&M Integrated Schedule |Master POA&M Schedule           | Flank Speed, MS Teams, Team Name, `url here`|

#### Configuration Item Class: Software / Code

Identify the types of controlled code configuration items managed by the project. Examples include source code, scripts, etc. Note: It is not necessary to identify all source code files.

***Example:***

|Name                      |Function                        |Location                  |
|--------------------------|--------------------------------|--------------------------|
|Harvester Scripts         |Python source code and shell scripts used to ingest data to various portal data stores from disparate locations. | `url here` |
|ESRI Portal for ArcGIS    |Portal configurations used for contiguous setup between environments. | `url here`|
|Apache proxy              |Apache configuration files and scripts used to support all proxy operations. | `url here` |

#### Configuration Item Class: Data

Identify the types of controlled data configuration items managed by the project. Examples include application servers.

***Example:***

|Name                      |Function                        |Location                  |
|--------------------------|--------------------------------|--------------------------|
|Harvester Scripts         |Python source code and shell scripts used to ingest data to various portal data stores from disparate locations. | `url here` |
|ESRI Portal for ArcGIS    |Portal configurations used for contiguous setup between environments. | `url here`|
|Apache proxy              |Apache configuration files and scripts used to support all proxy operations. | `url here` |

#### Infrastructure Configuration Items

If the project does not control the infrastructure configuration items, then this section may be deleted. Describe the project’s controlled infrastructure configuration items using the table below or an equivalent. If a project has a specific deliverable or set of deliverables that describes its infrastructure configuration items, a reference to those deliverables may be used in place of a table. If cloud services provider is used, please include the service provider name (ex. Azure, AWS, Salesforce, etc.) and their associated CI items here.

***Example:***

|Name                      |Product                         |Location                  |Access Control  |Applicable Environments |
|--------------------------|--------------------------------|--------------------------|----------------|------------------------|
|AWS Storage Bucket        |Larg data storage bucket for data. |`url here` | Role here from previous table. | Operations, Staging, DEV|

