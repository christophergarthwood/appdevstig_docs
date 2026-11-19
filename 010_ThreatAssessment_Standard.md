# Threat Assessment Standard (APP3030)

[TOC]

## Template / Reference

*Template* - [Threat Modeling /  Assessment Standard](./010_ThreatAssessment_Template.md)

## Definition:

A threat assessment is a simple process used to identify and understand potential dangers or risks that could cause harm. It helps determine how serious a threat is and how likely it is to happen, so people can take steps to prevent problems or respond effectively. Essentially, it's about spotting possible threats early and managing them to keep people, places, or systems safe.

## Purpose:

The purpose of a software threat assessment, in simple terms, is to identify potential dangers or weaknesses in a software system that hackers or other malicious actors could exploit. It helps organizations understand what kind of threats they might face, how serious those threats are, and what needs to be done to protect the software and data before any harm happens. This proactive approach reduces risks, helps allocate security resources wisely, improves safety, and helps ensure compliance with regulations. Essentially, it keeps the software safer by preparing for and preventing potential attacks before they occur.


## Requirements/Specifications/Guidelines:

The threat risk modeling process has five steps, enumerated below. They are: 

+ Identify Security Objectives.
+ Survey the Application
+ Decompose it
+ Identify Threats
+ Identify Vulnerabilities

Utilize the following model as the basis for your analysis to calculate the level of risk.  Consider your application's potential weaknesses by either self-reflection and/or utilizing a known standard such as OWASP's Top 10.

### 1.0 DREAD

DREAD is a classification scheme for quantifying, comparing and prioritizing the amount of risk presented by each evaluated threat. The DREAD acronym is formed from the first letter of each category below. DREAD modeling influences the thinking behind setting the risk rating and is also used directly to sort the risks. The DREAD algorithm, shown below, is used to compute a risk value, which is an average of all five categories.

`Risk_DREAD = (DAMAGE + REPRODUCIBILITY + EXPLOITABILITY + AFFECTED USERS + DISCOVERABILITY) / 5`

The calculation always produces a number between 0 and 10, the higher the number, the more serious the risk. Here are some examples of how to quantify the DREAD categories.

#### 1.1 Damage Potential

If a threat exploit occurs, how much damage will it be caused?

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

Attackers use leaks or flaws in the authentication or session management functions (e.g., exposed accounts, passwords, session IDs) to impersonate users.

Session management encompasses the techniques employed by web applications to transparently authorize a user for every HTTP request without having the user repeatedly login. The onus of session management must be borne by the application itself due to the stateless nature of the underlying HTTP protocol. Session management entails the application sending the client (in most cases, a web browser) a session token after successful authentication. In most cases, this token is passed via the Set-Cookie directive of HTTP and is stored on the client. The session token must then be sent by the client along with every HTTP request to the server to identify itself with the web-based application. The application can then determine whether the client is authorized to access the page being requested.

Session management mechanisms can be broadly classified into client-side and server-side mechanisms. This classification is based on the contents of the session token passed between the client and the application.

#### 2.2 [Cryptographic Failures](https://owasp.org/Top10/A02_2021-Cryptographic_Failures/)

The first thing is to determine the protection needs of data in transit and at rest. For example, passwords, credit card numbers, health records, personal information, and business secrets require extra protection, mainly if that data falls under privacy laws, e.g., EU's General Data Protection Regulation (GDPR), or regulations, e.g., financial data protection such as PCI Data Security Standard (PCI DSS). For all such data:

Is any data transmitted in clear text? This concerns protocols such as HTTP, SMTP, FTP also using TLS upgrades like STARTTLS. External internet traffic is hazardous. Verify all internal traffic, e.g., between load balancers, web servers, or back-end systems.

Are any old or weak cryptographic algorithms or protocols used either by default or in older code?

Are default crypto keys in use, weak crypto keys generated or re-used, or is proper key management or rotation missing? Are crypto keys checked into source code repositories?

Is encryption not enforced, e.g., are any HTTP headers (browser) security directives or headers missing?

Are the received server certificate and the trust chain properly validated?

