describe XinetdConfig::Token::Parser::ServiceAttributeStatementParser do

  let(:parser) {
    parser = XinetdConfig::Token::Parser::ServiceAttributeStatementParser.new
  }
  let (:tokens_list) {
    [XinetdConfig::Token::EntryBeginToken.new('')]
  }

  it 'is of type XinetdConfig::Token::Parser::BaseParser' do
    expect(parser).to be_kind_of XinetdConfig::Token::Parser::BaseParser
  end

  it 'tokenizes instances of XinetdConfig::Token::ServiceAttributes::UnrecognisedAttributeToken by default when unsupported tokens are parsed' do
    expect(
      parser.tokenize('foo', tokens_list)
    ).to include XinetdConfig::Token::ServiceAttributes::UnrecognisedAttributeToken
  end

  it 'returns an instance of XinetdConfig::Token::ServiceAttributes::TokenFactory as default token factory' do
    expect(parser.token_factory).to be_kind_of XinetdConfig::Token::ServiceAttributes::TokenFactory
  end

  it 'raises an error if an attempt to write the token factory is made' do
    expect { parser.token_factory = 'foo' }.to raise_error
  end

  it 'raises an error if the wrong type of factory is injected' do
    expect {
      XinetdConfig::Token::Parser::ServiceAttributeStatementParser.new(nil, WrongFactory.new)
    }.to raise_error TypeError
  end

  it 'returns an instance of the supported tokens' do
    #TODO assert each supported attribute translate to the correct type
    expect(
      parser.tokenize(
        XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN,
        tokens_list
      )
    ).to include XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken
  end

  it 'returns the expected combination of tokenized tokens' do
    tokens = parser.tokenize('id = telnet', tokens_list)
    expected_tokens = [
      XinetdConfig::Token::EntryBeginToken,
      XinetdConfig::Token::ServiceAttributes::IdAttributeToken,
      XinetdConfig::Token::Operators::AssignmentToken,
      XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::IdValueToken,
    ]

    expect(tokens.length).to eq(expected_tokens.length)

    tokens.each_with_index { |token, i|
      expect(token).to be_kind_of expected_tokens.at(i)
    }
  end

  it 'calls the chained parser if available when it cannot tokenize on its own' do
    chained_parser = ChainedParser.new
    expect(chained_parser).to receive(:tokenize).with('foo', [])
    parser = XinetdConfig::Token::Parser::ServiceAttributeStatementParser.new(chained_parser)
    parser.tokenize('foo')
  end
end
