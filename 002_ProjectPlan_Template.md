# Project Plan Template

[TOC]

## Process Standard

*Standard:* [Project Plan Standard](./002_ProjectPlan_Standard.md)

## 1. Project Overview

*   **Project Goal:** [Clearly state the overarching goal of the project in plain language.]
*   **Objectives:**
    *   [Specific, measurable objective 1]
    *   [Specific, measurable objective 2]
    *   [Add more objectives as needed]
*   **Scope:** [Define what is included and excluded from the project.]

This section should clearly define the project scope of work.

This Project Management Plan (PMP) will describe `organization name` technical approach for `Project Name` in accordance with the `Project Task Order or contract Id`  The PMP will adhere to the quality control requirements as defined within the `Project Task Order or contract Id` and organization policies for systems development and quality control.  Following the approval of this PMP, it will be baselined and subject to `Project Name` formal CM process.

The Project Management Plan is a living document in which revisions can be issued as the project progresses in order to add, modify, or delete provisions which will result in the most effectively managed project.

This PMP describes:

+ The scope and functionality of `Project Name` activities;
+ The implementation objectives of `Project Name` development work;
+ The processes used to ensure the Schedule and Budget are met (on time and within budget), including requirement specifications, system designs, configuration management and quality assurance processes;
+ The tasks to be undertaken;
+ The deliverables to be produced;
+ The known constraints, risks, and assumptions; and
+ The project schedule to support the monitoring of project activities.

Description of the purpose of this document goes here.

The theme of a good project plan is to “say what you do, and do what you say.” This means that, during the relatively calmer moments of the early project planning, you should state your intentions as fully as possible as you work major tradeoffs into a plan. So one major purpose of this plan is to document the rationale for including major project activities (and for excluding others). Then in later stages of the project’s execution, when the heat is on and the temptation to cut corners is great, the plan will help you keep enough discipline to not raise project risk by cutting out activities that you really felt you should do during those calmer planning moments.

Depending upon the scope of the project, you may be creating several other planning documents such as vision statements, quality assurance plans, etc. This plan document should highlight and summarize each of those documents and then explicitly refer the reader to those documents for more detail.

But regardless of project scope, the planning process should get you to think about each one of these project areas in enough depth to be able to state something about each one.

The size of this document is a judgment call on the following trade-off:
Detailed enough to guard against missing activities or not detecting variance during project execution.
Compact enough so that it can be referred to often during the project for guidance without a stifling amount of detail.

Some areas of this document may overlap. This is OK; better to state critical project attributes twice than not at all. Project planning is not an exact science. Some judgment will be necessary in deciding what to include and where to include it in the plan.

This section describes the product scope or vision. The product vision is the “front-end” of the requirements management process for this project. Summarize the product or service that this project is developing. Include the following attributes.

Market need: what customer problem is being solved

Time-to-market constraints
Major features: point out clearly the critical features without which the product or service should not be produced.
Product cost goals and constraints
Project cost goals and constraints


Also, state the relative priority of these attributes. For example, time-to-market may have an order of magnitude greater impact on project profitability than overspending on project cost. Such priority statements will allow trade-offs to be made more easily during the execution of the project.

If your development methodology calls out creating a vision document, then summarize the vision here and include a reference to the vision document.


## 2. Deliverables

*   [Key deliverable 1]
*   [Key deliverable 2]
*   [Add more deliverables as needed]

## 3. Milestones and Timeline

*   **Phase 1: [Phase Name]**
    *   [Milestone 1.1] - Due: [Date]
    *   [Milestone 1.2] - Due: [Date]
*   **Phase 2: [Phase Name]**
    *   [Milestone 2.1] - Due: [Date]
    *   [Milestone 2.2] - Due: [Date]
*   **Project Completion:** [Target Completion Date]

Or utilize a formalized mechanism for tracking more granular task management activities such as a pre-built spreadsheet or tool.

## 4. Tasks and Responsibilities

*   **Task List:**
    *   [ ] Task A - Assigned to: [Person/Team] - Due: [Date]
    *   [ ] Task B - Assigned to: [Person/Team] - Due: [Date]
    *   [ ] Task C - Assigned to: [Person/Team] - Due: [Date]
*   **Team Roles:**
    *   [Role 1]: [Person/Team]
    *   [Role 2]: [Person/Team]

## 5. Resources