Are initialization vectors ignored, reused, or not generated sufficiently secure for the cryptographic mode of operation? Is an insecure mode of operation such as ECB in use? Is encryption used when authenticated encryption is more appropriate?

Are passwords being used as cryptographic keys in absence of a password base key derivation function?

Is randomness used for cryptographic purposes that were not designed to meet cryptographic requirements? Even if the correct function is chosen, does it need to be seeded by the developer, and if not, has the developer over-written the strong seeding functionality built into it with a seed that lacks sufficient entropy/unpredictability?

Are deprecated hash functions such as MD5 or SHA1 in use, or are non-cryptographic hash functions used when cryptographic hash functions are needed?

Are deprecated cryptographic padding methods such as PKCS number 1 v1.5 in use?

Are cryptographic error messages or side channel information exploitable, for example in the form of padding oracle attacks?

#### 2.3 [Injection](https://owasp.org/Top10/A03_2021-Injection/) (APSC-DV-001460, APSC-DV-002510, APSC-DV-002540)

In an injection attack, the attacker sends simple text-based attacks that exploit the syntax of the targeted interpreter. Almost any source of data can be an injection vector, including internal sources.  Injection attacks can be used to run malicious queries or code and can result in leaking or modifying sensitive information.  The best way to find out if an application is vulnerable to injection is to verify that all use of interpreters clearly separates untrusted data from the command or query. For SQL calls, this means using bind variables in all prepared statements and stored procedures and avoiding dynamic queries.

#### 2.4 [Insecure Design](https://owasp.org/Top10/A04_2021-Insecure_Design/)

Attacker, who is an authorized system user, simply changes a parameter value that directly refers to a system object to another object the user isn’t authorized for. Is access granted?

Applications frequently use the actual name or key of an object when generating web pages. Applications don’t always verify the user is authorized for the target object. This results in an insecure direct object reference flaw. Testers can easily manipulate parameter values to detect such flaws. Code analysis quickly shows whether authorization is properly verified.

Insecure design is a broad category representing different weaknesses, expressed as “missing or ineffective control design.” Insecure design is not the source for all other Top 10 risk categories. There is a difference between insecure design and insecure implementation. We differentiate between design flaws and implementation defects for a reason, they have different root causes and remediation. A secure design can still have implementation defects leading to vulnerabilities that may be exploited. An insecure design cannot be fixed by perfect implementation as by definition, needed security controls were never created to defend against specific attacks. One of the factors that contributes to insecure design is the lack of business risk profiling inherent in the software or system being developed, and thus the failure to determine what level of security design is required.

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

Attackers identifies a weak component through scanning or manual analysis. He customizes the exploit as needed and executes the attack. It gets more difficult if the used component is deep in the application.

Virtually every application has these issues because most development teams don’t focus on ensuring their components/libraries are up to date. In many cases, the developers don’t even know all the components they are using, never mind their versions. Component dependencies make things even worse.

If you do not know the versions of all components you use (both client-side and server-side). This includes components you directly use as well as nested dependencies.

If the software is vulnerable, unsupported, or out of date. This includes the OS, web/application server, database management system (DBMS), applications, APIs and all components, runtime environments, and libraries.

If you do not scan for vulnerabilities regularly and subscribe to security bulletins related to the components you use.

If you do not fix or upgrade the underlying platform, frameworks, and dependencies in a risk-based, timely fashion. This commonly happens in environments when patching is a monthly or quarterly task under change control, leaving organizations open to days or months of unnecessary exposure to fixed vulnerabilities.

If software developers do not test the compatibility of updated, upgraded, or patched libraries.

If you do not secure the components’ configurations (see A05:2021-Security Misconfiguration).

#### 2.7 [Identification and Authentication Failures - Cross-Site Scripting (XSS) / Cross Site Request Forgery (CSRF) / Server-Side Request Forgery](https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29) (APSC-DV-002490, APSC-DV-002500, APSC-DV-002530, APSC-DV-000060, APSC-DV-002210, APSC-DV-002930)

