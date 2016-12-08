describe XinetdConfig::Token::Parser::ServiceStatementParser do

  let (:parser) {
    XinetdConfig::Token::Parser::ServiceStatementParser.new
  }

  it 'is of type XinetdConfig::Token::Parser::BaseParser' do
    expect(parser).to be_kind_of XinetdConfig::Token::Parser::BaseParser
  end

  it 'returns null when there is nothing to tokenize' do
    expect(parser.tokenize('foo')).to eq nil
  end

  it 'returns an instance of the token' do
    expect(parser.tokenize(XinetdConfig::Token::ServiceToken::TOKEN)).to include XinetdConfig::Token::ServiceToken
  end

  it 'returns a list with instances of the service and service name tokens' do
    tokens = parser.tokenize('service telnet')
    [
      XinetdConfig::Token::ServiceToken,
      XinetdConfig::Token::ServiceNameToken,
    ].each do |token_instance|
      expect(tokens).to include token_instance
    end
  end

  it 'calls the chained parser if available when it cannot tokenize on its own' do
    chained_parser = ChainedParser.new
    expect(chained_parser).to receive(:tokenize).with('foo', [])
    parser = XinetdConfig::Token::Parser::ServiceStatementParser.new(chained_parser)
    parser.tokenize('foo')
  end
end
