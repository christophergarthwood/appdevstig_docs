# Title: Delivery Standard

## Definition:
A software delivery standard is a set of guidelines and practices that describe how to create, test, and deliver software products to users in a reliable and efficient way. Simply put, it’s a rulebook that teams follow to make sure software is developed, checked for quality, and handed over to customers on time, with minimal errors and best results. 

## Purpose:
The primary method of achieving a quality delivery is consistency.  By having a consistent way to deliver products and receive inputs the development team gains advantage and ultimately helps the Government team member out.

## Requirements/Specifications/Guidelines:

## Measurable and Actionable:

Actionable at delivery of a new software version release.

## Timeliness:

Executed at each software secondary, using semantic versioning methods, version release.

## Reference(s)
 + Application Security and Development (ASD) Security Technical Implementation Guide (STIG) Version 6, Release 3, 2025/04/02 
   + APSC-DV-003140, Application files must be cryptographically hashed prior to deploying to DoD operational networks.
 + [DoDI 5000.87, October 2, 2020](https://www.esd.whs.mil/Portals/54/Documents/DD/issuances/dodi/500087p.PDF)

## Versioning

|Version       |Description                                                                                                         |
|--------------|--------------------------------------------------------------------------------------------------------------------|
|v0.1          | Inception|

 
____________________________________________________________________________________________________________________________________
## **Template for Customer Delivery**

# Delivery Manifest / Requirements (AppDev STIG v6r3, APSC-DV-003220)

## Contractor Minimal Software Delivery (versioned release) 

### Name of the Project

#### Sponsor Name, Department, Email

#### Date ISO 8601

#### Latest Version of Document or Project

### Artifacts:

1. Manifest of this list
2. Checksum of APSC-DV-003140, application files must be cryptographically hashed prior to deploying to DoD operational networks.
   + Executables
   + Source Code
   + Associated scripts (automation, build, documentation, test execution, ETL operations, etc.)
   + Tools
   + Databases
   + Libraries
   + Test Results
   + Datasets
   + Training Materials
   + Any other element used to integrate, test, evaluate, debug, deploy and operate the software application in all relevant environments (DEV, Staging, Ops).

3. Virus scan with results of entire deployment folder.
4. Design Document updated (if appropriate), preference is markdown with STIG references.
5. Application Configuration Guide (ACG) updated (if appropriate), preference is markdown with STIG references.
6. Application Build Procedures - should be a subset of the ACG.
7. Configuration Management Plan (CMP).
8. Last deployment plan / instructions, preference is markdown using a standard template.  If automation is used then the playbook is involved in repository format (meaning the repository downloaded as a clone).
9. Git Repo clone with tag reference Id.
10. Test plan with results, automated and manual.
11. Application User's Guide (AUG) updated, if appropriate. Customer format, ideally it should be markdown translated to HTML.
12. Security documentation, primarily STIG documents, updated if appropriate, as STIG checklists.
13. Scans by security application agreed upon with customer (cobertura, SonarQube, checkstyle, dependencies, custom scans).  Format depends on tool and location.
14. Automated documentation such as Javadoc for each application component.
15. Ticket management system results showing completed work, pending, etc. MS-Excel appropriate / acceptable.
16. Code reviews documented, in markdown using team template format.

The delivery of all software components where the government will have rights to the source code, such as open-source software and software developed at government expense; and a list of all third-party software components included in the software.  The delivery of software source code should support activities such as compilation and debugging, and future requirements for software sustainment over the lifecycle of the program.

#### Directory structure of deliverable

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


