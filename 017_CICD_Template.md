# CI/CD Template

[TOC]

## CI/CD Standards

*Standard* - [CI/CD Standard](./017_CICD_Standard.md)

## Standard Pathway for Containerized Applications

All applications should embrace containerization if possible.  This is the mandatory process for all new applications capable of being containerized.

The [Container Standard](./020_Container_Standard.md) enumerates the minimal requirements for container creation, scanning, and use.

### Code Management and Pipeline Initiation

**Post Code:** Application Developers shall commit all source code to the designated repository. Adherence to defined branching strategies (see [Configuration Management Standard](./006_ConfigurationManagement_Standard.md)) is required.

**Notify DevSecOps:**

Code commits to the ***main*** branch will be configured to automatically inspire a build of the entire project to include Testing, see [Test Standard](./015_TestPlan_Standard.md) for details regarding how testing will be conducted.

### CI/CD Pipeline Execution (Automation Expected)

**Phase 1:** Once the `.gitlab-ci.yml` is configured, GitLab runners will automatically execute containerization builds upon code commits or merge requests to the ***main*** branch. Developers work with DevSecOps to configure the initial pipeline using GitLab CI/CD capabilities.

**Phase 2:** The following steps are executed automatically by the DevSecOps-managed pipeline managed via GitLab.  The pipeline will:

1. **Code Import:** The pipeline imports the specified code repository from the project repository into the pipeline toolset's internal source code repository.
2. **Static Analysis (SAST):** SonarQube will perform a static analysis of the source code.
4. **Image Build:** A container image is built from the source code using .
3. **Dependency Scan (SCA):** See [SBOMs in the Container Standard](./020_Container_Template.md).
5. **Image Scan:** See [Scanning and Artifacts](./020_Container_Template.md) in the Container Standard.
7. **Dynamic Analysis (DAST):** The image is deployed to a staging environment where OWASP ZAP performs a dynamic analysis scan.  ?NOAH? Are we doing this?
9. **Image Virun Scan:** The container will be virus scanned using [Clam AV](./020_Container_Template.md).
9. **Common Vulnerabilities and Exposure (CVE) Scan:** The container will be CVE scanned using [Grype](./020_Container_Template.md).
9. **Image Signing:** The final container image is cryptographically signed using Cosign.
10. **Deploy to Registry:** The signed, scanned, and attested container image is pushed to the designated container registry (currently GitLab Container Registry).

### Application Deployment

This process is performed by hosting organization designated System Administrators to deploy the final, approved application into the production environment.

**Pull and Verify Image:** System Administrators will initiate the deployment by pulling the specific, versioned container image from the GitLab Container Registry. As a mandatory security control, the deployment mechanism must cryptographically verify the image's signature (using Cosign) against the trusted public key. Deployment of images that are unsigned or fail signature verification is strictly prohibited.

**Execute Deployment:** Once verified, the image is deployed to the production container platform (e.g., Microk8s, Kubernetes, OpenShift) within the DEV or On-Prem environment. Deployments must be executed using version-controlled, declarative configuration files (e.g., Kubernetes YAML, Helm Charts) maintained in a designated Git repository.

#### Scan Results Documentation

**Scan Reports:** Developers must generate and save scan reports in a standardized format (HTML, JSON, or SARIF).

**Report Submission:** Scan reports must be saved as pipeline artifacts and displayed on a GitLab Pages static web page in the project's repository.

**Finding Remediation:** Any Critical or High findings must be remediated before the merge request can be approved. If remediation is not possible, a POA&M must be created and approved by the DevSecOps team.

**Approval Gate:** The DevSecOps team or designated security reviewer must review scan results and provide approval before code can be merged to protected branches.

#### Automated Pipeline Prerequisites

- **Webhook Integration:** Automated triggering of pipelines via GitLab webhooks upon code commits or merge requests.
- **Credential Management:** Secure secrets management solution (e.g., HashiCorp Vault) implemented and integrated.

## Roles and Responsibilities

### Application Developers

- Responsible for writing secure code, committing it to GitLab, and remediating security findings directly related to libraries, code, or logic management.

### DevSecOps Team

- Responsible for maintaining, managing, and securing the CI/CD pipeline and build toolset.
- Importing new projects and assisting developers with the pipeline.

### System Administrators

- Responsible for the underlying infrastructure of the project Environment.
- For containerized applications: Responsible for pulling, verifying, and deploying signed container images to production.
- For non-containerized applications: Responsible for executing Ansible playbooks to deploy and manage the application.

### Project Managers / Stakeholders

- Responsible for reviewing and approving/denying exception requests for non-containerized applications.
- Ensuring projects and teams are compliant with this policy.

## Reference(s):

[Container Standard](./020_Container_Standard.md)

[Container Hardening Guide, Version 1](https://dl.dod.cyber.mil/wp-content/uploads/devsecops/pdf/Final_DevSecOps_Enterprise_Container_Hardening_Guide_1.2.pdf)

[DoW Enterprise DevSecOps Fundamentals, v 2.5, 2024/10](https://dodcio.defense.gov/Portals/0/Documents/Library/DoD%20Enterprise%20DevSecOps%20Fundamentals%20v2.5.pdf)

[NIST Secure Software Development Framework (SSDF), SP 800-218A](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218A.pdf)

[Software Engineering for Continuous Delivery of Warfighting Capability, 2023/  04](https://www.cto.mil/wp-content/uploads/2023/07/SWE-Guide-April2023.pdf)
