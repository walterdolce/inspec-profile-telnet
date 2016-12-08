require_relative '../xinetd_config/token/base_token'

Dir.glob(
  File.join(File.dirname(__FILE__), 'token', '**', '*.rb')
).each do |file|
  require file
end

module XinetdConfig
  module Token
    FIRST_LEVEL_TOKENS = [
      XinetdConfig::Token::EntryBeginToken::TOKEN,
      XinetdConfig::Token::EntryEndToken::TOKEN,
      XinetdConfig::Token::ServiceToken::TOKEN,
      XinetdConfig::Token::DefaultsToken::TOKEN,
      XinetdConfig::Token::IncludeDirToken::TOKEN,
      XinetdConfig::Token::IncludeToken::TOKEN,
    ]

    OPERATOR_TOKENS = [
      XinetdConfig::Token::Operators::AssignmentToken,
      XinetdConfig::Token::Operators::AddAssignmentToken,
      XinetdConfig::Token::Operators::SubtractAssignmentToken,
    ]

    SERVICE_ATTRIBUTE_TOKENS = [
      Token::ServiceAttributes::AccessTimesAttributeToken::TOKEN,
      Token::ServiceAttributes::BannerAttributeToken::TOKEN,
      Token::ServiceAttributes::BannerFailAttributeToken::TOKEN,
      Token::ServiceAttributes::BannerSuccessAttributeToken::TOKEN,
      Token::ServiceAttributes::BindAttributeToken::TOKEN,
      Token::ServiceAttributes::CpsAttributeToken::TOKEN,
      Token::ServiceAttributes::DenyTimeAttributeToken::TOKEN,
      Token::ServiceAttributes::DisableAttributeToken::TOKEN,
      Token::ServiceAttributes::EnvAttributeToken::TOKEN,
      Token::ServiceAttributes::FlagsAttributeToken::TOKEN,
      Token::ServiceAttributes::GroupAttributeToken::TOKEN,
      Token::ServiceAttributes::GroupsAttributeToken::TOKEN,
      Token::ServiceAttributes::IdAttributeToken::TOKEN,
      Token::ServiceAttributes::InstancesAttributeToken::TOKEN,
      Token::ServiceAttributes::InterfaceAttributeToken::TOKEN,
      Token::ServiceAttributes::LibwrapAttributeToken::TOKEN,
      Token::ServiceAttributes::LogOnFailureAttributeToken::TOKEN,
      Token::ServiceAttributes::LogOnSuccessAttributeToken::TOKEN,
      Token::ServiceAttributes::LogTypeAttributeToken::TOKEN,
      Token::ServiceAttributes::MaxLoadAttributeToken::TOKEN,
      Token::ServiceAttributes::MdnsAttributeToken::TOKEN,
      Token::ServiceAttributes::NiceAttributeToken::TOKEN,
      Token::ServiceAttributes::NoAccessAttributeToken::TOKEN,
      Token::ServiceAttributes::OnlyFromAttributeToken::TOKEN,
      Token::ServiceAttributes::PassenvAttributeToken::TOKEN,
      Token::ServiceAttributes::PerSourceAttributeToken::TOKEN,
      Token::ServiceAttributes::PortAttributeToken::TOKEN,
      Token::ServiceAttributes::ProtocolAttributeToken::TOKEN,
      Token::ServiceAttributes::RedirectAttributeToken::TOKEN,
      Token::ServiceAttributes::RLimitAsAttributeToken::TOKEN,
      Token::ServiceAttributes::RLimitCpuAttributeToken::TOKEN,
      Token::ServiceAttributes::RLimitDataAttributeToken::TOKEN,
      Token::ServiceAttributes::RLimitRssAttributeToken::TOKEN,
      Token::ServiceAttributes::RLimitStackAttributeToken::TOKEN,
      Token::ServiceAttributes::RpcNumberAttributeToken::TOKEN,
      Token::ServiceAttributes::RpcVersionAttributeToken::TOKEN,
      Token::ServiceAttributes::ServerArgsAttributeToken::TOKEN,
      Token::ServiceAttributes::ServerAttributeToken::TOKEN,
      Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN,
      Token::ServiceAttributes::TypeAttributeToken::TOKEN,
      Token::ServiceAttributes::UmaskAttributeToken::TOKEN,
      Token::ServiceAttributes::UserAttributeToken::TOKEN,
      Token::ServiceAttributes::V6OnlyAttributeToken::TOKEN,
      Token::ServiceAttributes::WaitAttributeToken::TOKEN,
    ]

    module ServiceAttributes
      class TokenFactory
        def create(line='')
          case line
            when SocketTypeAttributeToken::TOKEN
              SocketTypeAttributeToken.new(line)
            when ProtocolAttributeToken::TOKEN
              ProtocolAttributeToken.new(line)
            when WaitAttributeToken::TOKEN
              WaitAttributeToken.new(line)
            when UserAttributeToken::TOKEN
              UserAttributeToken.new(line)
            when GroupAttributeToken::TOKEN
              GroupAttributeToken.new(line)
            when ServerAttributeToken::TOKEN
              ServerAttributeToken.new(line)
            when ServerArgsAttributeToken::TOKEN
              ServerArgsAttributeToken.new(line)
            when InstancesAttributeToken::TOKEN
              InstancesAttributeToken.new(line)
            when LogOnSuccessAttributeToken::TOKEN
              LogOnSuccessAttributeToken.new(line)
            when LogOnFailureAttributeToken::TOKEN
              LogOnFailureAttributeToken.new(line)
            when OnlyFromAttributeToken::TOKEN
              OnlyFromAttributeToken.new(line)
            when LogTypeAttributeToken::TOKEN
              LogTypeAttributeToken.new(line)
            when NoAccessAttributeToken::TOKEN
              NoAccessAttributeToken.new(line)
            when AccessTimesAttributeToken::TOKEN
              AccessTimesAttributeToken.new(line)
            when TypeAttributeToken::TOKEN
              TypeAttributeToken.new(line)
            when RpcVersionAttributeToken::TOKEN
              RpcVersionAttributeToken.new(line)
            when RpcNumberAttributeToken::TOKEN
              RpcNumberAttributeToken.new(line)
            when IdAttributeToken::TOKEN
              IdAttributeToken.new(line)
            when EnvAttributeToken::TOKEN
              EnvAttributeToken.new(line)
            when PortAttributeToken::TOKEN
              PortAttributeToken.new(line)
            when PassenvAttributeToken::TOKEN
              PassenvAttributeToken.new(line)
            when FlagsAttributeToken::TOKEN
              FlagsAttributeToken.new(line)
            when NiceAttributeToken::TOKEN
              NiceAttributeToken.new(line)
            when RedirectAttributeToken::TOKEN
              RedirectAttributeToken.new(line)
            when BannerAttributeToken::TOKEN
              BannerAttributeToken.new(line)
            when BindAttributeToken::TOKEN
              BindAttributeToken.new(line)
            when InterfaceAttributeToken::TOKEN
              InterfaceAttributeToken.new(line)
            when PerSourceAttributeToken::TOKEN
              PerSourceAttributeToken.new(line)
            when GroupsAttributeToken::TOKEN
              GroupsAttributeToken.new(line)
            when BannerSuccessAttributeToken::TOKEN
              BannerSuccessAttributeToken.new(line)
            when BannerFailAttributeToken::TOKEN
              BannerFailAttributeToken.new(line)
            when CpsAttributeToken::TOKEN
              CpsAttributeToken.new(line)
            when DisableAttributeToken::TOKEN
              DisableAttributeToken.new(line)
            when MaxLoadAttributeToken::TOKEN
              MaxLoadAttributeToken.new(line)
            when RLimitAsAttributeToken::TOKEN
              RLimitAsAttributeToken.new(line)
            when RLimitCpuAttributeToken::TOKEN
              RLimitCpuAttributeToken.new(line)
            when RLimitDataAttributeToken::TOKEN
              RLimitDataAttributeToken.new(line)
            when RLimitRssAttributeToken::TOKEN
              RLimitRssAttributeToken.new(line)
            when RLimitStackAttributeToken::TOKEN
              RLimitStackAttributeToken.new(line)
            when V6OnlyAttributeToken::TOKEN
              V6OnlyAttributeToken.new(line)
            when DenyTimeAttributeToken::TOKEN
              DenyTimeAttributeToken.new(line)
            when UmaskAttributeToken::TOKEN
              UmaskAttributeToken.new(line)
            when MdnsAttributeToken::TOKEN
              MdnsAttributeToken.new(line)
            when LibwrapAttributeToken::TOKEN
              LibwrapAttributeToken.new(line)
            when Token::Operators::AssignmentToken::TOKEN
              Token::Operators::AssignmentToken.new(line)
            when Token::Operators::AddAssignmentToken::TOKEN
              Token::Operators::AddAssignmentToken.new(line)
            when Token::Operators::SubtractAssignmentToken::TOKEN
              Token::Operators::SubtractAssignmentToken.new(line)
            else
              UnrecognisedAttributeToken.new(line)
          end
        end
      end
    end
  end
end

