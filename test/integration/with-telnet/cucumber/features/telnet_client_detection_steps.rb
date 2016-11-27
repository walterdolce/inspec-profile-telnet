Given(/^the telnet client is installed on the node$/) do
  `sudo apt-get install -y telnet`
  expect($?.exitstatus).to eq 0
end

When(/^an executable "([^"]*)" is found in PATH on the node$/) do |executable_name|
  `which #{executable_name}`
  expect($?.exitstatus).to eq 0
end

Then(/^InSpec's compliance checks fail$/) do
  `inspec exec /tmp/inspec-profile`
  expect($?.exitstatus).to_not eq 0
end
