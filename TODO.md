- [IN PROGRESS] Implement logic to parse xinetd config files so to detect telnet related config
- Implement logic to parse inetd config files so to detect telnet related config
- Add integration test which verifies the presence of a warning 
message when xinetd is installed BUT its configuration could not 
be parsed (assumes a failure in reading xinetd.conf and/or 
a failure in reading its included files if any).
- Add integration test which verifies the presence of a warning 
message when inetd is installed BUT its configuration could not 
be parsed (assumes a failure in reading inetd.conf and/or 
a failure in reading its included files if any).