Attackers send text-based attack scripts that exploit the interpreter in the browser. Almost any source of data can be an attack vector, including internal sources such as data from the database.

Applications are vulnerable if they do not ensure that all users supplied input properly escaped, or they do not verify it to be safe via input validation, before including that input in the output page. Without proper output escaping or validation, such input will be treated as active content in the browser.

Attackers create forged HTTP requests and trick a victim into submitting them via image tags, XSS, or numerous other techniques. If the user is authenticated, the attack succeeds.

CSRF takes advantage of the fact that most web apps allow attackers to predict all the details of a particular action.  Because browsers send credentials like session cookies automatically, attackers can create malicious web pages which generate forged requests that are indistinguishable from legitimate ones.  Detection of CSRF flaws is easy via penetration testing or code analysis.

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

Without logging and monitoring, breaches cannot be detected. Insufficient logging, detection, monitoring, and active response occurs at any time:

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

As modern web applications provide end-users with convenient features, fetching a URL becomes a common scenario. As a result, the incidence of SSRF is increasing. Also, the severity of SSRF is becoming higher due to cloud services and the complexity of architecture.

Attacker links to unvalidated redirect and tricks victims into clicking it. Victims are more likely to click on it, since the link is to a valid site. Attackers target unsafe forward to bypass security checks.

Applications frequently redirect users to other pages or use internal forwards in a similar manner. Sometimes the target page is specified in an unvalidated parameter, allowing attackers to choose the destination page.  Detecting unchecked redirects is easy. Look for redirects where you can set the full URL. Unchecked forwards are harder, because they target internal pages.

### 3.0 STRIDE

STRIDE is a classification scheme for characterizing known threats according to the kinds of exploit that are used (or motivation of the attacker). The STRIDE acronym is formed from the first letter of each of the following categories.

#### Spoofing Identity

“Identity spoofing” is a key risk for applications that have many users but provide a single execution context at the application and database level. Users should not be able to become any other user or assume the attributes of another user.

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

Application designers should be aware that their applications may be subject to a denial-of-service attack. Therefore, the use of expensive resources such as large files, complex calculations, heavy-duty searches, or long queries should be reserved for authenticated and authorized users, and not available to anonymous users.

For applications that do not have this luxury, every facet of the application should be engineered to perform as little work as possible, to use fast and few database queries, to avoid exposing large files or unique links per user, to prevent simple denial of service attacks.

*Mitigation*: Provide methods of defense in use.

#### Elevation of Privilege

If an application provides distinct user and administrative roles, then it is vital to ensure that the user cannot elevate his/her role to a higher privilege one. Simply not displaying privileged role links is insufficient. Instead, all actions should be gated through an authorization matrix, to ensure that only the permitted roles can access privileged functionality.

*Mitigation*: Provide methods of defense in use.

## Measurable and Actionable:

