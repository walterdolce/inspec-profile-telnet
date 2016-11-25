Given(/^I provision the node$/) do
  # Placeholder step
end

Given(/^the telnet client is installed on the node$/) do
  `which telnet`
  expect($?.exitstatus).to eq 0
end

When(/^I run InSpec on the node$/) do
  ::STDOUT.puts `pwd`
  ::STDOUT.puts `ls /tmp/inspec-profile`
  ::STDOUT.puts `inspec check /tmp/inspec-profile`
end

Then(/^it fails the compliance checks$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
