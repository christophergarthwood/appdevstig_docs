# Project Documentation Standards (AppDev STIG v6r3, APSC-DV-003220)

## Versioning

|Version       |Date (YYYY/MM/DD)    |Description                                                                                                         |

|--------------|--------------------------------------------------------------------------------------------------------------------|

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
 - Must exist
 - Template provides references.
 - APSC-DV-003285, An Application Configuration Guide must be created and included with the application.

+ [Coding Standard](#coding_standard)
 - Universal (general)
 - Just simply must exist.
 - Template provides references.
 - Adherence automated minimally.
 - DO NOT use documents to drive change, use configurations.
 - Template provides references (APSC-DV-003215).

+ [Code Review Standard](#code_review_standard)
 - Standard exists is sufficient.
 - Template provides references.
 - Artifacts have to exist.

+ [Configuration Management Standard](#configuration_management_standard)
 - Standard exists is sufficient.
 - Template provide references.
 - Artifacts have to exist, specifically a Software Configuration Manual (SCM)

+ [Design Document Standard](#design_document_standard)
 - Must exist.
 - Template provides references.
 - APSC-DV-003220, The designer must create and update the Design Document for each release of the application.

+ [Deployment Standard](#deployment_standard)
 - Primary - Ansible / Puppet
 - Secondary - Documented

+ [Delivery Standard](#delivery_standard)
 - Incoming software.
 - Customer delivery.

+ [Threat Modeling Standard](#thread_modeling_standard)
 - Must exist.
 - APSC-DV-003230, Threat models must be documented and reviewed for each application release and updated as required by design and functionality changes or when new threats are discovered.
 - Artifact must exist for each application.

+ [Logging Standard](#logging_standard)
  - STIG compliant.
  - Documented and CM'd.

+ [Tracking System Standard](#tracking_system_standard)
  - APSC-DV-003190, Flaws found during a code review must be tracked in a defect tracking system and utilize configuration management.

+ [Test Plan Standard](#test_plan_standard)
  - Documented and CM'd.
  - Must include some portion of vulnerability scans.
  - APSC-DV-003130, Prior to each release of the application, updates to system, or applying patches; tests plans and procedures must be created and executed.
  - APSC-DV-003150, At least one tester must be designated to test for security flaws in addition to functional testing.
  - APSC-DV-003160, Test procedures must be created and at least annually executed to ensure system initialization, shutdown, and aborts are configured to verify the system remains in a secure state.
  - APSC-DV-003400, The Program Manager must verify all levels of program management, designers, developers, and testers receive annual security training pertaining to their job function.
  - APSC-DV-003180, Code coverage statistics must be maintained for each release of the application.
  - ASPC-DV-001995,Application must not be vulnerable to race conditions, test by code review or static code analysis.
  - ASPC-DV-002400,Restrict ability to launch DoS attacks, use code review, penetration or vulnerability testing for results that indicate attempts to DoS the application or use the application in DoS.
  - ASPC-DV-002500, Protect from CSRF vulnerabilities, review code review reports and the vulnerability assessment scans, test plan / configuration should attempt CSRF attack with results saved.
  - ASPC-DV-002590, Application must not be vulnerable to overflow attacks.A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code. |A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code.
  - ASPC-DV-002930, The ISSO must ensure active vulnerability testing is performed.The ISSO must ensure active vulnerability testing is performed.  It is imperative that automated scanning tools are configured properly to ensure that all of the application components that can be tested are tested. In the case of web applications, some of the application code base may be accessible on the website and could potentially be corrected by a knowledgeable system administrator. Active testing is different from code review testing in that active testing does not require access to the application source code base. A code review requires complete code base access and is normally performed by the development team.
  - APSC-DV-001460, An application vulnerability assessment must be conducted.
  - APSC-DV-002310, The application must fail to a secure state if system initialization fails, shutdown fails, or aborts fail. This should be part of the test plan.
  - APSC-DV-002485, The application must not store sensitive information in hidden fields. Request most recent code review and vulnerability scan results.  Review test configuration to ensure testing for hidden fields was conducted.  Review test results for incidents of hidden data fields.
  - APSC-DV-002510, The application must protect from command injection... test for command injection.
  - APSC-DV-002520, The application must protect from canonical representation vulnerabilities.   You must test your application with your supported browsers to determine if they pass in fully encoded double byte characters safely.
  - APSC-DV-002530, The application must validate all input, Comprehensive application security testing and code reviews are required to ensure the application is not vulnerable to input validation vulnerabilities.
  - APSC-DV-002540, The application must not be vulnerable to SQL Injection. Request the latest vulnerability scan test results.  Verify the scan configuration is configured to test for SQL injection flaws.  Review the scan results to determine if any SQL injection flaws were detected during application testing.
  - APSC-DV-002550, The application must not be vulnerable to XML-oriented attacks. Review the latest application vulnerability assessment and verify the scan was configured to test for XML-related vulnerabilities and security issues.
  - APSC-DV-002560, The application must not be subject to input handling vulnerabilities. If the vulnerability scan is not configured to test for input validation vulnerabilities if the most recent scan results show that high risk input validation vulnerabilities exist and a documented risk acceptance from the ISSO is not available, or if the scan results do not exist, this is a finding.
  - APSC-DV-002590, A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code.
  - APSC-DV-002870, Unsigned Category 1A mobile code must not be used in the application in accordance with DoD policy. Next, test the application. This testing should include functional testing from all major components of the application.
  - APSC-DV-003235, The application must not be subject to error handling vulnerabilities. Check test results for identified error handling vulnerabilities within the application.
  - APSC-DV-002250, Applications must use system-generated session identifiers that protect against session fixation. Application session testing is required in order to verify this requirement.
  - APSC-DV-002280, The application must not re-use or recycle session IDs. Application session testing is required in order to verify this requirement.
  - APSC-DV-002930, The ISSO must ensure active vulnerability testing is performed. Ask the application representative to provide vulnerability test procedures and vulnerability test results.

+ [Software Development Lifecycle (SDLC) Standard](#sdlc_standard)
  - Actual development of solutions whether it be system modifications or software modifications.
  - Standard will be expected only for CTG 80.7 Portal proper development, however incoming projects must adhere to minimal delivery standards.
  - APSC-DV-003400, The Program Manager must verify all levels of program management, designers, developers, and testers receive annual security training pertaining to their job function.


+ [Communication Standard](#communication_standard)
Communication Standards
  - Cover location, tempo, mechanism, any rules
  - Team meetings
  - Technical meetings
  - Customer technical meetings
  - Customer formal meetings
  - Government admin messages
  - CTG 80.7 community messages (ALL), downtime, etc.

<a name="documentation_explained"/>
### Documentation Explained
 
<a name="project_plan"/>
#### Project Plan (APSC-DV-003210)
 - *Structure:* should be template based on customer standards else develop a template reference the template and utilize that.
 - *Format:* preference is Markdown using pandoc to transform the content, else utilize MS Word.
 - *Methods of work implementation:*  Agile (daily scrum, Sprints duration, etc.)
 - *Project Artifact Location:* Central location, identify primary and secondary responsibilities
 - *Periodicity of Update:* Reviewed Updated per Sprint Review
 - *Comments:* Aligned to methodology, easily accessed
 - *Standard:* 

A project plan is valuable because it provides a roadmap for successful project completion, ensuring projects are completed on time, within budget, and to the required standard. It helps teams avoid potential problems, manage resources effectively, and communicate clearly with stakeholders. Ultimately, a strong project plan sets the foundation for efficient execution and better project outcomes.  This requirement is meant to apply to developers or organizations that are doing application development work.

Application development efforts include the creation of a project plan to track and organize the development work.

If security flaws are not tracked within the project plan, it is possible the flaws will be overlooked and included in a release.

Tracking flaws in the project plan will help identify code elements to be changed as well as the requested change.  Project Documentation and Procedure Order of precedence Founded in experience, DOD, STIG, and Radiance standards.

#### Integrated Master Plan (IMP) and Integration Master Schedule (IMS)
The Department of Defense (DoD), other agencies and DoD contractors use Integrated Master Plans (IMPs) and Integrated Master Schedules (IMSs) to plan and manage projects from inception to completion. Together the IMP and IMS integrate the activities and schedule components necessary to complete a project successfully.  The IMP typically describes three levels of activities: Events, Accomplishments, and Criteria.  The IMS adds a fourth level of detail: Tasks, with detailed timelines and deadlines. Each level consists of activities to fulfill the next level in the hierarchy. Programs complete Tasks to satisfy Criteria, which roll up to satisfy Accomplishments, which roll up to complete an Event. The IMP and IMS are integrated, so changes to the plan are reflected in the schedule.

<a name="acg"/>
#### Application Configuration Guide (ACG) Standards

<a name="coding_standard"/>
#### Coding Standard](#coding_standard)

<a name="code_review_standard"/>
#### Code Review Standard

<a name="configuration_management_standard"/>
#### Configuration Management Standard

<a name="design_document_standard"/>
#### Design Document Standard

<a name="deployment_standard"/>
#### Deployment Standard

<a name="delivery_standard"/>
#### Delivery Standard

<a name="threat_modeling_standard"/>
#### Threat Modeling Standard

<a name="logging_standard"/>
#### Logging Standard

<a name="tracking_system_standard"/>
#### Tracking System Standard

<a name="test_plan_standard"/>
#### Test Plan Standard

<a name="sdlc_standard"/>
#### Software Development Lifecycle (SDLC) Standard

<a name="communication_standard"/>
#### Communication Standard

<a name="references"/>
## References
+ [Integrated Master Plan and Integrated Master Schedule Preparation and Use Guide, May 2023](https://ac.cto.mil/wp-content/uploads/2023/05/IMP-IMS-Guide-2023.pdf)

+ [Application Security Development (ASD) Security Technical Implementation Guide (STIG) version 6, release 3 (APSC-DV-003220)](https://www.cyber.mil/stigs/downloads)

+ [pmi.org - The Value of Project Management](https://www.pmi.org/-/media/pmi/documents/public/pdf/white-papers/value-of-project-management.pdf)