+ Threat assessment must exist.
+ Threat assessments must return to a numerical value indicating the level of concern for an identified vulnerability.
+ Improvement of scores should occur over the course of the application's lifecycle if risk management indicates tighter security is appropriate.

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
 + [OWASP Threat Modeling Process](https://community.owasp.org/Threat_Modeling_Process)
 + [MITRE CWE List](https://cwe.mitre.org/)
 + [DoW Enterprise DevSecOps Fundamentals, v 2.5, 2024/10](https://dodcio.defense.gov/Portals/0/Documents/Library/DoD%20Enterprise%20DevSecOps%20Fundamentals%20v2.5.pdf)
 + [NIST Special Publication 800-37 (“Risk Management Framework for Information Systems and Organizations"), Rev 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-37r2.pdf)
 + [NIST Secure Software Development Framework (SSDF), SP 800-218A](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218A.pdf)

 ## Visual

 ```mermaid
graph TB
    Start([Start Threat Assessment]) --> Step1[1. Identify Security Objectives]
    
    Step1 --> Step2[2. Survey the Application]
    Step2 --> Step3[3. Decompose the Application]
    Step3 --> Step4[4. Identify Threats]
    Step4 --> Step5[5. Identify Vulnerabilities]
    
    Step5 --> Methods{Select Assessment<br/>Method}
    
    %% DREAD Path
    Methods --> DREAD[DREAD Analysis]
    DREAD --> D1[Damage Potential<br/>0-10]
    DREAD --> D2[Reproducibility<br/>0-10]
    DREAD --> D3[Exploitability<br/>0-10]
    DREAD --> D4[Affected Users<br/>0-10]
    DREAD --> D5[Discoverability<br/>0-10]
    
    D1 --> DREADCalc[Calculate DREAD Score<br/>Sum / 5 = Risk Value]
    D2 --> DREADCalc
    D3 --> DREADCalc
    D4 --> DREADCalc
    D5 --> DREADCalc
    
    %% OWASP Path
    Methods --> OWASP[OWASP Top 10 Analysis]
    OWASP --> O1[1. Broken Authentication/<br/>Access Control]
    OWASP --> O2[2. Cryptographic Failures]
    OWASP --> O3[3. Injection Flaws]
    OWASP --> O4[4. Insecure Design]
    OWASP --> O5[5. Security Misconfiguration]
    OWASP --> O6[6. Vulnerable Components]
    OWASP --> O7[7. Authentication Failures]
    OWASP --> O8[8. Software/Data Integrity]
    OWASP --> O9[9. Logging/Monitoring Failures]
    OWASP --> O10[10. Server-Side Request<br/>Forgery]
    
    O1 --> OWASPScore[Apply DREAD to Each<br/>OWASP Category]
    O2 --> OWASPScore
    O3 --> OWASPScore
    O4 --> OWASPScore
    O5 --> OWASPScore
    O6 --> OWASPScore
    O7 --> OWASPScore
    O8 --> OWASPScore
    O9 --> OWASPScore
    O10 --> OWASPScore
    
    %% STRIDE Path
    Methods --> STRIDE[STRIDE Analysis]
    STRIDE --> S1[Spoofing Identity]
    STRIDE --> S2[Tampering with Data]
    STRIDE --> S3[Repudiation]
    STRIDE --> S4[Information Disclosure]
    STRIDE --> S5[Denial of Service]
    STRIDE --> S6[Elevation of Privilege]
    
    S1 --> STRIDEMit[Document Mitigations<br/>for Each Category]
    S2 --> STRIDEMit
    S3 --> STRIDEMit
    S4 --> STRIDEMit
    S5 --> STRIDEMit
    S6 --> STRIDEMit
    
    %% Convergence
    DREADCalc --> Analysis[Comprehensive<br/>Risk Analysis]
    OWASPScore --> Analysis
    STRIDEMit --> Analysis
    
    Analysis --> Document[Document Findings:<br/>• External Interfaces<br/>• Data Protection<br/>• Access Control<br/>• Security Requirements<br/>• Incident Response]
    
    Document --> Review{Risk Score<br/>Acceptable?}
    
    Review -->|Yes| Approve[Approve & Monitor]
    Review -->|No| Mitigate[Implement Mitigations]
    
    Mitigate --> Reassess[Reassess Threats]
    Reassess --> Analysis
    
    Approve --> Monitor[Continuous Monitoring<br/>& Periodic Review]
    Monitor --> Lifecycle{Major Version<br/>Change?}
    
    Lifecycle -->|Yes| Start
    Lifecycle -->|No| Monitor
    
    %% Styling
    classDef processBox fill:#e1f5ff,stroke:#0066cc,stroke-width:2px
    classDef methodBox fill:#fff4e1,stroke:#ff9800,stroke-width:2px
    classDef decisionBox fill:#ffe1e1,stroke:#cc0000,stroke-width:2px
    classDef resultBox fill:#e1ffe1,stroke:#00cc00,stroke-width:2px
    
    class Step1,Step2,Step3,Step4,Step5 processBox
    class DREAD,OWASP,STRIDE,D1,D2,D3,D4,D5,O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,S1,S2,S3,S4,S5,S6 methodBox
    class Methods,Review,Lifecycle decisionBox
    class DREADCalc,OWASPScore,STRIDEMit,Analysis,Document,Approve,Monitor resultBox
 ```

