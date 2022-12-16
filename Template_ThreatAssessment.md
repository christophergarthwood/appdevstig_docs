# Appendix B Threat Assessment (APP3020)

The threat risk modeling process has five steps, enumerated below. They are: 

+ Identify Security Objectives. – performed by US Navy with Application Development Security Technical Implementation Guide (STIG)
+ Survey the Application – Conducted by GDIT web development team on 2011/11 and 2015/07
+ Decompose it – Developers are aware of authentication and authorization techniques used within the application as well as the security measures identified in this document.  Review of application is performed to the lowest level of Java classes.
+ Identify Threats – Performed in conjunction with the DREAD and STRIDE models utilized below.
+ Identify Vulnerabilities – Enumerated in this document.

## B.1 DREAD
DREAD is a classification scheme for quantifying, comparing and prioritizing the amount of risk presented by each evaluated threat. The DREAD acronym is formed from the first letter of each category below. DREAD modeling influences the thinking behind setting the risk rating, and is also used directly to sort the risks. The DREAD algorithm, shown below, is used to compute a risk value, which is an average of all five categories.

`Risk_DREAD = (DAMAGE + REPRODUCIBILITY + EXPLOITABILITY + AFFECTED USERS + DISCOVERABILITY) / 5`

The calculation always produces a number between 0 and 10; the higher the number, the more serious the risk. Here are some examples of how to quantify the DREAD categories.

### B.1.1 Damage Potential

If a threat exploit occurs, how much damage will be caused?

+ 0 = Nothing
+ 5 = Individual user data is compromised or affected.
+ 10 = Complete system or data destruction

### B.1.2 Reproducibility

How easy is it to reproduce the threat exploit?

+ 0 = Very hard or impossible, even for administrators of the application.
+ 5 = One or two steps required, may need to be an authorized user.
+ 10 = Just a web browser and the address bar is sufficient, without authentication.

### B.1.3 Exploitability

What is needed to exploit this threat?

+ 0 = Advanced programming and networking knowledge, with custom or advanced attack tools.
+ 5 = Malware exists on the Internet, or an exploit is easily performed, using available attack tools.
+ 10 = Just a web browser

### B.1.4 Affected Users

How many users will be affected?

+ 0 = None
+ 5 = Some users, but not all
+ 10 = All users

### B.1.5 Discoverability

How easy is it to discover this threat?

+ 0 = Very hard to impossible; requires source code or administrative access.
+ 5 = Can figure it out by guessing or by monitoring network traces.
+ 9 = Details of faults like this are already in the public domain and can be easily discovered using a search engine.
+ 10 = The information is visible in the web browser address bar or in a form.

Note: When performing a security review of an existing application, “Discoverability” will often be set to 10 by convention, as it is assumed the threat issues will be discovered.

## B.2 OWASP (Top 10)

The following are explanations of OWASP and potential mitigations with examples of how to score.

### B.2.1 Injection

In an injection attack, the attacker sends simple text-based attacks that exploit the syntax of the targeted interpreter. Almost any source of data can be an injection vector, including internal sources.  Injection attacks can be used to run malicious queries or code, and can result in leaking or modifying sensitive information.  The best way to find out if an application is vulnerable to injection is to verify that all use of interpreters clearly separates untrusted data from the command or query. For SQL calls, this means using bind variables in all prepared statements and stored procedures, and avoiding dynamic queries.

*Mitigation*: The web application uses named parameters, input validation at both a discrete per page as well as JBoss REQUEST variable level, and highly limited use of user input when constructing SQL.  Actual SQL attribution is never gleaned from user input, and all input variables on forms that reference specific attribution have an MD5 checksum applied so that discovery on the client is not feasible.  SQL roles utilized in web are managed to the level of need, thus the eauser (example) cannot modify the database schema or go outside of the schema that it is designated to use.  This reduces potential impact an account can have on the overall system.

`4.8 = (DAMAGE (7) + REPRODUCIBILITY (3) + EXPLOITABILITY (3) + AFFECTED USERS (10) + DISCOVERABILITY (1)) / 5`

### B.2.2 Broken Authentication and Session Management (APP3405)

Attacker uses leaks or flaws in the authentication or session management functions (e.g., exposed accounts, passwords, session IDs) to impersonate users.

