describe XinetdConfig::Token::Parser::IncludeStatementParser do

  it 'is of type XinetdConfig::Token::Parser::BaseParser' do
    expect(XinetdConfig::Token::Parser::IncludeStatementParser.new).to be_kind_of XinetdConfig::Token::Parser::BaseParser
  end

  it 'returns null when there is nothing to tokenize' do
    parser = XinetdConfig::Token::Parser::IncludeStatementParser.new
    expect(parser.tokenize('foo')).to eq nil
  end

  it 'returns an instance of the token' do
    parser = XinetdConfig::Token::Parser::IncludeStatementParser.new
    expect(parser.tokenize(XinetdConfig::Token::IncludeToken::TOKEN)).to include XinetdConfig::Token::IncludeToken
  end

  it 'returns a list with instances of the include and the include path tokens' do
    parser = XinetdConfig::Token::Parser::IncludeStatementParser.new
    tokens = parser.tokenize('include /some/file')
    [
      XinetdConfig::Token::IncludeToken,
      XinetdConfig::Token::IncludedPathToken,
    ].each do |token_instance|
      expect(tokens).to include token_instance
    end
  end

  it 'calls the chained parser if available when it cannot tokenize on its own' do
    chained_parser = ChainedParser.new
    expect(chained_parser).to receive(:tokenize).with('foo', [])
    parser = XinetdConfig::Token::Parser::IncludeStatementParser.new(chained_parser)
    parser.tokenize('foo')
  end
end
