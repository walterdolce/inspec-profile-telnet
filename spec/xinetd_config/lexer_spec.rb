require 'rspec'
require_relative '../../libraries/xinetd_config/lexer'
require_relative '../helpers/tokenization_assertor'

RSpec.configure do |c|
  c.include Helpers
end


describe XinetdConfig::Lexer do
  it 'returns an empty list of tokens by default' do
    lexer = XinetdConfig::Lexer.new
    expect(lexer.tokens).to eq []
  end

  it 'returns an empty string as raw configuration by default' do
    lexer = XinetdConfig::Lexer.new
    expect(lexer.raw_configuration).to eq ''
  end

  it 'returns the raw configuration as is when set' do
    lexer = XinetdConfig::Lexer.new('some configuration')
    expect(lexer.raw_configuration).to eq 'some configuration'
  end

  it 'returns an empty list of tokens when the tokenized configuration files content result empty' do
    assert_tokenization_of('').produces []
  end

  it 'tokenizes comments found in the configuration files' do
    assert_tokenization_of(<<CONTENT
    # I am a comment
CONTENT
    ).produces [XinetdConfig::Token::CommentBeginToken]
  end

  it 'tokenizes partial service blocks found in the configuration files' do
    assert_tokenization_of(<<CONTENT
service
CONTENT
    ).produces [XinetdConfig::Token::ServiceToken]
  end

  it 'tokenizes empty service blocks found in the configuration files' do
    assert_tokenization_of(<<CONTENT
service telnet
{
}
CONTENT
    ).produces [
                 XinetdConfig::Token::ServiceToken,
                 XinetdConfig::Token::ServiceNameToken,
                 XinetdConfig::Token::EntryBeginToken,
                 XinetdConfig::Token::EntryEndToken,
               ]
  end

  it 'tokenizes partial defaults block found in the configuration files' do
    assert_tokenization_of(<<CONTENT
defaults
CONTENT
    ).produces [XinetdConfig::Token::DefaultsToken]
  end

  it 'tokenizes empty include statements found in the configuration files' do
    pending 'TODO'
  end

  it 'tokenizes empty includedir statements found in the configuration files' do
    pending 'TODO'
  end


end

