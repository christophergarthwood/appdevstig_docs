# Definition of Done
[TOC]

## Template / Reference

## Definition
The Definition of Done (DoD) is a shared, explicit checklist of criteria that must be universally met for a product increment or backlog item to be considered truly finished, high-quality, and ready for release.

### Core Concept
Universal Standard: Unlike acceptance criteria (which are unique to a specific feature or user story), the DoD applies across all tasks and user stories to ensure a consistent baseline of quality.

Team Ownership: It is collectively defined and evolved by the development team (along with the product owner and stakeholders) to prevent technical debt and ambiguity. 

### Quality
For any task:
+ Spend the time on tasks to do it right.
+ No shortcuts.
+ Everything matters.
+ Have someone review your work prior to customer release.

#### Code Quality
Specifically for code:
+ Adheres to style guidelines (linted, formatted) prior to submission for peer review.
  + See our [Coding Standard Operating Procedure](./004_Coding_Standard.md)
+ Code is peer-reviewed prior to merging into main.
  + [GitLab Merge Requests](https://docs.gitlab.com/user/project/merge_requests/)
+ Docstrings follow standard formats:
  + See our [Coding Standard Operating Procedure](./004_Coding_Standard.md)
+ Anything that can go into configuration does.
  + [Dotenv](https://pypi.org/project/python-dotenv/)
+ Adherence to libraries and tools in use within the project (standard responses, error handling, etc.).
+ For major capabilities identified in the AppDev STIG, ensure you are compliant. Examples include SAML, session management, input validation, and user authentication.

### Testing
+ Test the results.
+ Test in more than one way.
+ Have someone test for you.

#### Code Testing
Specifically when working with code:
+ Unit tests exist and pass.
+ Integration tests exist and pass.

### Verification
In general, make sure what you've done works, is stable, and is ready to demo when asked. If you have tasks you're managing with a ticketing system, update them routinely and close them out. Ensure they are aligned with your milestones.

#### Code Verification
+ Code is successfully merged, built, and deployed to a staging or testing environment.
+ Human inspection and execution of integration tests are performed in the deployed environment.

### Documentation
In general, your documentation as part of a report, business input, analysis, or anything that is not actual code documentation should minimally:
1. Be spell-checked 2–3 times.
2. Read clearly.
3. Be verified to answer the question being posed.
4. Be peer-reviewed by a teammate.
5. Have management review and oversight prior to customer release.

#### Code Documentation
+ User documentation, API specs, and release notes are updated.
+ Meaningful responses for errors, failures, and broken execution are provided.

### Non-Functional Checks
+ Inspect security scans that are part of the CI/CD pipeline before signing off for completion.
+ Execute performance checks to ensure the solution executes in a reasonable time as expected by most web interactions. A web request for a user should ideally finish within 1 second, with 10 seconds being the absolute maximum limit before the user loses focus.

## Purpose
By having a minimum standard for completion and a team understanding of the social/engineering norms expected for work, a level of consistency, quality, and technical debt reduction is possible by way of "how we do business."

## Requirements / Specifications / Guidelines
Utilize the SOPs identified in this portion of the project to prosecute your work.

#### For Code Development
Ensure you are using CI/CD, testing, documenting, and obtaining peer review.

## Timeliness
Performed with every workload.

## Reference(s)
