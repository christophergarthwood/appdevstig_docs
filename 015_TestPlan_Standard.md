# Testing Standard

[TOC]

## Template / References

*Template* - [Test Template](./015_TestPlan_Template.md)

## Definition:

A test plan for software development, explained in plain language, is a document that outlines what needs to be tested in a software project, how it will be tested, who will do the testing, and when it will happen. It acts like a roadmap for the testing team to make sure all-important parts of the software are checked before release to catch any problems.

## Purpose:

The test plan helps organize testing efforts, ensures nothing important is missed, and improves the quality and reliability of the final software.

## Requirements/Specifications/Guidelines:

A test plan typically includes:

+ The goals of testing (what you want to verify works correctly)
+ The features or parts of the software that will be tested
+ The testing approach and types of tests (like functional or performance testing)
+ The schedule and key dates for testing activities
+ Who is responsible for different testing tasks
+ The tools and environments needed for testing
+ Criteria for deciding when testing is complete
+ How to handle and track bugs found during testing

## Measurable and Actionable:

Evidence of a test plan must exist prior to each release and be included with the deliverable.

## Timeliness:

+ Per release of the application.
+ Per change testing against the change itself after incorporation into the baseline of tests (if appropriate).
+ Per DevSecOps execution for a targeted set of tests.

## Reference(s):
 + [Software Engineering for Continuous Delivery of Warfighting Capability, 2023/04](https://www.cto.mil/wp-content/uploads/2023/07/SWE-Guide-April2023.pdf)
 + [DoW Enterprise DevSecOps Fundamentals, v 2.5, 2024/10](https://dodcio.defense.gov/Portals/0/Documents/Library/DoD%20Enterprise%20DevSecOps%20Fundamentals%20v2.5.pdf)
 + [NIST Special Publication 800-37 (“Risk Management Framework for Information Systems and Organizations"), Rev 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-37r2.pdf)
 + [NIST Secure Software Development Framework (SSDF), SP 800-218A](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218A.pdf)
 + [CISA Securing the Software Supply Chain](https://www.cisa.gov/sites/default/files/publications/ESF_SECURING_THE_SOFTWARE_SUPPLY_CHAIN_DEVELOPERS.PDF)
 + [Application Security Development (ASD) Security Technical Implementation Guide (STIG) version 6, release 5 (APSC-DV-003400)](https://www.cyber.mil/stigs/downloads)
  + APSC-DV-003130, Prior to each release of the application, updates to system, or applying patches; tests plans and procedures must be created and executed.
  + APSC-DV-003150, At least one tester must be designated to test security flaws in addition to functional testing.
  + APSC-DV-003160, Test procedures must be created and at least annually executed to ensure system initialization, shutdown, and aborts are configured to verify the system remains in a secure state.
  + APSC-DV-003400, The Program Manager must verify all levels of program management, designers, developers, and testers receive annual security training pertaining to their job function.
  + APSC-DV-003180, Code coverage statistics must be maintained for each release of the application.
  + ASPC-DV-001995,Application must not be vulnerable to race conditions, test by code review or static code analysis.
  + ASPC-DV-002400,Restrict ability to launch DoS attacks, use code review, penetration or vulnerability testing for results that indicate attempts to DoS the application or use the application in DoS.
  + ASPC-DV-002500, Protect from CSRF vulnerabilities, review code review reports and the vulnerability assessment scan, test plan / configuration should attempt CSRF attack with results saved.
  + ASPC-DV-002590, Application must not be vulnerable to overflow attacks. A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code. |A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code.
  + ASPC-DV-002930, The ISSO must ensure active vulnerability testing is performed. The ISSO must ensure active vulnerability testing is performed.  It is imperative that automated scanning tools are configured properly to ensure that all the application components that can be tested are tested. In the case of web applications, some of the application code base may be accessible on the website and could potentially be corrected by a knowledgeable system administrator. Active testing is different from code review testing in that active testing does not require access to the application source code base. A code review requires complete code base access and is normally performed by the development team.
  + APSC-DV-001460, An application vulnerability assessment must be conducted.
  + APSC-DV-002310, The application must fail to a secure state if system initialization fails, shutdown fails, or aborts fail. This should be part of the test plan.
  + APSC-DV-002485, The application must not store sensitive information in hidden fields. Request most recent code review and vulnerability scan results.  Review test configuration to ensure testing for hidden fields was conducted.  Review test results for incidents of hidden data fields.
  + APSC-DV-002510, The application must protect from command injection... test for command injection.
  + APSC-DV-002520, The application must protect from canonical representation vulnerabilities.   You must test your application with your supported browsers to determine if they pass in fully encoded double byte characters safely.
  + APSC-DV-002530, The application must validate all input, Comprehensive application security testing and code reviews are required to ensure the application is not vulnerable to input validation vulnerabilities.
  + APSC-DV-002540, The application must not be vulnerable to SQL Injection. Request the latest vulnerability scan test results.  Verify the scan configuration is configured to test for SQL injection flaws.  Review the scan results to determine if any SQL injection flaws were detected during application testing.
  + APSC-DV-002550, The application must not be vulnerable to XML-oriented attacks. Review the latest application vulnerability assessment and verify the scan was configured to test for XML-related vulnerabilities and security issues.
  + APSC-DV-002560, The application must not be subject to input handling vulnerabilities. If the vulnerability scan is not configured to test for input validation vulnerabilities if the most recent scan results show that high risk input validation vulnerabilities exist and a documented risk acceptance from the ISSO is not available, or if the scan results do not exist, this is a finding.
  + APSC-DV-002590, A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code.
  + APSC-DV-002870, Unsigned Category 1A mobile code must not be used in the application in accordance with DoW policy. Next, test the application. This testing should include functional testing from all major components of the application.
  + APSC-DV-003235, The application must not be subject to error handling vulnerabilities. Check test results for identified error handling vulnerabilities within the application.
  + APSC-DV-002250, Applications must use system-generated session identifiers that protect against session fixation. Application session testing is required to verify this requirement.
  + APSC-DV-002280, The application must not re-use or recycle session IDs. Application session testing is required to verify this requirement.
  + APSC-DV-002930, The ISSO must ensure active vulnerability testing is performed. Ask the application representative to provide vulnerability test procedures and vulnerability test results.

