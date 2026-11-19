# Design Document Standard

[TOC]

## Template / Reference

*Template* - [Design Document Template](./007_DesignDocument_Template.md)

## Definition

A design document in simple terms is a written plan that explains how software will be built. It describes what the software will do, how it will work, and how its different parts fit together. The purpose is to give everyone on the team (developers, testers, managers) a clear guide for building the software, so everyone knows what to do and how to do it. It helps avoid confusion, saves time, and makes sure the final product meets everyone’s expectations.

## Purpose

To bring team cohesion and focused understanding of the boundary conditions associated with the project thereby keeping the team on a consistent path that leads to success.

## Requirements/Specifications/Guidelines

A software design document needs to include several key requirements and components to ensure a clear, effective blueprint for development and will include an introduction, a System Overview, Scope & Context, Architectural Design, Detailed Design, User Interface Design, Data Design, Interface Design, Error Handling & Recovery, Dependencies & Assumptions and a Glossary of Terms.

Stakeholders, Requirements, Scope, and related project level data points will be encapsulated within the Project Management Plan.

Each section will be clear, thorough, and serve as a guide for developers, testers, and other stakeholders to understand and follow during the entire software development process.

## Measurable and Actionable

Periodic inspection of documentation and system design must hold up by inspecting the Design Document periodically or ad-hoc per release.

## Timeliness

Reviewed quarterly by the PM and Technical Lead.  Changes are appropriate if identified in Story and recognized as needed change during modifications.

## Reference(s)
 + Application Security and Development (ASD) Security Technical Implementation Guide (STIG) Version 6, Release 5, 2026/09/30 
   + APSC-DV-000180, Applications with SOAP messages requiring integrity must include the following message elements:-Message ID-Service Request-Timestamp-SAML Assertion (optionally included in messages) and all elements of the message must be digitally signed.
   + APSC-DV-000190, Messages protected with WS_Security must use time stamps with creation and expiration times.
   + APSC-DV-000200, Validity periods must be verified on all application messages using WS-Security or SAML assertions.
   + APSC-DV-000210, The application must ensure each unique asserting party provides unique assertion ID references for each SAML assertion.
   + APSC-DV-000220, The application must ensure encrypted assertions, or equivalent confidentiality protections are used when assertion data is passed through an intermediary, and confidentiality of the assertion data is required when passing through the intermediary.
   + APSC-DV-000230, The application must use the NotOnOrAfter condition when using the SubjectConfirmation element in a SAML assertion.
   + APSC-DV-000240, The application must use both the NotBefore and NotOnOrAfter elements or OneTimeUse element when using the Conditions element in a SAML assertion.
   + APSC-DV-000250, The application must ensure if a OneTimeUse element is used in an assertion, there is only one of the same used in the Conditions element portion of an assertion.
   + APSC-DV-000260, The application must ensure messages are encrypted when the SessionIndex is tied to privacy data.
   + APSC-DV-003220, The designer must create and update the Design Document for each release of the application.
   + APSC-DV-003236, The application development team must provide an application incident response plan.
 + [Defense Agency University (DAU)](https://www.dau.edu/acquipedia-article/configuration-management-cm)
 + [Federal Shared Services](https://ussm.gsa.gov/assets/files/M3-Playbook-Configuration-Management-Plan-Template.docx)
