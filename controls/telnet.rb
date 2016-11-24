# encoding: utf-8
# copyright: 2015, Walter Dolce <walterdolce@gmail.com>
# license: Apache License 2.0
title 'telnet'

control 'telnet-executable-in-path' do
  impact 0.7
  title 'Verifies whether there is a telnet executable available in $PATH'
  desc title
  describe command('which telnet') do
    it { should_not exist }
    its('exit_status') { should_not eq 0 }
  end
end