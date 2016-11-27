Feature: Telnet client detection
  In order to know whether a system has the telnet client installed
  As a system administrator and business owner
  I want InSpec to fail the compliance checks if it detect one

  Scenario: InSpec fails compliance checks when the telnet client is installed on the system
    Given the telnet client is installed on the node
    When I provision the node
    Then InSpec's compliance checks will fail

