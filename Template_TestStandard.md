# Test Plan Standard

## Reference:
Application Configuration Guide (ASD) Security Technical Implementation Guide (STIG) Version 6, Release 3, 2025/04/02
  - APSC-DV-003130, Prior to each release of the application, updates to system, or applying patches; tests plans and procedures must be created and executed.
  - APSC-DV-003150, At least one tester must be designated to test for security flaws in addition to functional testing.
  - APSC-DV-003160, Test procedures must be created and at least annually executed to ensure system initialization, shutdown, and aborts are configured to verify the system remains in a secure state.
  - APSC-DV-003400, The Program Manager must verify all levels of program management, designers, developers, and testers receive annual security training pertaining to their job function.
  - APSC-DV-003180, Code coverage statistics must be maintained for each release of the application.
  - ASPC-DV-001995,Application must not be vulnerable to race conditions, test by code review or static code analysis.
  - ASPC-DV-002400,Restrict ability to launch DoS attacks, use code review, penetration or vulnerability testing for results that indicate attempts to DoS the application or use the application in DoS.
  - ASPC-DV-002500, Protect from CSRF vulnerabilities, review code review reports and the vulnerability assessment scans, test plan / configuration should attempt CSRF attack with results saved.
  - ASPC-DV-002590, Application must not be vulnerable to overflow attacks.A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code. |A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code.
  - ASPC-DV-002930, The ISSO must ensure active vulnerability testing is performed.The ISSO must ensure active vulnerability testing is performed.  It is imperative that automated scanning tools are configured properly to ensure that all of the application components that can be tested are tested. In the case of web applications, some of the application code base may be accessible on the website and could potentially be corrected by a knowledgeable system administrator. Active testing is different from code review testing in that active testing does not require access to the application source code base. A code review requires complete code base access and is normally performed by the development team.
  - APSC-DV-001460, An application vulnerability assessment must be conducted.
  - APSC-DV-002310, The application must fail to a secure state if system initialization fails, shutdown fails, or aborts fail. This should be part of the test plan.
  - APSC-DV-002485, The application must not store sensitive information in hidden fields. Request most recent code review and vulnerability scan results.  Review test configuration to ensure testing for hidden fields was conducted.  Review test results for incidents of hidden data fields.
  - APSC-DV-002510, The application must protect from command injection... test for command injection.
  - APSC-DV-002520, The application must protect from canonical representation vulnerabilities.   You must test your application with your supported browsers to determine if they pass in fully encoded double byte characters safely.
  - APSC-DV-002530, The application must validate all input, Comprehensive application security testing and code reviews are required to ensure the application is not vulnerable to input validation vulnerabilities.
  - APSC-DV-002540, The application must not be vulnerable to SQL Injection. Request the latest vulnerability scan test results.  Verify the scan configuration is configured to test for SQL injection flaws.  Review the scan results to determine if any SQL injection flaws were detected during application testing.
  - APSC-DV-002550, The application must not be vulnerable to XML-oriented attacks. Review the latest application vulnerability assessment and verify the scan was configured to test for XML-related vulnerabilities and security issues.
  - APSC-DV-002560, The application must not be subject to input handling vulnerabilities. If the vulnerability scan is not configured to test for input validation vulnerabilities if the most recent scan results show that high risk input validation vulnerabilities exist and a documented risk acceptance from the ISSO is not available, or if the scan results do not exist, this is a finding.
  - APSC-DV-002590, A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code.
  - APSC-DV-002870, Unsigned Category 1A mobile code must not be used in the application in accordance with DoD policy. Next, test the application. This testing should include functional testing from all major components of the application.
  - APSC-DV-003235, The application must not be subject to error handling vulnerabilities. Check test results for identified error handling vulnerabilities within the application.
  - APSC-DV-002250, Applications must use system-generated session identifiers that protect against session fixation. Application session testing is required in order to verify this requirement.
  - APSC-DV-002280, The application must not re-use or recycle session IDs. Application session testing is required in order to verify this requirement.
  - APSC-DV-002930, The ISSO must ensure active vulnerability testing is performed. Ask the application representative to provide vulnerability test procedures and vulnerability test results.



