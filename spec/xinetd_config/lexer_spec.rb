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

    def assert_tokenization_from(configuration, &block)
      lexer = XinetdConfig::Lexer.new(configuration)
      tokens = lexer.tokenize
      expect(tokens).to_not eq []
      (0...tokens.length).each { |i|
        expect(tokens[i]).to be_kind_of XinetdConfig::Token::CommentToken
      }
    end
    
    assert_tokenization_from(<<CONTENT

    # I am a comment
CONTENT
).to [XinetdConfig::Token::CommentToken]

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

