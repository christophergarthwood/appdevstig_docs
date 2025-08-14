# Coding Standard (Simple)

## Reference
Application Security and Development (ASD) Security Technical Implementation Guide (STIG) Version 6, Release 3, 2025/04/02
 - APSC-DV-003215, The application development team must follow a set of coding standards.

## Coding Standard

1.  Will have "Top 10" things not to do in the language(s) you're developing in.
2.  Will have "Top 5+" things that are considered best practices for the language(s) you're developing in.
3.  Will reference all changes to Static Source Code Analyzers considered acceptable by the team.
4.  Will reference all tools used for static source analysis including STIG issues.
5.  Will reference the formatting tool used, external to IDE, and when subject tool will be used to the full extent.
6.  Will address Abstraction.
7.  Will address Exceptions/Error messages.
8.  Will address common data structures to be used by team.

## System Executables

Using command line exe's are considered inherently unsafe, as such a MD5 hash of the executable will be gathered, stored in a configuration file and referenced prior to any call/execution of it.  Algorithm should be:

1.  Perform MD5 comparison of executable about to be called.
2.  All input gathered from user, in other words, is not statically defined must be scrubbed.
3.  If executable is MD5 compliant then the System.exec can be called.

## No URL's in Compiled Code
URL's on pages will not be statically defined in page thus requiring recompilation.  Exceptions to this rule are if the language is scripted and does not require recompile (JSP, ASP, HTML, etc...).  The following algorithm will be used:

1.  All URLs will registered with a standard XML file.
2.  Each segment of the site (think different package schmea) will be separated within the XML file.
3.  An MD5 of the XML configuration file will be stored in a configuration file.
4.  Upload load of the site read in a singleton after confirming the MD5 signature.
5.  Use a structure to persistent package/url information and call as necessary.
6.  Failure of any type will result in no URL being displayed on page.

## Exceptions/Error Messages

1. Error messages (Exceptions) will be invoked with a custom class (API infrastructure) specifically designed to support the Application Development STIG to ensure no information expressed during error (stack traces) are displayed to the end-user thus revealing information that could be deemed valuable to an attacker.  Output of error should go to the log, based on log levels, and an obfuscated/reduced output should be displayed to the end user.
2. The software specific error/exception class will extend from the base functionality of the existing language error/exception class/object.
3. A domain of standard responses, which are application specific, will be matured over time based on encounters of the running package.


## Top 10
1. The design document for a project will utilize coding standards, which are allowed to be stock, and must include a reference of the Top 10 things not to do for the language the project is using.  If multiple languages are in use then multiple top 10's are required.
2. The coding standard will also incorporate best practices for the specific language(s) in the project.  Minimally five (5) best practices will be incorporated into the coding standard.


## Abstraction

1. Always abstract one level between API's and invocation.  If there's a class that provides Servlet functionality then the code developed will be abstracted at one level to inherit from Servlet and all use of Servlet would be that extended class.  This concept applies to any classes that will be used repeatedly or involve global level utilization.

## Source Formatting

1. All source, for the entire project, will be formatted prior to a tag being created using, preferred, an external formatting tool thus ensuring no dependency on a specific IDE.

## Static Code Analysis (SonarQube)
1. Source code will be scanned for classic errors using a standardized tool (could be considered standard if a custom written solution is the only way to verify error for a language).
2. No issues flagged as Critical will be permitted to go forward into a release unless:
	2.1.  Agreed to by team.
	2.2.  Update tool configuration file so error doesn't propagate.
	2.3.  CM configuration file for tool.
	2.4.  Add to comments/readme in deployment document and design document (coding standards)
3. No Application Development STIG issues will be permitted going forward (get APP codes) into a release unless:
	3.1.  Agreed to by team after performing a dedicated code review to ensure vulnerabilities are not considered dangerous to the project.
	3.2.  Documented in the comments/readme in deployment document.
	3.3.  Added to a new story in the backlog to be addressed immediately at next cycle.
	3.4.  Customer notified of plan.