Here's my process for code review, grouped into a couple of points. The process provides questions I ask myself to help me focus on a code change and its consequences. You don't need to go in this specific order. If there's a step, you can't execute for any reason, just move to another step.

1. Understand the change, what it's trying to solve, and why.
The explanation of why the change is needed and any relevant context should be in the commit message. If it isn't, request it and feel free to -1 until it's provided.
Is it something that needs to be solved? Is it something the project should focus on, or is it completely out of scope?
2. How would you implement the solution? Would it be different?
At this point, you know what the code change is about. How would you have done it? Think about this before reviewing the change in detail. If the solution you have in mind is different from the one you're reviewing, and you think it's better, bring that up in the review. You don't need to -1 it; just ask why the author didn't go in this direction and see how the discussion evolves.
3. Run the code with and without the change
I usually put a few breakpoints into the code, run it, and inspect how the new code interacts with the rest.
If you can't run the whole code, try to copy the function containing the new code to a new local file, simulate the input data, and run that. This is helpful when you either don't know how to run the whole project or when it requires a specific environment to which you don't have access.
4. Can the new code break anything?  Think about the consequences of the new implementation.  In the case of a new command-line option, will it always be accepted by the target?  Can a situation occur when the option wouldn't be accepted or when it could conflict with something?  Maybe it's a new import. Is the new library, and possibly a new dependency, available in the older releases or systems you ship the project for?  What about security? Is the new dependency safe to use? The least you can do is run a quick Internet search to find out. Also, look for warnings in the console log. Sometimes there are more secure methods within the same library.
5. Is the code effective?  You've determined that the proposed solution is probably correct. Now it's time to check the code itself, its effectiveness, and its necessity.  Check the style of the new code. Does it match the style of the project? Any open source project has (or should have) a document informing (new) contributors about the styles and good practices the project follows.
For instance, every project in the OpenStack community has a HACKING.rst file. There's often also a guide for new contributors with all the must-know information.
6. Check that all new variables and imports are used.  Often, there have been many iterations of the code you're reviewing, and sometimes the final version is very different from when it started. It's easy to forget an import or a new variable that was needed in a former version of the new code. Automation usually checks these things using linting tools like flake8 in the case of Python code.  Can you rewrite the code without declaring new variables? Well, usually, yes, but the question is whether it's better that way. Does it bring any benefit? The goal isn't to create as many one-liners as possible. The goal is to write code that is both efficient and easy to read. 
7. Are the new functions or methods necessary?  Is there a similar function that can be reused somewhere in the project? It's always worth helping to avoid reinventing the wheel and re-implementing logic that's already been defined.
8. Are there unit tests?  If the patch adds a new function or new logic in a function, it should also include new unit tests for that. It's always better when the author of a new function also writes unit tests for it.
9. Verify refactoring
If the commit refactors existing code (it renames a variable, changes variable scope, changes the footprint of a function by adding or removing arguments, or removes something), ask yourself:
	1.	Can this be removed? Will it affect the stable branch?
	2.	Are all the occurrences deleted?  You can use the grep command to find out. You wouldn't believe how many times I've voted -1 just because of this. This is a simple mistake that anyone can make, but that also means anyone can uncover it.  The owner of the commit can easily overlook these things, which is totally understandable. It's happened to me many times too. I'd finally figured out the root of the problem I'd been fixing, so I was in a rush to propose the review, and then I forgot to check the whole repo.  Apart from the project's repository, sometimes it's also necessary to check other code consumers. If some other project imports this one, they may need refactoring, too. In the OpenStack community, we have a tool that searches across every community project.
10. Does project documentation need to be modified?  Again, you can use the grep command to check whether the project documentation mentions anything related to the code change. Apply common sense to determine whether a change needs to be documented for end users or it's just an internal change that doesn't affect user experience.  Bonus tip: Be considerate Be considerate, precise, and descriptive if you make a suggestion or comment on something after you've reviewed the new code. Ask questions if you don't understand something. If you think the code is wrong, explain why you think so. Remember, the author can't fix it if they don't know what's broken.

DOD STIG Requirements for a Code Review

