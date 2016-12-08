describe XinetdConfig::Token::Parser::IncludeDirStatementParser do

  it 'is of type XinetdConfig::Token::Parser::BaseParser' do
    expect(XinetdConfig::Token::Parser::IncludeDirStatementParser.new).to be_kind_of XinetdConfig::Token::Parser::BaseParser
  end

  it 'returns null when there is nothing to tokenize' do
    parser = XinetdConfig::Token::Parser::IncludeDirStatementParser.new
    expect(parser.tokenize('foo')).to eq nil
  end

  it 'returns an instance of the token' do
    parser = XinetdConfig::Token::Parser::IncludeDirStatementParser.new
    expect(parser.tokenize(XinetdConfig::Token::IncludeDirToken::TOKEN)).to include XinetdConfig::Token::IncludeDirToken
  end

  it 'returns a list with instances of the includedir and the include path tokens' do
    parser = XinetdConfig::Token::Parser::IncludeDirStatementParser.new
    tokens = parser.tokenize('includedir /some/file')
    [
      XinetdConfig::Token::IncludeDirToken,
      XinetdConfig::Token::IncludePathToken,
    ].each do |token_instance|
      expect(tokens).to include token_instance
    end
  end

  it 'calls the chained parser if available when it cannot tokenize on its own' do
    class ChainedParser < XinetdConfig::Token::Parser::BaseParser
      def tokenize(line, tokens_list=[])
      end
    end
    chained_parser = ChainedParser.new
    expect(chained_parser).to receive(:tokenize).with('foo', [])
    parser = XinetdConfig::Token::Parser::IncludeDirStatementParser.new(chained_parser)
    parser.tokenize('foo')
  end
end
