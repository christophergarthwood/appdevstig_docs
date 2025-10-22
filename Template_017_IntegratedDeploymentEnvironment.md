# Title: Integrated Deployment Environment (IDE) Standard

## Definition:

An integrated deployment environment is a unified setup for software development and deployment that improves the process of moving code from development to a production environment. The  environment replicates the Staging / Operations environments to ensure deployment of any solution has a reasonable chance of success when engaging the Staging environment.  This is the first stop for the migration of code from a developer's local environment prior to Staging release.  

## Policy

### 1.0 Purpose:

This policy governs the activities of all application developers creating, deploying, or maintaining applications within the CTG 80.7 environment, hosted on the AWS Cloud (hereinafter referred to as "COSMOS"). The purpose of this policy is to ensure the security, stability, and operational integrity of the COSMOS environment by strictly controlling access to AWS services and resources. 

To facilitate a smooth transition for development teams, the COSMOS environment has been configured to closely mirror the architecture and operational patterns of the on-premise environment. 

By using an Integrated Deployment Environment (IDE) the teams ensure:

+ Consistent deployments: The application can run reliably in development, testing, and production environments by simply adjusting configuration files rather than altering code.

+ Security and compliance: Sensitive data such as credentials and access keys on the Staging / Operation environment have no chance of spillage.

+ Rapid updates and scaling: Configuration changes can be made quickly, even in real-time, to accommodate updates, incident response, or scaling demands—without downtime or code changes.

+ Simplified maintenance: Structured, centralized documentation reduces complexity in multi-environment scenarios and facilitates troubleshooting, onboarding, and knowledge transfer.

+ Requirements/Specifications/Guidelines: The IDE must exist and be respected by ensuring all team members utilizing this environment understand the rules of engagement.

+ Measurable and Actionable: Every deployment to the Staging / Operational environment must be proceeded by a deployment to the IDE.  Approval to move to the Staging environment requires proof of deployment to the IDE.

### 2.0 Scope 

This policy applies to all company personnel, contractors, and third-party developers (collectively, "Developers") who require access to the CTG 80.7 COSMOS environment for application development and deployment activities. This policy covers all actions taken by Developers within the AWS Management Console, via the AWS Command Line Interface (CLI), or through any SDK or API interacting with the COSMOS AWS account. 


### 3.0 Policy Statement 

While the current configuration of the COSMOS environment grants developers broad permissions for operational flexibility, all personnel are mandated to operate under a self-governed Principle of Least Privilege . 

This means that although you may have the technical ability to access or modify various AWS services, you are required by this policy to limit your actions strictly to the resources necessary for your assigned application development tasks. 

Developers must operate as if their permissions are limited only to the activities outlined in Section 5.0 (Permitted Activities). Any action taken outside the scope of your direct responsibilities, even if technically possible, is a violation of this policy and may impact the stability and security of the shared environment. The goal is to move towards a more restrictive, technically enforced model in the future, and adherence to this principle is critical. 

### 4.0 Access to the COSMOS Environment 

All personnel requiring new or modified access to the CTG 80.7 COSMOS environment must submit a formal request. 

To request access, please send an email to nicholas.m.hallal.civ@us.navy.mil with the following information: 

Full Name 

Application Name / Project 

Justification for Access 

### 5.0 Permitted Activities 

Developers are permitted to perform the following actions only on their assigned EC2 instance(s) : 

+ Access: Securely connect to the instance via approved methods (e.g.AWS Systems Manager Session Manager). 

+ Application Deployment: Deploy, update, and manage their application code, binaries, and related artifacts. 

+ Dependency Management: Install and configure application runtimes, libraries, and other software dependencies required for the application to function. 

+ Service Management: Start, stop, and restart application-specific services or processes running within the instance's operating system. 

+ Log and Performance Monitoring: Access application-level logs and use operating system tools to monitor the performance of their application. 

### 6.0 Prohibited Activities 

To maintain the security and stability of the shared COSMOS environment, the following activities are strictly prohibited. Even though your account permissions may allow these actions, performing them is a direct violation of this policy. 

