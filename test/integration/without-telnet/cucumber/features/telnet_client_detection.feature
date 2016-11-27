Feature: Telnet client detection
  In order to know whether a system has the telnet client installed
  As a system administrator and business owner
  I want InSpec to fail the compliance checks if it detect one

  Scenario Outline: InSpec doesn't fail compliance checks when a telnet executable is not found in PATH
    Given the telnet client is not installed on the node
    When the executable "<telnet_executable>" is not found in PATH on the node
    Then InSpec's compliance checks don't fail

    Examples:
      | telnet_executable |
      | telnet.netkit     |
      | telnet            |