*   **Personnel:** [List key personnel or teams involved.]
*   **Tools/Software:** [List any essential tools or software.]
*   **Budget:** [Briefly mention budget considerations or link to a separate budget document.]

## 6. Risk Management

*   **Potential Risks:**
    *   [Risk 1] - Mitigation Strategy: [Strategy]
    *   [Risk 2] - Mitigation Strategy: [Strategy]

## 7. Communication Plan

*   **Meeting Schedule:** [e.g., Weekly stand-ups, Bi-weekly reviews]
*   **Communication Channels:** [e.g., Email, Slack, Project Management Tool]
*   **Reporting Frequency:** [e.g., Monthly progress reports]

## 8. Lifecycle

A defined lifecycle helps to ensure relevance of work being done and continuity of the results of that work.  The intent of the following sections is to provide a general outline in which modifications or additions can be made in order to produce a defined approach.  Full Software Development Lifecycle (SDLC) and Software Maintenance Lifecycle (SMLC) are the two approaches discussed in the following sections.  Delete the lifecycle that does not pertain to your project.

`Project Name` will utilize a development lifecycle model that combines the best features of the classical waterfall methodology and the spiral model.  This model will involve:

+ Determining user requirements
+ Defining a design to satisfy user requirements
+ Building the physical system from the defined design
+ Testing the built components
+ Correcting the components of the new system that can not be qualified
+ Deploying the built system

The waterfall methodology is the overall governing process used by GDIT.  In addition, an iterative approach will be used within the high-level phases and across related phases such as the Requirements and Design Phase, and the System Building and Test Phase.  This methodology takes advantage of the flexibility and “quick reward” of the spiral development model, while protecting against “requirements creep” by benefiting from the formality of the waterfall process.

By employing the spiral model across the Requirements Definition Phase and Design Phase, we allow the user multiple opportunities to identify and refine requirements.  End users began by defining an initial set of requirements.  Each iteration of the design provides users with a visual feedback of improvements made and enhance their visualization of the end product.  This allows the requirements to be refined and eventually base-lined.

Software development efforts vary by size, duration, stability, and complexity.  The following phases encompass the beginning and end limits of any software development project:

+ Requirements Analysis
+ Design
+ Implementation
+ Integration and Test
+ Release Completion Milestone Review
+ Operation and Maintenance

The requirements of each individual project will determine the selection of an appropriate lifecycle model.
This section briefly describes the typical activities for each lifecycle phase:

### Requirements Analysis

This phase establishes the requirements for the software to be built.  Requirements may be developed based on the Statement of Work (SOW) and interviews with the client and/or users.  These requirements form the basis for acceptance of the software.  The requirements, design, code, and associated verification method are entered into a Requirements Traceability Matrix (RTM).  All projects will follow the procedures defined in the PR-ENG-001 Requirements Analysis Procedure document residing on the SESG PAL.

### Design

This phase describes the software system architecture, the major subsystems, processing modes, user input, system output, and component interfaces. The design phase produces the interface and database designs.  Each requirement must be allocated to one or more design components.  This ensures that all requirements are addressed by the design. The design components and the allocation of requirements to design components are added to the RTM.  Once the client has approved the design, the components are baselined. All projects will follow the procedures defined in the PR-ENG-002 Design Procedure document residing on the SESG PAL.

### Implementation and Test

This phase involves the actual source code development, unit testing, and unit integration.  Each unit is tested to ensure compliance with the design and the proper handling of error conditions.  Informal unit test plans (e.g., inputs, expected results), procedures, and results may be generated.  Unit integration involves putting the software units together and ensuring that they work together as intended.  Informal integration plans, procedures, and results may be generated.  Implementation also includes creating databases, populating databases, and creating data files.  As software source objects are completed, they are placed under CM control.  All projects will follow the procedures defined in the PR-ENG-003 Implementation and Unit Test Procedure document residing on the SESG PAL.

### Software Integration and Test

This phase involves putting the pieces of the software components together and testing the software to demonstrate to the client that the requirements have been met.  The general types of testing performed in this stage are integration, system, regression, performance, and acceptance testing.  Planning for testing may take place after the requirements have been baselined.  The client may request test plans, cases, procedures, and reports as deliverables.  Testing is performed on a computer that duplicates the production environment.  A dry run of the procedures is performed to verify the software and test procedures are ready for formal test.  Test cases are traced to the requirements in the RTM to ensure that all requirements have been verified.  Persons who were not responsible for the design or implementation of the component can perform testing.  The code is placed under formal CM control prior to testing to ensure that no modifications are incorporated into the software product while it is tested.  All projects will follow the procedures defined in the PR-ENG-004 Software Integration and Test Procedure document residing on the SESG PAL.