No Unapproved Access to Other AWS Services: Creating, configuring, modifying, or deleting any other AWS resources without following the formal Exception Request Process. This includes, but is not limited to: 

+ Identity and Access Management (IAM) Users, Roles, or Policies 

+ Simple Storage Service (S3) Buckets 

+ Relational Database Service (RDS) Instances 

+ Lambda Functions, VPCs, Security Groups, Elastic Load Balancers, etc. 

+ No Unapproved AWS Infrastructure-Level Changes to EC2 Instances: Modifying the underlying AWS configuration of an instance from the AWS console/CLI is prohibited. This refers to the instance's infrastructure, not OS-level modifications made inside the instance (which are covered in Section 5.0 and 7.0). Prohibited infrastructure-level changes include: 

+ Changing the instance type (e.g., from t3.micro to m5.large). 

+ Attaching, detaching, or modifying EBS volumes or network interfaces. 

+ Terminating any instance. This action is strictly forbidden. 

+ No Non-Standard Software Installation: To maintain critical parity with the on-premise environment, all software installed in COSMOS must be a version/application that is approved for and accessible in the on-prem environment. While your permissions may allow you to download and install other software, doing so is a policy violation. This rule ensures application compatibility and simplifies security management across all environments. 

+ Stopping, Starting, or Rebooting a shared EC2 instance that hosts multiple applications. 

***Exception:*** These actions (stop, start, reboot) are permissible only on a dedicated EC2 instance that runs no other team's applications. It is the developer's responsibility to verify the instance's status as non-shared before taking action. 

All requests for infrastructure changes (e.g., firewall rules, new databases, load balancers) must be submitted as a service request to the Cloud Operations team as per Section 8.0. 

### 7.0 Shared EC2 Instance Protocol 

It is common for multiple applications to be co-hosted on a single EC2 instance within the CTG 80.7 environment. This shared tenancy requires strict coordination to prevent service disruptions. 

+ Notification Requirement: Before performing any action that could impact the instance's operating system, shared libraries, or overall performance (e.g., installing a new system-wide dependency, restarting a core service, or performing a resource-intensive task), the Developer must provide advance notification. 

+ Communication Channel: Notifications must be posted in the designated communication channel (e.g., a specific Slack/Teams channel, JIRA board, or email distribution list) at least [e.g., 4 business hours] in advance. 

+ Notification Content, the notification must include: 

  + The EC2 Instance ID and Name. 

  + The application(s) you are working on. 

  + A clear description of the planned change. 

  + The scheduled date and time of the change. 

  + The estimated duration and potential impact. 

+ Conflict Resolution: If another team identifies a conflict with the proposed change, it is the responsibility of the involved parties to coordinate and find a mutually agreeable time. The Cloud Operations team can be engaged to mediate if a resolution cannot be reached. 

### 8.0 Exception Request Process 

If an application has a legitimate technical requirement for an AWS service other than EC2 (e.g., an S3 bucket for file storage or an RDS database), access will not be granted directly to the Developer. 

Instead, the Developer must submit a formal "Infrastructure Request" ticket to the Cloud Operations team. The request must include: 

+ A ticket reference in the project's tracking stem.

+ A detailed business and technical justification for the resource. 

+ The specific configuration required (e.g., S3 bucket name, RDS instance size). 

+ An access pattern description (how the application will connect to the resource). 

The Cloud Operations team will review the request. If approved, the team will provision the resource and provide the application with the necessary credentials and connection details (e.g., database endpoint, IAM Role for EC2). 
 

### 9.0 Enforcement and Compliance 

+ Monitoring: All actions within the COSMOS AWS account are logged and monitored via AWS CloudTrail and other security tools. This logging provides full visibility into all actions taken by all users. 

+ Audits: The Cloud Operations team will conduct periodic audits of CloudTrail logs to ensure all actions align with project requirements and adhere to this policy. 

+ Violations: Unauthorized activity or failure to comply with the self-governed Principle of Least Privilege outlined in this policy will be treated as a security incident. Non-compliance may result in immediate revocation of access, and further disciplinary action in accordance with company policy. 

## Timeliness:

Appropriate with each release.

## Reference:

Internal policy.

 

