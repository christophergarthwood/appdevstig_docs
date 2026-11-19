# Threat Assessment (AppDev STIG v6r5, APSC-DV-003230) Template

[TOC]

## Threat Assesment Standard

*Standard:* [Threat Modeling /  Assessment Standard](./010_ThreatAssessment_Standard.md)

## Threat Assessment (AppDev STIG v6r5, APSC-DV-003230) 

## Name of the Project

### Sponsor Name, Department, Email

### Assessment performed by

### Date ISO 8601

#### Authentication

*Describe how authentication works within the system and confirm it functions as expected. Use multiple accounts.*

#### Authorization

*Describe how authorization works within the system and confirm it functions as expected. Use multiple accounts.*

#### Unique Security Requirements

*Indicate if any unique security requirements exist.*

#### Verify that the following considerations are documented:

+ All external interfaces.
  ***Example: Document location.***

+ The nature of information being exchanged
  ***Example: Document location.***

+ Any protection on the external interface
  ***Example: Document location.***

+ User roles required for access control and the access privileges assigned to each role
  ***Example: Document location.***

+ Unique security requirements (e.g., encryption of key data elements at rest)
  ***Example: Document location.***

+ Categories of sensitive information processed by the application and their specific protection plans (e.g., PII, HIPAA).
  ***Example: Document location.***

+ Restoration priority of subsystems, processes, or information
  ***Example: Document location.***

+ Verify the organization includes documentation describing the design and implementation details of the security controls employed within the information system with sufficient detail
  ***Example: Document location.***

+ Application incident response plan that provides details on how to provide the development team with application vulnerability or bug information.
  ***Example: Document location.***
 
#### Open Web Application Security Project (OWASP)

*Perform an analysis of OWASP advocated security principles and perform your best assessment, with evidence, of compliance.*

OWASP advocates the following security principles:

+ Minimize Attack Surface Area
    ***Example: N/A not a web application.***

+ Secure Defaults 
    ***Example: all functions assume failure and do not elegate privilege.***

+ Principle of Least Privilege 
    ***Example: confirmed, through code review.***

+ Principle of Defense in Depth 
    ***Example: input validation, file/dir verification occur at all levels.***

+ Fail Securely
    ***Example: application fails securely and fast reporting issue to invoker and logged.****

+ Separation of Duties
    ***Example: N/A, no additional requirements or duties are associated with this application such as Database Administrator***
    
+ Do not trust Security through Obscurity 
    ***Example: confirmed***
    
+ Simplicity 
    ***Example: confirmed***

+ Fix Security Issues Correctly
    ***Example: confirmed****

### Threat Assessment (APSC-DV-003230)

The STIG details Threat Modeling:

"Threat Modeling is the process of identifying potential threats to the application, risk ranking these threats, and selecting appropriate countermeasures or mitigations for the threats. Threat modeling is a critical step in securing an application from attack."

+ Define Common Usage
    ***Example: Invocation by host OS authenticated user with appropriate file system permissions only.***

+ Identify External Dependencies
    ***Example: No external programs used or invoked by software.***

+ Enumerate Security Assumptions
    ***Example: No external network requirements, NetCDF assumed a safe data file format for purposes of trust.***
    ***Example: All inputs obtained from trusted sources using secure transport mechanisms.***

+ Identify Objects and Interactions
    ***Example:  Basic NetCDF read and Fortran compliant binary output.  ***
  ***Example:  libll - Linked list struct implementation.***
  ***Example:  libNav - Navigation struct.***
  ***Example:  libProducts - Product domain management struct.***

+ Identify Entry Points
    ***Example:  Entry point via authorized user with appropriate access to file system.***

+ Determine Threat Risk
    ***Example:  Threat risk minimal due to lack of web presence, host OS user management, and no external network dependencies.***

The remainder of this section will be your threat assessment technique identified in the standard applied here.

## Threat Analysis

*The following is an ***example only*** of a past analysis that one could use for their project as general guidance.*

#### 1.0 [Broken Authentication / Access Control and Session Management](http://owasp.org/Top10/A03_2021-Injection/)  (APSC-DV-000010, APSC-DV-001800, APSC-DV-002220, APSC-DV-002240, APSC-DV-002250, APSC-DV-002260, APSC-DV-002270, APSC-DV-002270)