### Release Completion Milestone Review

All projects will follow the procedures defined in the PR-ENG-005 Release Completion Milestone Review Procedure document residing on the SESG PAL.  The Release Completion Milestone Review is conducted at the end of the release development cycle and used to review the activities performed during the development cycle and collect measures.  The review of activities performed focuses on positive and negative lessons learned for both project assets and organizational assets, and submission of Process Improvement Requests.  Measurements for the activities performed and products produced during the release are collected, analyzed, presented, and discussed during the Release Completion Milestone Review.

### Operation and Maintenance

Maintenance is the last stage of the software lifecycle and is considered a mini-software development task with the full-scale software development effort scaled accordingly.  This lifecycle is referred to as the Software Maintenance Lifecycle (SMLC). After the product has been released, the maintenance phase keeps the software up-to-date with environment changes, user requirements changes, installation of software & hardware, transitioning, training, and overall operational support.  These activities involve associated planning and execution tasks and their associated deliverables.

Projects that are in the maintenance phase should adhere to the SMLC.  All changes to the system can be characterized by these four types of maintenance consisting of:

+ Corrective maintenance fixing bugs in the code.
+ Adaptive maintenance adapting the software to new environments.
+ Perfective maintenance updating the software according to changes in user requirements.
+ Preventive maintenance updating documentation and making the software more maintainable.

### Analysis

Analysis consists of impact analysis, cost benefit analysis, and isolation.  Impact analysis and cost benefit analysis includes analyzing different implementation alternatives and comparing their effect on schedule, cost, and operation.  Isolation refers to the time spent trying to understand the problem or the proposed enhancements to the system.

### Design

Design consists of redesigning the system based on the understanding of the necessary changes. It also entails semiformal documentation, like release review documents.

### Implementation and Testing

Implementation entails code and unit testing.  Code and unit testing includes time spent coding and testing the changes.  It also consists of semiformal documentation, like the software modification test plan.  Unit testing is performed by the person(s) who has made the changes.  Unit testing is usually performed locally on the user’s workstation.

### Software Integration and Testing

Testing consists of integration, acceptance and regression testing.

Integration testing refers to the time spent on the integration of the components.  Acceptance testing entails verifying that the changed system adheres to user requirements.

Acceptance testing is performed by the end users to ensure that the desired changes have been implemented successfully.

Regression testing refers to the time spent ensuring that the changes did not affect the functionality of the other parts of the software.

### Release Completion Milestone Review

### Documentation

Documentation consists of system, user, and other documentation.

System documentation refers to the time spent writing or revising the system description document

User documentation entails writing or revising the user’s guide and other formal documentation, excluding system documentation

Documentation is very important since the future changes will rely on the documentation of the previous changes/modifications.

## 9. REQUIREMENTS MANAGEMENT TOOLS, ENVIRONMENT, AND INFRASTRUCTURE

This section describes the computing environment and software tools that will be used in fulfilling the Requirements Management functions throughout the project or product lifecycle.  At a minimum the tools used and the infrastructure developed must facilitate effective configuration management of requirements.  Include the tools and procedures used to version control requirements items generated throughout the project or product lifecycle.

### REQUIREMENTS DOCUMENTATION

This section describes the requirements documentation that will be used for the project.  Also, it defines how the requirements are to be named, marked, and numbered.  At a minimum, projects are required to have the following requirements documentation:

### System Requirements Specification (SRS)/Functional Requirements Document (FRD)

This document fully describes the external behavior of the identified application or subsystem.  Additionally, it describes non-functional requirements, design constraints, and other factors necessary to provide a complete and comprehensive description of the software requirements.

### Requirements Traceability Matrix

The Requirement Traceability Matrix (RTM) is the primary mechanism to trace the decomposition, allocation, and achievement of requirements throughout the system or application’s lifecycle.  The RTM is a mapping of requirements:  to each other; design elements; test plans, procedures, or steps; and acceptance criteria.  Initially, the system requirements are mapped to architectural elements.  Then, the software requirements are mapped to successively smaller design elements as the software design becomes more detailed.  Acceptance criteria, test methods, and test plan paragraphs or procedures are also mapped to the requirements.  The RTM should be reviewed and updated whenever any of these items change over the life of the software system.

