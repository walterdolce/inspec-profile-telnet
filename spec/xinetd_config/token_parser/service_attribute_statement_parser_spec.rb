describe XinetdConfig::Token::Parser::InternalBlockStatementParser do

  it 'is of type XinetdConfig::Token::Parser::BaseParser' do
    expect(XinetdConfig::Token::Parser::InternalBlockStatementParser.new).to be_kind_of XinetdConfig::Token::Parser::BaseParser
  end

  it 'tokenizes instances of XinetdConfig::Token::ServiceAttributes::UnrecognisedAttributeToken by default when unsupported tokens are parsed' do
    parser = XinetdConfig::Token::Parser::InternalBlockStatementParser.new
    expect(parser.tokenize('foo', [XinetdConfig::Token::EntryBeginToken.new('')])).to include XinetdConfig::Token::ServiceAttributes::UnrecognisedAttributeToken
  end

  it 'returns an instance of XinetdConfig::Token::ServiceAttributes::TokenFactory as default token factory' do
    parser = XinetdConfig::Token::Parser::InternalBlockStatementParser.new
    expect(
      parser.token_factory
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::TokenFactory
  end

  it 'raises an error if an attempt to write the token factory is made' do
    parser = XinetdConfig::Token::Parser::InternalBlockStatementParser.new
    expect {
      parser.token_factory = 'foo'
    }.to raise_error
  end

  it 'raises an error if the wrong type of factory is injected' do
    expect {
      class WrongFactory
      end
      XinetdConfig::Token::Parser::InternalBlockStatementParser.new(nil, WrongFactory.new)
    }.to raise_error TypeError
  end

  it 'returns an instance of the supported tokens' do
    #TODO assert each supported attribute translate to the correct type
    parser = XinetdConfig::Token::Parser::InternalBlockStatementParser.new
    expect(
      parser.tokenize(
        XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN,
        [XinetdConfig::Token::EntryBeginToken.new('')]
      )
    ).to include XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken
  end

  it 'returns the expected combination of tokenized tokens' do
    parser = XinetdConfig::Token::Parser::InternalBlockStatementParser.new
    tokens = parser.tokenize('id = telnet', [XinetdConfig::Token::EntryBeginToken.new('')])
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
    parser = XinetdConfig::Token::Parser::InternalBlockStatementParser.new(chained_parser)
    parser.tokenize('foo')
  end
end