`0.0 = (DAMAGE (?) + REPRODUCIBILITY (?) + EXPLOITABILITY (?) + AFFECTED USERS (?) + DISCOVERABILITY (?)) / 5`

Attackers use leaks or flaws in the authentication or session management functions (e.g., exposed accounts, passwords, session IDs) to impersonate users.

Session management encompasses the techniques employed by web applications to transparently authorize a user for every HTTP request without having the user repeatedly login. The onus of session management must be borne by the application itself due to the stateless nature of the underlying HTTP protocol. Session management entails the application sending the client (in most cases, a web browser) a session token after successful authentication. In most cases, this token is passed via the Set-Cookie directive of HTTP and is stored on the client. The session token must then be sent by the client along with every HTTP request to the server to identify itself with the web-based application. The application can then determine whether the client is authorized to access the page being requested.

Session management mechanisms can be broadly classified into client-side and server-side mechanisms. This classification is based on the contents of the session token passed between the client and the application.

Access control is only effective in trusted server-side code or server-less API, where the attacker cannot modify the access control check or metadata.

Except for public resources, deny by default.

Implement access control mechanisms once and re-use them throughout the application, including minimizing Cross-Origin Resource Sharing (CORS) usage.

Model access controls should enforce record ownership rather than accepting that the user can create, read, update, or delete any record.

Unique application business limit requirements should be enforced by domain models.

Disable web server directory listing and ensure file metadata (e.g., .git) and backup files are not present within web roots.

Log access control failures, alert admins when appropriate (e.g., repeated failures).

Rate limit API and controller access to minimize the harm from automated attack tooling.

Stateful session identifiers should be invalidated on the server after logout. Stateless JWT tokens should rather be short-lived so that the window of opportunity for an attacker is minimized. For longer lived JWTs it's highly recommended to follow the OAuth standards to revoke access.

Web application ensures that all user supplied input sent back to the browser is verified to be safe (via input validation), and that user input properly escaped before it is included in the output page. Proper output encoding ensures that such input is always treated as text in the browser, rather than active content that might get executed. web utilizes validation of all input is a part of the Infrastructure code and with the use of local validation libraries as well as ESAPI all input coming into code is checked.  

The web uses a security token that is generated on the fly per edit/save pairing, so that “tricking” a user into navigating to a save page would not cause a save to occur but instead would throw a security error in the log file.

The web uses referrer checks on state-changing pages to ensure the user is coming from the previous page expected.  In addition, each page is annotated for role access and checked for organizational access before allowing a user to view it.

Sanitize and validate all client-supplied input data

Enforce the URL schema, port, and destination with a positive allow list

Do not send raw responses to clients

Disable HTTP redirections

Be aware of the URL consistency to avoid attacks such as DNS rebinding and “time of check, time of use” (TOCTOU) race conditions

Do not mitigate SSRF via the use of a deny list or regular expression. Attackers have payload lists, tools, and skills to bypass deny lists.

#### 2.2 [Cryptographic Failures](https://owasp.org/Top10/A02_2021-Cryptographic_Failures/)

`0.0 = (DAMAGE (?) + REPRODUCIBILITY (?) + EXPLOITABILITY (?) + AFFECTED USERS (?) + DISCOVERABILITY (?)) / 5`

*Mitigation*
Do the following, at a minimum, and consult the references:

Classify data processed, stored, or transmitted by an application. Identify which data is sensitive according to privacy laws, regulatory requirements, or business needs.

Don't store sensitive data unnecessarily. Discard it as soon as possible or use PCI DSS compliant tokenization or even truncation. Data that is not retained cannot be stolen.

Make sure to encrypt all sensitive data at rest.

Ensure up-to-date and strong standard algorithms, protocols, and keys are in place; use proper key management.

Encrypt all data in transit with secure protocols such as TLS with forward secrecy (FS) ciphers, cipher prioritization by the server, and secure parameters. Enforce encryption using directives like HTTP Strict Transport Security (HSTS).

Disable caching for response that contain sensitive data.

Apply required security controls as per the data classification.

Do not use legacy protocols such as FTP and SMTP for transporting sensitive data.

