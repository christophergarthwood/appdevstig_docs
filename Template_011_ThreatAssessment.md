# Title: Threat Assessment Standard (APP3020)

## Definition:

A threat assessment is a simple process used to identify and understand potential dangers or risks that could cause harm. It helps determine how serious a threat is and how likely it is to happen, so people can take steps to prevent problems or respond effectively. Essentially, it's about spotting possible threats early and managing them to keep people, places, or systems safe.

## Requirements/Specifications/Guidelines:

The threat risk modeling process has five steps, enumerated below. They are: 

+ Identify Security Objectives.
+ Survey the Application
+ Decompose it
+ Identify Threats
+ Identify Vulnerabilities

Utilize the following model as the basis for your analysis to calculate the level of risk.  Consider your application's potential weaknesses by either self-reflection and/or utilizing a known standard such as OWASP's Top 10.

### 1.0 DREAD

DREAD is a classification scheme for quantifying, comparing and prioritizing the amount of risk presented by each evaluated threat. The DREAD acronym is formed from the first letter of each category below. DREAD modeling influences the thinking behind setting the risk rating, and is also used directly to sort the risks. The DREAD algorithm, shown below, is used to compute a risk value, which is an average of all five categories.

`Risk_DREAD = (DAMAGE + REPRODUCIBILITY + EXPLOITABILITY + AFFECTED USERS + DISCOVERABILITY) / 5`

The calculation always produces a number between 0 and 10; the higher the number, the more serious the risk. Here are some examples of how to quantify the DREAD categories.

#### 1.1 Damage Potential

If a threat exploit occurs, how much damage will be caused?

+ 0 = Nothing
+ 5 = Individual user data is compromised or affected.
+ 10 = Complete system or data destruction

#### 1.2 Reproducibility

How easy is it to reproduce the threat exploit?

+ 0 = Very hard or impossible, even for administrators of the application.
+ 5 = One or two steps required, may need to be an authorized user.
+ 10 = Just a web browser and the address bar is sufficient, without authentication.

#### 1.3 Exploitability

What is needed to exploit this threat?

+ 0 = Advanced programming and networking knowledge, with custom or advanced attack tools.
+ 5 = Malware exists on the Internet, or an exploit is easily performed, using available attack tools.
+ 10 = Just a web browser

#### 1.4 Affected Users

How many users will be affected?

+ 0 = None
+ 5 = Some users, but not all
+ 10 = All users

#### 1.5 Discoverability

How easy is it to discover this threat?

+ 0 = Very hard to impossible; requires source code or administrative access.
+ 5 = Can figure it out by guessing or by monitoring network traces.
+ 9 = Details of faults like this are already in the public domain and can be easily discovered using a search engine.
+ 10 = The information is visible in the web browser address bar or in a form.

Note: When performing a security review of an existing application, “Discoverability” will often be set to 10 by convention, as it is assumed the threat issues will be discovered.

### 2.0 OWASP (Top 10)

The following are explanations of OWASP and potential mitigations with examples of how to score.

#### 2.1 [Broken Authentication / Access Control and Session Management](http://owasp.org/Top10/A03_2021-Injection/)  (APSC-DV-000010, APSC-DV-001800, APSC-DV-002220, APSC-DV-002240, APSC-DV-002250, APSC-DV-002260, APSC-DV-002270, APSC-DV-002270)

Attacker uses leaks or flaws in the authentication or session management functions (e.g., exposed accounts, passwords, session IDs) to impersonate users.

Session management encompasses the techniques employed by web applications to transparently authorize a user for every HTTP request without having the user repeatedly login. The onus of session management must be borne by the application itself due to the stateless nature of the underlying HTTP protocol. Session management entails the application sending the client (in most cases, a web browser) a session token after successful authentication. In most cases, this token is passed via the Set-Cookie directive of HTTP and is stored on the client. The session token must then be sent by the client along with every HTTP request to the server to identify itself to the web-based application. The application can then determine whether the client is authorized to access the page being requested.

Session management mechanisms can be broadly classified into client-side and server-side mechanisms. This classification is based on the contents of the session token passed between the client and the application.

