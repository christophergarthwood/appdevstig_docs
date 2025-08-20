# Title: Tracking System Standard

## Definition:

A software tracking system for tracking issues in a software development project, explained simply, is a tool that helps teams keep track of problems, bugs, or tasks that come up during development. It records each issue, assigns it to the right person to fix, and monitors the progress until the problem is resolved.

## Requirements/Specifications/Guidelines:

A tracking system must:

+ Organize all reported issues in one place
+ Prioritize which problems to fix first
+ Allow team members to add notes and updates
+ Track how long issues take to get fixed
+ Keep everyone informed about the status of issues

Atlassian Jira will be utilized as the tracking system with commit messages provided via Jira to update tickets as commits are made.

#### Commit Messages
When committing something use the -m flag to add a short commit message of the format:

`#<<Issue_Id by Ticketing System>><<Optional:(Use Case Id)>><<Bug Fix|Feature|Documentation|Optimization>><<Short description of the change in past tense>>.`

*the pound system is required*

Commit messages must be in the past tense.

In general try to group file changes wherever appropriate, so if your controller change also involved updating something in a helper file, the one commit message can happily encompas the changes to both files. The message ought to reflect the main aim of the change.

Bug Fix - the change fixes a bug
Feature - the change adds a new feature (the usual issue type)
Documentation — The change is a documentation only change
Optimisation - The change is an optimisation of the code base without any functional changes
If your change does not fit any of these categories, use Feature. Likewise if your change is not tied to an issue number you may use n/a instead.

So to use the above example your commit would have the following message:

#132 Feature added cosine similarity to human selected comments versus generative selected comments.
#132 (ML-025) Feature added cosine similarity to human selected comments versus generative selected comments.

## Measurable and Actionable:

+ Evidence of a commits tied to issues by way of the tracking system.
+ Evidence of changes traceable from version release to tracking system to requirement.

## Purpose:

A tracking system makes managing bugs or tasks clearer, faster, and more efficient so the software can be improved and delivered more reliably as well as provide metrics for project performance and accountability.

## Timeliness:

+ Per commit of code to the Software Configuration Management Plan.
+ Per new or modified Story or Task.

## Reference(s):
 + [Software Engineering for Continuous Delivery of Warfighting Capability, 2023/04](https://www.cto.mil/wp-content/uploads/2023/07/SWE-Guide-April2023.pdf)
 + [DOD Enterprise DevSecOps Fundamentals, v 2.5, 2024/10](https://dodcio.defense.gov/Portals/0/Documents/Library/DoD%20Enterprise%20DevSecOps%20Fundamentals%20v2.5.pdf)
 + [NIST Special Publication 800-37 (“Risk Management Framework for Information Systems and Organizations"), Rev 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-37r2.pdf)
 + [NIST Secure Software Development Framework (SSDF), SP 800-218A](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218A.pdf)
 + [CISA Securing the Software Supply Chain](https://www.cisa.gov/sites/default/files/publications/ESF_SECURING_THE_SOFTWARE_SUPPLY_CHAIN_DEVELOPERS.PDF)
