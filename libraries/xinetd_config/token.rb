Dir.glob(
  File.join(File.dirname(__FILE__), 'token', '**', '*.rb')
).each do |file|
  require file
end

module XinetdConfig
  module Token
    FIRST_LEVEL_TOKENS = [
      Token::EntryBeginToken::TOKEN,
      Token::EntryEndToken::TOKEN,
      Token::ServiceToken::TOKEN,
      Token::DefaultsToken::TOKEN,
      Token::IncludeDirToken::TOKEN,
      Token::IncludeToken::TOKEN,
    ]

    SERVICE_ATTRIBUTE_TOKENS = [
      Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN,
      Token::ServiceAttributes::ProtocolAttributeToken::TOKEN,
      Token::ServiceAttributes::WaitAttributeToken::TOKEN,
      Token::ServiceAttributes::UserAttributeToken::TOKEN,
      Token::ServiceAttributes::GroupAttributeToken::TOKEN,
      Token::ServiceAttributes::ServerAttributeToken::TOKEN,
      Token::ServiceAttributes::ServerArgsAttributeToken::TOKEN,
      Token::ServiceAttributes::InstancesAttributeToken::TOKEN,
      Token::ServiceAttributes::LogOnSuccessAttributeToken::TOKEN,
      Token::ServiceAttributes::LogOnFailureAttributeToken::TOKEN,
      Token::ServiceAttributes::LogTypeAttributeToken::TOKEN,
      Token::ServiceAttributes::OnlyFromAttributeToken::TOKEN,
      Token::ServiceAttributes::NoAccessAttributeToken::TOKEN,
      Token::ServiceAttributes::AccessTimesAttributeToken::TOKEN,
      Token::ServiceAttributes::TypeAttributeToken::TOKEN,
      Token::ServiceAttributes::RpcVersionAttributeToken::TOKEN,
      Token::ServiceAttributes::RpcNumberAttributeToken::TOKEN,
      Token::ServiceAttributes::IdAttributeToken::TOKEN,
      Token::ServiceAttributes::EnvAttributeToken::TOKEN,
      Token::ServiceAttributes::PortAttributeToken::TOKEN,
      Token::ServiceAttributes::PassenvAttributeToken::TOKEN,
      Token::ServiceAttributes::FlagsAttributeToken::TOKEN,
      Token::ServiceAttributes::NiceAttributeToken::TOKEN,
      Token::ServiceAttributes::RedirectAttributeToken::TOKEN,
      Token::ServiceAttributes::BannerAttributeToken::TOKEN,
      Token::ServiceAttributes::BindAttributeToken::TOKEN,
      Token::ServiceAttributes::InterfaceAttributeToken::TOKEN,
      Token::ServiceAttributes::PerSourceAttributeToken::TOKEN,
      Token::ServiceAttributes::GroupsAttributeToken::TOKEN,
      Token::ServiceAttributes::BannerSuccessAttributeToken::TOKEN,
      Token::ServiceAttributes::BannerFailAttributeToken::TOKEN,
      Token::ServiceAttributes::CpsAttributeToken::TOKEN,
      Token::ServiceAttributes::DisableAttributeToken::TOKEN,
      Token::ServiceAttributes::MaxLoadAttributeToken::TOKEN,
      Token::ServiceAttributes::RLimitAsAttributeToken::TOKEN,
      Token::ServiceAttributes::RLimitCpuAttributeToken::TOKEN,
      Token::ServiceAttributes::RLimitDataAttributeToken::TOKEN,
      Token::ServiceAttributes::RLimitRssAttributeToken::TOKEN,
      Token::ServiceAttributes::RLimitStackAttributeToken::TOKEN,
      Token::ServiceAttributes::V6OnlyAttributeToken::TOKEN,
      Token::ServiceAttributes::DenyTimeAttributeToken::TOKEN,
      Token::ServiceAttributes::UmaskAttributeToken::TOKEN,
      Token::ServiceAttributes::MdnsAttributeToken::TOKEN,
      Token::ServiceAttributes::LibwrapAttributeToken::TOKEN,
    ]
  end
end
