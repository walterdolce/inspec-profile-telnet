describe XinetdConfig::Token::ServiceAttributes::TokenFactory do

  let (:factory) {
    XinetdConfig::Token::ServiceAttributes::TokenFactory.new
  }

  let (:unrecognised_token) {
    XinetdConfig::Token::ServiceAttributes::UnrecognisedAttributeToken
  }

  it 'creates an instance of XinetdConfig::Token::ServiceAttributes::UnrecognisedAttributeToken by default' do
    expect(factory.create).to be_kind_of unrecognised_token
  end

  it 'creates an instance of XinetdConfig::Token::ServiceAttributes::UnrecognisedAttributeToken when no supported service attribute token class is matched' do
    expect(factory.create('foo')).to be_kind_of unrecognised_token
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken from #{XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::ProtocolAttributeToken from #{XinetdConfig::Token::ServiceAttributes::ProtocolAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::ProtocolAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::ProtocolAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::WaitAttributeToken from #{XinetdConfig::Token::ServiceAttributes::WaitAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::WaitAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::WaitAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::UserAttributeToken from #{XinetdConfig::Token::ServiceAttributes::UserAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::UserAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::UserAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::GroupAttributeToken from #{XinetdConfig::Token::ServiceAttributes::GroupAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::GroupAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::GroupAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::ServerAttributeToken from #{XinetdConfig::Token::ServiceAttributes::ServerAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::ServerAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::ServerAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::ServerArgsAttributeToken from #{XinetdConfig::Token::ServiceAttributes::ServerArgsAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::ServerArgsAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::ServerArgsAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::InstancesAttributeToken from #{XinetdConfig::Token::ServiceAttributes::InstancesAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::InstancesAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::InstancesAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::LogOnSuccessAttributeToken from #{XinetdConfig::Token::ServiceAttributes::LogOnSuccessAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::LogOnSuccessAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::LogOnSuccessAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::LogOnFailureAttributeToken from #{XinetdConfig::Token::ServiceAttributes::LogOnFailureAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::LogOnFailureAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::LogOnFailureAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::LogTypeAttributeToken from #{XinetdConfig::Token::ServiceAttributes::LogTypeAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::LogTypeAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::LogTypeAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::OnlyFromAttributeToken from #{XinetdConfig::Token::ServiceAttributes::OnlyFromAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::OnlyFromAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::OnlyFromAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::NoAccessAttributeToken from #{XinetdConfig::Token::ServiceAttributes::NoAccessAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::NoAccessAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::NoAccessAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::AccessTimesAttributeToken from #{XinetdConfig::Token::ServiceAttributes::AccessTimesAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::AccessTimesAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::AccessTimesAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::TypeAttributeToken from #{XinetdConfig::Token::ServiceAttributes::TypeAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::TypeAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::TypeAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::RpcVersionAttributeToken from #{XinetdConfig::Token::ServiceAttributes::RpcVersionAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::RpcVersionAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::RpcVersionAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::RpcNumberAttributeToken from #{XinetdConfig::Token::ServiceAttributes::RpcNumberAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::RpcNumberAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::RpcNumberAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::IdAttributeToken from #{XinetdConfig::Token::ServiceAttributes::IdAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::IdAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::IdAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::EnvAttributeToken from #{XinetdConfig::Token::ServiceAttributes::EnvAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::EnvAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::EnvAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::PortAttributeToken from #{XinetdConfig::Token::ServiceAttributes::PortAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::PortAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::PortAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::PassenvAttributeToken from #{XinetdConfig::Token::ServiceAttributes::PassenvAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::PassenvAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::PassenvAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::FlagsAttributeToken from #{XinetdConfig::Token::ServiceAttributes::FlagsAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::FlagsAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::FlagsAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::NiceAttributeToken from #{XinetdConfig::Token::ServiceAttributes::NiceAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::NiceAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::NiceAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::RedirectAttributeToken from #{XinetdConfig::Token::ServiceAttributes::RedirectAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::RedirectAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::RedirectAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::BannerAttributeToken from #{XinetdConfig::Token::ServiceAttributes::BannerAttributeToken::TOKEN}" do
    
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::BannerAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::BannerAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::BindAttributeToken from #{XinetdConfig::Token::ServiceAttributes::BindAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::BindAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::BindAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::InterfaceAttributeToken from #{XinetdConfig::Token::ServiceAttributes::InterfaceAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::InterfaceAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::InterfaceAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::PerSourceAttributeToken from #{XinetdConfig::Token::ServiceAttributes::PerSourceAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::PerSourceAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::PerSourceAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::GroupsAttributeToken from #{XinetdConfig::Token::ServiceAttributes::GroupsAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::GroupsAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::GroupsAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::BannerSuccessAttributeToken from #{XinetdConfig::Token::ServiceAttributes::BannerSuccessAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::BannerSuccessAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::BannerSuccessAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::BannerFailAttributeToken from #{XinetdConfig::Token::ServiceAttributes::BannerFailAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::BannerFailAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::BannerFailAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::CpsAttributeToken from #{XinetdConfig::Token::ServiceAttributes::CpsAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::CpsAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::CpsAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::DisableAttributeToken from #{XinetdConfig::Token::ServiceAttributes::DisableAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::DisableAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::DisableAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::MaxLoadAttributeToken from #{XinetdConfig::Token::ServiceAttributes::MaxLoadAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::MaxLoadAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::MaxLoadAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::RLimitAsAttributeToken from #{XinetdConfig::Token::ServiceAttributes::RLimitAsAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::RLimitAsAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::RLimitAsAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::RLimitCpuAttributeToken from #{XinetdConfig::Token::ServiceAttributes::RLimitCpuAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::RLimitCpuAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::RLimitCpuAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::RLimitDataAttributeToken from #{XinetdConfig::Token::ServiceAttributes::RLimitDataAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::RLimitDataAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::RLimitDataAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::RLimitRssAttributeToken from #{XinetdConfig::Token::ServiceAttributes::RLimitRssAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::RLimitRssAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::RLimitRssAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::RLimitStackAttributeToken from #{XinetdConfig::Token::ServiceAttributes::RLimitStackAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::RLimitStackAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::RLimitStackAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::V6OnlyAttributeToken from #{XinetdConfig::Token::ServiceAttributes::V6OnlyAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::V6OnlyAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::V6OnlyAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::DenyTimeAttributeToken from #{XinetdConfig::Token::ServiceAttributes::DenyTimeAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::DenyTimeAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::DenyTimeAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::UmaskAttributeToken from #{XinetdConfig::Token::ServiceAttributes::UmaskAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::UmaskAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::UmaskAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::MdnsAttributeToken from #{XinetdConfig::Token::ServiceAttributes::MdnsAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::MdnsAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::MdnsAttributeToken
  end

  it "creates an instance of XinetdConfig::Token::ServiceAttributes::LibwrapAttributeToken from #{XinetdConfig::Token::ServiceAttributes::LibwrapAttributeToken::TOKEN}" do
    expect(
      factory.create(XinetdConfig::Token::ServiceAttributes::LibwrapAttributeToken::TOKEN)
    ).to be_kind_of XinetdConfig::Token::ServiceAttributes::LibwrapAttributeToken
  end
end
