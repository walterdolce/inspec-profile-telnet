module XinetdConfig
  module Token
    module Parser
      class ServiceAttributeStatementParser < BaseParser

        attr_reader :token_factory

        def initialize(chained_parser=nil, token_factory=nil)
          super(chained_parser)
          if token_factory && !(token_factory.kind_of? Token::ServiceAttributes::TokenFactory)
            raise TypeError,
                  'Token factory must be an instance of XinetdConfig::Token::ServiceAttributes::TokenFactory'
          end
          @token_factory = token_factory || Token::ServiceAttributes::TokenFactory.new
        end

        def tokenize(line, tokens_list=[])
          split_line = line.split(' ')
          service_attribute = split_line.shift
          assignment_operator = split_line.shift
          service_attribute_value = split_line.shift
          if is_service_attribute(tokens_list.last.class, service_attribute)
            tokens_list << @token_factory.create(service_attribute)
            if assignment_operator
              tokens_list << @token_factory.create(assignment_operator)
            end
            if service_attribute_value
              if Token::SERVICE_ATTRIBUTE_TOKENS.include? service_attribute
                case service_attribute
                when Token::ServiceAttributes::AccessTimesAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::AccessTimesValueToken.new(line)
                when Token::ServiceAttributes::BannerAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::BannerValueToken.new(line)
                when Token::ServiceAttributes::BannerFailAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::BannerFailValueToken.new(line)
                when Token::ServiceAttributes::BannerSuccessAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::BannerSuccessValueToken.new(line)
                when Token::ServiceAttributes::BindAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::BindValueToken.new(line)
                when Token::ServiceAttributes::CpsAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::CpsValueToken.new(line)
                when Token::ServiceAttributes::DenyTimeAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::DenyTimeValueToken.new(line)
                when Token::ServiceAttributes::DisableAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::DisableValueToken.new(line)
                when Token::ServiceAttributes::EnvAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::EnvValueToken.new(line)
                when Token::ServiceAttributes::FlagsAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::FlagsValueToken.new(line)
                when Token::ServiceAttributes::GroupAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::GroupValueToken.new(line)
                when Token::ServiceAttributes::GroupsAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::GroupsValueToken.new(line)
                when Token::ServiceAttributes::IdAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::IdValueToken.new(line)
                when Token::ServiceAttributes::InstancesAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::InstancesValueToken.new(line)
                when Token::ServiceAttributes::InterfaceAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::InterfaceValueToken.new(line)
                when Token::ServiceAttributes::LibwrapAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LibwrapValueToken.new(line)
                when Token::ServiceAttributes::LogOnFailureAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LogOnFailureValueToken.new(line)
                when Token::ServiceAttributes::LogOnSuccessAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LogOnSuccessValueToken.new(line)
                when Token::ServiceAttributes::LogTypeAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LogTypeValueToken.new(line)
                when Token::ServiceAttributes::MaxLoadAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::MaxLoadValueToken.new(line)
                when Token::ServiceAttributes::MdnsAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::MdnsValueToken.new(line)
                when Token::ServiceAttributes::NiceAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::NiceValueToken.new(line)
                when Token::ServiceAttributes::NoAccessAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::NoAccessValueToken.new(line)
                when Token::ServiceAttributes::OnlyFromAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::OnlyFromValueToken.new(line)
                when Token::ServiceAttributes::PassenvAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::PassenvValueToken.new(line)
                when Token::ServiceAttributes::PerSourceAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::PerSourceValueToken.new(line)
                when Token::ServiceAttributes::PortAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::PortValueToken.new(line)
                when Token::ServiceAttributes::ProtocolAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::ProtocolValueToken.new(line)
                when Token::ServiceAttributes::RedirectAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RedirectValueToken.new(line)
                when Token::ServiceAttributes::RLimitAsAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RLimitAsValueToken.new(line)
                when Token::ServiceAttributes::RLimitCpuAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RLimitCpuValueToken.new(line)
                when Token::ServiceAttributes::RLimitDataAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RLimitDataValueToken.new(line)
                when Token::ServiceAttributes::RLimitRssAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RLimitRssValueToken.new(line)
                when Token::ServiceAttributes::RLimitStackAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RLimitStackValueToken.new(line)
                when Token::ServiceAttributes::RpcNumberAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RpcNumberValueToken.new(line)
                when Token::ServiceAttributes::RpcVersionAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RpcVersionValueToken.new(line)
                when Token::ServiceAttributes::ServerArgsAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::ServerArgsValueToken.new(line)
                when Token::ServiceAttributes::ServerAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::ServerValueToken.new(line)
                when Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::SocketTypeValueToken.new(line)
                when Token::ServiceAttributes::TypeAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::TypeValueToken.new(line)
                when Token::ServiceAttributes::UmaskAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::UmaskValueToken.new(line)
                when Token::ServiceAttributes::UserAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::UserValueToken.new(line)
                when Token::ServiceAttributes::V6OnlyAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::V6OnlyValueToken.new(line)
                when Token::ServiceAttributes::WaitAttributeToken::TOKEN
                  token = Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::WaitValueToken.new(line)
                end
                tokens_list << token
              end
            end
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end


        private

        attr_writer :token_factory

        def is_service_attribute(last_available_token, service_attribute)
          last_available_token == Token::EntryBeginToken && !(Token::FIRST_LEVEL_TOKENS.include? service_attribute)
        end
      end
    end
  end
end

