# Design Document Template

[TOC]

## Design Standard

*Standard:* [Design Document Standard](./007_DesignDocument_Standard.md)

## Design Document for [Software Project Name]

## Versioning

|Version       |Description                                                                                                         |
|--------------|--------------------------------------------------------------------------------------------------------------------|
|v0.1          | Inception source code, totally alpha, v0.1  |
|v1.1.24       | v1.1.24 ASD STIG v5 updates                 |
|v1.2.00       | v1.2.00 ASD STIG v6r3 updates               |
|v1.3.00       | ASD STIG v6r5 validation.

## Executive Summary

The purpose of this document is to provide a detailed description of the technical requirements, components, and development practices associated with software development for this project.  This project's design will be laid out here in detail as a blueprint for project implementation.  The following sections contain both detailed information about a software concept and the actions to be taken to create the system environment as well as details on all components used within the system.

*The intent of this document is to provide a representative example of what should be a compliant Design Document for purposes of satisfying an Application Development STIG review.  It is not exhaustive, and this example is focused on scientific applicaitons.*

## Introduction

The goal of this project is to ...

### Project Plan (APSC-DV-003210)

This requirement is meant to apply to developers or organizations that are doing application development work.

Application development efforts include the creation of a project plan to track and organize development work.

If security flaws are not tracked within the project plan, it is possible the flaws will be overlooked and included in a release.

Tracking flaws in the project plan will help identify code elements to be changed as well as the requested change.

Minimally a POA&M as well as a tracking system for changes must exist.  See the Configuration Management Plan (CMP) for the location of these artifacts.

### Development Strategy

Develop occurs on *what* resources, *what* platforms, and was run real-time on the *what* system.  Describe how the application is being developed.  

### Environment

See detailed output from the [Application Configuration Guide (ACG)](003_ApplicationConfigurationGuide_Standard.md) and the [Configuration Management Plan (CMP)](006_ConfigurationManagement_Standard.md).

+ Development Environment - *asset name*, see the Application Configuration Guide (ACG) and Configuration Management Plan (CMP)
+ Staging  - *where*
+ Operations - *where*

### Processes & Policies

+ Development at *where* targets customer end-environments and embraces the following principles:
      + Secure operations
          + Develop solutions with security in mind first, then scalability and then optimization.
      + Logging at various levels of granularity
          + Log with a standard framework and do so discretely with informative messages to ensure end-users / invokers fully understand what has transpired.  
          + Only log generic failures with deeper logs in the background for more detailed analysis.  Give nothing away.
      + Fail fast  
          + Use automation in build, deployment, and testing as much as possible so failure is detected early and therefore more quickly resolved.
      + Highly defensive code
          + Assume nothing and code defensively.  Use guard clauses, never leave a status in a true state unless proven true, isolate tests to their most logical level and log discreetly to find errors quickly.

+   Staging and Operations at *where* are intended for User Acceptance Testing (UAT) and operational concerns accordingly.

See the following standards and templates regarding the development process in conjunction with this Design Document for an entire view of how software development occurs with this team:

+ [Application Configuration Guides (ACG)](003_ApplicationConfigurationGuide_Standard.md) will exist.
+ [Coding Standards](004_Coding_Standard.md) will exist and be adhered to.
+ [Code Reviews](005_CodeReview_Standard.md) will be performed and documented.
+ [Configuration Management Plan (CMP)](006_ConfigurationManagement_Standard.md) will exist and be documented.
+ [Deployment Standards](008_Deployment_Standard.md) will be adhered to.
+ [Delivery Standards](009_Delivery_Standard.md) will be adhered to.
+ [Threat Assessments](010_ThreatAssessment_Standard.md) will be conducted initially and after each major release.
+ [Logging Standards](011_Logging_Standard.md) will be adhered to in all environments.
+ [Tracking System](012_TrackingSystem_Standard.md) will be utilized.
+ [Software Development Life Cycle](013_SoftwareDevelopmentLifecycle_Standard.md) will be documented and followed.
+ [Communications Standards](014_CommunicationPlan_Standard.md) will be utilized by the development team.
+ [Testing Standards](015_TestPlan_Standard.md) will be utilized by a designated tester.
+ Design Document will exist and be populated.

### Communications
+ Developers coordinate with *who*.
+ Quarterly Report to *who*.
+ Yearly reviews to *who*.
+ Periodic meetings with end-user to discuss general progress and clarify requirements as needed.

### Hardware Configuration Items

Specify network domain or named hardware configuration will be the target architecture for the smaller applications.

