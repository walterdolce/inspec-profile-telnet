describe XinetdConfig::Token::Parser::DefaultsStatementParser do

  let (:parser) {
    XinetdConfig::Token::Parser::DefaultsStatementParser.new
  }

  it 'is of type XinetdConfig::Token::Parser::BaseParser' do
    expect(parser).to be_kind_of XinetdConfig::Token::Parser::BaseParser
  end

  it 'returns null when there is nothing to tokenize' do
    expect(parser.tokenize('foo')).to eq nil
  end

  it 'returns an instance of the token' do
    expect(parser.tokenize(XinetdConfig::Token::DefaultsToken::TOKEN)).to include XinetdConfig::Token::DefaultsToken
  end

  it 'calls the chained parser if available when it cannot tokenize on its own' do
    chained_parser = ChainedParser.new
    expect(chained_parser).to receive(:tokenize).with('foo', [])
    parser = XinetdConfig::Token::Parser::DefaultsStatementParser.new(chained_parser)
    parser.tokenize('foo')
  end
end