Store passwords using strong adaptive and salted hashing functions with a work factor (delay factor), such as Argon2, scrypt, bcrypt or PBKDF2.

Initialization vectors must be chosen appropriate for the mode of operation. For many modes, this means using a CSPRNG (cryptographically secure pseudo random number generator). For modes that require a nonce, then the initialization vector (IV) does not need a CSPRNG. In all cases, the IV should never be used twice for a fixed key.

Always use authenticated encryption instead of just encryption.

Keys should be generated cryptographically randomly and stored in memory as byte arrays. If a password is used, then it must be converted to a key via an appropriate password base key derivation function.

Ensure that cryptographic randomness is used where appropriate, and that it has not been seeded in a predictable way or with low entropy. Most modern APIs do not require the developer to seed the CSPRNG to get security.

Avoid deprecated cryptographic functions and padding schemes, such as MD5, SHA1, PKCS number 1 v1.5.

Verify independently the effectiveness of configuration and settings.

#### 3.0 [Injection](https://owasp.org/Top10/A03_2021-Injection/) (APSC-DV-001460, APSC-DV-002510, APSC-DV-002540)

`0.0 = (DAMAGE (?) + REPRODUCIBILITY (?) + EXPLOITABILITY (?) + AFFECTED USERS (?) + DISCOVERABILITY (?)) / 5`

*Mitigation*: 

Preventing injections requires keeping data separate from commands and queries:

The preferred option is to use a safe API, which avoids using the interpreter entirely, provides a parameterized interface, or migrates to Object Relational Mapping Tools (ORMs).

Note: Even when parameterized, stored procedures can still introduce SQL injections if PL/SQL or T-SQL concatenates queries and data or executes hostile data with EXECUTE IMMEDIATE or exec().

Use positive server-side input validation. This is not a complete defense as many applications require special characters, such as text areas or APIs for mobile applications.

For any residual dynamic queries, escape special characters using the specific escape syntax for that interpreter.
Note: SQL structures such as table names, column names, and so on cannot be escaped, and thus user-supplied structure names are dangerous. This is a common issue in report-writing software. 

#### 4.0 [Insecure Design](https://owasp.org/Top10/A04_2021-Insecure_Design/)

`0.0 = (DAMAGE (?) + REPRODUCIBILITY (?) + EXPLOITABILITY (?) + AFFECTED USERS (?) + DISCOVERABILITY (?)) / 5`

*Mitigation*: 

Establish and use a secure development lifecycle with AppSec professionals to help evaluate and design security and privacy-related controls

Establish and use a library of secure design patterns or paved road ready to use components

Use threat modeling for critical authentication, access control, business logic, and key flows

Integrate security language and controls into user stories

Integrate plausibility checks at each tier of your application (from frontend to backend)

Write unit and integration tests to validate that all critical flows are resistant to the threat model. Compile use-cases and misuse-cases for each tier of your application.

Segregate tier layers on the system and network layers depending on the exposure and protection needs

Segregate tenants robustly by design throughout all tiers

Limit resource consumption by user or service

web uses declarative Java with Annotations to determine which roles have elevated privileges. If a user modifies a URL into an area that has privileged content the Front Controller facade will first check to see if subject user is allowed elevated privileges, if not a standard page will present.

#### 5.0 [Security Misconfiguration](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/)

`0.0 = (DAMAGE (0) + REPRODUCIBILITY (0) + EXPLOITABILITY (0) + AFFECTED USERS (0) + DISCOVERABILITY (0)) / 5`

*Mitigation*: 
Secure installation processes should be implemented, including:

A repeatable hardening process makes it fast and easy to deploy another environment that is appropriately locked down. Development, QA, and production environments should all be configured identically, with different credentials used in each environment. This process should be automated to minimize the effort required to set up a new secure environment.

A minimal platform without any unnecessary features, components, documentation, and samples. Remove or do not install unused features and frameworks.

A task to review and update the configurations appropriate to all security notes, updates, and patches as part of the patch management process (see A06:2021-Vulnerable and Outdated Components). Review cloud storage permissions (e.g., S3 bucket permissions).

A segmented application architecture provides effective and secure separation between components or tenants, with segmentation, containerization, or cloud security groups (ACLs).

Sending security directives to clients, e.g., Security Headers.

