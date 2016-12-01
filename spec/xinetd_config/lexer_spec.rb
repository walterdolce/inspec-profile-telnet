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
    assert_tokenization_of(<<CONTENT


CONTENT
    ).produces []
  end

  it 'returns lists containing instances of token objects representing the tokenized configuration components' do
    assert_tokenization_of(<<CONTENT

    # I am a comment
CONTENT
    ).produces [XinetdConfig::Token::CommentToken]

    assert_tokenization_of(<<CONTENT

    # I am a comment
service
CONTENT
    ).produces [XinetdConfig::Token::CommentToken, XinetdConfig::Token::ServiceToken]

  end
end

