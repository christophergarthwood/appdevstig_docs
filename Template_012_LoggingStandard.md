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
Include in Host portion of conf/server.xml with your Tomcat Distribution

<Valve className="org.apache.catalina.valves.AccessLogValve"
       directory="${catalina.base}/logs"
       prefix="access_log" 
       fileDateFormat="yyyy-MM-dd.HH"
       suffix=".log" 
       pattern="%h^%l^%u^%t^%>s^%b^%T^cookie:%{SESSIONID}c^request:%{SESSIONID}r^%U^%q"
/>

Explanation:

Hostname/IP, Remote Logname, Remote User, Time Request was received, status, Size of Repsonse in bytes minute HTTP Headers, Time of request, Cookie SessionID, request Session Id, URL Path, Query

Tomcat Patterns:

[Access Logging](https://tomcat.apache.org/tomcat-9.0-doc/config/valve.html#Access_Logging)

|Symbol|Explanation|
|------|-----------|
|%a | Remote IP address. See also %{xxx}a below.|
|%A | Local IP address|
|%b | Bytes sent, excluding HTTP headers, or '-' if zero|
|%B | Bytes sent, excluding HTTP headers|
|%D | Time taken to process the request in millis. Note: In httpd %D is microseconds. Behaviour will be aligned to httpd in Tomcat 10 onwards.|
|%F | Time taken to commit the response, in milliseconds|
|%h | Remote host name (or IP address if enableLookups for the connector is false)|
|%H | Request protocol|
|%I | Current request thread name (can compare later with stacktraces)|
|%l | Remote logical username from identd (always returns '-')|
|%m | Request method (GET, POST, etc.)|
|%p | Local port on which this request was received. See also %{xxx}p below.|
|%q | Query string (prepended with a '?' if it exists)|
|%r | First line of the request (method and request URI)|
|%s | HTTP status code of the response|
|%S | User session ID|
|%t | Date and time, in Common Log Format|
|%T | Time taken to process the request, in seconds. Note: This value has millisecond resolution whereas in httpd it has second resolution. Behaviour will be align to httpd in Tomcat 10 onwards.|
|%u | Remote user that was authenticated (if any), else '-' (escaped if required)|
|%U | Requested URL path|
|%v | Local server name|
|%X | Connection status when response is completed:|
|X =| Connection aborted before the response completed.|
|+ =| Connection may be kept alive after the response is sent.|
|- =| Connection will be closed after the response is sent.|

There is also support to write information incoming or outgoing headers, cookies, session or request attributes and special timestamp formats. It is modeled after the Apache HTTP Server log configuration syntax. Each of them can be used multiple times with different xxx keys:

|Pattern|Explanation|
|-------|-----------|
|%{xxx}a|write remote address (client) (xxx==remote) or connection peer address (xxx=peer)
|%{xxx}i|write value of incoming header with name xxx (escaped if required)
|%{xxx}o|write value of outgoing header with name xxx (escaped if required)
|%{xxx}c|write value of cookie(s) with name xxx (comma separated and escaped if required)
|%{xxx}r|write value of ServletRequest attribute with name xxx (escaped if required, value ?? if request is null)
|%{xxx}s|write value of HttpSession attribute with name xxx (escaped if required, value ?? if request is null)
|%{xxx}p|write local (server) port (xxx==local) or remote (client) port (xxx=remote)
|%{xxx}t|write timestamp at the end of the request formatted using the enhanced SimpleDateFormat pattern xxx

### Apache

[Apache 2.4 Logs](https://httpd.apache.org/docs/2.4/logs.html)

#### System Logging Secure Socket Layers (SSL)

LogFormat "%h^

#### Startup / Shutdown Logs

Minimal log format is:

LogFormat "%a %A %h %H %l %m %s %t %u %U \"%{Referer}i\" " common

Apache Log Formats

|Format|String Description|
|------|------------------|
|%%|The percent sign.|
|%a|Client IP address of the request (see the mod_remoteip module).|
|%{c}a|Underlying peer IP address of the connection (see the mod_remoteip module).|
|%A|Local IP-address.|
|%B|Size of response in bytes, excluding HTTP headers.|
|%b|Size of response in bytes, excluding HTTP headers. In CLF format, i.e. a '-' rather than a 0 when no bytes are sent.|
|%{VARNAME}C|The contents of cookie VARNAME in the request sent to the server. Only version 0 cookies are fully supported.|
|%D|The time taken to serve the request, in microseconds.|
|%{VARNAME}e|The contents of the environment variable VARNAME.|
|%f|Filename.|
|%h|Remote hostname. Will log the IP address if HostnameLookups is set to Off, which is the default. If it logs the hostname for only a few hosts, you probably have access control directives mentioning them by name. See the Require host documentation.|
|%{c}h|Like %h, but always reports on the hostname of the underlying TCP connection and not any modifications to the remote hostname by modules like mod_remoteip.|
|%H|The request protocol.|
|%{VARNAME}i|The contents of VARNAME: header line(s) in the request sent to the server. Changes made by other modules (e.g. mod_headers) affect this. If you're interested in what the request header was prior to when most modules would have modified it, use mod_setenvif to copy the header into an internal environment variable and log that value with the %{VARNAME}e described above.|
|%k|Number of keepalive requests handled on this connection. Interesting if KeepAlive is being used, so that, for example, a '1' means the first keepalive request after the initial one, '2' the second, etc...; otherwise this is always 0 (indicating the initial request).|
|%l|Remote logname (from identd, if supplied). This will return a dash unless mod_ident is present and IdentityCheck is set On.|
|%L|The request log ID from the error log (or '-' if nothing has been logged to the error log for this request). Look for the matching error log line to see what request caused what error.|
|%m|The request method.|
|%{VARNAME}n|The contents of note VARNAME from another module.|
|%{VARNAME}o|The contents of VARNAME: header line(s) in the reply.|
|%p|The canonical port of the server serving the request.|
|%{format}p|The canonical port of the server serving the request, or the server's actual port, or the client's actual port. Valid formats are canonical, local, or remote.|
|%P|The process ID of the child that serviced the request.|
|%{format}P|The process ID or thread ID of the child that serviced the request. Valid formats are pid, tid, and hextid.|
|%q|The query string (prepended with a ? if a query string exists, otherwise an empty string).|
|%r|First line of request.|
|%R|The handler generating the response (if any).|
|%s|Status. For requests that have been internally redirected, this is the status of the original request. Use %>s for the final status.|
|%t|Time the request was received, in the format [18/Sep/2011:19:18:28 -0400]. The last number indicates the timezone offset from GMT|
|%{format}t|The time, in the form given by format, which should be in an extended strftime(3) format (potentially localized). If the format starts with begin: (default) the time is taken at the beginning of the request processing. If it starts with end: it is the time when the log entry gets written, close to the end of the request processing. In addition to the formats supported by strftime(3), the following format tokens are supported: sec -	number of seconds since the Epoch; msec - number of milliseconds since the Epoch; usec - number of microseconds since the Epoch; msec_frac - millisecond fraction; usec_frac - microsecond fraction.  These tokens can not be combined with each other or strftime(3) formatting in the same format string. You can use multiple %{format}t tokens instead.|
|%T|The time taken to serve the request, in seconds.|
|%{UNIT}T|The time taken to serve the request, in a time unit given by UNIT. Valid units are ms for milliseconds, us for microseconds, and s for seconds. Using s gives the same result as %T without any format; using us gives the same result as %D. Combining %T with a unit is available in 2.4.13 and later.|
|%u|Remote user if the request was authenticated. May be bogus if return status (%s) is 401 (unauthorized).|
|%U|The URL path requested, not including any query string.|
|%v|The canonical ServerName of the server serving the request.|
|%V|The server name according to the UseCanonicalName setting.|
|%X|Connection status when response is completed:|
|X =|Connection aborted before the response completed.|
|+ =|Connection may be kept alive after the response is sent.|
|- =|Connection will be closed after the response is sent.|
|%I|Bytes received, including request and headers. Cannot be zero. You need to enable mod_logio to use this.|
|%O|Bytes sent, including headers. May be zero in rare cases such as when a request is aborted before a response is sent. You need to enable mod_logio to use this.|
|%S|Bytes transferred (received and sent), including request and headers, cannot be zero. This is the combination of %I and %O. You need to enable mod_logio to use this.|
|%{VARNAME}^ti|The contents of VARNAME: trailer line(s) in the request sent to the server.|
|%{VARNAME}^to|The contents of VARNAME: trailer line(s) in the response sent from the server.|

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
