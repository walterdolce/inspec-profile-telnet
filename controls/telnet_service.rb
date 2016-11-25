# encoding: utf-8
# copyright: 2015, Walter Dolce <walterdolce@gmail.com>
# license: Apache License 2.0
title 'telnet service'

control 'telnet-service' do
  impact 1.0
  title 'Prevent use of the telnet service'
  desc 'Verifies the status of the telnet service'
  
  tag 'production', 'development'
  tag 'telnet', 'protocol'
  tag 'service'
  
  describe service('com.apple.telnetd') do
    it { should_not be_installed }
    it { should_not be_enabled }
    it { should_not be_running }
  end
end
