describe XinetdConfig::Token::CommentToken do
  it 'is of type XinetdConfig::Token::Base' do
    token = XinetdConfig::Token::CommentToken.new('# I am a comment')
    expect(token).to be_kind_of XinetdConfig::Token::Base
  end

  it 'returns its raw content as initially set upon instantiation' do
    token = XinetdConfig::Token::CommentToken.new('# I am a comment')
    expect(token.raw_token).to eq '# I am a comment'
  end

  it 'returns the comment content polished from the comment token' do
    token = XinetdConfig::Token::CommentToken.new('# #I am a comment')
    expect(token.token).to eq '#I am a comment'
  end
end
