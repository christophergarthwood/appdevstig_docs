# Project Documentation Standards (AppDev STIG v6r3, APSC-DV-003220)

## Versioning

|Version       |Date (YYYY/MM/DD)    |Description |
|--------------|---------------------|------------|
|v0.1          | 2025/08/15          |Inception of effort. |

## Table of Contents

+ [Executive Summary](#executive_summary)
+ [Introduction](#introduction)
+ [Minimal Documentation Set](#minimal_documentation_set)
+ [Documentation Explained](#documentation_explained)
+ [References](#references)

<a name="executive_summary"/>

## Executive Summary

A standardized approach to software project management, grounded in PMI and Department of Defense (DOD) acquisition policy, delivers critical value to organizations. PMI’s globally recognized framework ensures consistent project planning, execution, and control, enabling project teams to improve efficiency, manage risks proactively, and deliver repeatable success across projects. By adhering to standards such as those outlined in the PMBOK Guide, teams benefit from a common vocabulary, validated methodologies, and best practices that promote stakeholder alignment, transparency, and resource optimization.

Within the DOD, acquisition policy mandates the use of flexible, adaptive standards for software development. The DOD’s Software Acquisition Pathway focuses on rapid and iterative software delivery, integrating modern methodologies such as Agile and DevSecOps to meet urgent mission needs. These standard-driven processes enhance risk management, expedite decision-making, and ensure cybersecurity and intellectual property considerations are addressed from project inception.

Overall, the integration of proven PMI standards and DOD policy fosters accountability, improves communication, and raises the quality of deliverables. Organizations experience greater consistency and predictability in projects, while also adapting to evolving technology and mission requirements—a competitive advantage essential for mission success and organizational growth.

<a name="introduction"/>

## Introduction

The goal of this document is to establish minimal standards towards consistent software delivery grounded in DOD policy and procedures.  

A clear set of software project management standards serves as the foundation for successful delivery and superior operational support. These standards are designed to guide project teams through every phase of the software lifecycle by ensuring clarity, repeatability, and quality at each critical touchpoint.

The project plan acts as the roadmap, defining scope, objectives, timelines, resources, and risk management strategies to keep teams aligned and deliverables on target. An application configuration guide provides instructions for setting up software environments and ensures consistency in deployments across development, testing, and production. The design document captures architectural decisions, system interfaces, and key technical details, enabling informed development and maintenance.

Adherence to coding standards promotes readable, secure, and maintainable code. Code reviews provide structured peer assessments, reducing defects and improving software quality. Deployment standards outline the requirements and procedures for reliable software releases, minimizing downtime and errors.

Configuration management governs version control and change tracking, safeguarding the integrity of the software as it evolves. Threat modeling proactively identifies and mitigates security risks during design and development. Detailed test plans establish the criteria and methods for verifying software functionality, performance, and security before release.

Robust communication plans ensure that stakeholders remain informed and engaged, driving accountability and transparency across the project. Together, these documents and practices create a disciplined framework that enhances collaboration, reduces risk, and leads to successful and secure software solutions.

A “cloud culture” is the set of values, attitudes, and behaviors within an organization that enable and optimize an IT architecture. This culture emphasizes collaboration, flexibility, and scalability—not just in technical infrastructure, but in work processes and team dynamics as well. In a cloud culture, teams are encouraged to experiment, adapt quickly, leverage automation, and share resources, all of which support innovation and agility.

Cloud-centric behavior prioritize continuous learning, open communication, and customer-focused solutions. Rather than relying on rigid structures and traditional IT silos, a cloud culture fosters cross-functional teamwork, self-service access to resources, and rapid decision-making. This mindset shift empowers employees to embrace change, learn new skills, and optimize business outcomes using the unique advantages of cloud platforms.

Cloud culture seeks automation over manual processes, exercises Agile workload management, utilizes abstraction and seeks scalable design first.

<a name="minimal_documentation_set"/>

### Minimal Documentation Set

The following standards represents the minimal set of documents / artifacts a software project should create, maintain, and reference throughout the Software Development Lifecycle (SDLC).  Each standard provides justification for existence through references to US Government policy and Industry recognized practices.  Decentralized command is a tennant of the US military, without mechanisms in place to help ensure each team member has a means of understanding protocol / procedure you lose cohesion in the face of inevitable personnel change outs.

Reviewing each standard and creating the minimally required content within each artifact helps fortify but does not guarantee success.  Only by understanding that these standards are for your customer, team, and culture to utilize and adapt for your own purposes will you be successful.  Much like the Application Security Development (ASD) Security Technical Implementation Guide (STIG) is a *guide* for engaging the development process and not a ***mandated*** checklist will your make use of this artifact.

+ [Project Plan and Master Integrated POA&M](#project_plan)

+ [Application Configuration Guide (ACG) Standard](#acg)

+ [Coding Standard](#coding_standard)

+ [Code Review Standard](#code_review_standard)

+ [Configuration Management Standard](#configuration_management_standard)

+ [Design Document Standard](#design_document_standard)

+ [Deployment Standard](#deployment_standard)

+ [Delivery Standard](#delivery_standard)

+ [Threat Modeling Standard](#threat_modeling_standard)

+ [Logging Standard](#logging_standard)

+ [Tracking System Standard](#tracking_system_standard)

+ [Test Plan Standard](#test_plan_standard)

+ [Software Development Lifecycle (SDLC) Standard](#sdlc_standard)

+ [Communication Standard](#communication_standard)

<a name="documentation_explained"/>

### Documentation Explained
 
<a name="project_plan"/>

#### Project Plan (APSC-DV-003210)
 - *Structure:* Must be template based on customer standards else develop a template reference the template and utilize that.
 - *Format:* Preference is Markdown using pandoc to transform the content as needed and maintain in repository, else utilize MS Word.  
 - *Methods of work implementation:*  Agile (daily scrum, Sprints duration, etc.)
 - *Project Artifact Location:* Central location with Project Management documentation.
 - *Periodicity of Update:* Reviewed & updated post Sprint Review
 - *Comments:* Aligned to methodology, easily accessed
 - *Standard:* [Project Plan Template](./Template_002_ProjectPlanStandard.md)
 - *References:* APSC-DV-003210, [Secure Software Development Framework (SSDF)](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218.pdf)

A project plan is valuable because it provides a roadmap for successful project completion, ensuring projects are completed on time, within budget, and to the required standard. It helps teams avoid potential problems, manage resources effectively, and communicate clearly with stakeholders. Ultimately, a strong project plan sets the foundation for efficient execution and better project outcomes.  This requirement is meant to apply to developers or organizations that are doing application development work.

Application development efforts include the creation of a project plan to track and organize the development work.

If security flaws are not tracked within the project plan, it is possible the flaws will be overlooked and included in a release.

Tracking flaws in the project plan will help identify code elements to be changed as well as the requested change.  Project Documentation and Procedure Order of precedence Founded in experience, DOD, STIG, and Radiance standards.


#### Integrated Master Plan (IMP) and Integration Master Schedule (IMS)

 - *Structure:* Customer agreed upon format at PM's discretion.
 - *Format:* Customer agreed upon format at PM's discretion.
 - *Methods of work implementation:*  Agile (daily scrum, Sprints duration, etc.)
 - *Project Artifact Location:* Central location with Project Management documentation.
 - *Periodicity of Update:* As needed by Progam Manager with inputs from the team.
 - *Comments:* Milestones and High level tasks designed to demonstrate marked progress towards the final capability.
 - *Standard:* N/A
 - *References:* [Office of Executive Director for Systems Engineering and Architecture, May 2023](https://ac.cto.mil/wp-content/uploads/2023/05/IMP-IMS-Guide-2023.pdf)

The Department of Defense (DoD), other agencies and DoD contractors use Integrated Master Plans (IMPs) and Integrated Master Schedules (IMSs) to plan and manage projects from inception to completion. Together the IMP and IMS integrate the activities and schedule components necessary to complete a project successfully.  The IMP typically describes three levels of activities: Events, Accomplishments, and Criteria.  The IMS adds a fourth level of detail: Tasks, with detailed timelines and deadlines. Each level consists of activities to fulfill the next level in the hierarchy. Programs complete Tasks to satisfy Criteria, which roll up to satisfy Accomplishments, which roll up to complete an Event. The IMP and IMS are integrated, so changes to the plan are reflected in the schedule.

<a name="acg"/>

#### Application Configuration Guide (ACG) Standards
 - *Structure:* Must be template based on customer standards else develop a template reference the template and utilize that.
 - *Format:* Markdown with a repository utilizing pandoc to transform the content, else utilize MS Word.
 - *Methods of work implementation:*  Technical Lead is responsible and maintains.
 - *Project Artifact Location:* Central location (repository preferred), with Project Managment Plan (PMP).
 - *Periodicity of Update:* Reviewed & updated post Sprint Retrospective after completed stories.
 - *Comments:* Aligned to methodology, easily accessed.
 - *Standard:* [Application Configuration Guide](./Template_003_ApplicationConfigurationGuideStandard.md)
 - *References:* APSC-DV-003285, An Application Configuration Guide must be created and included with the application.

The Application Configuration Guide is any document or collection of documents used to configure the application.  These documents may be part of a user guide, secure configuration guide, or any guidance that satisfies the requirements provided herein.

Configuration examples include but are not limited to:

 - Encryption Settings
 - PKI Certificate Configuration Settings
 - Password Settings
 - Auditing configuration
 - AD configuration
 - Backup and disaster recovery settings
 - List of hosting enclaves and network connection requirements
 - Deployment configuration settings
 - Known security assumptions, implications, system level protections, best practices, and required permissions

Development systems, build systems, and test systems must operate in a standardized environment. These settings are to be documented in the Application Configuration Guide.

Examples include but are not limited to:

 - List of development systems, build systems, and test systems.
 - Versions of compilers used
 - Build options when creating applications and components
 - Versions of COTS software (used as part of the application)
 - Operating systems and versions
 - For web applications, which browsers and what versions are supported.

All deployment configuration settings are to be documented in the Application Configuration Guide and the Application Configuration Guide must be made available to application hosting providers and application/system administrators.


<a name="coding_standard"/>

#### Coding Standard
 - *Structure:* Must be a template based on team standards and must exist.
 - *Format:* Highest priority is to use automated mechanism for conformance.  Alternate is Markdown in a central repository using pandoc to transform the content, else utilize MS Word.
 - *Methods of work implementation:*  Technical lead is responsible and maintains, however all team members have a voice.
 - *Project Artifact Location:* Central location, either configuration files or Markdown document, in a repository regardless.
 - *Periodicity of Update:* Reviewed & updated post Sprint Retrospective, team discussion.
 - *Comments:* Automation is the key to success.
 - *Standard:* [Coding Standard](./Template_004_CodingStandard.md)
 - *References:* APSC-DV-003215, The application development team must follow a set of coding standards.

A coding standard is a set of simple rules and guidelines that programmers follow when writing code. These rules help make the code easier to read, understand, and maintain by everyone on the team. It ensures that all the code looks and works in a consistent way.

<a name="code_review_standard"/>

#### Code Review Standard
 - *Structure:* Must be a template based on team standards and must exist.
 - *Format:* Highest preference is to use a distributed system like Atlassian's FishEye, however use of Markdown in a repository for a template is acceptable, conversion with pandoc is acceptable. 
 - *Methods of work implementation:*  Performed at the end of a code development cycle per change prior to full merge into main.
 - *Project Artifact Location:* Central location, final code review output is with Project Management documentation.
 - *Periodicity of Update:* Performed with each change by a developer.
 - *Comments:* None
 - *Standard:* [Code Review](./Template_005_CodeReviewStandard.md)
 - *References:* APSC-DV-\*, multiple ASD references.

A code review is when one or more developers check someone else’s computer program code to find mistakes, improve quality, and make sure it follows agreed-upon rules before the code is added to the final project. It helps catch problems early and keeps the software working well.

<a name="configuration_management_standard"/>

#### Configuration Management Standard
 - *Structure:* Must be utilized and must be a centralized softare server solution, like Git or another version management system.
 - *Format:* Markdown document with template in central repository, use pandoc for transformation with other formats.
 - *Methods of work implementation:*  Performed with branch, trunk, tag strategy. Code changes are every few hours, server configuration changes are at change.
 - *Project Artifact Location:* Central location, must be a repository.  System Administrators have first priority with Technical Lead providing support.
 - *Periodicity of Update:* Performed no less than every few hours on your branch and pushed to the central server (upstream).
 - *Comments:* None
 - *Standard:* [Configuration Management Standard](./Template_006_ConfigurationManagementStandard.md)
 - *References:* APSC-DV-\*, multiple ASD references.

Software Configuration Management (SCM) is the process of keeping track of and controlling all the changes made to software throughout its development and use. In simple terms, it helps teams manage updates to the software, including code, documents, and settings, so that everything stays organized, consistent, and reliable.

<a name="design_document_standard"/>

#### Design Document Standard
 - *Structure:* Must be an agreed upon template, must be utilized, must exist, and must be in a repository like Git or similar configuration management solution.
 - *Format:* Preference is Markdown with transformation via pandoc.
 - *Methods of work implementation:*  Executed by Technical Lead with discussion to Project Manager.
 - *Project Artifact Location:* Maintained with repository, utilize tags for each release with copy to Project Management documentation.
 - *Periodicity of Update:* Each major change or process / procedure change.  Technical Leader Inspection quarterly with update noted in record of change. PM inspection yearly.
 - *Comments:* None
 - *Standard:* [Design Document Standard](./Template_007_DesignDocumentStandard.md)
 - *References:* APSC-DV-003220, The designer must create and update the Design Document for each release of the application.

This requirement is meant to apply to developers or organizations that are doing application development work.

The application design document or configuration guide includes configuration settings, recommendations and best practices that pertain to the secure deployment of the application.

It also contains the detailed functional architecture as well as any changes to the application architecture corresponding to a new version release and must be documented to ensure all risks are assessed and mitigated to the maximum extent practical.

<a name="deployment_standard"/>

#### Deployment Standard
 - *Structure:* Markdown formatted template agreed upon by team with diagram demonstrating workflow.  Actual deployment will be an automated solution, like Ansible.
 - *Format:*  Markdown using pandoc for data transformation.
 - *Methods of work implementation:*  Updated and maintained by System Administrators, input from whole team.
 - *Project Artifact Location:* Central location, repository. Actual implementation should utilize Ansible playbooks.
 - *Periodicity of Update:* Per deployment with initial creation in DEV and initial testing in Staging.
 - *Comments:*  None
 - *Standard:* [Deployment Standard](./Template_008_DeploymentStandard.md)
 - *References:*

A software deployment standard is a set of rules and procedures that explain how to properly deliver and set up software for users or organizations. In simple terms, it describes the steps to safely install, configure, and update software so that it works correctly and securely on users’ computers or devices. Following a standard helps ensure consistency, reduces errors, and improves security for everyone involved.

<a name="delivery_standard"/>

#### Delivery Standard
 - *Structure:* Manifest of documents aligned with standard in formal letter to the customer.
 - *Format:* Company letter head release.
 - *Methods of work implementation:* Gathered by each lead for each component of the effort, formalized by PM and delivered by PM.
 - *Project Artifact Location:* Project Management document repository.
 - *Periodicity of Update:* As needed.
 - *Comments:* Discrete Deliverable.
 - *Standard:* [Delivery Standard](./Template_010_DeliveryStandard.md) 
 - *References:* 

A software delivery standard is a set of guidelines and practices that describe how to create, test, and deliver software products to users in a reliable and efficient way. Simply put, it’s a rulebook that teams follow to make sure software is developed, checked for quality, and handed over to customers on time, with minimal errors and best results. This helps ensure the software meets users’ needs and works as expected.

<a name="threat_modeling_standard"/>

#### Threat Modeling Standard
 - *Structure:* Template response.
 - *Format:* Markdown documentation prefered using a known template.
 - *Methods of work implementation:* Team analysis and recording of results.
 - *Project Artifact Location:* Project Management documents repository.
 - *Periodicity of Update:* Inception and each secondary semantic release.
 - *Comments:* None
 - *Standard:* [Threat Modeling /  Assessment Standard](./Template_011_ThreatAssessment.md)
 - *References:*  APSC-DV-003230, Threat models must be documented and reviewed for each application release and updated as required by design and functionality changes or when new threats are discovered.

A threat assessment in a software engineering project is the process of identifying, analyzing, and understanding possible dangers or risks that could impact the security or success of the software being developed. This means looking for potential issues, such as vulnerabilities that attackers could exploit, and evaluating how likely and how serious those issues might be. The goal is to spot these threats early, so the team can take steps to prevent or reduce problems and keep the project safe and on track.

<a name="logging_standard"/>

#### Logging Standard
 - *Structure:* Configuration file according to solution (web server, application server, software application, etc.).
 - *Format:* See standard details.
 - *Methods of work implementation:* N/A
 - *Project Artifact Location:*  Logs saved per customer mandated location, configuration in CM'd config files.
 - *Periodicity of Update:* Enabled day one of server setup.
 - *Comments:* None
 - *Standard:* [Logging Standard](./Template_012_LoggingStandard.md)
 - *References:* Various Security Technical Implementation Guides (STIG)

A logging standard for software development projects, in simple terms, is a set of agreed rules about how to record events and information about what the software is doing.

<a name="tracking_system_standard"/>

#### Tracking System Standard
 - *Structure:* Depends on implementation.
 - *Format:* Depends on implementation.
 - *Methods of work implementation:* Utilization of designated system, see artifact location.
 - *Project Artifact Location:* `url_here`
 - *Periodicity of Update:*  Daily, per change.
 - *Comments:* None
 - *Standard:* [Tracking System Standard](./Template_013_TrackingSystemStandard.md)
 - *References:* DOD Enterprise DevSecOps Fundamentals, v 2.5, 2024/10
 
 A software tracking system for tracking issues in a software development project, explained simply, is a tool that helps teams keep track of problems, bugs, or tasks that come up during development. It records each issue, assigns it to the right person to fix, and monitors the progress until the problem is resolved.


<a name="test_plan_standard"/>

#### Test Plan Standard
 - *Structure:* Human authorized / trained tester
 - *Format:* Depends on methodology utilized.
 - *Methods of work implementation:* Manual and automated with results saved for inspection.
 - *Project Artifact Location:* Project Management documentation location.
 - *Periodicity of Update:* Per release of the application.
 - *Comments:* None
 - *Standard:* [Test Standard](./Template_016_TestStandard.md)
 - *References:* APSC-DV-003130, Prior to each release of the application, updates to system, or applying patches; tests plans and procedures must be created and executed.

A test plan for software development, explained in plain language, is a document that outlines what needs to be tested in a software project, how it will be tested, who will do the testing, and when it will happen. It acts like a roadmap for the testing team to make sure all important parts of the software are checked before release to catch any problems.

<a name="sdlc_standard"/>

#### Software Development Lifecycle (SDLC) Standard
 - *Structure:* Guided document showing workflow utilized to make modifications to software.
 - *Format:* Markdown
 - *Methods of work implementation:* Track changes, route modifications to PM for approval, circulate with team.
 - *Project Artifact Location:*  Project Management documentation.
 - *Periodicity of Update:* Technical Leadership discussion from outcome of identified need for modification.
 - *Comments:* None
 - *Standard:* [Softare Development Lifecycle Standard](./Template_014_SoftwareDevelopmentLifecycleStandard.md)
 - *References:* DOD Enterprise DevSecOps Fundamentals, v 2.5, 2024/10

The software development lifecycle (SDLC) is a simple step-by-step process that teams follow to create software. It helps organize and guide the work to make sure the software is well-built, meets user needs, and is delivered on time.

<a name="communication_standard"/>

#### Communication Standard
 - *Structure:* Varies based on task identified in communications standard matrix.
 - *Format:* Varies based on meeting but standard templates will be consistently used.
 - *Methods of work implementation:* Varies, see comms matrix.
 - *Project Artifact Location:* Project Management documentation location.
 - *Periodicity of Update:* Varies, see comms matrix.
 - *Comments:* None
 - *Standard:* [Communication Standard](./Template_015_CommunicationStandard.md)
 - *References:* Standard Project Management Plan (PMP) practice.

A communication standard for a software development project is a set of clear rules and guidelines about how team members share information with each other and stakeholders. It explains the best ways and tools to use for talking about project updates, sharing documents, providing feedback, asking questions, and solving problems. The purpose is to keep everyone on the same page, avoid misunderstandings, and make sure important information doesn’t get missed. Communication standards might include things like regular meetings, using certain chat apps or tools, documenting decisions, and being respectful and clear in all messages.

<a name="references"/>

## References
 + [Software Engineering for Continuous Delivery of Warfighting Capability, 2023/04](https://www.cto.mil/wp-content/uploads/2023/07/SWE-Guide-April2023.pdf)
 + [DOD Enterprise DevSecOps Fundamentals, v 2.5, 2024/10](https://dodcio.defense.gov/Portals/0/Documents/Library/DoD%20Enterprise%20DevSecOps%20Fundamentals%20v2.5.pdf)
 + [NIST Special Publication 800-37 (“Risk Management Framework for Information Systems and Organizations"), Rev 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-37r2.pdf)
 + [NIST Secure Software Development Framework (SSDF), SP 800-218A](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218A.pdf)
 + [CISA Securing the Software Supply Chain](https://www.cisa.gov/sites/default/files/publications/ESF_SECURING_THE_SOFTWARE_SUPPLY_CHAIN_DEVELOPERS.PDF)
 + [Application Security Development (ASD) Security Technical Implementation Guide (STIG) version 6, release 3 (APSC-DV-003220)](https://www.cyber.mil/stigs/downloads)
 + [Integrated Master Plan and Integrated Master Schedule Preparation and Use Guide, May 2023](https://ac.cto.mil/wp-content/uploads/2023/05/IMP-IMS-Guide-2023.pdf)
 + [pmi.org - The Value of Project Management](https://www.pmi.org/-/media/pmi/documents/public/pdf/white-papers/value-of-project-management.pdf)
