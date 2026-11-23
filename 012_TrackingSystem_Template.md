# Tracking System Agile Story Template / Reference Example

**Participants:** Developer "X"

**Title:** MDV 4.\* to 5.\* Upgrade Deployment Plan (1 of 2)
Purpose: Create deployment plan based on documentation provided by MDV Team Lead.  As an integrator for CTG 80.7 I need to plan for and execute an upgrade of MDV 5.\* to the Portal environment.  Validation of requirements, marshaling of materials, and execution of installation are the identified major tasks.  We will pursue a dual execution of “by hand” building of a deployment coupled with an automated method of deployment as this aligns with the Product Owner’s vision current to future operations.  Deployment of MDV 5.\* is considered a must have by the sponsor and will provide enhanced capability to the end-user (Navy ship riders).

**Plan (Tasks):**
1.	Deployment plan will be a documented series of steps that indicate pre-test conditions for deployment, deployment instructions, and post-test conditions when complete. 
2.	Develop an Ansible script to automate version 5 of MDV and share that with the MDV Team Lead thus enabling that team to automate deployments and going forward enforce automated deployments coupled with deployment plans.  This shift in deployment strategy will improve future efforts, streamline integrations, and set the standard the Product Owner expects from the Portal team.
3.	Integration test (IDE DEV) to confirm plan.

**Story Points:** 5   (first time execution of this effort, see Acceptance Criteria, training team members on proper deployment method, formal use of Integration environment).

**Acceptance Criteria:**
1.	Documented, dated, markdown formatted deployment plan using steps identified in MDV 5.\* deployment requirements sufficient to replicate MDV 5.\* deployment to Staging and Operations.
2.	Documented deployment test run in Integration Environment (IDE DEV).
3.	Ansible automated deployment script for MDV 5.0 shared with MDV Technical Lead.
4.	Update of Project Standard for deployment procedures indicating requirement for an Integration Test, Documented Deployment Plan, and expectation for Automation using agnostic tools such as Ansible.

