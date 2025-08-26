# Title: Code Review Standard

## Definition:                                                                                        
A code review is a systematic evaluation of source code, typically performed by one or more developers other than the code’s author, to identify bugs, ensure quality, reinforce coding standards, and promote knowledge sharing within a development team. This process—often called peer review—involves examining code for logic errors, security vulnerabilities, code consistency, and maintainability before the code is merged into the main codebase. Code reviews serve as a cornerstone of software quality assurance, helping teams catch issues early, maintain code integrity, and encourage collaborative learning among team members.

## Purpose:
The purpose of a code review is to systematically examine source code by peers to identify defects, ensure adherence to coding standards, and improve overall software quality. It acts as an essential quality control mechanism by catching bugs early, reducing technical debt, and ensuring that code is clear, secure, and maintainable before integration into the main codebase.

The value returned from code reviews includes:

+ Improved Code Quality: By detecting issues—such as logical errors, vulnerabilities, or performance problems—early, code reviews help deliver more robust and reliable software.

+ Knowledge Sharing: They foster collaboration and allow team members to learn new techniques and best practices, spreading expertise across the team and reducing reliance on any single developer.

+ Consistency and Compliance: Code reviews enforce standardized coding styles and practices, enhancing readability and making maintenance easier for current and future developers.

+ Enhanced Security: With targeted reviews, security flaws can be identified and addressed before release, complementing automated security scans.

+ Increased Collaboration and Team Ownership: The process builds a collaborative culture where developers collectively contribute to quality, promoting shared ownership of the codebase.

+ Reduced Bugs and Faster Issue Resolution: Early detection of defects reduces costly fixes post-deployment and improves development efficiency.

Overall, code reviews are a vital practice that enhances software quality, team productivity, and project success by coupling technical rigor with collaborative learning.


## Requirements/Specifications/Guidelines:                                                            
A code review must be performed for medium to large changes within a software project or the creation of new functional capabilities.  The review must be documented using a consistent standardized template and must be included with the release of the version of software the review is a part of.

## Measurable and Actionable:
The code review should be easily understood by a developer or administrator (if the change is a configuration or Operating System modification), should document and register defects or issues, see Tracking System Standard.  The review should iterate through a standard set of expectations and foster teamwork.  The review must not be antagonistic and is not about opinion or preference so much as adherence to whatever standards are in place.  When solving an algorithm no changes to the algorithm should be suggested unless the review knows the algorithm is:

+ Security Concern
+ Anti-Pattern
+ Grossly inefficient
+ Divergent from team expectations that were clearly enumerated

Bear in mind that finding a ***flaw*** in software prior to a deployment is a **SAVE** and should be considered a win for the team.  We learn from our mistakes.  A **FAIL** is when a flaw is deployed and detected by anyone and then must be remediated.

## Timelines: 
Should be performed for any major change, semantic versioning of secondary number, to the software package.  Should minimally be performed for new developers, regardless of experience, on the project and performed on first release of the software.                                                                                        
## Reference(s):

