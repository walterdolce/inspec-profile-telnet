Given(/^the telnet client is not installed on the node$/) do
  `which telnet`
  expect($?.exitstatus).to_not eq 0
end

When(/^the executable "([^"]*)" is not found in PATH on the node$/) do |executable_name|
  `which #{executable_name}`
  expect($?.exitstatus).to_not eq 0
end

Then(/^InSpec's compliance checks don't fail$/) do
  `inspec exec /tmp/inspec-profile`
  expect($?.exitstatus).to eq 0
end
