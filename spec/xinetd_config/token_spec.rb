require 'rspec'
require_relative '../../libraries/xinetd_config/token'

describe XinetdConfig::Token::Base do
  it 'returns its raw content as initially set upon instantiation' do
    token = XinetdConfig::Token::Base.new('# I am a comment')
    expect(token.raw_token).to eq '# I am a comment'
  end
end
