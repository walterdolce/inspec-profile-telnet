require 'rspec'

describe XinetdConfigToken do
  it 'returns its raw content as initially set upon instantiation' do
    token = XinetdConfigToken.new('# I am a comment')
    expect(token.raw_token).to eq '# I am a comment'
  end
end