#### 2.2 [Cryptographic Failures](https://owasp.org/Top10/A02_2021-Cryptographic_Failures/)

The first thing is to determine the protection needs of data in transit and at rest. For example, passwords, credit card numbers, health records, personal information, and business secrets require extra protection, mainly if that data falls under privacy laws, e.g., EU's General Data Protection Regulation (GDPR), or regulations, e.g., financial data protection such as PCI Data Security Standard (PCI DSS). For all such data:

Is any data transmitted in clear text? This concerns protocols such as HTTP, SMTP, FTP also using TLS upgrades like STARTTLS. External internet traffic is hazardous. Verify all internal traffic, e.g., between load balancers, web servers, or back-end systems.

Are any old or weak cryptographic algorithms or protocols used either by default or in older code?

Are default crypto keys in use, weak crypto keys generated or re-used, or is proper key management or rotation missing? Are crypto keys checked into source code repositories?

Is encryption not enforced, e.g., are any HTTP headers (browser) security directives or headers missing?

Is the received server certificate and the trust chain properly validated?

Are initialization vectors ignored, reused, or not generated sufficiently secure for the cryptographic mode of operation? Is an insecure mode of operation such as ECB in use? Is encryption used when authenticated encryption is more appropriate?

Are passwords being used as cryptographic keys in absence of a password base key derivation function?

Is randomness used for cryptographic purposes that was not designed to meet cryptographic requirements? Even if the correct function is chosen, does it need to be seeded by the developer, and if not, has the developer over-written the strong seeding functionality built into it with a seed that lacks sufficient entropy/unpredictability?

Are deprecated hash functions such as MD5 or SHA1 in use, or are non-cryptographic hash functions used when cryptographic hash functions are needed?

Are deprecated cryptographic padding methods such as PKCS number 1 v1.5 in use?

Are cryptographic error messages or side channel information exploitable, for example in the form of padding oracle attacks?

#### 2.3 [Injection](https://owasp.org/Top10/A03_2021-Injection/) (APSC-DV-001460, APSC-DV-002510, APSC-DV-002540)

In an injection attack, the attacker sends simple text-based attacks that exploit the syntax of the targeted interpreter. Almost any source of data can be an injection vector, including internal sources.  Injection attacks can be used to run malicious queries or code, and can result in leaking or modifying sensitive information.  The best way to find out if an application is vulnerable to injection is to verify that all use of interpreters clearly separates untrusted data from the command or query. For SQL calls, this means using bind variables in all prepared statements and stored procedures, and avoiding dynamic queries.

#### 2.4 [Insecure Design](https://owasp.org/Top10/A04_2021-Insecure_Design/)

Attacker, who is an authorized system user, simply changes a parameter value that directly refers to a system object to another object the user isn’t authorized for. Is access granted?

Applications frequently use the actual name or key of an object when generating web pages. Applications don’t always verify the user is authorized for the target object. This results in an insecure direct object reference flaw. Testers can easily manipulate parameter values to detect such flaws. Code analysis quickly shows whether authorization is properly verified.

Insecure design is a broad category representing different weaknesses, expressed as “missing or ineffective control design.” Insecure design is not the source for all other Top 10 risk categories. There is a difference between insecure design and insecure implementation. We differentiate between design flaws and implementation defects for a reason, they have different root causes and remediation. A secure design can still have implementation defects leading to vulnerabilities that may be exploited. An insecure design cannot be fixed by a perfect implementation as by definition, needed security controls were never created to defend against specific attacks. One of the factors that contribute to insecure design is the lack of business risk profiling inherent in the software or system being developed, and thus the failure to determine what level of security design is required.

#### 2.5 [Security Misconfiguration](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/)

Attacker accesses default accounts, unused pages, unpatched flaws, unprotected files and directories, etc. to gain unauthorized access to or knowledge of the system.

Security misconfiguration can happen at any level of an application stack, including the platform, web server, application server, database, framework, and custom code. Developers and system administrators need to work together to ensure that the entire stack is configured properly. Automated scanners are useful for detecting missing patches, misconfigurations, use of default accounts, unnecessary services, etc.

