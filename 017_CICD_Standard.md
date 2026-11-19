# CI/CD Standard

[TOC]

## Template / References

*Template* - [CI/CD Template](./018_CICD_Template.md)

## Definition:

CI/CD is a way to automate getting software changes from a developer’s computer to users.

 - **CI = Continuous Integration:** Developers regularly add small code changes to a shared project. Each change is automatically built and tested, so problems are caught early.
 - **CD = Continuous Delivery or Continuous Deployment:** Once the code passes tests, the system automatically prepares it for release.
- **Project Environment:** The authorized computing environment for the development of this project.
- **DEV:** The designated environment for hosting approved applications on the NIPRNet only.
- **CI/CD Pipeline:** Continuous Integration/Continuous Deployment. An automated process for building, testing, and deploying applications.
- **OSA Toolset:** The approved Orchestration and Security Automation toolset used for the CI/CD pipeline, including Tekton, GitLab, JFrog Artifactory/Xray, etc.
- **SAST (Static Application Security Testing):** Analysis of application source code for security vulnerabilities. Tools: Blackduck, Coverity.
- **SCA (Software Composition Analysis):** Analysis of third-party and open-source dependencies for known vulnerabilities and license compliance. Tools: JFrog Xray, Black Duck Binary Analysis (BDBA).
- **DAST (Dynamic Application Security Testing):** Analysis of a running application for security vulnerabilities. Tool: OWASP ZAP.
- **SBOM (Software Bill of Materials):** A formal, machine-readable inventory of software components and dependencies used in building an application.
- **Attestation:** A cryptographically signed metadata record confirming that a specific step in the pipeline (e.g., build, test) was executed as defined.
- **Image Signing:** The process of cryptographically signing a container image to ensure its integrity and prove its origin.

Continuous delivery means it is ready to release, but a person may still click “deploy.”

Continuous deployment means every approved change is released to users automatically.

** Simple example **

Think of a factory assembly line:

1. A developer submits a change, such as a “Reset Password” button.
2. CI checks that the app still builds and tests pass.
3. CD packages the approved change and sends it to a test environment or live website.
4. The goal is to release updates faster and with fewer avoidable mistakes.

## Purpose:

This standard establishes the procedures for the development, security scanning, and deployment of all new applications within the project Environment. The primary scope of this document is for applications intended for the NIPRNet (Non-classified Internet Protocol Router Network).

The objective is to ensure a secure, compliant, and efficient software development lifecycle (SDLC) by mandating the use of an approved CI/CD pipeline and deployment methodology.

**Note:** While this standard is currently enacted for the NIPRNet environment, the principles and procedures outlined herein are intended to serve as the foundational model for future deployments to other classification levels. It is acknowledged that at the current time, a dedicated "Alpha" or development cloud environment for non-NIPR environments does not yet exist for testing. It is anticipated that the core CI/CD toolset and processes will be similar when those environments are established.

## Measurable and Actionable:

Evidence of executed workloads related to required tasks in the Template must be available for inspection.  Every commit to the project should be eligible for inspection.

## Timeliness:

Minimally, a nightly build should occur, however as changes are made the measured work performed per task within the CI/CD pipeline should be created.

## 4.0 Policy Statements

1. All new applications developed for the project Environment must be designed for containerization and deployed via the approved CI/CD pipeline (Section 5.0).
2. Applications that cannot be containerized require a formal exception (Section 6.0) before any development or deployment activities may commence.
3. All security scan findings must be remediated or have a formally documented and approved Plan of Action & Milestones (POA&M) before the application can be promoted to the next stage in the pipeline.
4. All container images deployed to the project Environment must be signed, and their signatures must be verified upon deployment.
5. All containerized applications must use approved Iron Bank base images from registry1.dso.mil. Exception requests for alternative base images must be submitted to project Stakeholders for formal approval when Iron Bank images are not available or technically feasible.

---

## 5.0 Procedure: Standard Pathway for Containerized Applications

This is the mandatory process for all new applications capable of being containerized.

### 5.1 Code Management and Pipeline Initiation

**Post Code:** Application Developers shall commit all source code to the designated DISA GitLab repository (web.git.mil). Adherence to defined branching strategies (e.g., GitFlow) is required.

**Notify DevSecOps:**

Phase 1: Following a merge to the main or release branch, developers shall notify the DevSecOps team to provide support in configuring the CI/CD pipeline.

Phase 2: Upon completion of the merge, the DevSecOps team will import the repository into the OSA toolset. (This process is planned for automation via webhooks in future pipeline iterations.)

### 5.2 CI/CD Pipeline Execution (Automated)

**Phase 1:** Once the `.gitlab-ci.yml` is configured, GitLab runners will automatically execute containerization builds upon code commits or merge requests. Developers work with DevSecOps to configure the initial pipeline using GitLab CI/CD capabilities.

**Phase 2:** The following steps are executed automatically by the DevSecOps-managed Tekton pipeline:

1. **Code Import:** The Tekton pipeline imports the specified code repository from web.git.mil into the OSA toolset's internal source code repository (currently Bitbucket, with a planned future migration to GitLab).
2. **Static Analysis (SAST):** Blackduck and/or Coverity perform a static analysis of the source code.
3. **Dependency Scan (SCA):** JFrog Xray and/or Black Duck Binary Analysis (BDBA) perform a scan of all application dependencies.
4. **Image Build:** A container image is built from the source code using Buildah.
5. **Image Scan:** JFrog Xray and/or BDBA perform a comprehensive vulnerability scan of the newly built container image.
6. **SBOM Generation:** An SBOM is generated using JFrog Xray and/or Trivy.
7. **Dynamic Analysis (DAST):** The image is deployed to a staging environment where OWASP ZAP performs a dynamic analysis scan.
8. **Pipeline Attestation:** Tekton Chains generates and signs attestations for each completed step.
9. **Image Signing:** The final container image is cryptographically signed using Tekton Chains and Cosign.
10. **Deploy to Registry:** The signed, scanned, and attested container image is pushed to the designated container registry (currently GitLab Container Registry).

### 5.3 Application Deployment

This process is performed by System Administrators to deploy the final, approved application into the production environment.

**Pull and Verify Image:** System Administrators will initiate the deployment by pulling the specific, versioned container image from the GitLab Container Registry. As a mandatory security control, the deployment mechanism must cryptographically verify the image's signature (using Cosign) against the trusted public key. Deployment of images that are unsigned or fail signature verification is strictly prohibited.

**Execute Deployment:** Once verified, the image is deployed to the production container platform (e.g., Kubernetes, OpenShift) within the DEV or On-Prem environment. Deployments must be executed using version-controlled, declarative configuration files (e.g., Kubernetes YAML, Helm Charts) maintained in a designated Git repository.

---

## 6.0 Procedure: Exception Pathway for Non-Containerized Applications

This pathway is reserved for applications with a compelling business or technical justification that prevents containerization. Approval is not guaranteed.

**Submit Exception Request:** The Application Owner or Project Manager must submit a formal request via email to the designated Project Manager and Stakeholders. The request must include:

- Requester Name & Application Name
- **Detailed Business Justification:** A thorough explanation of why the application cannot be containerized
- **Comprehensive Installation Plan:** A step-by-step deployment plan designed to be automated using Ansible

**Approval:** The request will be reviewed by the governance board/stakeholders. If approved, the project may proceed.

**Approved Development & Deployment Process:**

1. **Code Repository:** All application source code and associated Ansible playbooks must be posted and maintained in the designated DISA GitLab repository (web.git.mil).
2. **Code Review:** Application Developers are required to perform and document a thorough peer review of the codeset.
3. **Deployment:** System Administrators will utilize the approved Ansible playbooks from the GitLab repository to deploy and configure the application. No manual deployments are permitted.

---

## 6.5 Implementation Phases

This policy will be implemented in two phases to balance immediate security needs with the ultimate goal of full automation.

### 6.5.1 Short-Term Implementation (Phase 1)

During the short-term phase, the focus is on establishing foundational security practices and version control discipline while the full CI/CD pipeline infrastructure is being developed.

#### Code Management

**Post Code:** Application Developers shall commit all source code to the designated DISA GitLab repository (web.git.mil). Adherence to defined branching strategies (e.g., GitFlow) is required.
**Version Control:** All code changes must be tracked through GitLab with meaningful commit messages. Pull requests (merge requests) are required for all changes to main/release branches.
**Code Review:** All code changes must undergo peer review before merging. Reviews must be documented in GitLab merge requests with approval from at least one qualified reviewer.

#### Security Scanning (Local Execution)

Developers are responsible for running security scans locally on their development workstations or in their local environments before committing code.

**Required Scans:**

- **Static Analysis (SAST):** Developers must run approved SAST tools (e.g., SonarQube, Semgrep, or language-specific linters) against their code.
- **Dependency Scan (SCA):** Developers must scan dependencies for known vulnerabilities using tools such as OWASP Dependency-Check, npm audit, pip-audit, or Maven dependency-check plugin.
- **Container Image Scan:** For containerized applications, developers must scan built images using Trivy, Grype, or similar tools before pushing to any registry.

#### Scan Results Documentation

**Scan Reports:** Developers must generate and save scan reports in a standardized format (HTML, JSON, or SARIF).

**Report Submission:** Scan reports must be attached to the corresponding GitLab merge request or stored in a designated repository location (e.g., `docs/security-scans/` directory within the project).

**Finding Remediation:** Any Critical or High findings must be remediated before the merge request can be approved. If remediation is not possible, a POA&M must be created and approved by the DevSecOps team.

**Approval Gate:** The DevSecOps team or designated security reviewer must review scan results and provide approval before code can be merged to protected branches.

#### Container Image Management

**Base Images:** Developers must use approved Iron Bank base images from registry1.dso.mil. A list of approved images is maintained by the DevSecOps team.
**Image Building:** Container images should be built locally or in a controlled build environment following the Dockerfile best practices.
**Image Storage:** Built images may be pushed to the GitLab Container Registry but must include scan results and evidence of security review.

