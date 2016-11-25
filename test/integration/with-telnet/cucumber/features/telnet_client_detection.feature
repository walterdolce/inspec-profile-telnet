Feature: Telnet client detection
  In order to know whether a system has the telnet client installed
  As a system administrator and business owner
  I want InSpec to fail the compliance checks if it detect one

  Scenario: InSpec fails compliance checks when the telnet client is installed on the system
    Given I provision the node
    And the telnet client is installed on the node
    When I run InSpec on the node
    Then it fails the compliance checks