This tracing makes identifying and assessing requirements change impacts easier, reducing risk, and helping ensure product conformance and acceptability.  It is important that the traceability be bi-directional.  The RTM template is available on the SESG PAL. It may be stored in an access database or in a excel spreadsheet. The output must adhere to the SESG template.

### QUALITY ASSURANCE

Process and Product Quality Assurance (PPQA) processes will support the delivery of high-quality products and services by providing the stakeholders with visibility into and feedback on the work products and process adherence.  GDIT recognizes that PPQA policies should be structured to meet the requirements and levels of complexity of each task.  This approach allows GDIT to ensure responsiveness, technical accuracy, and on-time performance.  All feedback will be based on objective evaluations; an auditor external to the project will be performing the process and products evaluations. Non-compliance issues will be communicated and tracked to resolution.

GDIT will develop a customized supplemental, stand-alone QAA plan for `Project Name`.  Under this plan, Quality Assurance (QA) personnel will examine key deliverable software, as well as other deliverables and documentation.

This section describes what project activities are planned to ensure compliance with your organization’s quality plan. These activities include component qualification, MTBF prediction procedures, environmental and safety testing, etc. If you are developing products under ISO 9000/9001 or CE mark certification, you should state the principal activities and documents you need to create, such as a Technical File.

If the Product Quality Assurance Plan or any of its components is extensive, then put it in a separate document and refer to it here with a short summary.

You may want to break out major product quality assurance activities into more detail. Examples are software quality assurance planning and safety/compliance planning.

#### SOFTWARE QUALITY ASSURANCE PLAN OUTLINE

Describe here the principal activities of software quality assurance that will be done during the project to ensure adequate fitness for use of the software. Principal elements of a SQAP include the following:

## 10. Risk Management

Explain how Risk Management will be handled for your specific project utilizing the Project Planning Procedures, the Risk Management Procedures and the risks, issues, and action (RIA) tool that are located on the SESG PAL.

A risk is something that may happen in the future and if it does, will have an adverse impact on the project. "That may happen" implies a probability of less then 100%. If it has a probability of 100% - in other words it will happen - it is an issue. A risk must also have a probability something above 0%. It must be a chance to happen or it is not a risk. Risks are the potential of undesirable events that could negatively impact project execution.  The goal of risk management is to prevent risks from becoming issues, by identifying them prior to occurrence, and as appropriate, mitigating their impacts by preventative or remedial action.

The second thing to consider from the definition is "will have an adverse impact". If it will not have an adverse impact, it is not a risk.

Once risks are identified, project managers should include steps to prevent or mitigate them.  Decisions about how to address individual risks will depend on the nature and probable severity of the risk in relation to the achievement of project objectives.

An issue is defined as a situation, problem, or an activity that has happened or is happening which impacts the approved Project Plan.  A project issue is a concern or request raised by any stakeholder that needs to be addressed, either immediately or during the project.  Project issues need to be reviewed during the project as they could become a serious threat to the project and therefore a mitigating strategy needs to be prepared.
Issues are reviewed at the project’s weekly status meeting and tracked on the RIA tool to closure.  High priority issues are reported to the customer as appropriate and to senior management and addressed at the monthly status meeting.  `Project Name` follows the SESG Project Planning procedure for managing issues.

Risks are addressed at the weekly project meeting using the Risk Issues Action (RIA) tool and reported monthly at the Sr. Management meeting.  High priority risks are reported to the customer as appropriate and to Sr. Management and addressed at the monthly status meeting.  `Project Name` follows the SESG Risk Management procedure for managing risks.

## 11.  PROJECT MONITORING

Tailor the following text to be specific for your project in accordance with the MSM at a minimum.

It is required that a monthly cost, schedule, and status report be produced and that a monthly status meeting be held with the project management team in attendance.

Project Monitoring is one of the key elements in ensuring that the project budget and schedule will be maintained to the maximum extent possible and that the project will be completed with the highest degree of quality.  All project cost, schedule, quality, and other status reporting shall be done in the most accurate and upfront manner, and on a timely basis.  The need to continuously and accurately report cost increases; schedule changes; deficient quality items; and the causes, impacts, and proposed measures to mitigate these issues is paramount to effectively managing and administering the project.