See detailed output within the [Application Configuration Guide (ACG)](003_ApplicationConfigurationGuide_Standard.md) and the [Configuration Management Plan (CMP)](006_ConfigurationManagement_Standard.md).

### Data Communications

All communications are performed on a file system, it is possible and at *agency?* probable that subject file system is Network File System (NFS) mounted, however no other communications via TCP/IP are performed on any ports.  This is a scientific data processing program with no user accounts, roles, or web presence.

Refer to the [Configuration Management Plan (CMP)](006_ConfigurationManagement_Standard.md) for details regarding communications.

### Software Configuration Items

Language(s) / libraries that will be used for all applications developed for project tasking.  Identify high level tools / packages used to enable the project.  Leave details related to discrete software components, like your code, in the Configuration Management Plan (CMP). This domain should be the minimal software tools / solutions necessary to execute the project.

***Example:***

| App Name      | App Version |
| ------------- | ----------- |
| GCC           | 4.8.+       |
| Bash shell    | 4+          |
| Korn shell    | 93+         |
| H5 libs       | 1.8.19      |
| NetCDF libs   | 4.4.1       |

### Data Design

#### Data Objects and Resultant Data Structures

##### Input
***Example:*** 
Satellite imagery, NetCDF, v4.4.1 is the predominant format used for the *what data type*.

##### Output
Fortran compliant binary outputs are the final resultant and are structured as follows:

***Data Structure***