|STIG ID        |Severity|Summary               |
|---------------|--------|----------------------|
|APSC-DV-001620 |II      |Network access to privileged accounts, Using code reviews check the application for authentication mechanisms used when accessing the application, see STIG check text for details.|
|APSC-DV-001630 |II      |Network access to nonprivileged accounts, Using code reviews check the application for authentication mechanisms used when accessing the application, see STIG check text for details.|
|ASPC-DV-001995 |II      |Application must not be vulnerable to race conditions, test by code review or static code analysis.|
|ASPC-DV-002400 |II      |Restrict ability to launch DoS attacks, use code review, penetration or vulnerability testing for results that indicate attempts to DoS the application or use the application in DoS.|
|ASPC-DV-002485 |II      |Ensure sensitive information is not stored in hidden fields, code review and scan results shold show that no hidden fields are used to store sensitive information.  Test plan / configuration should attempt to detect for hidden fields.|
|ASPC-DV-002500 |II      |Protect from CSRF vulnerabilities, review code review reports and the vulnerability assessment scans, test plan / configuration should attempt CSRF attack with results saved.|
|ASPC-DV-002510 |II      |Protect from command injection, perform code review and vulnerability scans for command injection potential.|
|ASPC-DV-002520 |II      |Protect from canonical representation vulnerabilities, utilize code reviews and vulnerability scans (web server and application configuration) for invalid canonical forms (language dependent).|
|ASPC-DV-002530 |II      |Validate all input, perform code reviews to ensure all input is validated.|
|ASPC-DV-002590 |II      |Application must not be vulnerable to overflow attacks.A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code.|
|A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code.
|ASPC-DV-002930 |II      | The ISSO must ensure active vulnerability testing is performed.The ISSO must ensure active vulnerability testing is performed.  It is imperative that automated scanning tools are configured properly to ensure that all of the application components that can be tested are tested. In the case of web applications, some of the application code base may be accessible on the website and could potentially be corrected by a knowledgeable system administrator. Active testing is different from code review testing in that active testing does not require access to the application source code base. A code review requires complete code base access and is normally performed by the development team.|
|APSC-DV-003170 |II      |An application code review must be performed on the application.|
|APSC-DV-003190 |II      |Flaws found during a code review must be tracked in a defect tracking system.|
|APSC-DV-003215 |II      |The application development team must follow a set of coding standards.Coding standards are useful in the code review process as well as in situations where a team member leaves and duties must then be assigned to another team member.|
|APSC-DV-003230 |II      |Threat models must be documented and reviewed for each application release and updated as required by design and functionality changes or when new threats are discovered. Threat modeling is not an approach to reviewing code, but it does complement the security code review process.|
|APSC-DV-003235 |II      |The application must not be subject to error handling vulnerabilities. he primary way to detect error handling vulnerabilities is to perform code reviews. If a manual code review cannot be performed, static code analysis tools should be employed in conjunction with tests to help force the error conditions by specifying invalid input (such as fuzzed data and malformed filenames) and by using different accounts to run the application. These tests may give indications of vulnerability, but they are not comprehensive.|

## Test Standard

The following minimal tests will be conducted with each release in an automated and/or manual fashion.  

    + Unit Testing
      + Will occur on function calls and atomic code intended to return basic reponses as well as services.

    + Integration Testing
      + Integration testing will be written for each sub-component with a validation of results executed.
      + Validation will contain expected size.
      + Validation will contain expected number of outputs.
      + Validation will contain verification of data such as AVG of a parameter.

    + Security / Vulnerability Testing
      + Designed to stretch and flex the system.
      + Will minimally utilize some type of Fuzz tool.
      + Will exercise OWASP Top 10 recognized vulnerabilities.
      + Will demonstrate lack of race conditions if possible.
      + Will demonstrate lack of vulnerability to DoS or ability to generate DoS.
      + Will demonstrate CSRF defenses.
      + Will demonstrate documented general input validation methods in coding standard.
      + Will demonstrate examples of input validation in coding standard use.
      + Will demonstrate Command Injection defense or lack of potential.
      + Will demonstrate SQL Injection defense or lack of potential.
      + Will demonstrate Cannonical vulnerability defense.

    + Technical Acceptance Test
      + Will be conducted with a demonstration to the end-user.

    + User Acceptance Test
      + Will occur minimally at customer's resource.

Note that it is always desired to see automation to the maximum extent possible.

## Test Tools

The testing procedure will function as follow:

