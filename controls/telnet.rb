# encoding: utf-8
# copyright: 2015, Walter Dolce <walterdolce@gmail.com>
# license: Apache License 2.0
title 'telnet'

control 'telnet-executable-presence' do
  impact 0.7
  title 'Verifies whether there is a "telnet" executable available in $PATH'
  desc title
  describe command('telnet') do
    it { should_not exist }
  end
end
