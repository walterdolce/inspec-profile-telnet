require 'rspec'
require_relative '../../libraries/xinetd_config/lexer'

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
    lexer = XinetdConfig::Lexer.new(<<CONFIGURATION_CONTENT


CONFIGURATION_CONTENT
    )
    expect(lexer.tokenize).to eq []
  end

  it 'returns lists containing instances of token objects representing the tokenized configuration components' do
    lexer = XinetdConfig::Lexer.new(<<CONFIGURATION_CONTENT

    # I am a comment
CONFIGURATION_CONTENT
    )
    tokens = lexer.tokenize
    expect(tokens).to_not eq []
    expect(tokens[0]).to be_kind_of XinetdConfig::Token::CommentToken

    lexer = XinetdConfig::Lexer.new(<<CONFIGURATION_CONTENT

    # I am a comment
service
CONFIGURATION_CONTENT
    )
    tokens = lexer.tokenize
    expect(tokens).to_not eq []
    expect(tokens[0]).to be_kind_of XinetdConfig::Token::CommentToken
    expect(tokens[1]).to be_kind_of XinetdConfig::Token::ServiceToken
  end
end