The application might be vulnerable if the application is:

+ Missing appropriate security hardening across any part of the application stack or improperly configured permissions on cloud services.
+ Unnecessary features are enabled or installed (e.g., unnecessary ports, services, pages, accounts, or privileges).
+ Default accounts and their passwords are still enabled and unchanged.
+ Error handling reveals stack traces or other overly informative error messages to users.
+ For upgraded systems, the latest security features are disabled or not configured securely.
+ The security settings in the application servers, application frameworks (e.g., Struts, Spring, ASP.NET), libraries, databases, etc., are not set to secure values.
+ The server does not send security headers or directives, or they are not set to secure values.
+ The software is out of date or vulnerable (see A06:2021-Vulnerable and Outdated Components).

#### 2.6 [Vulnerable and Outdated Components](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/)

Attacker identifies a weak component through scanning or manual analysis. He customizes the exploit as needed and executes the attack. It gets more difficult if the used component is deep in the application.

Virtually every application has these issues because most development teams don’t focus on ensuring their components/libraries are up to date. In many cases, the developers don’t even know all the components they are using, never mind their versions. Component dependencies make things even worse.

If you do not know the versions of all components you use (both client-side and server-side). This includes components you directly use as well as nested dependencies.

If the software is vulnerable, unsupported, or out of date. This includes the OS, web/application server, database management system (DBMS), applications, APIs and all components, runtime environments, and libraries.

If you do not scan for vulnerabilities regularly and subscribe to security bulletins related to the components you use.

If you do not fix or upgrade the underlying platform, frameworks, and dependencies in a risk-based, timely fashion. This commonly happens in environments when patching is a monthly or quarterly task under change control, leaving organizations open to days or months of unnecessary exposure to fixed vulnerabilities.

If software developers do not test the compatibility of updated, upgraded, or patched libraries.

If you do not secure the components’ configurations (see A05:2021-Security Misconfiguration).

#### 2.7 [Identification and Authentication Failures - Cross-Site Scripting (XSS) / Cross Site Request Forgery (CSRF) / Server Side Request Forgery](https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29) (APSC-DV-002490, APSC-DV-002500, APSC-DV-002530, APSC-DV-000060, APSC-DV-002210, APSC-DV-002930)

Attacker sends text-based attack scripts that exploit the interpreter in the browser. Almost any source of data can be an attack vector, including internal sources such as data from the database.

Applications are vulnerable if they do not ensure that all user supplied input is properly escaped, or they do not verify it to be safe via input validation, before including that input in the output page. Without proper output escaping or validation, such input will be treated as active content in the browser.

Attacker creates forged HTTP requests and tricks a victim into submitting them via image tags, XSS, or numerous other techniques. If the user is authenticated, the attack succeeds.

CSRF takes advantage the fact that most web apps allow attackers to predict all the details of a particular action.  Because browsers send credentials like session cookies automatically, attackers can create malicious web pages which generate forged requests that are indistinguishable from legitimate ones.  Detection of CSRF flaws is fairly easy via penetration testing or code analysis.

Confirmation of the user's identity, authentication, and session management is critical to protect against authentication-related attacks. There may be authentication weaknesses if the application:

Permits automated attacks such as credential stuffing, where the attacker has a list of valid usernames and passwords.

Permits brute force or other automated attacks.

Permits default, weak, or well-known passwords, such as "Password1" or "admin/admin".

Uses weak or ineffective credential recovery and forgot-password processes, such as "knowledge-based answers," which cannot be made safe.

Uses plain text, encrypted, or weakly hashed passwords data stores (see A02:2021-Cryptographic Failures).

Has missing or ineffective multi-factor authentication.

Exposes session identifier in the URL.

Reuse session identifier after successful login.

Does not correctly invalidate Session IDs. User sessions or authentication tokens (mainly single sign-on (SSO) tokens) aren't properly invalidated during logout or a period of inactivity.

#### 2.8 [Software and Data Integrity Failures](https://owasp.org/Top10/A08_2021-Software_and_Data_Integrity_Failures/)