An automated process to verify the effectiveness of the configurations and settings in all environments.

Web applications do not utilize any default accounts for either backend database or JBoss application server.  There are no files or directories without any level of protection. All settings/configuration files are configuration managed. 

#### 6.0 [Vulnerable and Outdated Components](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/)

`0.0 = (DAMAGE (0) + REPRODUCIBILITY (0) + EXPLOITABILITY (0) + AFFECTED USERS (0) + DISCOVERABILITY (0)) / 5`

*Mitigation:*
Remove unused dependencies, unnecessary features, components, files, and documentation.

Continuously inventory the versions of both client-side and server-side components (e.g., frameworks, libraries) and their dependencies using tools like versions, OWASP Dependency Check, retire.js, etc. Continuously monitor sources like Common Vulnerability and Exposures (CVE) and National Vulnerability Database (NVD) for vulnerabilities in the components. Use software composition analysis tools to automate the process. Subscribe to email alerts for security vulnerabilities related to components you use.

Only obtain components from official sources over secure links. Prefer signed packages to reduce the chance of including a modified, malicious component (see A08:2021-Software and Data Integrity Failures).

Monitor for libraries and components that are unmaintained or do not create security patches for older versions. If patching is not possible, consider deploying a virtual patch to monitor, detect, or protect against the discovered issue.

Every organization must ensure an ongoing plan for monitoring, triaging, and applying updates or configuration changes for the lifetime of the application or portfolio.

Each component of the web is checked for updates regularly and patches are applied when available.

#### 7.0 [Identification and Authentication Failures - Cross-Site Scripting (XSS) / Cross Site Request Forgery (CSRF) / Server-Side Request Forgery](https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29) (APSC-DV-002490, APSC-DV-002500, APSC-DV-002530, APSC-DV-000060, APSC-DV-002210, APSC-DV-002930)

`0.0 = (DAMAGE (0) + REPRODUCIBILITY (0) + EXPLOITABILITY (0) + AFFECTED USERS (0) + DISCOVERABILITY (0)) / 5`

*Mitigation:*

Where possible, implement multi-factor authentication to prevent automated credential stuffing, brute force, and stolen credential reuse attacks.

Do not ship or deploy with any default credentials, particularly for admin users.

Implement weak password checks, such as testing new or changed passwords against the top 10,000 worst passwords list.

Align password length, complexity, and rotation policies with National Institute of Standards and Technology (NIST) 800-63b's guidelines in section 5.1.1 for Memorized Secrets or other modern, evidence-based password policies.

Ensure registration, credential recovery, and API pathways are hardened against account enumeration attacks by using the same messages for all outcomes.

Limit or increasingly delay failed login attempts but be careful not to create a denial-of-service scenario. Log all failures and alert administrators when credential stuffing, brute force, or other attacks are detected.

Use a server-side, secure, built-in session manager that generates a new random session ID with high entropy after login. Session identifier should not be in the URL, be securely stored, and invalidated after logout, idle, and absolute timeouts.

The web utilizes a Front Controller facade which manages access to every portion of the site. A Webservice Controller provides the same level of management for web services. The authorization matrix is explicit, if you are not authorized to be in a particular portion of the site you will be denied access. If a user changes the URL to an area they are not authorized for (seeking elevated privileges) they will be blocked using Declarative Java annotations. If a URL is modified to get the user to data they are not supposed to see, the backend DAO will block access using a rigidly enforced organizational access filter and restrict where necessary.

#### 8.0 [Software and Data Integrity Failures](https://owasp.org/Top10/A08_2021-Software_and_Data_Integrity_Failures/)

`0.0 = (DAMAGE (0) + REPRODUCIBILITY (0) + EXPLOITABILITY (0) + AFFECTED USERS (0) + DISCOVERABILITY (0)) / 5`

*Mitigation:*
Use digital signatures or similar mechanisms to verify the software or data is from the expected source and has not been altered.

Ensure libraries and dependencies, such as npm or Maven, are consuming trusted repositories. If you have a higher risk profile, consider hosting a well-known good repository that's vetted.

Ensure that a software supply chain security tool, such as OWASP Dependency Check or OWASP CycloneDX, is used to verify that components do not contain known vulnerabilities