Session management encompasses the techniques employed by web applications to transparently authorize a user for every HTTP request without having the user repeatedly login. The onus of session management must be borne by the application itself due to the stateless nature of the underlying HTTP protocol. Session management entails the application sending the client (in most cases, a web browser) a session token after successful authentication. In most cases, this token is passed via the Set-Cookie directive of HTTP and is stored on the client. The session token must then be sent by the client along with every HTTP request to the server to identify itself to the web-based application. The application can then determine whether the client is authorized to access the page being requested.

Session management mechanisms can be broadly classified into client-side and server-side mechanisms. This classification is based on the contents of the session token passed between the client and the application.

*Mitigation*: Web session management is conducted with JBoss at the application server level, see the jbossweb.sar/context.xml file for the configuration.  Session timeouts are set to 30 seconds as per jbossweb.deployer/web.xml.  The web WAR’s web.xml specifies a 720 second timeout with security features enabled.  Session IDs will not be exposed in the URL.  Tokens are generated for Save Pages (overriding session management within JBoss) and are comprised of JBoss Session Id + CAC DoD Unique ID + Java Classpath. Overall sessions with your CAC will be no more than 24 hours as per the Online Certificate Status Protocol (OCSP) configuration.

`7 = (DAMAGE (7) + REPRODUCIBILITY (4) + EXPLOITABILITY (10) + AFFECTED USERS (7) + DISCOVERABILITY (7)) / 5`

### B.2.3 Cross-Site Scripting (XSS)

Attacker sends text-based attack scripts that exploit the interpreter in the browser. Almost any source of data can be an attack vector, including internal sources such as data from the database.
Applications are vulnerable if they do not ensure that all user supplied input is properly escaped, or they do not verify it to be safe via input validation, before including that input in the output page. Without proper output escaping or validation, such input will be treated as active content in the browser.

*Mitigation*: web ensures that all user supplied input sent back to the browser is verified to be safe (via input validation), and that user input is properly escaped before it is included in the output page. Proper output encoding ensures that such input is always treated as text in the browser, rather than active content that might get executed. web utilizes validation of all input is a part of the Infrastructure code and with the use of local validation libraries as well as ESAPI all input coming into code is checked.  

`6 = (DAMAGE (7) + REPRODUCIBILITY (5) + EXPLOITABILITY (6) + AFFECTED USERS (7) + DISCOVERABILITY (5)) / 5`

### B.2.4 Insecure Direct Object References

Attacker, who is an authorized system user, simply changes a parameter value that directly refers to a system object to another object the user isn’t authorized for. Is access granted?

Applications frequently use the actual name or key of an object when generating web pages. Applications don’t always verify the user is authorized for the target object. This results in an insecure direct object reference flaw. Testers can easily manipulate parameter values to detect such flaws. Code analysis quickly shows whether authorization is properly verified.

*Mitigation*: web uses declarative Java with Annotations to determine which roles have elevated privileges. If a user modifies a URL into an area that has privileged content the FrontController facade will first check to see if subject user is allowed elevated privileges, if not a standard page will present.

`6.6 = (DAMAGE (5) + REPRODUCIBILITY (10) + EXPLOITABILITY (10) + AFFECTED USERS (4) + DISCOVERABILITY (4)) / 5`

### B.2.5 Security Misconfiguration

Attacker accesses default accounts, unused pages, unpatched flaws, unprotected files and directories, etc. to gain unauthorized access to or knowledge of the system.

Security misconfiguration can happen at any level of an application stack, including the platform, web server, application server, database, framework, and custom code. Developers and system administrators need to work together to ensure that the entire stack is configured properly. Automated scanners are useful for detecting missing patches, misconfigurations, use of default accounts, unnecessary services, etc.

*Mitigation*: web does not utilize any default accounts for either backend database or JBoss application server.  There are no files or directories without some level of protection. All settings/configuration files are configuration managed. 

`6.8 = (DAMAGE (7) + REPRODUCIBILITY (5) + EXPLOITABILITY (9) + AFFECTED USERS (5) + DISCOVERABILITY (7)) / 5`

### B.2.6 Sensitive Data Exposure

