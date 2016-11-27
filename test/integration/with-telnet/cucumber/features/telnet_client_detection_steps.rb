Given(/^I provision the node$/) do
  # Placeholder step
end

Given(/^the telnet client is installed on the node$/) do
  `which telnet`
  expect($?.exitstatus).to eq 0
end

When(/^InSpec's compliance checks will fail$/) do
  `inspec exec /tmp/inspec-profile`
  expect($?.exitstatus).to_not eq 0
end
