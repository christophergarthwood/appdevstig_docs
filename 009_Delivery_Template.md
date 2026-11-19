# Delivery Checklist Template


[TOC]

## Delivery Standard

*Standard:* [Delivery Standard](./009_Delivery_Standard.md)

## Delivery Manifest / Requirements

## Minimal Software Delivery

### Name of the Project (tagged release v?.?.?)

#### Sponsor Name, Department, Email

#### Date ISO 8601

### Purpose

The purpose of this document is to enumerate all required artifacts associated with a deployment of any external software package to project infrastructure.  Artifacts are defined as any component of a software delivery mandated by policy or required by the sponsor / deployment team to successfully and efficiently deploy the solution.

Those starting for the first time shoudl expect an initial conversation with the Team for purposes of a briefing and to discuss:

+ Purpose
+ Scope
+ Business Requirements

First time deployments should expect a heavier burden of documentation and paperwork as registration in DADMS, eMass, and related IA information resources is a first step towards sponsor expectations.

### Artifacts:

1. Manifest of this list with hyperlinks to the location of each artifact.

2. Checksum of (APSC-DV-003140) application files must be cryptographically hashed prior to deploying to Government operational networks.
   + Executables such as: \*.exe, \*.jar, \*.war, etc... if appropriate.
   + Source Code with tagged release.
   + Associated scripts (automation, build, documentation, test execution, ETL operations, etc.).
   + Tools used to build internal components
   + Databases, representative data, Entity Relationship Diagrams (ERD), Data Dictionary, and script used to build the database.
   + Libraries used to support the application.
   + Test Results
   + Example / Representative Datasets
   + Deployed Datasets
   + Ports, Protocols, and Services anticipated for the successful deployment of this solution.
   + Listing of disk requirements:
       + For containers identification of Persistent Container Volumes and mounted filesystem needs.
       + Overall disk requirements summarized.
   + Listing of major applications with versions and their status, as well as system Id, with respect to DADMS, eMass, and related Government registration requirements.
   + Training Materials
   + Any other element used to integrate, test, evaluate, debug, deploy and operate the software application in all relevant environments (DEV, Staging, Ops).
   + System View (SV) type diagram showing assets, applications, ports, protocols, and data flow for the particular solution.  Note that this diagram should be part of the Design Document.
  
If the project was `git clone` then cryptographic hashing is not required.  Git repository must be a valid organization repository recognized by your organization as authoritative. 

3. Virus scan with results of entire deployment folder.  Picture of scan with DTG and evidence of files sufficient.

4. [Design Document](./007_DesignDocument_Standard.md) updated (if appropriate), preference is markdown with STIG references.

5. [Application Configuration Guide (ACG)](./003_ApplicationConfigurationGuide_Standard.md) updated (if appropriate), preference is markdown with STIG references.

6. Application Build Procedures - should be a subset of the ACG, preference is in markdown with automation being the end goal. If deploying to a container it must be recognized that only a specific domain of container images will be authorized for the deployment environment.  Your solution must work within those boundary conditions.  Your compose.yml / Dockerfile should reference a container image supported by the container standards in the tagged deployment.

7. [Configuration Management Plan (CMP)](./006_ConfigurationManagement_Standard.md) in markdown as preference, however MS Office documentation is sufficient.

8. [Deployment plan / instructions](008_Deployment_Standard.md), preference is automation with markdown instructions using a standard [template](008_Deployment_Template.md).  If automation is used then an explanation of how to deploy the application using the automation suite.  Ansible is the preferred automation solution followed by Shell Scripts.

9. Git Repo clone with tag reference Id.

10. [Test plan](./015_TestPlan_Standard.md) with results, automated and manual.

11. Application User's Guide (AUG) updated, if appropriate. Customer format, ideally it should be markdown.

12. Security documentation, primarily STIG documents, as STIG checklists.

13. Scans by security application agreed upon with customer (cobertura, SonarQube, checkstyle, dependencies, custom scans).  Format depends on tool and location.

14. Automated documentation such as Javadoc for each application component, Doxygen is the preference however the development team's Coding Standard overrides this expectation.

15. Ticket management system results showing completed work, pending, etc...  A snapshot of output in plain text or MS-Excel appropriate / acceptable.

16. [Code reviews](./005_CodeReview_Standard.md) documented with evidence thereof to review.

The delivery of all software components where the government will have rights to the source code, such as open-source software and software developed at government expense; and a list of all third-party software components included in the software.  The delivery of software source code should support activities such as compilation and debugging, and future requirements for software sustainment over the lifecycle of the program.

The intent of this delivery standard is to create a reproducible and consistent artifact that is hosted on project infrastructure.

#### Representative Directory structure of deliverable

```
./
├── manifest.txt
├── checksum.txt
├── virus_scan/
│   ├── virus_scan_results.[png,jpg,gif,txt]
├── design_document/
|   ├── Markdown (*.md), MS-Word (*.docx), HTML (.html) output for the Software Design Document (SDD) using a defined template.
├── acg/
|   ├── Markdown (*.md), MS-Word (*.docx), HTML (.html) output for the Application Configuration Guide (ACG) using a defined template.
├── cmp/
|   ├── Markdown (*.md), MS-Word (*.docx), HTML (.html) output for the Configuration Management Plan (CMP) using a defined template.
├── deployment/
|   ├── Markdown (*.md), MS-Word (*.docx), HTML (.html) output using a defined template.
├── repos/
│   ├── 1 to N folders of Git repositories for every Configuration Item (CI) stored in a code repository (configs, source, etc.)
├── test/
|   ├── 1 to N files in: Markdown (*.md), MS-Word (*.docx), HTML (.html) output representing all tests.
│   ├── Example: unit_tests
│   ├── Example: user_acceptance_tests
├── aug/
|   ├── 1 to N files in: Markdown (*.md), MS-Word (*.docx), HTML (.html) output representing Application User's Guide (AUG)
├── stig/
│   ├── STIG checklists (*.ckl)
├── scans/
│   ├── Example: intrusion_detection results
│   ├── Example: sonarqube results
├── source_code_doc/
|   ├── 1 to N files in: Markdown (*.md), MS-Word (*.docx), HTML (.html) output from a tool that reads source and generates output like Doxygen or Javadoc.
├── ticket_system/
|   ├── 1 to N files in: Markdown (*.md), MS-Word (*.docx), MS-Excel (*.xlsx), HTML (.html) output from the ticketing system.
├── code_review/
|   ├── 1 to N files in: Markdown (*.md), MS-Word (*.docx), HTML (.html) output for Code Reviews using a defined template.
```
Ideally a post-commit hook on a tagged version of the software will trigger a push of the source and artifacts to a project repository, unless hosted within project, and thereby notify the team of an potential deployment.  Once notification is received the portal team will inspect the artifacts and attempt to re-create the solution on DEV themselves.  If all artifacts are present, of sufficient quality, and the application deploys on DEV with basic tests conducted futher deployments to other environments will be scheduled.