Ensure that there is a review process for code and configuration changes to minimize the chance that malicious code or configuration could be introduced into your software pipeline.

Ensure that your CI/CD pipeline has proper segregation, configuration, and access control to ensure the integrity of the code flowing through the build and deploy processes.

Ensure that unsigned or unencrypted serialized data is not sent to untrusted clients without some form of integrity check or digital signature to detect tampering or replay of the serialized data

#### 9.0 [Security Logging and Monitoring Features](https://owasp.org/Top10/A09_2021-Security_Logging_and_Monitoring_Failures/)

`0.0 = (DAMAGE (0) + REPRODUCIBILITY (0) + EXPLOITABILITY (0) + AFFECTED USERS (0) + DISCOVERABILITY (0)) / 5`

*Mitigation:*

Developers should implement some or all the following controls, depending on the risk of the application:

Ensure all login, access control, and server-side input validation failures can be logged with sufficient user context to identify suspicious or malicious accounts and held for enough time to allow delayed forensic analysis.

Ensure that logs are generated in a format that log management solutions can easily consume.

Ensure log data is encoded correctly to prevent injections or attacks on the logging or monitoring systems.

Ensure high-value transactions have an audit trail with integrity controls to prevent tampering or deletion, such as append-only database tables or similar.

DevSecOps teams should establish effective monitoring and alerting such that suspicious activities are detected and responded to quickly.

Establish or adopt an incident response and recovery plan, such as National Institute of Standards and Technology (NIST) 800-61r2 or later.

#### 10.0 [Server-Side Request Forgery (SSRF)](https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29/)

`0.0 = (DAMAGE (0) + REPRODUCIBILITY (0) + EXPLOITABILITY (0) + AFFECTED USERS (0) + DISCOVERABILITY (0)) / 5`

*Mitigation:*
From Network layer
Segment remote resource access functionality in separate networks to reduce the impact of SSRF

Enforce “deny by default” firewall policies or network access control rules to block all but essential intranet traffic.
Hints:
~ Establish an ownership and a lifecycle for firewall rules based on applications.
~ Log all accepted and blocked network flows on firewalls (see A09:2021-Security Logging and Monitoring Failures).

From Application layer:
Sanitize and validate all client-supplied input data

Enforce the URL schema, port, and destination with a positive allow list

Do not send raw responses to clients

Disable HTTP redirections

Be aware of the URL consistency to avoid attacks such as DNS rebinding and “time of check, time of use” (TOCTOU) race conditions

Do not mitigate SSRF via the use of a deny list or regular expression. Attackers have payload lists, tools, and skills to bypass deny lists.

Additional Measures to consider:
Don't deploy other security relevant services on front systems (e.g. OpenID). Control local traffic on these systems (e.g. localhost)

For frontends with dedicated and manageable user groups use network encryption (e.g. VPNs) on independent systems to consider very high protection needs



## STRIDE

STRIDE is a classification scheme for characterizing known threats according to the kinds of exploit that are used (or motivation of the attacker). The STRIDE acronym is formed from the first letter of each of the following categories.

### Spoofing Identity

*Mitigation*: The web app uses PKI authentication to prevent the possibility of identity spoofing. In addition, new user account requests are vetted by a human agent before being granted access.

### Tampering with Data

*Mitigation*: The web app uses both client-side and server-side validation to prevent both accidental as well as malicious data manipulation. The web edit pages use obfuscated input field names that do not match the rendered field names of a view page.

### Repudiation

*Mitigation*: The web app uses both user roles as well as organizational filters to compartmentalize the portions of the site that a user is allowed to utilize. The web also incorporates a transaction log which saves relevant details of each transaction (minus views) per user. The web server and access logs are audited at regular intervals.

### Information Disclosure

*Mitigation*: The web app does not store any information on the client-side. All data is saved and stored on the server-side. 

### Denial of Service

*Mitigation*: The web app does not support any functionality for anonymous users; all functions require authentication and authorization.

### Elevation of Privilege

*Mitigation*: The web app enforces a strict authorization matrix for each page based on both roles and organizational filters. Privileged links are inaccessible to unprivileged users both by not being shown as well as prevention of use by the Controller (Page Controller performs role checks and org checks and enforces the annotated privileges on each page). Non-administrative users cannot modify their own access level.

