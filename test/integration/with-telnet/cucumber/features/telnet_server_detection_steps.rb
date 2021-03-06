Given(/^the telnet server is installed on the node$/) do
  `sudo apt-get install -y telnetd`
  expect($?.exitstatus).to eq 0
end

When(/^a telnet server executable is found in PATH on the node$/) do
  `which telnetd`
  exit_status = $?.exitstatus
  if exit_status == 1
    `which in.telnetd`
    exit_status = $?.exitstatus
  end
  
  expect(exit_status).to eq 0
end