Software and data integrity failures relate to code and infrastructure that does not protect against integrity violations. An example of this is where an application relies upon plugins, libraries, or modules from untrusted sources, repositories, and content delivery networks (CDNs). An insecure CI/CD pipeline can introduce the potential for unauthorized access, malicious code, or system compromise. Lastly, many applications now include auto-update functionality, where updates are downloaded without sufficient integrity verification and applied to the previously trusted application. Attackers could potentially upload their own updates to be distributed and run on all installations. Another example is where objects or data are encoded or serialized into a structure that an attacker can see and modify is vulnerable to insecure deserialization.


#### 2.9 [Security Logging and Monitoring Features](https://owasp.org/Top10/A09_2021-Security_Logging_and_Monitoring_Failures/)

Without logging and monitoring, breaches cannot be detected. Insufficient logging, detection, monitoring, and active response occurs any time:

Auditable events, such as logins, failed logins, and high-value transactions, are not logged.

Warnings and errors generate no, inadequate, or unclear log messages.

Logs of applications and APIs are not monitored for suspicious activity.

Logs are only stored locally.

Appropriate alerting thresholds and response escalation processes are not in place or effective.

Penetration testing and scans by dynamic application security testing (DAST) tools (such as OWASP ZAP) do not trigger alerts.

The application cannot detect, escalate, or alert for active attacks in real-time or near real-time.

You are vulnerable to information leakage by making logging and alerting events visible to a user or an attacker (see A01:2021-Broken Access Control).

You are vulnerable to injections or attacks on the logging or monitoring systems if log data is not correctly encoded.

#### 2.10 [Server-Side Request Forgery (SSRF)](https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29/)

SSRF flaws occur whenever a web application is fetching a remote resource without validating the user-supplied URL. It allows an attacker to coerce the application to send a crafted request to an unexpected destination, even when protected by a firewall, VPN, or another type of network access control list (ACL).

As modern web applications provide end-users with convenient features, fetching a URL becomes a common scenario. As a result, the incidence of SSRF is increasing. Also, the severity of SSRF is becoming higher due to cloud services and the complexity of architectures.

Attacker links to unvalidated redirect and tricks victims into clicking it. Victims are more likely to click on it, since the link is to a valid site. Attacker targets unsafe forward to bypass security checks.

Applications frequently redirect users to other pages, or use internal forwards in a similar manner. Sometimes the target page is specified in an unvalidated parameter, allowing attackers to choose the destination page.  Detecting unchecked redirects is easy. Look for redirects where you can set the full URL. Unchecked forwards are harder, because they target internal pages.

### 3.0 STRIDE

STRIDE is a classification scheme for characterizing known threats according to the kinds of exploit that are used (or motivation of the attacker). The STRIDE acronym is formed from the first letter of each of the following categories.

#### Spoofing Identity

“Identity spoofing” is a key risk for applications that have many users but provide a single execution context at the application and database level. In particular, users should not be able to become any other user or assume the attributes of another user.

*Mitigation*: Provide methods of defense in use.

#### Tampering with Data

Users can potentially change data delivered to them, return it, and thereby potentially manipulate client-side validation, GET and POST results, cookies, HTTP headers, and so forth. The application should not send data to the user, such as interest rates or periods, which are obtainable only from within the application itself. The application should also carefully check data received from the user and validate that it is sane and applicable before storing or using it.

*Mitigation*: Provide methods of defense in use.

#### Repudiation

Users may dispute transactions if there is insufficient auditing or recordkeeping of their activity. For example, if a user says, “But I didn’t transfer any money to this external account!”, and you cannot track his/her activities through the application, then it is extremely likely that the transaction will have to be written off as a loss. Therefore, consider if the application requires non-repudiation controls, such as web access logs, audit trails at each tier, or the same user context from top to bottom. Preferably, the application should run with the user’s privileges, not more, but this may not be possible with many off-the-shelf application frameworks.

*Mitigation*: Provide methods of defense in use.

#### Information Disclosure