#### Deployment Process

**Manual Deployment:** During Phase 1, deployments may be performed manually by System Administrators following documented procedures.
**Deployment Documentation:** All deployments must be documented including the image/artifact version, deployment date, approver, and any configuration changes.
**Change Management:** All production deployments must follow the established change management process with appropriate approvals.

### 6.5.2 Long-Term Implementation (Phase 2)

The long-term implementation phase represents the full realization of the automated CI/CD pipeline as described in Section 5.0. This phase will be initiated once the OSA Toolset infrastructure is fully operational.

#### Automated Pipeline Prerequisites

- **Infrastructure Readiness:** Complete deployment of Tekton, JFrog Artifactory/Xray, and all required security scanning tools in the OSA environment.
- **Webhook Integration:** Automated triggering of pipelines via GitLab webhooks upon code commits or merge requests.
- **Credential Management:** Secure secrets management solution (e.g., HashiCorp Vault) implemented and integrated.

#### Transition Criteria

The transition from Phase 1 (short-term) to Phase 2 (long-term) will occur when the following criteria are met:

- **OSA Toolset Operational:** All CI/CD pipeline components are deployed, tested, and validated.
- **Pilot Program Successful:** At least three pilot applications have been successfully deployed through the automated pipeline.
- **Documentation Complete:** Comprehensive developer documentation, runbooks, and training materials are available.
- **Support Structure Established:** DevSecOps team is trained and a support process is in place for pipeline issues.
- **Security Validation:** The automated pipeline has passed security assessment and received authorization to operate (ATO).

#### Transition Process

**Phased Migration:** Applications will be migrated from Phase 1 to Phase 2 in a controlled manner, starting with pilot applications and gradually expanding to all projects.
**Dual Operation:** During the transition period, both Phase 1 and Phase 2 processes may operate in parallel to ensure continuity.
**Mandatory Deadline:** All applications must transition to the automated pipeline (Phase 2) according to the timeline established by Stakeholders at the time of the Phase 2 announcement.

#### Phase 2 Standard Pathway

Once Phase 2 is fully implemented, the procedures described in Section 5.0 (Standard Pathway for Containerized Applications) become mandatory. The local scanning requirements of Phase 1 may be reduced or eliminated as the automated pipeline provides comprehensive security coverage.

### 6.5.3 Ongoing Requirements (All Phases)

Regardless of the implementation phase, the following requirements remain constant:

1. All security scan findings classified as Critical or High must be remediated or have a formally documented and approved POA&M.

2. All code must be stored in the designated DISA GitLab repository (web.git.mil).

3. All deployments must use approved base images from Iron Bank. In the event an Iron Bank base image cannot be utilized due to technical limitations or availability, an Exception Request must be submitted to the Stakeholders for formal approval. The Exception Request must include:
   - Detailed justification for why an Iron Bank image cannot be used
   - The proposed alternative base image source and security posture
   - Additional security controls to mitigate risks
   - A timeline for transitioning to an Iron Bank image if one becomes available

4. All production deployments require proper approval and change management.

5. Regular security audits will be conducted to ensure compliance with this policy.

---

## 7.0 Roles and Responsibilities

### Application Developers

- Responsible for writing secure code, committing it to GitLab, and remediating security findings.
- For non-containerized applications, performing and documenting code reviews.

### DevSecOps Team

- Responsible for maintaining, managing, and securing the CI/CD pipeline and OSA toolset.
- Importing new projects and assisting developers with the pipeline.

### System Administrators

- Responsible for the underlying infrastructure of the project Environment.
- For containerized applications: Responsible for pulling, verifying, and deploying signed container images to production.
- For non-containerized applications: Responsible for executing Ansible playbooks to deploy and manage the application.

### Project Managers / Stakeholders

- Responsible for reviewing and approving/denying exception requests for non-containerized applications.
- Ensuring projects and teams are compliant with this policy.

---

## 8.0 Compliance and Enforcement

Compliance with this policy is mandatory.

Applications found to be out of compliance may be removed from the project Environment.

Regular audits of the CI/CD pipeline, container registry, and deployed applications will be conducted to ensure adherence to this policy.

## Reference(s):

[Container Standard](./020_Container_Standard.md)

[Container Hardening Guide, Version 1](https://dl.dod.cyber.mil/wp-content/uploads/devsecops/pdf/Final_DevSecOps_Enterprise_Container_Hardening_Guide_1.2.pdf)

[DoW Enterprise DevSecOps Fundamentals, v 2.5, 2024/10](https://dodcio.defense.gov/Portals/0/Documents/Library/DoD%20Enterprise%20DevSecOps%20Fundamentals%20v2.5.pdf)

[NIST Secure Software Development Framework (SSDF), SP 800-218A](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218A.pdf)

[Software Engineering for Continuous Delivery of Warfighting Capability, 2023/  04](https://www.cto.mil/wp-content/uploads/2023/07/SWE-Guide-April2023.pdf)
