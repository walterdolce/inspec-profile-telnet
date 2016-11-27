Feature: Telnet server detection
  In order to know whether a system has the telnet server installed
  As a system administrator and business owner
  I want InSpec to fail the compliance checks if it detect one

  Scenario: InSpec fails compliance checks when the telnet server is installed on the system
    When the telnet server is installed on the node
    Then InSpec's compliance checks will fail

