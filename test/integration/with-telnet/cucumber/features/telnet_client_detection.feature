Feature: Telnet client detection
  In order to know whether a system has the telnet client installed
  As a system administrator and business owner
  I want InSpec to fail the compliance checks if it detect one

  Scenario Outline: InSpec fails compliance checks when a telnet executable is found in PATH
    Given the telnet client is installed on the node
    When an executable "<telnet_executable>" is found in PATH on the node
    Then InSpec's compliance checks fail

    Examples:
      | telnet_executable |
      | telnet.netkit     |
      | telnet            |