Users are rightfully wary of submitting private details to a system. If it is possible for an attacker to publicly reveal user data at large, whether anonymously or as an authorized user, there will be an immediate loss of confidence and a substantial period of reputation loss. Therefore, applications must include strong controls to prevent user ID tampering and abuse, particularly if they use a single context to run the entire application. Also, consider if the user’s web browser may leak information. Some web browsers may ignore the no caching directives in HTTP headers or handle them incorrectly. In a corresponding fashion, every secure application has a responsibility to minimize the amount of information stored by the web browser, just in case it leaks or leaves information behind, which can be used by an attacker to learn details about the application, the user, or to potentially become that user. Finally, in implementing persistent values, keep in mind that the use of hidden fields is insecure by nature.

Such storage should not be relied on to secure sensitive information or to provide adequate personal privacy safeguards.

*Mitigation*: Provide methods of defense in use.

#### Denial of Service

Application designers should be aware that their applications may be subject to a denial of service attack. Therefore, the use of expensive resources such as large files, complex calculations, heavy-duty searches, or long queries should be reserved for authenticated and authorized users, and not available to anonymous users.

For applications that do not have this luxury, every facet of the application should be engineered to perform as little work as possible, to use fast and few database queries, to avoid exposing large files or unique links per user, in order to prevent simple denial of service attacks.

*Mitigation*: Provide methods of defense in use.

#### Elevation of Privilege

If an application provides distinct user and administrative roles, then it is vital to ensure that the user cannot elevate his/her role to a higher privilege one. In particular, simply not displaying privileged role links is insufficient. Instead, all actions should be gated through an authorization matrix, to ensure that only the permitted roles can access privileged functionality.

*Mitigation*: Provide methods of defense in use.

## Measurable and Actionable:

+ Threat assessment must exist.
+ Threat assessments must return a numerical value indicating the level of concern for an identified vulnerability.
+ Improvement of scores should occur over the course of the application's lifecycle if risk management indicates tighter security is appropriate.

## Purpose:

The purpose of a software threat assessment, in simple terms, is to identify potential dangers or weaknesses in a software system that hackers or other malicious actors could exploit. It helps organizations understand what kind of threats they might face, how serious those threats are, and what needs to be done to protect the software and data before any harm happens. This proactive approach reduces risks, helps allocate security resources wisely, improves safety, and helps ensure compliance with regulations. Essentially, it keeps the software safer by preparing for and preventing potential attacks before they occur.

## Timeliness:

Should occur with each major change to the system at semantic versioning primary level 1.x.x to 2.x.x.