+ [Atlassian Code Review Good Practices](https://www.atlassian.com/blog/add-ons/code-review-best-practices)

+ [Google eng-practices](https://google.github.io/eng-practices/review/)

+ [GitHub Standard of a Code Review](https://google.github.io/eng-practices/review/reviewer/standard.html)

+ [Git Lab What is a code review?](https://about.gitlab.com/topics/version-control/what-is-code-review/)

+ Application Security and Development (ASD) Security Technical Implementation Guide (STIG) Version 6, Release 3, 2025/04/02

|STIG ID        |Severity|Summary               |
|---------------|--------|----------------------|
|ASPC-DV-001995 |II      |Application must not be vulnerable to race conditions, test by code review or static code analysis.|
|ASPC-DV-002400 |II      |Restrict ability to launch DoS attacks, use code review, penetration or vulnerability testing for results that indicate attempts to DoS the application or use the application in DoS.|
|ASPC-DV-002485 |II      |Ensure sensitive information is not stored in hidden fields, code review and scan results shold show that no hidden fields are used to store sensitive information.  Test plan / configuration should attempt to detect for hidden fields.|
|ASPC-DV-002500 |II      |Protect from CSRF vulnerabilities, review code review reports and the vulnerability assessment scans, test plan / configuration should attempt CSRF attack with results saved.|
|ASPC-DV-002510 |II      |Protect from command injection, perform code review and vulnerability scans for command injection potential.|
|ASPC-DV-002520 |II      |Protect from canonical representation vulnerabilities, utilize code reviews and vulnerability scans (web server and application configuration) for invalid canonical forms (language dependent).|
|ASPC-DV-002530 |II      |Validate all input, perform code reviews to ensure all input is validated.|
|ASPC-DV-002590 |II      |Application must not be vulnerable to overflow attacks.A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code. A code review, static code analysis or active vulnerability or fuzz testing are methods used to identify overflows within application code.|
|ASPC-DV-002930 |II      | The ISSO must ensure active vulnerability testing is performed.The ISSO must ensure active vulnerability testing is performed.  It is imperative that automated scanning tools are configured properly to ensure that all of the application components that can be tested are tested. In the case of web applications, some of the application code base may be accessible on the website and could potentially be corrected by a knowledgeable system administrator. Active testing is different from code review testing in that active testing does not require access to the application source code base. A code review requires complete code base access and is normally performed by the development team.|
|APSC-DV-003170 |II      |An application code review must be performed on the application.|
|APSC-DV-003190 |II      |Flaws found during a code review must be tracked in a defect tracking system.|
|APSC-DV-003215 |II      |The application development team must follow a set of coding standards.Coding standards are useful in the code review process as well as in situations where a team member leaves and duties must then be assigned to another team member.|
|APSC-DV-003230 |II      |Threat models must be documented and reviewed for each application release and updated as required by design and functionality changes or when new threats are discovered. Threat modeling is not an approach to reviewing code, but it does complement the security code review process.|
|APSC-DV-003235 |II      |The application must not be subject to error handling vulnerabilities. he primary way to detect error handling vulnerabilities is to perform code reviews. If a manual code review cannot be performed, static code analysis tools should be employed in conjunction with tests to help force the error conditions by specifying invalid input (such as fuzzed data and malformed filenames) and by using different accounts to run the application. These tests may give indications of vulnerability, but they are not comprehensive.|

## Recommended Inspection Method

1. Understand the change, what it's trying to solve, and why.

The explanation of why the change is needed and any relevant context should be in the commit message. If it isn't, request it and feel free to -1 until it's provided.
Is it something that needs to be solved? Is it something the project should focus on, or is it completely out of scope?

2. How would you implement the solution? Would it be different?

At this point, you know what the code change is about. How would you have done it? Think about this before reviewing the change in detail. If the solution you have in mind is different from the one you're reviewing, and you think it's better, bring that up in the review. You don't need to -1 it; just ask why the author didn't go in this direction and see how the discussion evolves.

3. Run the code with and without the change.

I usually put a few breakpoints into the code, run it, and inspect how the new code interacts with the rest.
If you can't run the whole code, try to copy the function containing the new code to a new local file, simulate the input data, and run that. This is helpful when you either don't know how to run the whole project or when it requires a specific environment to which you don't have access.

4. Can the new code break anything? 

Think about the consequences of the new implementation.  In the case of a new command-line option, will it always be accepted by the target?  Can a situation occur when the option wouldn't be accepted or when it could conflict with something?  Maybe it's a new import. Is the new library, and possibly a new dependency, available in the older releases or systems you ship the project for?  What about security? Is the new dependency safe to use? The least you can do is run a quick Internet search to find out. Also, look for warnings in the console log. Sometimes there are more secure methods within the same library.

5. Is the code effective?  

You've determined that the proposed solution is probably correct. Now it's time to check the code itself, its effectiveness, and its necessity.  Check the style of the new code. Does it match the style of the project? Any open source project has (or should have) a document informing (new) contributors about the styles and good practices the project follows.
For instance, every project in the OpenStack community has a HACKING.rst file. There's often also a guide for new contributors with all the must-know information.

6. Check that all new variables and imports are used. 

Often, there have been many iterations of the code you're reviewing, and sometimes the final version is very different from when it started. It's easy to forget an import or a new variable that was needed in a former version of the new code. Automation usually checks these things using linting tools like flake8 in the case of Python code.  Can you rewrite the code without declaring new variables? Well, usually, yes, but the question is whether it's better that way. Does it bring any benefit? The goal isn't to create as many one-liners as possible. The goal is to write code that is both efficient and easy to read. 

7. Are the new functions or methods necessary? 

Is there a similar function that can be reused somewhere in the project? It's always worth helping to avoid reinventing the wheel and re-implementing logic that's already been defined.

8. Are there unit tests? 
If the patch adds a new function or new logic in a function, it should also include new unit tests for that. It's always better when the author of a new function also writes unit tests for it.

9. Verify refactoring
If the commit refactors existing code (it renames a variable, changes variable scope, changes the footprint of a function by adding or removing arguments, or removes something), ask yourself:
	1.	Can this be removed? Will it affect the stable branch?
	2.	Are all the occurrences deleted?  You can use the grep command to find out. You wouldn't believe how many times I've voted -1 just because of this. This is a simple mistake that anyone can make, but that also means anyone can uncover it.  The owner of the commit can easily overlook these things, which is totally understandable. It's happened to me many times too. I'd finally figured out the root of the problem I'd been fixing, so I was in a rush to propose the review, and then I forgot to check the whole repo.  Apart from the project's repository, sometimes it's also necessary to check other code consumers. If some other project imports this one, they may need refactoring, too. In the OpenStack community, we have a tool that searches across every community project.

10. Does project documentation need to be modified? 
Again, you can use the grep command to check whether the project documentation mentions anything related to the code change. Apply common sense to determine whether a change needs to be documented for end users or it's just an internal change that doesn't affect user experience.  Bonus tip: Be considerate Be considerate, precise, and descriptive if you make a suggestion or comment on something after you've reviewed the new code. Ask questions if you don't understand something. If you think the code is wrong, explain why you think so. Remember, the author can't fix it if they don't know what's broken.

