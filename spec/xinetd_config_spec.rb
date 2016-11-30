require 'inspec'
require 'rspec'
require_relative '../libraries/xinetd_config'

describe XinetdConfig do
  it 'should be of type Inspec.resource(1)' do
    expect(XinetdConfig).to be < Inspec.resource(1)
  end
end
