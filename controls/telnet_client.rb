# encoding: utf-8
# copyright: 2015, Walter Dolce <walterdolce@gmail.com>
# license: Apache License 2.0
title 'telnet client'

control 'telnet-client' do
  impact 0.5
  title 'Prevent use of the telnet client'
  desc 'Verifies whether there is a "telnet" client executable available in $PATH'
  
  tag 'production', 'development'
  tag 'telnet', 'protocol'
  
  describe command('telnet') do
    it { should_not exist }
  end
end
