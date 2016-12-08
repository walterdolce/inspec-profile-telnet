describe XinetdConfig::Token::Parser::BaseParser do
  it 'raises an exception if the chained parser is not of the correct type' do
    expect {
      XinetdConfig::Token::Parser::BaseParser.new(WrongChainedParser.new)
    }.to raise_error(TypeError)
  end

  it 'raises an exception when the "abstract" methods are invoked directly' do
    expect {
      XinetdConfig::Token::Parser::BaseParser.new.tokenize('foo')
    }.to raise_error(NotImplementedError)
  end
end
