# Title: Coding Standard 

## Definition:                                                                                        
The application development team must follow a set of coding standards.

Coding standards are guidelines established by the development team or individual developers that recommend programming style, practices and methods.  The coding standards employed will vary based upon the programming language that is being used to develop the application and the development team.

Coding standards often cover the use of white space characters, variable naming conventions, function naming conventions, and comment styles.  Implementing coding standards provides many benefits to the development process.  These benefits include code readability, coding consistency among both individual and teams of developers as well as ease of code integration.  

The following are examples of what will typically be in a coding standards document.  This list is an example of what one can expect to find in typical coding standard documents and is not a comprehensive list:

- Indent style conventions
- Naming conventions
- Line length conventions
- Comment conventions
- Programming best practices
- Programming style conventions

Coding standards allow developers to quickly adapt to code which has been developed by various members of a development team.  Coding standards are useful in the code review process as well as in situations where a team member leaves and duties must then be assigned to another team member.  

Code conforming to a standard format is easier to read, especially if someone other than the original developer is examining the code.  In addition, formatted code can be debugged and corrected faster than unformatted code.

Introducing coding standards can help increase the consistency, reliability, and security of the application by ensuring common programming structures and tasks are handled by similar methods, as well as, reducing the occurrence of common logic errors.

## Requirements/Specifications/Guidelines:                                                            
Having an ACG is a Cat II requirement as per the ASD STIG V6R3 and has been a requirement since at least V4 of the ASD STIG.  An ACG is considered an industry best practice as well.  Subject document just exist, should be in Markup, and ideally be as automated as possible.

Your ACG might simply describe how large portions of your coding standard is utilized within an Integrated Development Environment (IDE) or how each developer applies subject standard to their work through the use of Code Templates, etc... Do not use documents to drive change, use automation with configurations.

## Measurable and Actionable:
Analysis of code submitted to the repository should conform, largely, with the coding standard.

## Purpose:
The purpose of a coding standard is to establish clear, consistent rules and guidelines that developers follow when writing code. These standards ensure that the code is clean, readable, and maintainable, which makes it easier for teams to collaborate, find and fix bugs, and extend the software over time. Coding standards also help reduce errors, improve security, and enhance overall software quality by promoting uniformity across the codebase regardless of who writes the code. Ultimately, they lead to more efficient development and better long-term project success.

## Timelines: 
Real-time with application development.                                                                                         

