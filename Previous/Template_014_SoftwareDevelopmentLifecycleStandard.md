# Title: Software Development Standard

## Definition:

## Requirements/Specifications/Guidelines:

## Measurable and Actionable:

## Purpose:

## Timeliness:


## Reference(s)
 + [Application Security Development (ASD) Security Technical Implementation Guide (STIG) version 6, release 3 (APSC-DV-003400)](https://www.cyber.mil/stigs/downloads)
   + APSC-DV-003400, The Program Manager must verify all levels of program management, designers, developers, and testers receive annual security training pertaining to their job function.
 + [Software Engineering for Continuous Delivery of Warfighting Capability, 2023/04](https://www.cto.mil/wp-content/uploads/2023/07/SWE-Guide-April2023.pdf)
 + [DOD Enterprise DevSecOps Fundamentals, v 2.5, 2024/10](https://dodcio.defense.gov/Portals/0/Documents/Library/DoD%20Enterprise%20DevSecOps%20Fundamentals%20v2.5.pdf)
 + [NIST Special Publication 800-37 (“Risk Management Framework for Information Systems and Organizations"), Rev 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-37r2.pdf)
 + [NIST Secure Software Development Framework (SSDF), SP 800-218A](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218A.pdf)
 + [CISA Securing the Software Supply Chain](https://www.cisa.gov/sites/default/files/publications/ESF_SECURING_THE_SOFTWARE_SUPPLY_CHAIN_DEVELOPERS.PDF)
____________________________________________________________________________________________________________________________________
## **Template**

# Software Development Lifecycle (SDLC)

## Name of the Project

### Sponsor Name, Department, Email

### Date ISO 8601

### Latest Version of Document or Project if Synced

## History of Work Performed

## Versioning

|Version       |Description                                                                                                         |
|--------------|--------------------------------------------------------------------------------------------------------------------|
|v0.1          | Inception source code, totally alpha, v0.1  |
|v1.1.24       | v1.1.24 ASD STIG v5 updates                 |
|v1.2.00       | v1.2.00 ASD STIG v6r3 updates               |

## Executive Summary

*The intent of this document is to provide a representative example of what an example SDLC might look like.*

### Introduction

The Software Development Life Cycle (SDLC) is a structured process used by development teams to design, build, test, and deploy software. It helps ensure the software meets user needs, is delivered on time, and is of high quality.

The SDLC typically includes these key stages:

*Planning:* Define project goals, requirements, scope, schedule, and resources.

*Requirements Analysis:* Gather and analyze detailed user and business requirements.

*Design:* Create the software architecture, system design, and user interface plans.

*Implementation (Coding):* Developers write the actual code according to designs and standards.

*Testing:* Verify the software works correctly, is free of bugs, and meets requirements through various tests.

*Deployment:* Release the software to users and configure it in the production environment.

*Maintenance:* Provide ongoing support, fix issues, and update the software over time.

SDLC provides a roadmap that guides each phase methodically, helping ensure efficient, predictable, and successful software development and delivery. Different methodologies (like Waterfall, Agile, Spiral) apply these stages in varied ways tailored to specific project needs.

### Secure Design Principal Training (APSC-DV-003400)

Many application team members may not be aware of the security implications regarding the code that they design, write and test. To address this concern, the Program Manager will ensure all levels of program management receive security training regarding the necessity, impact, and benefits of integrating secure development practices into the development lifecycle. 

This training is in addition to DoD 8570 training requirements as DoD 8570 annual security training does not presently cover application SDLC security concerns.

The Program Manager will ensure development team members are provided training on secure design principles for the entire SDLC and newly discovered vulnerability types on, at least, an annual basis. 

Development team members include:

- Designers/Application Architects
- Developers/Programmers
- Testers
- Application managers

Security Training completed by team in support of Secure Software Development Practices:

**Security Training (APSC-DV-003400)**

|Training Name  | Date Reviewed | Description                                                          |
|---------------|---------------|----------------------------------------------------------------------|
|OWASP Top Ten  |????/??/??     |Internal training covering the OWASP Top Ten for 2017 and implications for this application.|
|SDLC 101       |????/??/??     |http://safecode.org/courses/security-development-lifecycle-101        |
|CyberAwareness |????/??/??     |DoD Requirement                                                       |

##### Standards

Development efforts will follow the processes specified in the Process Asset Library (PAL) or other standards specified in a kick-off meeting.  Enumerate the different processes and provide a hyperlink to their authoritative location.

#### PAL

*where?* Reference: [standards and best practices](https://confluence.di2e.net/display/NRL7331) used per project and by the team.

#### Software Configuration Management (APSC-DV-003010)

Software Configuration Management (SCM) is the process of tracking code as it is developed, maintaining versions of code and their histories and ensuring that only one person at a time is making changes to a given section of code.  The importance of SCM cannot be overstated, especially in a development environment with multiple programmers. 

The application is modified using a Trunk/Branch/Tag methodology and the Git repository management system .  Each modification will be tracked as a task which in turn will be the basis for software modification, testing, and eventual feature release.  All modifications will be correlated to the host/parent organization tracking/requirements system which authorizes the work.

Objects considered eligible for deployment:

+ Source Code (\*.c, \*.sh, \*.md, \*.html, \*.(all graphics formats) )
+ Configuration/Settings files
+ Libraries used for execution at build and run-time

*Describe your repository setup and Reference.*

[VISOR Central Repository](https://bitbucket.di2e.net/projects/NRL7331/repos/visor_gops_parser/browse)

Additional information regarding operational deployment is in the section Transferring Code from Development to Deployment (APSC-DV-003010).

All modifications to any configurable part of the project will be managed and tracked by using the tracking system.

Each time this software is released a new version is indicated and a tag created, all change requests are recorded in the version history for that release.  The team will have an environment that will represent the release of all software deployments.  All software components, source code, libraries, and project documentation will be encapsulated within repository name with URI under specific structure requirements highlighted in the top level of the repository.  

Individual tag history is stored with each project in a corresponding README.md file at the top level of the folder.

For a baseline of all components of the software package refer to the Deployment folder for the last deployment which should contain:
+ Test Case report.
+ Sonar Source report.
+ Unit, Human Testing, Technical Acceptance Test | User Acceptance Test report.
+ Security scan report (Sonar duplicates this function).
+ A copy of the actual software and any supplementary content to deploy as in the binary release.
+ Reference to the reference for repository for subject release of the following components:
+ Source Code.
+ Documentation. 
+ Architecture diagram, embedded within documentation.
+ Design document (this document).
+ User Release Notes
+ Application Configuration Guide
+ Setup Guide
+ Installation Guide

## Build Environment 

### Introduction Coding Standards (APSC-DV-003215)

#### Definition

Common programming standards are adhered to for the following reasons:

+ Programmers can go into any code and determine the status   which increases maintainability, readability, and reusability.
+ New programmers can rapidly grasp their status.
+ Programmers that are unfamiliar with a programming language have a common standard which alleviates the need to develop a personal style.
+ Standard programming language reduces errors and increases reliability.
+ Individual styles are replaced, and an emphasis is placed on business concerns - high productivity, maintainability, shared authorship, and other aspects that help the group achieve its goal. 

See: http://www.cse.buffalo.edu/~rapaport/code.documentation.Excerpts.pdf  for details and a more robust explanation as to why a coding standard is necessary.

#### Scope

Coding standards are outlined on  *where?*  Reference: [DI2E Confluence NRL 7331 HOWTO](https://confluence.di2e.net/display/NRL7331/How-to+articles) under: Profiling Applications, Code Review, Transition Environment, Git Best Practices and Sample Log Helper Scriptlets, Development Knowledge, Format and Linting tools.

Note that each project has a build and test script associated with it.

**Coding format / standards:**

| Specification           | Sub-Component            | Purpose                      |
|-------------------------|--------------------------|------------------------------|
| Doxygen                 | VISOR (visor_gops_parser)|Documentation                |
| Markdown README.md      | All                      | Documentation                |
| SonarQube               | VISOR (visor_gops_parser)| Compliance inspection and security |
| Visual Code Grep Scanner| VISOR (visor_gops_parser)| C/C++ static code analysis     |
| Shellcheck              | Consolidated System      | Compliance/Standards inspection|

#### General Conventions - C / Bash / Ksh languages used

##### Unsafe Methods (APSC-DV-003210)

Unsafe methods are those that have side-effects that are not understood properly or require elevated security privileges to perform their function.  No unsafe methods are utilized in this system.  Functions such as strlen and related string manipulation functions are not used.  Research into best C practices for unsafe functions was conducted and all relevant function calls replaced with known good representations of the same function.

Classic list of recognized unsafe functions:

+ strcpy -> strncpy -> strlcpy/strcpy_s.
+ strcat -> strncat -> strlcat/strcat_s -strtok.
+ sprintf -> snprintf.
+ vsprintf -> vsnprintf.
+ gets -> fgets/gets_s.
+ makepath -> _makepath_s (MSDN)
+ _splitpath -> _splitpath_s (MSDN)
+ scanf/sscanf -> sscanf_s (MSDN
+ ato\*

A grep performed on all \*.c source files indicates the unsafe functions are not in use except in these locations:

+ strncpy is used in libProduct and visor_gops_parser at three instances.  Extensive research into various tools, libraries, and commentary by developers indicates that this is a bottomless pit if one attempts to add strlcpy to C source code.  Subject strncpy stands and is used careful with input validation backing defenses.

Other considerations are the output by Flaw Finder:
1. Multiple references to format strings (CWE-134).  This is a library pulled in from a 3rd party and reviewed.  Inputs provided to the log.c code are all generated by the developer.  In the event an external string is provided to the log.c routines subject external input would be scrubbed for input by 
2. References to CWE-362/CWE-367.  As previously stated, this code should be run using the lowest privileges that are required to accomplish the necessary tasks. If possible, create isolated accounts with limited privileges that are only used for a single task. That way, a successful attack will not immediately give the attacker access to the rest of the software or its environment. Also note that files are closed after use, user input is validated, see ***validate_*** routines, subject files are not open and closed multiple times, and race conditions are met with the fcntl library that locks the .out files created during program execution.  NetCDF's don't have a locking mechanism for shared reading thus the input is unaltered.

3. Buffer boundary checking referenced in the report for libll.c are invalid as this routine is a debugging routine to support output of data to ASCII format.  Use of snsprintf helps prevent overflow.  Commentary regarding log.c buffers do not take the sizeof(buf) into account and are a false positive.

4. memcpy concerns in visor_gops_parser are mitigated by specifically checking incoming strings for size, calculating maximum size and then allocating bytes.

[Unsafe C functions and the replacement](https://stackoverflow.com/questions/26558197/unsafe-c-functions-and-the-replacement]

##### System Executables

No system commands are called in compiled code.

##### No URL's in Compiled Code

As this is not a web application, no URL`'`s are stored within source code.

##### Exceptions/Error Messages

Error messages (Exceptions) will be invoked with a custom class (API infrastructure) specifically designed to support the Application Development STIG to ensure no information expressed during error (stack traces) are displayed to the end-user thus revealing information that could be deemed valuable to an attacker.  Output of error should go to the log, based on log levels, and an obfuscated/reduced output should be displayed to the end user.

The application must not be subject to error handling vulnerabilities (APSC-DV-003235).
The software specific error/exception class will extend from the base functionality of the existing language error/exception class/object.

This application was designed to test the "contract" by which it was written and to fail fast if that contract is broken without authorizing additional capabilities due to failure.

A domain of standard responses, which are application specific, will be matured over time based on encounters of the running package.

### Best Practices

The following are employed as part of "standard practice" within the VISOR system.

#### Local Variables

+ Do not name local variables with the same name as an instance (global scope) variable.
+ One per line.
+ Use the local variable for only one thing.

#### Methods

+ Separate with blank lines.
+ Refactor where appropriate.  If you have a method that takes more than 60 seconds to understand, break it into helper methods.  
+ Reuse.  If you have a routine that is called by someone/something else consider incorporation into a larger schema for access such as our APIs.

#### Imports/Library references

+ Use separate lines.
+ Preference is to group as follows: 1) standard library 2) related third party 3) local project
+ Bulk import for #1, #2, and #3 bring in specific objects needed.
+ Regardless, be consistent.
+ Remove unused import statements; leverage the IDE to find these if possible.

#### Error Handling

+ All code will be written to degrade gracefully...if possible and where appropriate.
  +  Exhaustive testing to ensure *fail fast* is used throughout the code base.
+ All routines that the developer considers "risky" meaning have potential for failure or the developer recognized potential flaw in algorithm and is unsure of a solution will wrap the code in the equivalent of a try/catch/finally.
+ All results of failure will gracefully degrade and report the error along with meaningful commentary.

#### Abstraction

Always abstract one level between API's and invocation. Constants are used as extensively as possible and when used more than once or there is a potential for modification subject values are placed in a configuration file.

#### Source Formatting

All source, for the entire project, will be formatted prior to a tag being created using, preferred, an external formatting tool thus ensuring no dependency on a specific IDE.  See standards section for details on tools used for source code formatting.  Use of `uncrustify` was utilized.

#### Static Code Analysis 

Source code will be scanned for classic errors using a standardized tool (could be considered standard if a custom written solution is the only way to verify error for a language).
+ No issues flagged as Critical will be permitted to go forward into a release unless agreed to by team.
+ Update tool configuration file so error doesn't propagate.
+   SonarQube is used to help manage static code analysis, see [Test Case](../testcase/index.html) documentation for details regarding SonarQube instance that supports this project.
+   Visual Code Grepper (windows based) is used to help manage static code analysis as well, see [Test Case](../testcase/index.html) documentation for details regarding SonarQube instance that supports this project.

 
### Top 10 Secure Coding Practices (Software Engineering Institute)

 1. Validate input Validate input from all untrusted data sources. Proper input validation can eliminate most software vulnerabilities. Be suspicious of most external data sources, including command line arguments, network interfaces, environmental variables, and user controlled (APSC-DV-002530, APSC-DV-002560).  ***Performed on all user input received, see `validate_` routines.***

 2. Heed compiler warnings. Compile code using the highest warning level available for your compiler and eliminate warnings by modifying the code. Use static and dynamic analysis tools to detect and eliminate additional security flaws.  ***Compiler warnings are kept to a bare minimal.  Compiler details and log results are made available in the [Test Case](../testcase/index.html)***

 3. Architect and design for security policies. Create software architecture and design your software to implement and enforce security policies. For example, if your system requires different privileges at different times, consider dividing the system into distinct intercommunicating subsystems, each with an appropriate privilege set.  ***SELinux concerns would have to be addressed for those applications associated with this effort.***

 4. Keep it simple. Keep the design as simple and small as possible. Complex designs increase the likelihood that errors will be made in their implementation, configuration, and use. Additionally, the effort required to achieve an appropriate level of assurance increases dramatically as security mechanisms become more complex.

 5. Default deny. Base access decisions on permission rather than exclusion. This means that, by default, access is denied, and the protection scheme identifies conditions under which access is permitted.

 6. Adhere to the principle of least privilege. Every process should execute with the least set of privileges necessary to complete the job. Any elevated permission should be held for a minimum time. This approach reduces the opportunities an attacker must execute arbitrary code with elevated privileges. ***This system was designed to support only a basic user account with appropriate access to file system areas designated in the configuration file.***

 7. Sanitize data sent to other systems. Sanitize all data passed to complex subsystems such as command shells, relational databases, and commercial off-the-shelf components. Attackers may be able to invoke unused functionality in these components using SQL, command, or other injection attacks. This is not necessarily an input validation problem because the complex subsystem being invoked does not understand the context in which the call is made. Because the calling process understands the context, it is responsible for sanitizing the data before invoking the subsystem. ***All user supplied input is validated for erroneous characters.***

 8. Practice defense in depth. Manage risk with multiple defensive strategies, so that if one layer of defense turns out to be inadequate, another layer of defense can prevent a security flaw from becoming an exploitable vulnerability and/or limit the consequences of a successful exploit. For example, combining secure programming techniques with secure runtime environments should reduce the likelihood that vulnerabilities remaining in the code at deployment time can be exploited in the operational environment.

  9. Use effective quality assurance techniques. Good quality assurance techniques can be effective in identifying and eliminating vulnerabilities. Fuzz testing, penetration testing, and source code audits should all be incorporated as part of an effective quality assurance program. Independent security reviews can lead to more secure systems. External reviewers bring an independent perspective; for example, in identifying and correcting invalid assumptions. ***Source code is internally code reviewed, discussion of algorithms is held with team members, and SonarQube is used for compliance checks.***

   10. Adopt a secure coding standard. Develop and/or apply a secure coding standard for your target development language and platform.

### Transferring Code from Development to Deployment (APSC-DV-003010)

As referenced in section, Build Environment, multiple environments are used to develop this application. Build and Test (BAT) is the actual developer's workstation.  Code is written after the trunk is branched and the appropriate change request is updated.  The developer implements the algorithm/modifications to their branch on their workstation and conducts tests prior to reintegration of the branch into the trunk.  

The Operational environment will be hosted on *where?* resources and maintenance of both environment and security fall to that organization's administrative staff.

#### Deployment

The final steps in any deployment are to specifically test both general functionality as well as specific functionality of what was released with the specific stakeholder for each change request.

Deployment will have a guide and a specific tag identified as part of the transition document.

TODO: Consider Ansible deployment script.

#### Creation of Deployment Materials

Application files must be cryptographically hashed prior to deploying DoD operational networks (ASPC-DV-003140). 
Indicate where deployment materials are kept as part of a deployment, if using a code repository be sure to include the URI.