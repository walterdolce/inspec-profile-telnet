require 'inspec'
require 'rspec'
require_relative '../libraries/xinetd_config'

describe XinetdConfig::XinetdConfig do
  it 'is of type Inspec.resource(1)' do
    expect(XinetdConfig::XinetdConfig).to be < Inspec.resource(1)
  end
end