|Type |Type            |Type                                          |Bytes|Bytes               |Bytes  |
|-----|----------------|----------------------------------------------|-----|--------------------|-------|
|[int]|[int]           |[int]                                         |[4b] |        [# records] |  [4b] |
|[int]|[int]           |[int]                                         |[4b] |        [data type] |  [4b] |
|[int]|[char@12 x #rec]|[int]                                         |[4b] |        [dtg ary  ] |  [4b] |
|[int]|[float x #rec]  |[int]                                         |[4b] |        [lat ary  ] |  [4b] |
|[int]|[float x #rec]  |[int]                                         |[4b] |        [long ary ] |  [4b] |
|[int]|[float x # rec] |[int]                                         |[4b] |        [a_490_lmi] |  [4b] |

***Binary Datafile Example***

|Hex FRB      |Hex Data Value                       |Hex FRB       | Boundary     | Data         |Boundary     |
|-------------|-------------------------------------|--------------|--------------|--------------|-------------|
|[00 00 00 04]|[00 67 5E E5]                        |[00 00 00 04] | [FORTRAN RB] |[6774501     ]|[FORTRAN RB ]|
|[00 00 00 04]|[00 00 00 DB]                        |[00 00 00 04] | [FORTRAN RB ]|[219         ]|[FORTRAN RB ]|
|[00 00 00 0C]|[32 30 31 38 31 32 31 37 30 30 30 30]|[00 00 00 0C] | [FORTRAN RB ]|[201812170000]|[FORTRAN RB ]|
|[01 9D 7B 94]|[42 30 99 9A] @ 6774501              |              | [27098004   ]|[44.18       ]|[FORTRAN RB ]|
|[01 9D 7B 94]|[C3 34 00 00] @ 6774501              |              | [27098004   ]|[-180.0      ]|[FORTRAN RB ]|
|[01 9D 7B 94]|[3D 55 66 C0] @ 6774501              |              | [27098004   ]|[0.05209994  ]|[FORTRAN RB ]|
 
**FRB - Fortran Record Boundary**

Internal data structures used are not saved to the filesystem.

#### File and Database Structures

Explain the relevant files and databases and their role in the project.  Details regarding where or what that solution is hosted on will be in the Configuration Management Plan (CMP).

***Example:***
No database mechanism is in use for this application.
NetCDF v4.+ is in use for all data formats.

### Data 

#### Data Flow Diagram (APSC-DV-002950)

Document the exchange of data between assets, which must be registered in the CMP, and include ports, protocols, and data formats.

[Data Exchange](./reference.png)
![Data Exchange](./reference.png)

*Data Flow (APSC-DV-002950)*

Provide a description of how the data flows in the project.  A system view of ports, protocols, and lines of travel is appropriate.  Details components are highlighted in the CMP, this is a high-level overview.

***Example***:
Data exchange is not intrinsically network based, like a web application.  This scientific application gathers data files via file system, stores them locally to facilitate easier I/O, and saves the result to a designated folder.  NetCDF and binary output structured for NCODA are the only data file formats and information exchanged.

#### Categories of Data Sensitivity (APSC-DV-003290)

Document any data sensitivity concerns between data elements.  Every data element identified in the CMP should have notation regarding classification in this document or maintained in the CMP itself.

***Example:*** 
No specific classification is associated with this project.  Source code does not include a specific requirement to handle data classifications.  VISOR code could be hosted on any environment that supports the same libraries as Global Ocean Processing System (GOPS).  Additional output modification for security classifications would be handled via postProduction.sh scripts.

*Are there any classification guides you must adhere to?  Provide references.*

[DoW Data Sensitivity](http://www.dtic.mil/whs/directives/corres/pdf/520001_vol1.pdf)

Security classification guides shall provide the following information:

+ There are no security requirements for this project.

## Architecture

### Approved Architecture

Describe the architecture approved at a high level conceptually, reference the detailed output within the [Application Configuration Guide (ACG)](003_ApplicationConfigurationGuide_Standard.md) and the [Configuration Management Plan (CMP)](006_ConfigurationManagement_Standard.md).

***Example:***

This is a scientific data processing software solution and does not have traditional web architecture or utilize services.  No API was developed for this software package.  See the [Application Configuration Guide (ACG)](003_ApplicationConfigurationGuide_Standard.md) for details regarding the Concept of Operations (CONOPS) for this solution.

### Communications

  *How are the primary means of communication occurring?  Describe in layman's terms and then expound in detail.*

**Communications Protocols**

See the detailed output within the [Application Configuration Guide (ACG)](003_ApplicationConfigurationGuide_Standard.md) and the [Configuration Management Plan (CMP)](006_ConfigurationManagement_Standard.md) for Ports, Protocols, and Services used as per the Ports, Protocols, and Services Manual (PPSM).

### Roles (APSC-DV-002380)

Identify any roles associated with this application, note that these are not the roles within the project itself which are encapsulated in the Configuration Management Plan (CMP).  The following roles are for this application package proper:

**Roles**

***Example:***

| Role Name       | Function |  Description                                                      |
|-----------------|----------|-------------------------------------------------------------------|
|None             |N/A       |A standard system user account is the only requirement for this system.  There are no administrators or special access privilege roles associated with this software package.|

## Requirements

Requirements are encapsulated within *what document*?

Changes to software are tracked in *where*?  Reference: https://web.git.mil

Overall project perspective is maintained at  *where, provide Reference:* https://web.git.mil

See the section entitled 4.2.4 Software Configuration Management (APSC-DV-003010) for details regarding the proper way to start a change of this software application.  Minimally your SCM should be documented in the Configuration Management Plan. Provide a high-level overview of how changes are made.

***Example:*** 

Changes are made in a branch that typically correlates to a registered Jira issue.  Commits via the Software Configuration Management (SCM) system include reference to the Jira issue the change was initiated with.  A change is requested by the Principal Investigator (PI), discussed with the software development team and entered as a Story in the Agile (Jira) system.  A three-month projection of task load is identified and confirmed acceptable by the PI and executed upon.  As releases are made versions are updated with a change long and Stories are updated in the Agile system to reflect the change and status.

## Software Specifications

### System Environment and System Components 

***Example:***
Target environment is a server using Red Hat Enterprise Linux v7+ in either 32- or 64-bit configuration.  *Describe system environment.*

*Note that if a provisioning system is being used then you should reference that instead of repeating everyting.*

### Managed Software Domain
See section, Software, for details regarding the managed software domain associated with this IT solution.

### Development Technique 
 

The Software Development Life Cycle (SDLC) is a structured process used by development teams to design, build, test, and deploy software. It helps ensure the software meets user needs, is delivered on time, and is of high quality.

See [Software Development Life Cycle Standard](013_SoftwareDevelopmentLifecycle_Standard.md).

SDLC provides a roadmap that guides each phase methodically, helping ensure efficient, predictable, and successful software development and delivery. Different methodologies (like Waterfall, Agile, Spiral) apply these stages in varied ways tailored to specific project needs.

##### Standards

Development efforts will follow the processes specified in the Process Asset Library (PAL) or other standards specified in a kick-off meeting.  Enumerate the different processes and provide a hyperlink to their authoritative location.

Review the [Coding Standard](004_Coding_Standard.md) and the [Code Review Standard](005_CodeReview_Standard.md) for details on how this project's standards will be managed.

#### PAL

*where?* Reference: [standards and best practices]() used per project and by the team.

#### Software Configuration Management (APSC-DV-003010)

Software Configuration Management (SCM) is the process of tracking code as it is developed, maintaining versions of code and their histories and ensuring that only one person at a time is making changes to a given section of code.  The importance of SCM cannot be overstated, especially in a development environment with multiple programmers. 

Refer to the [Configuration Management Plan (CPM)](006_ConfigurationManagement_Standard.md) for explicit details regarding SCM.

### Transferring Code from Development to Deployment (APSC-DV-003010)

#### Deployment

The final steps in any deployment are to specifically test both general functionality as well as specific functionality of what was released with the specific stakeholder for each change request.

See [Deployment Standard](008_Deployment_Standard.md) for instructions related to the deployment standards for software delivery.

#### Creation of Deployment Materials

Application files must be cryptographically hashed prior to deploying DoW operational networks (ASPC-DV-003140). 
Indicate where deployment materials are kept as part of a deployment, if using a code repository be sure to include the URI.

See [Delivery Standard](009_Delivery_Standard.md) for instructions related to the creation of a delivery and the minimal artifacts required as part of a customer delivery from this project and receipt of other components into this project (deployment of other software packages).

## Security

### Definition

The focus of this section is to discuss security within a DoW environment for web applications as well as Desktop application development.  Security in this context are those measures taken to protect an application from aberrant/malicious actions by any user accessing the application.  Security is the use of various mechanisms, with defense in depth taken into consideration, intended to thwart and/or record the aberrant/malicious user behavior.

###  Scope
This document represents core knowledge of the project in question regarding application security which will serve as the authoritative medium for all decisions.  Standards, rules, and guidance on action will come from the material contained in this document.

The goal of application security is to prevent unauthorized access to the application and its respective data. It should be noted that there is no completely secure application; however, attack vectors can be secured such that the efforts to overcome security implementations far outweigh any gains that could be had.

The SANS Institute has an excellent and sufficiently generic checklist regarding application security. This checklist notes important points to consider during the design process: risk assessment, authentication, and authorization/access control. Security issues within the actual codebase fall outside the scope of this document. 

The Department of War (DoW) is sufficiently concerned about this topic to dedicate a complete Security Technical Implementation Guide (STIG) to the subject. Information Assurance Officers (IAO) and even end users should also be concerned with web application security because of its direct effect on data integrity.

Major categories within application security discussed in this text are:

+ Security Technical Implementation Guide (STIG)
+ Application Security and Development (ASD), Version 6, Release 5
+ [Open Web Application Security Project (OWASP)](https://www.owasp.org/index.php/Main_Page)
+ [National Institute of Standards and Technology (NIST)](http://www.nist.gov/)

### Categories

#### Security Technical Implementation Guide (STIG)

From the STIG: 

DoW Directive 8500.01E requires that "all IA and IA-enabled IT products incorporated into DoW information systems shall be configured in accordance with DoW-approved security configuration guidelines" and tasks DISA to "develop and provide security configuration guidance for IA and IA-enabled IT products in coordination with Director, NSA".

By using the STIG, developers achieve a twofold accomplishment: compliance with DoW mandates, and usage of fully vetted best practices.  The STIG addresses three levels (or categories) of vulnerabilities -- CAT I (highest, can lead to immediate unauthorized access), CAT II (high potential of granting unauthorized access), and CAT III (can indirectly cause unauthorized access). 

Subject application is not an IA or IA-enabled IT product.  It is a scientific processing suite which should be run with an unprivileged account.

From the website:
"Founded in 1901, NIST is a non-regulatory federal agency within the U.S. Department of Commerce. NIST's mission is to promote U.S. innovation and industrial competitiveness by advancing measurement science, standards, and technology in ways that enhance economic security and improve our quality of life."

It should be noted that valuable information related to application security can be obtained from this site.  While not mandatory, as DoW STIG requirements represent the highest standard, this site is worth periodic review for potential vulnerabilities when executing a threat assessment.

### Threat Assessment (APSC-DV-003230)

The STIG details Threat Modeling:

"Threat Modeling is the process of identifying potential threats to the application, risk ranking these threats, and selecting appropriate countermeasures or mitigations for the threats. Threat modeling is a critical step in securing an application from attack."

Use the [Threat Assessment Template](010_ThreatAssessment_Template.md) to ensure you have an updated set of documents for your application.

### Application Configuration Guide ~ ACG (APSC-DV-003285)

An application configuration guide defines the components, configuration of the components, and how those components work together. See Appendix B: Application Configuration Guide (ACG) ~ APSC-DV-003285.  Installation guides are in a separate text.  See [ACG](003_ApplicationConfigurationGuide_Standard.md) for guidance with respect to a Standard and Template.

## Metrics

### Definition

Software metric is a measure of some property of a piece of software or its specifications. Since quantitative measurements are essential in all sciences, there is a continuous effort by computer science practitioners and theoreticians to bring similar approaches to software development. The goal is obtaining objective, reproducible and quantifiable measurements, which may have numerous valuable applications in schedule and budget planning, cost estimation, quality assurance testing, software debugging, performance optimization, and optimal personnel task assignments.

### Scope

Core metrics will come from SonarQube as it has the capacity to measure coverage, lines of code, defects, and vulnerabilities.

Additional metrics regarding speed of application time and load (Low/High Portal) will be maintained in a Flank Speed project folder along with Project Management Plans (PMP's) and related documentation.

## Testing

### Definition

Software testing is an investigation conducted to provide stakeholders with information about the quality of the product or service under test. Software testing also provides an objective, independent view of the software to allow the business to appreciate and understand the risks of software implementation.  Test techniques include, but are not limited to, the process of executing a program or application with the intent of finding software bugs (errors).
Software testing can also be stated as the process of validating and verifying that a software program/application/product:
+ Meets the business and technical requirements that guided its design and development. 
+ Works as expected; and 
+ Can be implemented with the same characteristics. 

 Software testing, depending on the testing method employed, can be implemented at any time in the development process. However, most of the test effort occurs after the requirements have been defined and the coding process has been completed. As such, the methodology of the test is governed by the software development methodology adopted.

Different software development models will focus the test effort at different points in the development process. Newer development models, such as Agile, often employ test driven development and place an increased portion of the testing in the hands of the developer, before it reaches a formal team of testers.  In a more traditional model, most of the test execution occurs after the requirements have been defined and the coding process has been completed.

### Scope

The primary purpose of testing is to detect software failures so that defects may be discovered and corrected.  All testing for release will have a Test Plan prior to release to the customer.  User Acceptance Test (UAT) will be conducted prior to operational release of the software.

## ASD Specific Criteria

+ APSC-DV-000180 - If your applicaiton utilizes SOAP messaging, refer to this requirement and ensure Fix Text requirement(s) are met.

+ APSC-DV-000190 - If your application utilizes WS-Security tokens refer to this requirement in the ASD and ensure the Fix Text requirement(s) are met.

+ APSC-DV-000200 - If your application utilizes WSS or SAML assertions refer to this requirement in the ASD and ensure the Fix Text requirement(s) are met.

+ APSC-DV-000210 - If your application utilizes SAML assertions refer to this requirement in the ASD and ensure the Fix Text requirement(s) are met.

+ APSC-DV-000220 - If your application utilizes WS-Security tokens refer to this requirement in the ASD and ensure the Fix Text requirement(s) are met.

+ APSC-DV-000230 - If your application utilizes SAML assertions refer to this requirement in the ASD and ensure the Fix Text requirement(s) are met.

+ APSC-DV-000240 - If your application utilizes SAML assertions refer to this requirement in the ASD and ensure the Fix Text requirement(s) are met.

+ APSC-DV-000250 - If your application utilizes SAML assertions refer to this requirement in the ASD and ensure the Fix Text requirement(s) are met.

+ APSC-DV-000260 - If your application utilizes SAML assertions refer to this requirement in the ASD and ensure the Fix Text requirement(s) are met.

+ APSC-DV-003236 - An incident response plan must be defined.  An application incident response process is managed by the development team and should include a method for individuals to submit potential security vulnerabilities to the development or maintenance team.  The plan should dictate what is to be done with the reported vulnerabilities. Reported vulnerabilities must be tracked throughout the process to ensure they are triaged, corrected, and tested. The corresponding update is released to the user community and the user community is notified of the availability of the application update.  Without an established application incident management plan and process, discovered issues and vulnerabilities will go unreported.   Vulnerabilities will not be triaged and managed, and there may be delays in corrective actions.  Information on how to submit bug and vulnerability reports must also be included in the application design document or configuration guide.


See dedicated [Test Standard and Template](015_TestPlan_Standard.md) documentation.

++ Glossary of Terms 

Access Control - based on your system classification, you will be given access to package functions specific to your job.

Attribute - information about a process or task. 

Checklist - a list of items, each with a check box, displayed in the task window.
 
Class - a category, to which documents and process definitions are assigned, used to organize documents and process definitions.

Graphical User Interface (GUI) - visually oriented interface to talk with a program.

Host - generally a program that stores data for a client and provides that data to the client as requested.

Primary Key - a value that uniquely identifies each row in a database table. See Relational Database management on the Internet.

Privilege - an access control mechanism for processes. 

C - a compiled language.

RDBMS - Relational Database Management System

RDBMS ER Diagram - (Relational Database Management System Entity Relationship Diagram).

Security Technical Information Guide (STIG) - The documentation that specifies and explains the procedures for performing the SRR.

SCM - Software Configuration Management. 

