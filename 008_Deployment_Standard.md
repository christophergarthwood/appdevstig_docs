# 📘 Deployment Standard

[TOC]

## 🔗 Template / Reference

*Template* - [Deployment Template](./008_Deployment_Template.md)

## 📖 Definition

A software delivery plan is a simple, step-by-step roadmap that shows how a team will create, test, and deliver a software product to its users. It organizes all the important tasks, timelines, and resources needed so that everyone knows what to do, when to do it, and how to reach the project’s goals successfully. In short, it helps teams stay organized and on track from the beginning of a project all the way through to releasing the finished software.

## 🎯 Purpose

A software delivery plan ensures "no surprises" when migrating to the next tier and reduces risk when deploying a solution as the plan is circulated with all team members, tested, and followed in the subsequent Staging and Operations releases.


## 🧩 Requirements/Specifications/Guidelines

A software deployment plan template, based on industry’s best practices, should provide a clear and detailed blueprint for delivering software to production environments with minimal risk and maximum transparency. 

All deployments will have the following characteristics

1.  Step-by-Step Checklist: Enumerate all actions to take during deployment, with owner/assignee for each.  A CI/CD or automated deployment will still have a deployment plan, however subject plan's checklist will reference those automated functions that influence the discrete portion of the system being updated.
2.  Integration Environment: Every deployment will be tested, verified, and must pass testing through an Integration Environment.  The Integration Environment does not have to be a 100% clone of Staging or Operations, however truly representative data must be present and execution of the system with that data must be successful.  All architecture components must be present, however they are allowed to co-reside on the same system and ports are authorized to be different if documented in the ACG but must be noted in the plan.
3.  Automation: All deployments will seek agnostic automation for every deployment.  Bash scripts are preferred over manual steps, Ansible is preferred over Bash scripts, and any automation (even if esoteric) is preferred over manual steps.  Note that the sponsor must approve vendor specific automation and subject automation must be addressed in the Application Configuration Guide and Design Document.
4. Testing: All deployments will be tested by the team, a designated tester, and an end-user on every environment the application is anticipated to run on.  Once all testing is complete the deployment can be considered a success.

The team member on scene always retains the authority to abort a deployment, however identification of the problem discovered must be documented and could require re-execution in the Integration Environment.

Expect a rolling deployment strategy, however details regarding various approaches are provided should a different technique be required.

Deployment Strategy: Define the approach (e.g., big bang, blue-green, canary, rolling) and steps for each phase.  Expect all deployments to be Rolling Deployments but do not make assumptions.

Rolling Deployment: New versions are gradually deployed, replacing older versions on a server-by-server or instance-by-instance basis.
+ Pros: Maintains service availability during the update process.
+ Cons: Can be slow, and issues may affect multiple users before the full deployment is complete.

Blue-Green Deployment: Two identical production environments are maintained (Blue for the current version, Green for the new version). The new version is deployed to the inactive Green environment, thoroughly tested, and then traffic is switched from Blue to Green.
+ Pros: Provides a quick rollback option and ensures high availability during the transition.
+ Cons: Requires maintaining two production environments, which can be costly.

Canary Deployment: The new version is released to a small, isolated subset of users first. Their behavior and performance are closely monitored.
+ Pros: Minimizes the impact of bugs by affecting only a small group of users, allowing for early detection and correction.
+ Cons: Requires sophisticated traffic routing and monitoring capabilities.

## 📏 Measurable and Actionable

Performed for every deployment.

## ⏱️Timeliness

Performed for every deployment.

## 📚 Reference(s)
 + 🏛️Application Security and Development (ASD) Security Technical Implementation Guide (STIG) Version 6, Release 5, 2025/04/02
    + APSC-DV-003220, The designer must create and update the Design Document for each release of the application. The application design document or configuration guide includes configuration settings, recommendations and best practices that pertain to the secure deployment of the application. 
    + APSC-DV-002930, The ISSO must ensure active vulnerability testing is performed prior to deployment.
    + APSC-DV-003340, At least one application administrator must be registered to receive update notifications, or security alerts, when automated alerts are available.