Attackers typically don’t break crypto directly. They break something else, such as steal keys, do man-in-the-middle attacks, or steal clear text data off the server, while in transit, or from the user’s browser.

The most common flaw is simply not encrypting sensitive data. When crypto is employed, weak key generation and management, and weak algorithm usage is common, particularly weak password hashing techniques. Browser weaknesses are very common and easy to detect, but hard to exploit on a large scale. External attackers have difficulty detecting server side flaws due to limited access and they are also usually hard to exploit.

*Mitigation*: web uses organizationally defined SSL to secure communications both to and from the user, as well as to and from the backend database.  Keys and algorithms are defined by the Government client.  The web does not contain any SECRET or sensitive information such as credit card number or PII.  

`5.6 = (DAMAGE (5) + REPRODUCIBILITY (5) + EXPLOITABILITY (5) + AFFECTED USERS (4) + DISCOVERABILITY (9)) / 5`

### B.2.7 Missing Function Level Access Control

Attacker, who is an authorized system user, simply changes the URL to a parameter to a privileged function. Is access granted? Anonymous users could access private pages that aren’t protected.

Applications do not always protect application functions properly. Sometimes, function level protection is managed via configuration, and the system is misconfigured. Sometimes, developers must include the proper code checks, and they forget.

Detecting such flaws is easy. The hardest part is identifying which pages (URLs) or functions exist to attack.

*Mitigation*: The web utilizes a FrontController facade which manages access to every portion of the site. A WebServiceController provides the same level of management for web services. The authorization matrix is explicit, if you are not authorized to be in a particular portion of the site you will be denied access. If a user changes the URL to an area they are not authorized for (seeking elevated privileges) they will be blocked using Declarative Java annotations. If a URL is modified in an attempt to get the user to data they are not supposed to see, the backend DAO will block access using a rigidly enforced organizational access filter and restrict where necessary.

`5.8 = (DAMAGE (5) + REPRODUCIBILITY (4) + EXPLOITABILITY (10) + AFFECTED USERS (4) + DISCOVERABILITY (6)) / 5`

### B.2.8 Cross-Site Request Forgery

Attacker creates forged HTTP requests and tricks a victim into submitting them via image tags, XSS, or numerous other techniques. If the user is authenticated, the attack succeeds.

CSRF takes advantage the fact that most web apps allow attackers to predict all the details of a particular action.  Because browsers send credentials like session cookies automatically, attackers can create malicious web pages which generate forged requests that are indistinguishable from legitimate ones.  Detection of CSRF flaws is fairly easy via penetration testing or code analysis.

*Mitigation*: The web uses a security token that is generated on the fly per edit/save pairing, so that “tricking” a user into navigating to a save page would not cause a save to occur, but instead would throw a security error in the log file.

`6.2 = (DAMAGE (5) + REPRODUCIBILITY (7) + EXPLOITABILITY (10) + AFFECTED USERS (4) + DISCOVERABILITY (5)) / 5`

### B.2.9 Using Components with Known Vulnerabilities

Attacker identifies a weak component through scanning or manual analysis. He customizes the exploit as needed and executes the attack. It gets more difficult if the used component is deep in the application.

Virtually every application has these issues because most development teams don’t focus on ensuring their components/libraries are up to date. In many cases, the developers don’t even know all the components they are using, never mind their versions. Component dependencies make things even worse.

*Mitigation*: Each component of the web is checked for updates regularly and patches are applied when available.

`7 = (DAMAGE (9) + REPRODUCIBILITY (4) + EXPLOITABILITY (5) + AFFECTED USERS (8) + DISCOVERABILITY (9)) / 5`

### B.2.10 Unvalidated Redirects and Forwards

Attacker links to unvalidated redirect and tricks victims into clicking it. Victims are more likely to click on it, since the link is to a valid site. Attacker targets unsafe forward to bypass security checks.

Applications frequently redirect users to other pages, or use internal forwards in a similar manner. Sometimes the target page is specified in an unvalidated parameter, allowing attackers to choose the destination page.  Detecting unchecked redirects is easy. Look for redirects where you can set the full URL. Unchecked forwards are harder, because they target internal pages.

