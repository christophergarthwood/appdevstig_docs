# Title: Design Management Standard

## Definition:

A design document in simple terms is a written plan that explains how software will be built. It describes what the software will do, how it will work, and how its different parts fit together. The purpose is to give everyone on the team (developers, testers, managers) a clear guide for building the software, so everyone knows what to do and how to do it. It helps avoid confusion, saves time, and makes sure the final product meets everyone’s expectations.

## Purpose:

To bring team cohesion and focused understanding of the boundary conditions associated with the project thereby keeping the team on a consistent path that leads to success.

## Requirements/Specifications/Guidelines:

A software design document needs to include several key requirements and components to ensure a clear, effective blueprint for development and should include Introduction & Stakeholders, a System Overview, Scope & Context, Architectural Design, Detailed Design, User Interface Design, Data Design, Interface Design, Error Handling & Recovery, Dependencies & Assumptions and a Glossary of Terms.

Each section should be clear, thorough, and serve as a guide for developers, testers, and other stakeholders to understand and follow during the entire software development process.

## Measurable and Actionable:

Completion of POA&M milestones, success criteria, and risk management.

## Timeliness:

Reviewed quarterly by the PM and Technical Lead.  Changes are appropriate if identified in Story and recognized as needed change during modifications.

## Reference(s)
 + Application Security and Development (ASD) Security Technical Implementation Guide (STIG) Version 6, Release 3, 2025/04/02 
   + APSC-DV-000180, Applications with SOAP messages requiring integrity must include the following message elements:-Message ID-Service Request-Timestamp-SAML Assertion (optionally included in messages) and all elements of the message must be digitally signed.
   + APSC-DV-000190, Messages protected with WS_Security must use time stamps with creation and expiration times.
   + APSC-DV-000200, Validity periods must be verified on all application messages using WS-Security or SAML assertions.
   + APSC-DV-000210, The application must ensure each unique asserting party provides unique assertion ID references for each SAML assertion.
   + APSC-DV-000220, The application must ensure encrypted assertions, or equivalent confidentiality protections are used when assertion data is passed through an intermediary, and confidentiality of the assertion data is required when passing through the intermediary.
   + APSC-DV-000230, The application must use the NotOnOrAfter condition when using the SubjectConfirmation element in a SAML assertion.
   + APSC-DV-000240, The application must use both the NotBefore and NotOnOrAfter elements or OneTimeUse element when using the Conditions element in a SAML assertion.
   + APSC-DV-000250, The application must ensure if a OneTimeUse element is used in an assertion, there is only one of the same used in the Conditions element portion of an assertion.
   + APSC-DV-000260, The application must ensure messages are encrypted when the SessionIndex is tied to privacy data.
   + APSC-DV-003220, The designer must create and update the Design Document for each release of the application.
   + APSC-DV-003236, The application development team must provide an application incident response plan.
 + [Defense Agency University (DAU)](https://www.dau.edu/acquipedia-article/configuration-management-cm)
 + [Federal Shared Services](https://ussm.gsa.gov/assets/files/M3-Playbook-Configuration-Management-Plan-Template.docx)
____________________________________________________________________________________________________________________________________
## **Template**

# Design Document (AppDev STIG v6r3, APSC-DV-003220)

## Name of the Project

### Sponsor Name, Department, Email

### Date ISO 8601

### Latest Version of Document or Project if Synced

## History of Work Performed

## Versioning

|Version       |Description                                                                                                         |
|--------------|--------------------------------------------------------------------------------------------------------------------|
|v0.1          | Inception source code, totally alpha, v0.1  |
|v1.1.24       | v1.1.24 ASD STIG v5 updates                 |
|v1.2.00       | v1.2.00 ASD STIG v6r3 updates               |

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

See detailed output from the [Application Configuration Guide (ACG)](./Template_003_ApplicationConfigurationGuideStandard.md) and the [Configuration Management Plan (CMP)](./Template_006_ConfigurationManagementStandard.md).

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

+ [Application Configuration Guides (ACG)](./Template_003_ApplicationConfigurationGuideStandard.md) will exist.
+ [Coding Standards](./Template_004_CodingStandard.md) will exist and be adhered to.
+ [Code Reviews](./Template_005_CodeReviewStandard.md) will be performed and documented.
+ [Configuration Management Plan (CMP)](./Template_006_ConfigurationManagementStandard.md) will exist and be documented.
+ [Deployment Standards](./Template_008_DeploymentStandard.md) will be adhered to.
+ [Delivery Standards](./Template_010_DeliveryStandard.md) will be adhered to.
+ [Threat Assessments](./Template_011_ThreatAssessment.md) will be conducted initially and after each major release.
+ [Logging Standards](./Template_012_LoggingStandard.md) will be adhered to in all environments.
+ [Tracking System](./Template_013_TrackingSystemStandard.md) will be utilized.
+ [Software Development Life Cycle](./Template_014_SoftwareDevelopmentLifecycleStandard.md) will be documented and followed.
+ [Communications Standards](./Template_015_CommunicationStandard.md) will be utilized by the development team.
+ [Testing Standards](./Template_016_TestStandard.md) will be utilized by a designated tester.
+ [Design Document](./Template_DesignDocumentStandard.md) will exist and be populated.

### Communications
+ Developers coordinate with *who*.
+ Quarterly Report to *who*.
+ Yearly reviews to *who*.
+ Periodic meetings with end-user to discuss general progress and clarify requirements as needed.

### Hardware Configuration Items

Specify network domain or named hardware configuration will be the target architecture for the smaller applications.

See detailed output within the [Application Configuration Guide (ACG)](./Template_003_ApplicationConfigurationGuideStandard.md) and the [Configuration Management Plan (CMP)](./Template_006_ConfigurationManagementStandard.md).

### Data Communications

All communications are performed on a file system, it is possible and at *agency?* probable that subject file system is Network File System (NFS) mounted, however no other communications via TCP/IP are performed on any ports.  This is a scientific data processing program with no user accounts, roles, or web presence.

Refer to the [Configuration Management Plan (CMP)](./Template_006_ConfigurationManagementStandard.md) for details regarding communications.

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

[DoD Data Sensitivity](http://www.dtic.mil/whs/directives/corres/pdf/520001_vol1.pdf)

Security classification guides shall provide the following information:

+ There are no security requirements for this project.

## Architecture

### Approved Architecture

Describe the architecture approved at a high level conceptually, reference the detailed output within the [Application Configuration Guide (ACG)](./Template_003_ApplicationConfigurationGuideStandard.md) and the [Configuration Management Plan (CMP)](./Template_006_ConfigurationManagementStandard.md).

***Example:***

This is a scientific data processing software solution and does not have traditional web architecture or utilize services.  No API was developed for this software package.  See the [Application Configuration Guide (ACG)](./Template_003_ApplicationConfigurationGuideStandard.md) for details regarding the Concept of Operations (CONOPS) for this solution.

### Communications

  *How are the primary means of communication occurring?  Describe in layman's terms and then expound in detail.*

**Communications Protocols**

See the detailed output within the [Application Configuration Guide (ACG)](./Template_003_ApplicationConfigurationGuideStandard.md) and the [Configuration Management Plan (CMP)](./Template_006_ConfigurationManagementStandard.md) for Ports, Protocols, and Services used as per the Ports, Protocols, and Services Manual (PPSM).

### Roles (APSC-DV-002380)

Identify any roles associated with this application, note that these are not the roles within the project itself which are encapsulated in the Configuration Management Plan (CMP).  The following roles are for this application package proper:

**Roles**

***Example:***

| Role Name       | Function |  Description                                                      |
|-----------------|----------|-------------------------------------------------------------------|
|None             |N/A       |A standard system user account is the only requirement for this system.  There are no administrators or special access privilege roles associated with this software package.|

## Requirements

Requirements are encapsulated within *what document*?

Changes to software are tracked in *where*?  Reference: [DI2E Jira](https://jira.di2e.net/secure/Dashboard.jspa) 

Overall project perspective is maintained at  *where, provide Reference:* [DI2E Confluence](https://confluence.di2e.net/display/NRL7331/VISOR)

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

See [Software Development Life Cycle Standard](./Template_014_SoftwareDevelopmentLifecycleStandard.md).

SDLC provides a roadmap that guides each phase methodically, helping ensure efficient, predictable, and successful software development and delivery. Different methodologies (like Waterfall, Agile, Spiral) apply these stages in varied ways tailored to specific project needs.

##### Standards

Development efforts will follow the processes specified in the Process Asset Library (PAL) or other standards specified in a kick-off meeting.  Enumerate the different processes and provide a hyperlink to their authoritative location.

Review the [Coding Standard](./Template_004_CodingStandard.md) and the [Code Review Standard](./Template_005_CodeReviewStandard.md) for details on how this project's standards will be managed.

#### PAL

*where?* Reference: [standards and best practices](https://confluence.di2e.net/display/NRL7331) used per project and by the team.

#### Software Configuration Management (APSC-DV-003010)

Software Configuration Management (SCM) is the process of tracking code as it is developed, maintaining versions of code and their histories and ensuring that only one person at a time is making changes to a given section of code.  The importance of SCM cannot be overstated, especially in a development environment with multiple programmers. 

Refer to the [Configuration Management Plan (CPM)](./Template_006_ConfigurationManagementStandard.md) for explicit details regarding SCM.

### Transferring Code from Development to Deployment (APSC-DV-003010)

#### Deployment

The final steps in any deployment are to specifically test both general functionality as well as specific functionality of what was released with the specific stakeholder for each change request.

See [Deployment Standard](./Template_008_DeploymentStandard.md) for instructions related to the deployment standards for software delivery.

#### Creation of Deployment Materials

Application files must be cryptographically hashed prior to deploying DoD operational networks (ASPC-DV-003140). 
Indicate where deployment materials are kept as part of a deployment, if using a code repository be sure to include the URI.

See [Delivery Standard](./Template_008_DeploymentStandard.md) for instructions related to the creation of a delivery and the minimal artifacts required as part of a customer delivery from this project and receipt of other components into this project (deployment of other software packages).

## Security

### Definition

The focus of this section is to discuss security within a DoD environment for web applications as well as Desktop application development.  Security in this context are those measures taken to protect an application from aberrant/malicious actions by any user accessing the application.  Security is the use of various mechanisms, with defense in depth taken into consideration, intended to thwart and/or record the aberrant/malicious user behavior.

###  Scope
This document represents core knowledge of the project in question regarding application security which will serve as the authoritative medium for all decisions.  Standards, rules, and guidance on action will come from the material contained in this document.

The goal of application security is to prevent unauthorized access to the application and its respective data. It should be noted that there is no completely secure application; however, attack vectors can be secured such that the efforts to overcome security implementations far outweigh any gains that could be had.

The SANS Institute has an excellent and sufficiently generic checklist regarding application security. This checklist notes important points to consider during the design process: risk assessment, authentication, and authorization/access control. Security issues within the actual codebase fall outside the scope of this document. 

The Department of Defense (DoD) is sufficiently concerned about this topic to dedicate a complete Security Technical Implementation Guide (STIG) to the subject. Information Assurance Officers (IAO) and even end users should also be concerned with web application security because of its direct effect on data integrity.

Major categories within application security discussed in this text are:

+ Security Technical Implementation Guide (STIG)
+ Application Security and Development (ASD), Version 6, Release 3
+ [Open Web Application Security Project (OWASP)](https://www.owasp.org/index.php/Main_Page)
+ [National Institute of Standards and Technology (NIST)](http://www.nist.gov/)

### Categories

#### Security Technical Implementation Guide (STIG)

From the STIG: 

DoD Directive 8500.01E requires that "all IA and IA-enabled IT products incorporated into DoD information systems shall be configured in accordance with DoD-approved security configuration guidelines" and tasks DISA to "develop and provide security configuration guidance for IA and IA-enabled IT products in coordination with Director, NSA".

By using the STIG, developers achieve a twofold accomplishment: compliance with DoD mandates, and usage of fully vetted best practices.  The STIG addresses three levels (or categories) of vulnerabilities -- CAT I (highest, can lead to immediate unauthorized access), CAT II (high potential of granting unauthorized access), and CAT III (can indirectly cause unauthorized access). 

Subject application is not an IA or IA-enabled IT product.  It is a scientific processing suite which should be run with an unprivileged account.

From the website:
"Founded in 1901, NIST is a non-regulatory federal agency within the U.S. Department of Commerce. NIST's mission is to promote U.S. innovation and industrial competitiveness by advancing measurement science, standards, and technology in ways that enhance economic security and improve our quality of life."

It should be noted that valuable information related to application security can be obtained from this site.  While not mandatory, as DoD STIG requirements represent the highest standard, this site is worth periodic review for potential vulnerabilities when executing a threat assessment.

### Threat Assessment (APSC-DV-003230)

The STIG details Threat Modeling:

"Threat Modeling is the process of identifying potential threats to the application, risk ranking these threats, and selecting appropriate countermeasures or mitigations for the threats. Threat modeling is a critical step in securing an application from attack."

Use the [Threat Assessment Template](./Template_011_ThreatAssessment.md) to ensure you have an updated set of documents for your application.

### Application Configuration Guide ~ ACG (APSC-DV-003285)

An application configuration guide defines the components, configuration of the components, and how those components work together. See Appendix B: Application Configuration Guide (ACG) ~ APSC-DV-003285.  Installation guides are in a separate text.  See [ACG](./Template_003_ApplicationConfigurationGuideStandard.md) for guidance with respect to a Standard and Template.

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

See dedicated [Test Standard and Template](./Template_016_TestStandard.md) documentation.

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