### CONTINUOUSLY MONITOR PROJECT VARIABLES

The Project Manager monitors the following items periodically to ensure that their progress/status is in accordance with their associated plans:

+ Project Management Plan
+ Configuration Management Plan
+ Quality Assurance Plan
+ Risks
+ Project Metrics
+ Project Data
+ Stakeholder Involvement
+ Stakeholder Commitments

The Project Manager analyzes the current state of project variables to determine if there are significant deviations from the documented plans or product acceptance agreements.  The Project Manager will compare actual project results against planned estimates to identify issues.

### CONDUCT PROJECT MEETINGS

Tailor the following text to be specific for your project with the understanding that the PM is required to conduct three types of meetings:

#### Internal Project Team Meetings

The Project Manager will hold regular scheduled internal project meetings to communicate status to the project team, and to plan for upcoming project tasks defined in the documented project plan.  The meetings serve as a means of exchanging status information on individual team tasks, addressing actions items, issues, and project risks.  The Project Manager ensures follow-up information is communicated and Action Items are managed to closure utilizing the RIA tool.  Plans for the next scheduled tasks are clarified and Action Items established.  The meetings are conducted as a minimum once a month to ensure currency.

#### Internal Sr. Management Meetings

On a regularly scheduled basis determined by the Project Plan, but at least once a month, the Project Manger will meet with Sr. Management to discuss the project costs, schedules, quality issues, compliance with project requirements, and other status items to ensure that the project status, progress, and milestones are being met.

#### Client/Customer Meetings

The Project Manager will hold a Client/customer meetings at least once a month to discuss project status, project action items, issues, and risks.  All meetings are planned events and the initiator of each event must define the content, identify participants, and establish tasks/assignments for the conduct of the review.  The Project Manager ensures follow-up information is communicated and Action Items are managed to closure utilizing the RIA tool.

Significant issues occurring between status meetings will be communicated immediately without waiting for the next regularly scheduled meeting, with any highly significant or sensitive issues elevated immediately to Sr. Management.

### REVISE COURSE OF ACTION

The Project Manager, having determined the need for corrective action, participates with the project team leaders in revising Project Plans, Processes, and Procedures.  Project Plan changes may address, but are not limited to:  schedule, resource allocation, product/project requirements, process improvements, testing, and team training.  The Project Manager reviews the changes with all affected stakeholders and negotiates approval of any changes with Sr. Management and the sponsor.

The Project Manager ensures that approved changes are incorporated into Project Plans, Processes, and Procedures, and that the revised documents are placed under CM.  Some examples of reasons to revise or re-plan the project’s course of action include: significant deviations in the project planning parameters from project estimates; stakeholder commitments that have not been satisfied or stakeholder involvement issues; significant changes in risk status; issues discovered through verification and validation activities; etc.

### INITIATE AND TRACK ACTIONS TO CLOSURE
The Project Manager directs that the revised plans, processes, and procedures are instituted and will serve as the basis for all future project activities.  The new project planning variables are subject to continuous monitoring and analysis.  Lessons Learned from the impact of the corrective actions are documented for future planning efforts.  Product acceptance issues are addressed to ensure that any non-conformance items (i.e., quality, functional requirements, etc.) have been corrected.

### CONDUCT MILESTONE REVIEWS
Milestone Reviews are scheduled with relevant stakeholders at integral points of the project.  The following steps should be followed to plan/conduct the Milestone Reviews:

1.	Schedule review with relevant stakeholders (include agenda)
2.	Distribute work products created for milestone, to be reviewed by participants
3.	Conduct review meeting with following agenda items:
    + Review completion of milestone related work products
    + Review commitments, status and risks of project
    + Review re-planned schedule for project completion (if necessary)
    + Identify and document significant issues and their impacts
    + Reach consensus on Yes/No decision to move forward to next project phase
    + Document results of the review, action items, and decisions
4.	Track Action Items to closure

## 12. Approval and Sign-off

*   **Approved by:** [Name/Role] - Date: [Date]

## Appendix A: Glossary and Key Terms

| Term or Acronym | Definition or Description |
|-----------------|---------------------------|
|Sample           | Sample definition.        |

## Appendix B: References

| Name of Reference | URL or location of Reference |
|-----------------|---------------------------|
|Reference 001    | http://someurl.com |
