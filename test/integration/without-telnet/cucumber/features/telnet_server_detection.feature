Feature: Telnet server detection
  In order to know whether a system has the telnet server installed
  As a system administrator and business owner
  I want InSpec to fail the compliance checks if it detect one

  Scenario: InSpec fails compliance checks when the telnet server is installed on the system
    Given the telnet server is not installed on the node
    When the telnet server executable is not found in PATH on the node
    Then InSpec's compliance checks don't fail
