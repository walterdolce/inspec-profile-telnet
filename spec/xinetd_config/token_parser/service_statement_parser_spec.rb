describe XinetdConfig::Token::Parser::ServiceStatementParser do

  it 'is of type XinetdConfig::Token::Parser::BaseParser' do
    expect(XinetdConfig::Token::Parser::ServiceStatementParser.new).to be_kind_of XinetdConfig::Token::Parser::BaseParser
  end

  it 'returns null when there is nothing to tokenize' do
    parser = XinetdConfig::Token::Parser::ServiceStatementParser.new
    expect(parser.tokenize('foo')).to eq nil
  end

  it 'returns an instance of the token' do
    parser = XinetdConfig::Token::Parser::ServiceStatementParser.new
    expect(parser.tokenize(XinetdConfig::Token::ServiceToken::TOKEN)).to be_kind_of XinetdConfig::Token::ServiceToken
  end

  it 'returns a list with instances of the service and service name tokens' do
    parser = XinetdConfig::Token::Parser::ServiceStatementParser.new
    tokens = parser.tokenize('service telnet')
    [
      XinetdConfig::Token::ServiceToken,
      XinetdConfig::Token::ServiceNameToken,
    ].each do |token_instance|
      expect(tokens).to include token_instance
    end
  end

  it 'calls the chained parser if available when it cannot tokenize on its own' do
    class ChainedParser < XinetdConfig::Token::Parser::BaseParser
      def tokenize(line)
      end
    end
    chained_parser = ChainedParser.new
    expect(chained_parser).to receive(:tokenize).with('foo')
    parser = XinetdConfig::Token::Parser::ServiceStatementParser.new(chained_parser)
    parser.tokenize('foo')
  end
end
