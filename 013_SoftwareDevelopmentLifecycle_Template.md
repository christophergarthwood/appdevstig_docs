# Software Development Lifecycle (SDLC) Template

[TOC]

## SDLC Standard

*Standard:* [Software Development Lifecycle Standard](./013_SoftwareDevelopmentLifecycle_Standard.md)

## Software Development Lifecycle (SDLC) 

## Project Name

### Some Customer, Some Organization

### 2026/03/20     

### 0.1

## History of Work Performed

## Versioning

|Version       | Description                                  |
|-------------------------------------------------------------|
|v0.1          | Inception source code, totally alpha, v0.1   |

## Executive Summary

The intent of this document is to provide an SDLC implementation for WADE LLM.

### Introduction

The Software Development Life Cycle (SDLC) is a structured process used by development teams to design, build, test, and deploy software. It helps ensure the software meets user needs, is delivered on time, and is of high quality.

The SDLC typically includes these key stages:

*Planning:* Define project goals, requirements, scope, schedule, and resources.

*Requirements Analysis:* Gather and analyze detailed user and business requirements.

*Design:* Create the software architecture, system design, and user interface plans.

*Implementation (Coding):* Developers write the actual code according to designs and standards.

*Testing:* Verify the software works correctly, is free of bugs, and meets requirements through various tests.

*Deployment:* Release the software to users and configure it in the production environment.

*Maintenance:* Provide ongoing support, fix issues, and update the software over time.

SDLC provides a roadmap that guides each phase methodically, helping ensure efficient, predictable, and successful software development and delivery. Different methodologies (like Waterfall, Agile, Spiral) apply these stages in varied ways tailored to specific project needs.

### Secure Design Principal Training (APSC-DV-003400)

Many application team members may not be aware of the security implications regarding the code that they design, write and test. To address this concern, the Program Manager will ensure all levels of program management receive security training regarding the necessity, impact, and benefits of integrating secure development practices into the development lifecycle. 

This training is in addition to DoW 8570 training requirements as DoW 8570 annual security training does not presently cover application SDLC security concerns.

The Program Manager will ensure development team members are provided training on secure design principles for the entire SDLC and newly discovered vulnerability types on, at least, an annual basis. 

Development team members include:

- Designers/Application Architects
- Developers/Programmers
- Testers
- Application managers 

Security Training completed by team in support of Secure Software Development Practices:

**Security Training (APSC-DV-003400)**

|Training Name  | Date Reviewed | Description                                                          |
|---------------|---------------|----------------------------------------------------------------------|
|OWASP Top Ten  |????/??/??     |Internal training covering the OWASP Top Ten for 2017 and implications for this application.|
|SDLC 101       |????/??/??     |http://safecode.org/courses/security-development-lifecycle-101        |
|CyberAwareness |????/??/??     |DoW Requirement                                                       |

##### Standards

Development efforts will follow the processes specified in the Process Asset Library (PAL) or other standards specified in a kick-off meeting.  Enumerate the different processes and provide a hyperlink to their authoritative location.

[Process Asset Library (PAL)](<cite URL here)

#### Software Configuration Management (APSC-DV-003010)

Software Configuration Management (SCM) is the process of tracking code as it is developed, maintaining versions of code and their histories and ensuring that only one person at a time is making changes to a given section of code.  The importance of SCM cannot be overstated, especially in a development environment with multiple programmers. 

The application is modified using a Trunk/Branch/Tag methodology and the Git repository management system .  Each modification will be tracked as a task which in turn will be the basis for software modification, testing, and eventual feature release.  All modifications will be correlated to the host/parent organization tracking/requirements system which authorizes the work.

Objects considered eligible for deployment:

+ Source Code (\*.py, \*.sh, \*.md, \*.json, \*.(all graphics formats) )
+ Configuration/Settings files
+ Libraries used for execution at build and run-time, these must be CM'd as well in a repository.

Additional information regarding operational deployment is in the section Transferring Code from Development to Deployment (APSC-DV-003010).

All modifications to any configurable part of the project will be managed and tracked by using the tracking system.

Each time this software is released a new version is indicated and a tag created, all change requests are recorded in the version history for that release.  The team will have an environment that will represent the release of all software deployments.  All software components, source code, libraries, and project documentation will be encapsulated within repository name with URI under specific structure requirements highlighted in the top level of the repository.  

Individual tag history is stored with each project in a corresponding README.md file at the top level of the folder.

For a baseline of all components of the software package refer to the Deployment folder for the last deployment which should contain:

+ Test Case report.
+ Scan report.
+ Unit, Human Testing, Technical Acceptance Test | User Acceptance Test report.
+ Reference to the reference for repository for subject release of the following components:
+ Source Code.
+ Architecture diagram(s), embedded within documentation.
+ Design document (DD)
+ User Release Notes
+ Application Configuration Guide (ACG)
+ Installation Guide

## Coding Standards (APSC-DV-003215)

### Definition

Common programming standards are adhered to for the following reasons:

+ Programmers can go into any code and determine the status   which increases maintainability, readability, and reusability.
+ New programmers can rapidly grasp their status.
+ Programmers that are unfamiliar with a programming language have a common standard which alleviates the need to develop a personal style.
+ Standard programming language reduces errors and increases reliability.
+ Individual styles are replaced, and an emphasis is placed on business concerns - high productivity, maintainability, shared authorship, and other aspects that help the group achieve its goal. 

Coding standards are outlined at [Standard Operating Procedures Documentation](<cite URL here>).

## Build Environment 

TODO

## Transferring Code from Development to Deployment (APSC-DV-003010)

TODO

### Deployment

TODO

TODO: Consider Ansible deployment script.

### Creation of Deployment Materials

Application files must be cryptographically hashed prior to deploying DoW operational networks (ASPC-DV-003140). 

TODO
