# Test Plan Template

## Test Standrd
*Standard:* [Test Standard](./015_TestPlan_Standard.md)

The following minimal tests will be conducted with each release in an automated and/or manual fashion.  

    + Unit Testing
      + Will occur on function calls and atomic code intended to return basic responses as well as services.

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
      + Will demonstrate Canonical vulnerability defense.

    + Technical Acceptance Test
      + Will be conducted with a demonstration to the end-user.

    + User Acceptance Test
      + Will occur minimally at customer's resource.

Note that it is always desired to see automation to the maximum extent possible.

## Test Tools

The testing procedure will function as follows:

____________________________________________________________________________________________________________________________________
## **Template**

# Test Plan (AppDev STIG v6r3, APSC-DV-????)

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
|v1.3.00       | v1.3.00 ASD STIG v6r5 validation            |

## Executive Summary

*The intent of this document is to provide a representative example of what should be a compliant Test Plan document.*

## Introduction

Software testing is an investigation conducted to provide stakeholders with information about the quality of the product or service under test. Software testing also provides an objective, independent view of the software to allow the business to appreciate and understand the risks of software implementation.  Test techniques include, but are not limited to, the process of executing a program or application with the intent of finding software bugs (errors).
Software testing can also be stated as the process of validating and verifying that a software program/application/product:
+ Meets the business and technical requirements that guided its design and development. 
+ Works as expected; and 
+ Can be implemented with the same characteristics. 

 Software testing, depending on the testing method employed, can be implemented at any time in the development process. However, most of the test effort occurs after the requirements have been defined and the coding process has been completed. As such, the methodology of the test is governed by the software development methodology adopted.

Different software development models will focus the test effort at different points in the development process. Newer development models, such as Agile, often employ test driven development and place an increased portion of the testing in the hands of the developer, before it reaches a formal team of testers.  In a more traditional model, most of the test execution occurs after the requirements have been defined and the coding process has been completed.

### Scope

The primary purpose of testing is to detect software failures so that defects may be discovered and corrected.  All testing for release will have a Test Plan prior to release to the customer.  User Acceptance Test (UAT) will be conducted prior to operational release of the software.

### Categories

#### Functional vs. Non-functional Testing

Functional testing refers to activities that verify a specific action or function of the code. These are usually found in the code requirements documentation, although some development methodologies work from use cases or user stories. Functional tests tend to answer the question of "can the user do this" or "does this particular feature work".

Non-functional testing refers to aspects of the software that may not be related to a specific function or user action, such as scalability or security.  Non-functional testing tends to answer such questions as "how many people can log in at once".
Most applications developed will be desktop applications and many traditional non-functional tests such as multi-user access, band-width utilization will not be applicable.  Specific tests will be documented in Use Test Cases.  Only those tests the customer requests of a non-functional nature will have registered tests in Use Test Cases.

#### Defects and Failures

All defects and failures encountered will be registered with the sponsor and designated as a bug.  All defects will be addressed and prioritized based on communication with the sponsor.  Typically, software changes will be exercised first followed by defects during a development cycle unless the defect is born from a newly created software change. Describe the process and how you manage defects.

#### Compatibility

All software developed will target the Java Virtual Machine (JVM) and who will make final compilations and tests against the sponsor's target infrastructure thus ensuring full compatibility with final environment.

#### Security flaws (APSC-DV-003210)
Security flaws must be fixed or addressed in the project plan. This requirement is meant to apply to developers or organizations that are doing application development work. Application development efforts include the creation of a project plan to track and organize development work.  If security flaws are not tracked within the project plan, it is possible the flaws will be overlooked and included in a release.

Tracking flaws in the project plan will help identify code elements to be changed as well as the requested change.

Ensure you have a project plan that identifies known security flaws ranging from host applications to your own.

#### Software Verification and Validation

Software testing is used in association with verification and validation:

+ Verification: Have we built the software right? (i.e., does it match the specification)? 
  +  Software performs as expected and fulfills the purpose of slicing a world sized NetCDF into smaller pieces and creating output sufficient to feed into NCODA QC.
+ Validation: Have we built the right software? (i.e., is this what the customer wants)?
  +  Software terms and execution agreed to by the end-user.

### Testing Levels

Tests are frequently grouped by where they are added in the software development process, or by the level of specificity of the test. The main levels during the development process as defined by the SWEBOK guide are unit-, integration-, and system testing that are distinguished by the test target without implying a specific process model. Other test levels are classified by the testing objective.