## Reference(s):
   + Application Security and Development (ASD) Security Technical Implementation Guide (STIG) Version 6, Release 3, 2025/04/02
     + APSC-DV-003215, The application development team must follow a set of coding standards.

   + [What are Coding Standards?](https://blog.codacy.com/coding-standards)

   + [Coding Standards and Best Practices to Follow](https://www.browserstack.com/guide/coding-standards-best-practices)

   + [coding Standards and Guidelines](https://www.geeksforgeeks.org/software-engineering/coding-standards-and-guidelines/)

## Miscellanous

[Case Preference Per Language](#case_preference_per_language)
[Documentation Tools](#documentation_tools)
[Scanning Tools](#scanning_tools)
[Linting Tools](#lintint_tools)
+ [Python](#python)
+ [Bash](#bash)
+ [Java](#Java)
+ [Perl](#perl)
+ [C](#c)
+ [FORTRAN](#fortran)
__________________________________________________________________________________________________________________________________
# **Template**

The following are high level coding standards rules that transcend language and algorithm and are intended to foster highly legible code without cramping the style of your programming staff.  Subject rules should be adapted / augmented to support your project(s) and not used at face value.

1.	No magic numbers.  All static values should be either constants or in a configuration file.  Always use configuration files with key, value pair notation whenever possible.
2.	Use meaningful variables.  FORTRAN constructs such as: i, j, k are not permissible.  Make variables as long as you want but make them meaningful.  Code should read like a sentence vice a cryptographer’s test.  See the table below for coding styles of variables.
3.	If the program is going to do something more than once, make it a function.  Copy / paste of code or repetitive code that does nearly the same thing should be encapsulated as functions.  Again, naming of functions is relevant just like with variables.  The following are industry recognized function naming schema: Function names should be verbs if the function changes the state of the program, and nouns if they're used to return a certain value.
4.	Comment the code, but not excessively.  Major programs should enumerate scope, purpose, and a change log (use of a repository system allows for dropping this practice).  Smaller functions should describe their purpose and arguments.  Application Programmer’s Interfaces (API’s) should be more heavily documented than functions that are not providing services to others.
5.	Format your code.  Pick the formatting tool your project will use and stick with it.  Instead of the 50 page unread document simply utilize a formatter, consider configuration managing the settings file if appropriate, and bypass the worries of following something developed as a technique before code formatters were standardized.
6.	Test.  Include a test, at some level, with your work.  Develop a Use Case, which enumerates application usage and the fulfillment of that use through the application.  Create a Test Case, explicit instructions designed to allow repetitive testing of specific functions, born from the Use Case.  Execute the Test Cases prior to each commit and especially before a release.  Use automation whenever possible.
7.	Security.  Consider the implications of security on your code.  Minimally conduct a scan using static code analysis tools such as SonarQube (SonarQube Index Page, n.d.) to get a sense of where your code is and where you might improve it.  Establish as a team the maximum level of compliance with the scanning tool and work towards reduction of Technical Debt (Wikipedia.org Technical Debt, n.d.).
8.	Address Exception and Error handling (APSC-DV-003235).  Also see (Failing Securely, n.d.) and (Fail Securely, n.d.).
9.	Log consistently.  In the case of Model Operations use the logging framework.
10.	See Unsafe Functions and understand the ramifications.
11.	Use of System Executables (flow of control outside of the application will be discussed) should be managed.  PERL offers 3-4 ways to invoke a system command.  The PERL system function call does the same thing as exec, except that a fork is done first and the parent process waits for the child process to exit.  The system function call also provides the exit code of the external call.  Use the PERL system function for calls outside of PERL itself.
12.	exec - executes a command and never returns. It's like a return statement in a function.  If the command is not found exec returns false. It never returns true, because if the command is found it never returns at all. There is also no point in returning STDOUT, STDERR or exit status of the command. You can find documentation about it in perlfunc, because it is a function.
13.	System – (desired solution) executes a command and your Perl script is continued after the command has finished.  The return value is the exit status of the command. You can find documentation about it in perlfunc.
14.	Backticks - like system executes a command and your Perl script is continued after the command has finished.  In contrary to system the return value is STDOUT of the command.  qx// is equivalent to backticks. You can find documentation about it in perlop, because unlike system and exec it is an operator.
15.	Document Top 10’s.  Top 10 worst things to do and top 10 best things to do should be known by all team members per language used.

## General Good Practices to condsider

1.  Will have "Top 10" things not to do in the language(s) you're developing in.
2.  Will have "Top 5+" things that are considered best practices for the language(s) you're developing in.
3.  Will reference all changes to Static Source Code Analyzers considered acceptable by the team.
4.  Will reference all tools used for static source analysis including STIG issues.
5.  Will reference the formatting tool used, external to IDE, and when subject tool will be used to the full extent.
6.  Will address Abstraction.
7.  Will address Exceptions/Error messages.
8.  Will address common data structures to be used by team.

## System Executables Minimal Approach

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

## Abstraction

1. Always abstract one level between API's and invocation.  If there's a class that provides Servlet functionality then the code developed will be abstracted at one level to inherit from Servlet and all use of Servlet would be that extended class.  This concept applies to any classes that will be used repeatedly or involve global level utilization.

## Source Formatting

1. All source, for the entire project, will be formatted prior to a tag being created using, preferred, an external formatting tool thus ensuring no dependency on a specific IDE.

## Development Practices

Beautiful is better than ugly.

Explicit is better than implicit.

Simple is better than complex.

Complex is better than complicated.

Flat is better than nested.

Sparse is better than dense.

Readability counts.

Special cases aren't special enough to break the rules.

Although practicality beats purity.

Errors should never pass silently.

Unless explicitly silenced.

In the face of ambiguity, refuse the temptation to guess.

There should be one-- and preferably only one --obvious way to do it.

Although that way may not be obvious at first unless you're Dutch.

Now is better than never.

Although never is often better than *right* now.

If the implementation is hard to explain, it's a bad idea.

If the implementation is easy to explain, it may be a good idea.

Namespaces are one honking great idea -- let's do more of those!

## Static Code Analysis (SonarQube)
1. Source code will be scanned for classic errors using a standardized tool (could be considered standard if a custom written solution is the only way to verify error for a language).
2. No issues flagged as Critical will be permitted to go forward into a release unless:
	+  Agreed to by team.
	+  Update tool configuration file so error doesn't propagate.
	+  CM configuration file for tool.
	+  Add to comments/readme in deployment document and design document (coding standards)
3. No Application Development STIG issues will be permitted going forward (get APP codes) into a release unless:
	+  Agreed to by team after performing a dedicated code review to ensure vulnerabilities are not considered dangerous to the project.
	+  Documented in the comments/readme in deployment document.
	+  Added to a new story in the backlog to be addressed immediately at next cycle.
	+  Customer notified of plan.

## Useful tools related to Code Standards enforcement

1. **Linters:**

Linters analyze code for potential errors, bugs, and violations of coding standards.
They can be customized to enforce specific style rules and best practices.
Examples: ESLint (JavaScript/JSX), Flake8 (Python), StyleCop (.NET).
ESLint, for example, identifies and fixes code issues based on predefined rules, promoting consistency in JavaScript projects.
Linters help avoid syntax errors, ensure consistent indentation, and enforce naming conventions.

2. **Code Formatters:**

Code formatters automatically format code according to predefined style guides.
They ensure consistent code structure, layout, and indentation.
Examples: Prettier, Beautify, ESLint (when used for formatting), Stylelint.
Prettier, for instance, automatically formats code, handling issues like unnecessary whitespace and trailing commas.

3. **Static Analysis Tools:**

Static analysis tools analyze code without executing it, identifying potential issues such as security vulnerabilities and code quality problems.  They can detect issues like SQL injection, XSS, and memory leaks.  Examples: SonarQube, Veracode, Klocwork, Snyk Code, Semgrep.  SonarQube offers comprehensive code quality and security analysis for multiple languages.

4. **IDE Plugins:**

Many IDEs (Integrated Development Environments) offer plugins that enhance code quality and enforce coding standards.
These plugins can include linting, formatting, and code analysis features.
Examples: ReSharper for .NET, various plugins for Visual Studio Code.
IDEs like Visual Studio Code and WebStorm provide features like syntax highlighting, code completion, and linting integration.

5. **Other Tools:**

  + 5.1 Continuous Integration/Continuous Deployment (CI/CD) tools: Automate testing and deployment, ensuring code quality and adherence to standards throughout the development lifecycle.

  + 5.2 Code review tools: Facilitate collaboration and feedback on code, helping identify potential issues and enforce standards.

  + 5.3 Dependency scanning tools: Identify vulnerabilities in open-source dependencies.

<a name="case_preference_per_language"/>

## Case Preference Per Language

|Language	|Style	    |Example	                |URI|
|-----------|-----------|---------------------------|---|
|Python	    |Snake case	|this_is_my_var	            |https://www.python.org/dev/peps/pep-0008/|
|Perl	    |Snake case	|$this_is_my_var	        |https://perldoc.perl.org/perlstyle.html|
|Bash	    |Lowercase	|$this	                    |http://wiki.bash-hackers.org/scripting/style|
|Java	    |CamelCase / MixedCase	|thisIsMyVar	|http://www.oracle.com/technetwork/java/codeconventions-135099.html|
|Fortran	|Snake case	|this_is_my_var	            |https://gcc.gnu.org/onlinedocs/gcc-6.1.0/gfortran/Naming-conventions.html; http://www.fortran90.org/src/best-practices.html|
|C / C++    |           |                           | |			

<a name="documentation_tools"/>

## Documentation Tools

|Name	   |URI	                             |Notes|
|----------|---------------------------------|-----|
|Doxygen   |http://www.doxygen.nl/           |Converts many languages to highly useful documentation.|
|Pandoc	   |https://pandoc.org/              |Converts Markdown, which you should be using, to any format you want.|
|FORTRAN Documenter	| http://www.doxygen.nl/ |Converts FORTRAN source to highly useful documentation.|

<a name="scanning_tools"/>

## Scanning Tools

|Name	                   |URI	              |Notes|
|--------------------------|------------------|-----|
|SonarQube	               |See CI/CD Pipeline|	Performs static code analysis against configurable templates.|
|Visual Code Grepper (VCGV)|https://github.com/nccgroup/VCG|Only works in Windows (sorry) and is an automated code security review tools which handles: C, C++, Java, VB, C#, PL/SQL.|
|Flawfinder|https://dwheeler.com/flawfinder/|A simple program that examines C/C++ source code and reports possible security weaknesses (“flaws”) sorted by risk level.|

<a name="linting_tools"/>

## Formatting / Linting Tools

<a name="python"/>

### Python

|Name	    |URI	                               |Notes|
|-----------|--------------------------------------|-----|
|autopep8	|https://pypi.python.org/pypi/autopep8 |Actual format tool.|
|Pyflakes	|https://pypi.python.org/pypi/pyflakes |Code checker / linter.|
|black	    |Use Anaconda.	                       |Anaconda|

<a name="c"/>

### C/C++

|Name|URI|Notes|
|----|---|-----|
|Uncrustify|http://uncrustify.sourceforge.net/|Actual format tool.|

<a name="perl"/>

### Perl

|Name|URI|Notes|
|----|---|-----|
|perltidy|http://perltidy.sourceforge.net/|Saves file to *.pdy|

<a name="java"/>

### Java
|Name|URI|Notes|
|----|---|-----|
|google-java-format-1.5|https://github.com/google/google-java-format|Invocation with java –jar.|

<a name="bash"/>

### Bash

|Name|URI|Notes|
|----|---|-----|
|Shellcheck|https://github.com/koalaman/shellcheck|https://www.shellcheck.net/|
|Beautysh|https://github.com/bemeurer/beautysh| Will overwrite your files use –b or perform your own backup.|

<a name="fortran"/>

### FORTRAN

+ [K-scope v0.2.6](http://www.r-ccs.riken.jp/ungi/soft/kscope/)
+ [http://fortranwiki.org/fortran/show/Tools](http://fortranwiki.org/fortran/show/Tools)