## Reference(s)
 + [Application Security Development (ASD) Security Technical Implementation Guide (STIG) version 6, release 3 (APSC-DV-003230)](https://www.cyber.mil/stigs/downloads)
   + APSC-DV-000520, The application must audit the execution of privileged functions.
   + APSC-DV-003220, The designer must create and update the Design Document for each release of the application.
   + APSC-DV-003230, Threat models must be documented and reviewed for each application release and updated as required by design and functionality changes or when new threats are discovered.
   + APSC-DV-003260, Procedures must be in place to notify users when an application is decommissioned.
   + APSC-DV-003320, Protections against DoS attacks must be implemented.
 + [OWASP Top 10](https://owasp.org/www-project-top-ten/)
 + [MITRE CWE List](https://cwe.mitre.org/)

## Versioning

|Version       |Description                                                                                                         |
|--------------|--------------------------------------------------------------------------------------------------------------------|
|v0.1          | Inception|

____________________________________________________________________________________________________________________________________
## **Template**

# Threat Assessment  (AppDev STIG v6r3, APSC-DV-003230)

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

+ Any protections on the external interface
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

+	Minimize Attack Surface Area
    ***Example: N/A not a web application.***

+	Secure Defaults 
    ***Example: all functions assume failure and do not elegate privilege.***

+	Principle of Least Privilege 
    ***Example: confirmed, through code review.***

+	Principle of Defense in Depth 
    ***Example: input validation, file/dir verification occur at all levels.***

+	Fail Securely
    ***Example:application fails securely and fast reporting issue to invoker and logfed.****

+	Separation of Duties
    ***Example: N/A, no additional requirements or duties are associated with this application such as Database Administrator***
    
+	Do not trust Security through Obscurity 
    ***Example: confirmed***
    
+	Simplicity 
    ***Example: confirmed***

+	Fix Security Issues Correctly
    ***Example: confirmed****

### Threat Assessment (APSC-DV-003230)

The STIG details Threat Modeling:

"Threat Modeling is the process of identifying potential threats to the application, risk ranking these threats, and selecting appropriate countermeasures or mitigations for the threats. Threat modeling is a critical step in securing an application from attack."

+	Define Common Usage
    ***Example: Invocation by host OS authenticated user with appropritate file system permissions only.***

+	Identify External Dependencies
    ***Example: No external programs used or invoked by software.***

+	Enumerate Security Assumptions
    ***Example: No external network requiements, NetCDF assumed a safe data file format for purposes of trust.***
    ***Example: All inputs obtained from trusted sources using secure transport mechanisms.***

+	Identify Objects and Interactions
    ***Example:  Basic NetCDF read and Fortran compliant binary output.  ***
	***Example:  libll - Linked list struct implementation.***
	***Example:  libNav - Navigation struct.***
	***Example:  libProducts - Product domain management struct.***

+	Identify Entry Points
    ***Example:  Entry point via authorized user with appropriate access to file system.***

+	Determine Threat Risk
    ***Example:  Threat risk minimal due to lack of web presence, host OS user management, and no external network dependencies.***

The remainder of this section will be your threat assessment technique identified in the standard applied here.

## Threat Analysis

*The following is an ***example only*** of a past analysis that one could use for their project as general guidance.*

#### 1.0 [Broken Authentication / Access Control and Session Management](http://owasp.org/Top10/A03_2021-Injection/)  (APSC-DV-000010, APSC-DV-001800, APSC-DV-002220, APSC-DV-002240, APSC-DV-002250, APSC-DV-002260, APSC-DV-002270, APSC-DV-002270)

`0.0 = (DAMAGE (?) + REPRODUCIBILITY (?) + EXPLOITABILITY (?) + AFFECTED USERS (?) + DISCOVERABILITY (?)) / 5`

Attacker uses leaks or flaws in the authentication or session management functions (e.g., exposed accounts, passwords, session IDs) to impersonate users.

Session management encompasses the techniques employed by web applications to transparently authorize a user for every HTTP request without having the user repeatedly login. The onus of session management must be borne by the application itself due to the stateless nature of the underlying HTTP protocol. Session management entails the application sending the client (in most cases, a web browser) a session token after successful authentication. In most cases, this token is passed via the Set-Cookie directive of HTTP and is stored on the client. The session token must then be sent by the client along with every HTTP request to the server to identify itself to the web-based application. The application can then determine whether the client is authorized to access the page being requested.

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

Web application ensures that all user supplied input sent back to the browser is verified to be safe (via input validation), and that user input is properly escaped before it is included in the output page. Proper output encoding ensures that such input is always treated as text in the browser, rather than active content that might get executed. web utilizes validation of all input is a part of the Infrastructure code and with the use of local validation libraries as well as ESAPI all input coming into code is checked.  

The web uses a security token that is generated on the fly per edit/save pairing, so that “tricking” a user into navigating to a save page would not cause a save to occur, but instead would throw a security error in the log file.

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

Preventing injection requires keeping data separate from commands and queries:

The preferred option is to use a safe API, which avoids using the interpreter entirely, provides a parameterized interface, or migrates to Object Relational Mapping Tools (ORMs).

Note: Even when parameterized, stored procedures can still introduce SQL injection if PL/SQL or T-SQL concatenates queries and data or executes hostile data with EXECUTE IMMEDIATE or exec().

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

web uses declarative Java with Annotations to determine which roles have elevated privileges. If a user modifies a URL into an area that has privileged content the FrontController facade will first check to see if subject user is allowed elevated privileges, if not a standard page will present.


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

Web application does not utilize any default accounts for either backend database or JBoss application server.  There are no files or directories without some level of protection. All settings/configuration files are configuration managed. 


#### 6.0 [Vulnerable and Outdated Components](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/)

`0.0 = (DAMAGE (0) + REPRODUCIBILITY (0) + EXPLOITABILITY (0) + AFFECTED USERS (0) + DISCOVERABILITY (0)) / 5`

*Mitigation:*
Remove unused dependencies, unnecessary features, components, files, and documentation.

Continuously inventory the versions of both client-side and server-side components (e.g., frameworks, libraries) and their dependencies using tools like versions, OWASP Dependency Check, retire.js, etc. Continuously monitor sources like Common Vulnerability and Exposures (CVE) and National Vulnerability Database (NVD) for vulnerabilities in the components. Use software composition analysis tools to automate the process. Subscribe to email alerts for security vulnerabilities related to components you use.

Only obtain components from official sources over secure links. Prefer signed packages to reduce the chance of including a modified, malicious component (see A08:2021-Software and Data Integrity Failures).

Monitor for libraries and components that are unmaintained or do not create security patches for older versions. If patching is not possible, consider deploying a virtual patch to monitor, detect, or protect against the discovered issue.

Every organization must ensure an ongoing plan for monitoring, triaging, and applying updates or configuration changes for the lifetime of the application or portfolio.

Each component of the web is checked for updates regularly and patches are applied when available.


#### 7.0 [Identification and Authentication Failures - Cross-Site Scripting (XSS) / Cross Site Request Forgery (CSRF) / Server Side Request Forgery](https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29) (APSC-DV-002490, APSC-DV-002500, APSC-DV-002530, APSC-DV-000060, APSC-DV-002210, APSC-DV-002930)

`0.0 = (DAMAGE (0) + REPRODUCIBILITY (0) + EXPLOITABILITY (0) + AFFECTED USERS (0) + DISCOVERABILITY (0)) / 5`

*Mitigation:*

Where possible, implement multi-factor authentication to prevent automated credential stuffing, brute force, and stolen credential reuse attacks.

Do not ship or deploy with any default credentials, particularly for admin users.

Implement weak password checks, such as testing new or changed passwords against the top 10,000 worst passwords list.

Align password length, complexity, and rotation policies with National Institute of Standards and Technology (NIST) 800-63b's guidelines in section 5.1.1 for Memorized Secrets or other modern, evidence-based password policies.

Ensure registration, credential recovery, and API pathways are hardened against account enumeration attacks by using the same messages for all outcomes.

Limit or increasingly delay failed login attempts, but be careful not to create a denial of service scenario. Log all failures and alert administrators when credential stuffing, brute force, or other attacks are detected.

Use a server-side, secure, built-in session manager that generates a new random session ID with high entropy after login. Session identifier should not be in the URL, be securely stored, and invalidated after logout, idle, and absolute timeouts.

The web utilizes a FrontController facade which manages access to every portion of the site. A WebServiceController provides the same level of management for web services. The authorization matrix is explicit, if you are not authorized to be in a particular portion of the site you will be denied access. If a user changes the URL to an area they are not authorized for (seeking elevated privileges) they will be blocked using Declarative Java annotations. If a URL is modified in an attempt to get the user to data they are not supposed to see, the backend DAO will block access using a rigidly enforced organizational access filter and restrict where necessary.


#### 8.0 [Software and Data Integrity Failures](https://owasp.org/Top10/A08_2021-Software_and_Data_Integrity_Failures/)

`0.0 = (DAMAGE (0) + REPRODUCIBILITY (0) + EXPLOITABILITY (0) + AFFECTED USERS (0) + DISCOVERABILITY (0)) / 5`

*Mitigation:*
Use digital signatures or similar mechanisms to verify the software or data is from the expected source and has not been altered.

Ensure libraries and dependencies, such as npm or Maven, are consuming trusted repositories. If you have a higher risk profile, consider hosting an internal known-good repository that's vetted.

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

*Mitigation*: The web app enforces a strict authorization matrix for each page based on both roles and organizational filters. Privileged links are inaccessible to unprivileged users both by not being shown as well as prevention of use by the Controller (PageController performs role checks and org checks and enforces the annotated privileges on each page). Non-administrative users cannot modify their own access level.