#### Unit Testing

Unit testing refers to tests that verify the functionality of a specific section of code, usually at the function level. In an object-oriented environment, this is usually at class level, and the minimal unit tests include the constructors and destructors.
It will not be necessary to unit test every function in the application, primary focus will be object (which contain data or perform operations on data) method unit tests.  100% code coverage is not a reality in most applications thus focus on unit testing will be at a discrete versus a raw code coverage value as performed by SonarQube.

No discrete unit testing is present as this is not an API but an application that uses many different components.

#### Integration Testing

Integration testing is any type of software testing that seeks to verify the interfaces between components against software design. Software components may be integrated in an iterative way or all together ("big bang"). Normally the former is considered a better practice since it allows interface issues to be localized more quickly and fixed.
Integration testing works to expose defects in the interfaces and interaction between integrated components (modules). Progressively larger groups of tested software components corresponding to elements of architectural design are integrated and tested until the software works as a system.

+ Integration Testing - Does the project actively advocate and create Integration Tests for interaction of functions, objects, and procedures?

Integration tests are available per platform (*agency platform?*, ) and are proceeded by `test_*`.

#### System Testing

System testing tests a completely integrated system to verify that it meets its requirements.
The completed compiled application will be tested in the development environment and ultimately tested on DOD and named hardware platform workstations.  Describe how system testing is performed and indicate by reference where standards for testing exist.

System test on CENTOS and DSRC SGI & Cray platforms was performed.

#### Vulnerability Testing (APSC-DV-001460, APSC-DV-002930)

An application vulnerability assessment is a test conducted to identify weaknesses and security vulnerabilities that may exist within an application. The testing must cover all aspects and components of the application architecture. If an application consists of a web server and a database, then both components must be fully tested for vulnerabilities possible.

Vulnerability assessment tests normally utilize a combination of specialized software called application vulnerability scanners as well as custom scripts and manual tests. In some instances, multiple tools are required to test all aspects of application features, functions and architecture. The vulnerability scanner is typically configured to communicate with the application through the user interface or via an application’s communication port. In addition to using automated tools, manual tests conducted from the OS console such as executing custom scripts or reviewing configuration settings for known vulnerabilities may also be included as part of the test.

Testers will typically utilize application user test accounts to test application features and functionality such as adding content, executing queries and completing transactions. The vulnerability testing software utilizes user actions and access as well as a list of known security vulnerabilities to detect and identify weak security controls or misconfigurations that could potentially be manipulated by the user or create security vulnerability.

Testing must be conducted on a periodic basis while the application is in production and after system changes to ensure any changes are made to the system do not introduce new security vulnerabilities.

Describe how vulnerability testing is conducted for the application.

No discrete tools are used for vulnerability testing except local attempts to penetrate the CLI arguments which are performed informally.

### Test Plans (APSC-DV-003130)

The application testing process is vital in identifying security flaws before the application is released. In addition to the standard functional testing performed, the development team will have at least one tester specifically testing the application for security flaws.  Standard security flaws will be evaluated on the development environment, and review of source code for security flaws will be reviewed as well.
Test plans specify how you will test the application.  Test plans say how you will test.  Use Cases represent a function that the application is performing and is the basis for requirements/code creation.  Test Cases are the embodiment of the Use Case and provide details descriptions of how the test of the Use Case will be conducted.  Test Cases persist, have a specific date/time of execution, and individual performing the test.  Integration tests could include any number and types of tests, they represent a body of tests that confirm past testing, which was successful, continues to be successful due to any change to the application or its components.  An integration test passing represents acknowledgement of a known past functional state.
Automated testing is nothing more than tests, at any level of granularity, which can be invoked, typically triggered by an event like a build, and run by themselves with no human interaction.  The result of an automated test should be persisted.
 
#### Named Tester/Test Team (APSC-DV-0031[50,60])
For each deployment a single developer will be designated as the Test Manager and responsible for the review of all tests performed and will consult with the Team Leader regarding the results of the tests performed.  The team will ensure tests procedures exist and at least annually executed to ensure system initialization, shutdown, and aborts are configured to ensure the system remains in a secure state.  Utilize the Testing Standard and its references for minimal requirements.

**Designated Testers**

|Name of Tester  |  Email Address                |  Last Test related training |
|----------------|-------------------------------|-----------------------------|
|Some tester   |  tester@testerland.com            | Not conducted.              |

#### Test Procedures

See dedicated Test Standard and Plan.

