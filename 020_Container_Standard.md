# 📘 Container Standard


[TOC]

## 🔗 Template / Reference

*Template* - [Container Template](./020_Container_Template.md)

## 📖 Definition

A container is a lightweight, self-contained package that bundles an application together with everything it needs to run — code, runtime, system libraries, and configuration settings — so it works reliably no matter where it's deployed.

### 🟦 1. The Simple Analogy

Think of a shipping container in the physical world: it doesn't matter what's inside (furniture, electronics, food) or which ship, truck, or crane moves it — the container has a standard shape that any port or vehicle can handle. Software containers work the same way. They create a standardized "box" around an application so it can move between a developer's laptop, a test server, and a production cloud environment without breaking.

### 🟩 2. How It Actually Works

A container shares the underlying operating system's kernel with other containers on the same machine, but each one runs in its own isolated user space. This is different from a traditional virtual machine, which packages an entire guest operating system along with the app.

**Lightweight:** because containers don't need a full OS copy, they start in seconds and use far less memory and disk space than VMs.

**Isolated:** each container has its own filesystem, processes, and network interface, so apps don't interfere with each other even when running on the same host.

**Portable:** the container image includes all dependencies, so "it works on my machine" problems mostly disappear — if it runs in the container, it runs the same way anywhere that container engine is supported.

**Consistent:** the same image is used from development through testing to production, reducing configuration drift.

### 🟨 3. Why It Matters for Architecture and Security

Containers make it practical to break large applications into smaller, independently deployable microservices, each running in its own container and scaled on demand. Orchestration tools like Kubernetes / microk8s then manage scheduling, scaling, and recovery of many containers across a cluster of machines.

From a DevSecOps angle, containers let you "shift security left": you can scan a container image for vulnerable dependencies, enforce that only signed, approved images run in production, and apply the principle of least privilege by giving each container only the permissions and network access it actually needs. Because containers are ephemeral and defined by code (a Dockerfile or similar), you can also rebuild and redeploy a clean, patched instance quickly instead of patching a live, long-running server — which reduces the attack surface and makes environments easier to audit and reproduce consistently.


## 🎯 Purpose

This document serves as a living standard and team contract between all participants in Information Technology (IT) to ensure containers destined for Naval Oceanographic Office (NAVOCEANO) enterprise networks are secure, repeatable, and reusable. These standards act as a binding agreement between party members of the development, engineering, cybersecurity, and infrastructure teams. While these teams are often disparate, they are collapsed into general groups for the purpose of this document: infrastructure team (system engineers, technicians, and system administrators), cybersecurity team (system engineers, information system security officers, cybersecurity analysts, system administrators, software developers), and developers (system engineers, infrastructure technicians, software engineers).
Team members may have responsibilities in one or more areas, as the command dictates.

The following topics are addressed in the template:
✅ Approved locations to fetch base container images (Registry control)
✅ How to secure base images (Hardening & minimal footprints)
✅ Proper scanning methods and artifacts (CVEs, SBOMs, and Attestations)
✅ How to handle secrets and sensitive data required by containers
✅ How to externalize configurations in containers for ease of adjudication and reuse
✅ How to ensure auditing and logging trails (standardized formatting and output)
✅ How to ensure Public Key Infrastructure (PKI) is implemented correctly
✅ How to provide storage safely (read-only file systems, volumes, and ephemeral storage)
✅ How to deploy and protect TCP and UDP services safely and route them (ports and service mesh integration)
✅ How to enforce infrastructure runtime policies (resource allocation and admission control)
✅ How to manage a container’s lifecycle
✅ What minimum body of evidence (BOD) are required for delivery

## 🧩 Requirements/Specifications/Guidelines

See the [Container Template](./020_Container_Template.md) for discrete requirements.

## 📏 Measurable and Actionable

📊 Performed for every deployment and new functional capability.  

📊Use CI/CD pipelines to measure metrics that are appropriate to your project.

📊Minimal considerations are compliance with security protocols.

## ⏱️ Timeliness

Performed as part of the overall approach towards development and minimally required per deployment.

## 📚 Reference(s)

🏛️ [CISA Securing the Software Supply Chain](https://www.cisa.gov/sites/default/files/publications/ESF_SECURING_THE_SOFTWARE_SUPPLY_CHAIN_DEVELOPERS.PDF)
🏛️ [Container Image Creation and Deployment Guide, Version 2, Release 0.6 (2020/11/02)](https://dl.dod.cyber.mil/wp-content/uploads/devsecops/pdf/DevSecOps_Enterprise_Container_Image_Creation_and_Deployment_Guide_2.6-Public-Release.pdf)
🏛️ [Container Hardening Guide, Version 1](https://dl.dod.cyber.mil/wp-content/uploads/devsecops/pdf/Final_DevSecOps_Enterprise_Container_Hardening_Guide_1.2.pdf)
🏛️ [DoW Enterprise DevSecOps Fundamentals, v 2.5, 2024/10](https://dodcio.defense.gov/Portals/0/Documents/Library/DoD%20Enterprise%20DevSecOps%20Fundamentals%20v2.5.pdf)
🏛️[DISA STIGS](https://www.cyber.mil/stigs/)
🏛️[Executive Order 14028](https://www.nist.gov/itl/executive-order-14028-improving-nations-cybersecurity)
🏛️ [Git](https://git-scm.com/)
🏛️[GitLab](https://about.gitlab.com/)
🏛️[GitLab Pages](https://docs.gitlab.com/user/project/pages/)
🏛️ [Iron Bank](https://p1.dso.mil/iron-bank)
🏛️ [Iron Bank Dockerfile Requirements](https://docs-ironbank.dso.mil/hardening/dockerfile-requirements/)
🏛️[NIST 800-53/RMF](https://csrc.nist.gov/projects/risk-management/sp800-53-controls)
🏛️[NIST Special Publication 800-37 “Risk Management Framework for Information Systems and Organizations", Rev 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-37r2.pdf)
🏛️ [NIST Secure Software Development Framework (SSDF), SP 800-218A](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218A.pdf)
🏛️ [Software Engineering for Continuous Delivery of Warfighting Capability, 2023/04](https://www.cto.mil/wp-content/uploads/2023/07/SWE-Guide-April2023.pdf)
[TruffleHog](https://github.com/trufflesecurity/trufflehog)