*Mitigation*: The web uses referrer checks on state-changing pages to ensure the user is coming from the previous page expected.  In addition, each page is annotated for role access and checked for organizational access before allowing a user to view it.

`6.2 = (DAMAGE (5) + REPRODUCIBILITY (6) + EXPLOITABILITY (10) + AFFECTED USERS (5) + DISCOVERABILITY (5)) / 5`

## B.3 STRIDE

STRIDE is a classification scheme for characterizing known threats according to the kinds of exploit that are used (or motivation of the attacker). The STRIDE acronym is formed from the first letter of each of the following categories.

### Spoofing Identity

“Identity spoofing” is a key risk for applications that have many users but provide a single execution context at the application and database level. In particular, users should not be able to become any other user or assume the attributes of another user.

*Mitigation*: The web app uses PKI authentication to prevent the possibility of identity spoofing. In addition, new user account requests are vetted by a human agent before being granted access.

###Tampering with Data

Users can potentially change data delivered to them, return it, and thereby potentially manipulate client-side validation, GET and POST results, cookies, HTTP headers, and so forth. The application should not send data to the user, such as interest rates or periods, which are obtainable only from within the application itself. The application should also carefully check data received from the user and validate that it is sane and applicable before storing or using it.

*Mitigation*: The web app uses both client-side and server-side validation to prevent both accidental as well as malicious data manipulation. The web edit pages use obfuscated input field names that do not match the rendered field names of a view page.

### Repudiation

Users may dispute transactions if there is insufficient auditing or recordkeeping of their activity. For example, if a user says, “But I didn’t transfer any money to this external account!”, and you cannot track his/her activities through the application, then it is extremely likely that the transaction will have to be written off as a loss. Therefore, consider if the application requires non-repudiation controls, such as web access logs, audit trails at each tier, or the same user context from top to bottom. Preferably, the application should run with the user’s privileges, not more, but this may not be possible with many off-the-shelf application frameworks.

*Mitigation*: The web app uses both user roles as well as organizational filters to compartmentalize the portions of the site that a user is allowed to utilize. The web also incorporates a transaction log which saves relevant details of each transaction (minus views) per user. The web server and access logs are audited at regular intervals.

### Information Disclosure

Users are rightfully wary of submitting private details to a system. If it is possible for an attacker to publicly reveal user data at large, whether anonymously or as an authorized user, there will be an immediate loss of confidence and a substantial period of reputation loss. Therefore, applications must include strong controls to prevent user ID tampering and abuse, particularly if they use a single context to run the entire application. Also, consider if the user’s web browser may leak information. Some web browsers may ignore the no caching directives in HTTP headers or handle them incorrectly. In a corresponding fashion, every secure application has a responsibility to minimize the amount of information stored by the web browser, just in case it leaks or leaves information behind, which can be used by an attacker to learn details about the application, the user, or to potentially become that user. Finally, in implementing persistent values, keep in mind that the use of hidden fields is insecure by nature.

Such storage should not be relied on to secure sensitive information or to provide adequate personal privacy safeguards.

*Mitigation*: The web app does not store any information on the client-side. All data is saved and stored on the server-side. 

### Denial of Service

Application designers should be aware that their applications may be subject to a denial of service attack. Therefore, the use of expensive resources such as large files, complex calculations, heavy-duty searches, or long queries should be reserved for authenticated and authorized users, and not available to anonymous users.

For applications that do not have this luxury, every facet of the application should be engineered to perform as little work as possible, to use fast and few database queries, to avoid exposing large files or unique links per user, in order to prevent simple denial of service attacks.

*Mitigation*: The web app does not support any functionality for anonymous users; all functions require authentication and authorization.

### Elevation of Privilege

If an application provides distinct user and administrative roles, then it is vital to ensure that the user cannot elevate his/her role to a higher privilege one. In particular, simply not displaying privileged role links is insufficient. Instead, all actions should be gated through an authorization matrix, to ensure that only the permitted roles can access privileged functionality.

*Mitigation*: The web app enforces a strict authorization matrix for each page based on both roles and organizational filters. Privileged links are inaccessible to unprivileged users both by not being shown as well as prevention of use by the Controller (PageController performs role checks and org checks and enforces the annotated privileges on each page). Non-administrative users cannot modify their own access level.

