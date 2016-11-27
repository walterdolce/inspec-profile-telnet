# encoding: utf-8
# copyright: 2015, Walter Dolce <walterdolce@gmail.com>
# license: Apache License 2.0
title 'telnet server'

control 'telnet-server' do
  impact 1.0
  title 'Prevents use of the telnet server'
  desc 'Verifies whether there the telnet server is available on the node'
  
  tag 'production', 'development'
  tag 'telnet', 'protocol'
  tag 'server', 'service'
 
  %w(telnetd in.telnetd).each do |executable|
    describe command(executable) do
      it { should_not exist }
    end
  end
end
