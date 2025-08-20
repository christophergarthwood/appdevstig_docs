# Title: Logging Standard

## Definition:

A logging standard for software development projects, in simple terms, is a set of agreed rules about how to record events and information about what the software is doing.

## Requirements/Specifications/Guidelines:

A logging standard standard usually defines:

+ What kind of information should be logged (like errors or user actions)
+ How detailed the logs should be (log levels such as info, warning, error)
+ The format for writing logs so they are easy to read and analyze
+ Where and how logs should be stored safely
+ When to create logs to avoid unnecessary information but keep enough details to troubleshoot

The logging standard for this project is enumerated below.

### Tomcat

#### User Logging
<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs" prefix="localhost_access_log" suffix=".txt" pattern="%h %l %t %u &quot;%r&quot; %s %b" />

#### Proxy Management
<Valve className="org.apache.catalina.valves.RemoteIpValve" internalProxies="172.16.0.10|172.16.0.11" />

<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs" prefix="access" suffix=".log" pattern="combined" renameOnRotate="true" requestAttributesEnabled="true" />

### Apache

#### System Logging
Must utilize CustomLog, example follows:

CustomLog "logs/access_log" common or CustomLog “log/access_log” combined

#### Startup / Shutdown Logs

Minimal log format is:

LogFormat "%a %A %h %H %l %m %s %t %u %U \"%{Referer}i\" " common

#### Log Event Notifications (domain of values)

**** MUST BE DONE ***

#### Log Permissions, Space, and Infrastructure

Sufficient permissions to limit log access, ensure adequate space, and infrastructure setup is required (meaning log information is available via the customer's log monitoring solution).

Verify and document in the Configuration Management Plan (CMP) where logs are kept and how the logs can be viewed via customer infrastructure.

### Applications

#### Roles and Account Manipulation

If your application modifies, creates or in any way alters a role or account you must log those events.  See ASD requirements.

#### Sensitive Data

It is important to identify and exclude certain types of data that is written into the logs. If the logs are compromised and sensitive data is included in the logs, this could assist an attacker in furthering their attack or it could completely compromise the system.

Examples of such data include but are not limited to; Passwords, Session IDs, Application source code, encryption keys, and sensitive data such as personal health information (PHI), Personally Identifiable Information (PII), or government identifiers (e.g., SSN).

Inspection by Senior Administrator and when in doubt the Project Manager.

#### Access to objects
Review the logs and identify if the application is logging both successful and unsuccessful access to application objects such as files, folders, processes, or application modules and sub components, or systems.

#### Startup and Shutdown

The application must log startup and shutdown events such as the beginning of execution and the end of execution.
## Measurable and Actionable:

Analysis of logged fields versus requirements mandated by the various STIG's.

## Purpose:

Having a logging standard ensures that the team collects useful data in a clear and organized way, which makes fixing bugs, improving software performance, and understanding system behavior much easier.

## Timeliness:

Applicable day one of server setup.

## Reference(s)
 + [Application Security Development (ASD) Security Technical Implementation Guide (STIG) version 6, release 3](https://www.cyber.mil/stigs/downloads)
   + APSC-DV-000340, The application must automatically audit account creation.
   + APSC-DV-000350, The application must automatically audit account modification.
   + APSC-DV-000360, The application must automatically audit account disabling actions.
   + APSC-DV-000370, The application must automatically audit account removal actions.
   + APSC-DV-000420, The application must automatically audit account enabling actions.
   + APSC-DV-000620, The application must provide audit record generation capability for the creation of session IDs.
   + APSC-DV-000650, The application must not write sensitive data into the application logs.
   + APSC-DV-000830, The application must generate audit records when successful/unsuccessful logon attempts occur.
   + APSC-DV-000840, The application must generate audit records for privileged activities or other system-level access.
   + APSC-DV-000860, The application must generate audit records when successful/unsuccessful accesses to objects occur.
   + APSC-DV-000910, The application must initiate session auditing upon startup. 
   + APSC-DV-000940, The application must log application shutdown events.
 + [Apache Tomcat Application Server 9, version 3, release 2](https://www.cyber.mil/stigs/downloads)
   + TCAT-AS-000170, Tomcat servers behind a proxy or load balancer must log client IP.
   + TCAT-AS-001080, Application user name must be logged.
 + [Apache Server 2.4 UNIX Server, version 3, release 2](https://www.cyber.mil/stigs/downloads)
   + AS24-U1-000065, The Apache web server must have system logging enabled.
   + AS24-U1-000070, The Apache web server must generate, at a minimum, log records for system startup and shutdown, system access, and system authentication events.
   + AS24-U1-000130, An Apache web server, behind a load balancer or proxy server, must produce log records containing the client IP information as the source and destination and not the load balancer or proxy IP information with each event.
   + AS24-U1-000160, The Apache web server must use a logging mechanism that is configured to alert the Information System Security Officer (ISSO) and System Administrator (SA) in the event of a processing failure.
   + AS24-U1-000180, The Apache web server log files must only be accessible by privileged users.
   + AS24-U1-000190, The log information from the Apache web server must be protected from unauthorized modification or deletion.
   + AS24-U1-000440, Apache web server application directories,  libraries, and configuration files must only be accessible to privileged users.
   + AS24-U1-000690, Non-privileged accounts on the hosting system must only access Apache web server security-relevant information and functions through a distinct administrative account.
   + AS24-U1-000710, The Apache web server must use a logging mechanism that is configured to allocate log record storage capacity large enough to accommodate the logging requirements of the Apache web server.
   + AS24-U1-000730, The Apache web server must be configured to integrate with an organizations security infrastructure.
