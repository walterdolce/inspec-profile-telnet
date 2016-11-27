Given(/^the telnet server is not installed on the node$/) do
  assert_telnet_server_absence
end

When(/^the telnet server executable is not found in PATH on the node$/) do
  assert_telnet_server_absence
end

def assert_telnet_server_absence
  %w(telnetd in.telnetd).each do |telnet_server_executable|
    `which #{telnet_server_executable}`
    expect($?.exitstatus).to_not eq 0
  end
end
