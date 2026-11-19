# Coding Standard Template

[TOC]

## Coding Standard

*Standard:* [Coding Standard](./004_Coding_Standard.md)

## Coding Standard

[Case Preference Per Language](#case_preference_per_language)

[Documentation Tools](#documentation_tools)

[Scanning Tools](#scanning)

[Formatting Tools](#formatting)

[Vulnerability Tools](#vulnerabilities)

## Project Components and Automation Tools Used
*Enumerate those parts of the software that will utilize a specific solution / tool.*

**Coding format / standards:**

| Specification           | Sub-Component            | Purpose                      |
|-------------------------|--------------------------|------------------------------|
| Markdown                | All                      | Documentation                |
| Grype                   | All                      | CVE Compliance               |
| Shellcheck              | Bash                     | Compliance/Standards inspection|
| Ruff                    | Python                   | Compliance/Standards inspection/Formatting|
| CodeQL                  | Programming Languages    | Compliance/Standards inspection|
| Bandit                  | Python                   | Compliance/Standards inspection|
| OWASP ZAP               | Programming Languages    | Vulnerabilities Checks|
| checkov                 | Kubernetes/Podman        | Vulnerabilities Checks|
| Clam AV                 | All                      | Virus Scans|
| Syft                    | All                      | Software Bill of Materials (SBOM) |

## The Standard

The following are high level coding standards rules that transcend language and algorithms and are intended to foster highly legible code without cramping the style of your programming staff.  Subject rules should be adapted / augmented to support your project(s) and not used at face value.

1.  No magic numbers.  All static values should be either constants or in a configuration file.  Always use configuration files with key, value pair notation whenever possible.
2.  Use meaningful variables.  FORTRAN constructs such as i, j, k are not permissible.  Make variables as long as you want but make them meaningful.  Code should be read like a sentence vice a cryptographer’s test.  See the table below for coding styles of variables.
3.  If the program is going to do something more than once, make it a function.  Copy / paste of code or repetitive code that does nearly the same thing should be encapsulated as functions.  Again, naming of functions is relevant just like with variables.  The following are industry recognized function naming schema: Function names should be verbs if the function changes the state of the program, and nouns if they're used to return a certain value.
4. Comment on the code, but not excessively.  Major programs should enumerate scope, purpose, and a change log (use of a repository system allows for dropping this practice).  Smaller functions should describe their purpose and arguments.  Application Programmer’s Interfaces (API’s) should be more heavily documented than functions that are not providing services to others.
5.  Format your code.  Pick the formatting tool your project will use and stick with it.  Instead of the 50-page unread document simply utilizing a formatter, consider configuration managing the settings file if appropriate, and bypass the worries of following something developed as a technique before code formatters were standardized.
6.  Test.  Include a test, at some level, with your work.  Develop a Use Case, which enumerates application usage and the fulfillment of that use through the application.  Create a Test Case, explicit instructions designed to allow repetitive testing of specific functions, born from the Use Case.  Execute the Test Cases prior to each commit and especially before a release.  Use automation whenever possible.
7.  Security.  Consider the implications of security on your code.  Minimally conduct a scan using static code analysis tools to get a sense of where your code is and where you might improve it.  Establish as a team the maximum level of compliance with the scanning tool and work towards reduction of Technical Debt (Wikipedia.org Technical Debt, n.d.).
8.  Address Exception and Error handling (APSC-DV-003235).  Also see (Failing Securely, n.d.) and (Fail Securely, n.d.).
9.  Log consistently.  In the case of Model Operations use the logging framework.
10. See Unsafe Functions and understand the ramifications.
11. Use of System Executables (flow of control outside of the application will be discussed) should be managed.  PERL offers 3-4 ways to invoke a system command.  The PERL system function call does the same thing as exec, except that a fork is done first and the parent process waits for the child process to exit.  The system function call also provides the exit code of the external call.  Use the PERL system function for calls outside of PERL itself.
12. exec - executes a command and never returns. It's like a return statement in a function.  If the command is not found exec returns false. It never returns true, because if the command is found it never returns at all. There is also no point in returning STDOUT, STDERR or exit status of the command. You can find documentation about it in perlfunc, because it is a function.
13. System – (desired solution) executes a command.
14. Document Top 10’s.  Top 10 worst things to do and top 10 best things to do should be known by all team members per language used.

## General Good Practices to consider
1.  Will have "Top 10" things not to do in the language(s) you're developing in.
  + Don't use mutable default arguments: Objects like lists and dicts are persistent across function calls. Initialize with None and create the structure inside the block.
  + Never overwrite built-in keywords: Naming a variable list, dict, or str shadows the built-in functions, which will cause obscure errors when you try to use them later.
  + Avoid wildcard imports: Using from module import * pollutes your namespace, makes it impossible to trace where variables came from, and risks overriding names.
  + Don't use bare except blocks: A blank except: statement catches everything—including KeyboardInterrupt, making it incredibly difficult to debug or quit your program.
  + Stop ignoring the with statement: Opening files with standard open() and manually closing them can cause memory leaks if an error occurs. Always use the with open(...) as f: context manager.
  + Don't use for i in range(len(list)): This is un-Pythonic and slow. Use for i, item in enumerate(my_list): to unpack both indices and values gracefully.
  + Avoid explicit boolean checks: Writing if condition == True: or if len(list) > 0: is redundant. Simply evaluate if condition: or if list:.
  + Don't concatenate strings in a loop: Strings are immutable in Python. Using += inside a loop creates a new string object every time, causing massive performance bottlenecks. Instead, append to a list and use "".join(list).
  + Avoid using dict.keys() for lookups: Doing if key in my_dict.keys(): is slower than necessary. Just check if key in my_dict: directly.
  + Don't use range() just to loop through a dictionary: Instead of for key in my_dict: value = my_dict[key], use the cleaner for key, value in my_dict.items().

2.  Will have "Top 5+" things that are considered best practices for the language(s) you're developing in.
  + Adhere to PEP 8 Style Guidelines or minimally use a formatter/linter:
    + Use exactly 4 spaces per indentation level instead of tabs.
    + Use snake_case for variables, functions, and modules.
    + Use PascalCase for naming classes and exceptions.
    + Use UPPER_CASE to quickly identify constant values.
    + Limit lines of code to a maximum of 79 characters.
    + Format files automatically using tools like Ruff or Black.
  + Isolate Projects Using Virtual Environments (include requirements.txt and pyproject.toml files).
  + Write "Pythonic" Code with Built-In Features
    + Use f-strings
    + Use enumerate()
    + Use list and dictionary comprehensions
    + Use exception handling.
    + Handle large datasets using generators to reduce system memory. Use generators (yield) instead of lists when dealing with large data.
  + Manage Resources via Context Managers (with)
  + Utilize Type Hints for Better Maintenance

<a name="scanning"/>
3.  Will reference all changes to Linting and Static Source Code Analyzers considered acceptable by the team.
  
  + Bash:
      + [Shellcheck](https://github.com/koalaman/shellcheck) - Linting

  + Python:
      + [Ruff](https://github.com/astral-sh/ruff) - Linting
      + [Bandit](https://bandit.readthedocs.io) - Scanning

  + Many languages:
      + [CodeQL](https://github.com/github/codeql) - Scanning
      + [OWASP ZAP](https://www.zaproxy.org) - Scanning

  + Kubernetes / Podman:
      + [checkov]( https://www.checkov.io) - Linting / Scanning

<a name="formatting"/>
4.  Will reference the formatting tool used, not just within IDE, and when subject tool will be used to the full extent.

  + [Ruff](https://github.com/astral-sh/ruff)

<a name="vulnerabilities"/>
5.  Will reference vulnerability (CVE, Virus, SBOM) tools used.

  + [Grype](https://github.com/anchore/grype)
  + [Syft](https://github.com/anchore/syft))
  + [Clam AV](https://docs.clamav.net)

## System Executables Minimal Approach

Using command line exe's are considered inherently unsafe, as such a MD5 hash of the executable will be gathered, stored in a configuration file and referenced prior to any call/execution of it.  Algorithm should be:

1.  Perform MD5 comparison of executable about to be called.
2.  All input gathered from user, in other words, is not statically defined must be scrubbed.
3.  If executable is MD5 compliant then the System.exec can be called.

## No URL's in Compiled Code
URLs on pages will not be statically defined in code thus requiring recompilation.  

1.  All URLs will be registered with a configuation file.
2.  Each segment of the project (think different package schema) will be separated within the configuration file.

## Exceptions/Error Messages

1. Error messages (Exceptions) will be invoked with a custom class (API infrastructure) specifically designed to support the Application Development STIG to ensure no information expressed during error (stack traces) are displayed to the end-user thus revealing information that could be deemed valuable to an attacker.  Output of error should go to the log, based on log levels, and an obfuscated/reduced output should be displayed to the end user.
2. The software specific error/exception class will extend from the base functionality of the existing language error/exception class/object.
3. A domain of standard responses, which are application specific, will be matured over time based on encounters of the running package.


## Abstraction

1. Always abstract one level between API's and invocation.  If there's a class that provides Servlet functionality then the code developed will be abstracted at one level to inherit from Servlet and all use of Servlet would be that extended class.  This concept applies to any classes that will be used repeatedly or involve global level utilization.

## Source Formatting

1. All sources for the entire project will be formatted prior to a tag being created using, preferred, an external formatting tool thus ensuring no dependency on a specific IDE.

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

## Static Code Analysis

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

## STIG Considerations

### Security Vulnerability Management (ASPC-DV-003210)

This requirement is meant to apply to developers or organizations that are doing application development work.

Application development efforts include the creation of a project plan to track and organize the development work.

If security flaws are not tracked within the project plan, it is possible the flaws will be overlooked and included in a release.  Ask the application representative to demonstrate how security flaws are integrated into the project plan.

Tracking flaws in the project plan will help identify code elements to be changed as well as the requested change.

If security flaws are not addressed in the project plan or there is no process to introduce security flaws into the project plan, this is a finding.


### Input Handling Vulnerabilities (ASPC-DV-002560)

The application must not be subject to input handling vulnerabilities.

A common application vulnerability is unpredictable behavior due to improper input validation. This requirement guards against adverse or unintended system behavior caused by invalid inputs, where information system responses to the invalid input may be disruptive or cause the system to fail into an unsafe state.

Data received from the user should always be suspected as being malicious and always validated prior to using it as input to the application.

Establish a standard operating procedure for sanitizing all application input.

### Unsafe Methods

Unsafe methods are those that have side-effects that are not understood properly or require elevated security privileges to perform their function.

Classic list of recognized unsafe functions in Python:

1. Code Evaluation and Execution
  + eval(): Evaluates a raw string as a Python expression. If you pass user-controlled input, an attacker can execute arbitrary commands.
  + exec(): Similar to eval(), but it executes arbitrary Python statements (including imports, file manipulation, and loops).

2. OS Command Execution
  + os.system() and os.popen(): Pass a command string directly to the underlying system shell. If the command string contains unsanitized user input, it leads to severe shell command injection vulnerabilities.
  + subprocess.run(..., shell=True): Invokes the system shell to run the command, which introduces the same risks as os.system().

3. Insecure Deserialization
  + pickle.loads(): Deserializes raw data into a Python object. It is famously unsafe because a maliciously crafted pickle stream can execute arbitrary code on your machine when loaded.yaml.load() (PyYAML): The default load method in PyYAML can instantiate arbitrary Python objects, leading to remote code execution.

4. File and Archive Vulnerabilitiestarfile.extractall(): Extracts tar files without validating the paths of the files inside. Malicious archives can place files outside the target directory (path traversal) or overwrite system binaries using symbolic links.

5. Standard Library Gotchas
  + os.path.join() or pathlib.Path.joinpath(): Although generally safe, if used carelessly to concatenate a base path and an unsanitized user-provided subpath, it can be exploited for directory traversal attacks.


### Exceptions/Error Messages

Error messages (Exceptions) will be invoked with a custom class (API infrastructure) specifically designed to support the Application Development STIG to ensure no information expressed during error (stack traces) are displayed to the end-user thus revealing information that could be deemed valuable to an attacker.  Output of error should go to the log, based on log levels, and an obfuscated/reduced output should be displayed to the end user.

The application must not be subject to error handling vulnerabilities (APSC-DV-003235).  The software specific error/exception class will extend from the base functionality of the existing language error/exception class/object.

This application was designed to test the "contract" by which it was written and to fail fast if that contract is broken without authorizing additional capabilities due to failure.  A domain of standard responses, which are application specific, will be matured over time based on encounters of the running package.

## Useful tools related to Code Standards enforcement

1. **Linters:**

Linters analyze code for potential errors, bugs, and violations of coding standards.
They can be customized to enforce specific style rules and best practices.
Linters help avoid syntax errors, ensure consistent indentation, and enforce naming conventions.

  + Python - [Flake8](https://flake8.pycqa.org/) - `flake8 script.py`

2. **Code Formatters:**

Code formatters automatically format code according to predefined style guides.
They ensure consistent code structure, layout, and indentation.

  + Python - [Black](https://github.com/psf/black) - `black my_script.py`

3. **Static Analysis Tools:**

Static analysis tools analyze code without executing it, identifying potential issues such as security vulnerabilities and code quality problems.  They can detect issues like SQL injection, XSS, and memory leaks.  

  + SonarQube (software languages)
  + Bandit (Python)
  + OWASP ZAP (software languages)
  + Code QL (software languages)
  + Ruff (Python)
  + Checkov (Kubernetes, Podman)

4. **IDE Plugins:**

Many IDEs (Integrated Development Environments) offer plugins that enhance code quality and enforce coding standards.
These plugins can include linting, formatting, and code analysis features.

  + Prefer Continue coupled with https://genai.mil.

5. **Other Tools:**

  + 5.1 Continuous Integration/Continuous Deployment (CI/CD) tools: Automate testing and deployment, ensuring code quality and adherence to standards throughout the development lifecycle.

    + Gitlab inherit tools will be used.

  + 5.2 Code review tools: Facilitate collaboration and feedback on code, helping identify potential issues and enforce standards.

    + Gitlab inherit tools will be used.

<a name="case_preference_per_language"/>

## Case Preference Per Language

|Language |Style      |Example                    |URI|
|---------|-----------|---------------------------|---|
|Python   |Snake case |this_is_my_var             |https://www.python.org/dev/peps/pep-0008/|
|Bash     |Lowercase  |$this                      |http://wiki.bash-hackers.org/scripting/style|

<a name="documentation_tools"/>

## Documentation Tools

|Name    |URI                              |Notes|
|----------|---------------------------------|-----|
|Markdown  |https://www.markdownguide.org    |Basic default Markdown will be used for all technical documents.|
|Pandoc    |https://pandoc.org/              |Converts Markdown, which you should be using, to any format you want.|
|Google Style for Code |  [Google Style](https://google.github.io/styleguide/pyguide.html) or [NumPy/SciPy](https://realpython.com/documenting-python-code/)  | Used docstring format.|

  + MkDocs will be used to convert docstring into usable content.

