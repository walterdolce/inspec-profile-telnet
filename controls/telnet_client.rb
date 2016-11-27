# encoding: utf-8
# copyright: 2015, Walter Dolce <walterdolce@gmail.com>
# license: Apache License 2.0
title 'telnet client'

control 'telnet-client' do
  impact 0.5
  title 'Prevent use of the telnet client'
  desc 'Verifies whether a telnet client executable is available in PATH'
  
  tag 'production', 'development'
  tag 'telnet', 'protocol'
  
  %w(telnet telnet.netkit).each do |telnet_executable|
    describe command(telnet_executable) do
      it { should_not exist }
    end
  end
end
