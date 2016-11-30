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
    lexer = XinetdConfig::Lexer.new(<<configuration


configuration
    )
    expect(lexer.tokenize).to eq []
  end

  it 'returns a list containing instances of token objects representing the tokenized configuration components' do
    lexer = XinetdConfig::Lexer.new(<<configuration

    # I am a comment
configuration
    )
    tokens = lexer.tokenize
    expect(tokens).to_not eq []
    expect(tokens[0]).to be_kind_of XinetdConfig::Token::Base
    expect(tokens[0]).to be_kind_of XinetdConfig::Token::CommentToken
  end
end

