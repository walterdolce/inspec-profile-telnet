Feature: Telnet client detection
  In order to know whether a system has the telnet client installed
  As a system administrator and business owner
  I want InSpec to fail the compliance checks if it detect one

  Scenario: InSpec fails compliance checks when an 'telnet' executable is found in $PATH
    Given the telnet client is installed on the node
    When an executable "telnet" is found in $PATH on the node
    Then InSpec's compliance checks will fail

