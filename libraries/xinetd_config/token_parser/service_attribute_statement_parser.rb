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
          first_line_word = split_line.shift
          assignment_operator = second_line_word = split_line.shift
          service_attribute_value = split_line.shift
          last_available_token = tokens_list.last.class
          if last_available_token == Token::EntryBeginToken && !(Token::FIRST_LEVEL_TOKENS.include? line.split(' ').shift)
            tokens_list << @token_factory.create(first_line_word)
            if assignment_operator
              tokens_list << @token_factory.create(assignment_operator)
            end
            if service_attribute_value
              if Token::SERVICE_ATTRIBUTE_TOKENS.include? first_line_word
                case first_line_word
                when Token::ServiceAttributes::AccessTimesAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::AccessTimesValueToken.new(line)
                when Token::ServiceAttributes::BannerAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::BannerValueToken.new(line)
                when Token::ServiceAttributes::BannerFailAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::BannerFailValueToken.new(line)
                when Token::ServiceAttributes::BannerSuccessAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::BannerSuccessValueToken.new(line)
                when Token::ServiceAttributes::BindAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::BindValueToken.new(line)
                when Token::ServiceAttributes::CpsAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::CpsValueToken.new(line)
                when Token::ServiceAttributes::DenyTimeAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::DenyTimeValueToken.new(line)
                when Token::ServiceAttributes::DisableAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::DisableValueToken.new(line)
                when Token::ServiceAttributes::EnvAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::EnvValueToken.new(line)
                when Token::ServiceAttributes::FlagsAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::FlagsValueToken.new(line)
                when Token::ServiceAttributes::GroupAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::GroupValueToken.new(line)
                when Token::ServiceAttributes::GroupsAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::GroupsValueToken.new(line)
                when Token::ServiceAttributes::IdAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::IdValueToken.new(line)
                when Token::ServiceAttributes::InstancesAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::InstancesValueToken.new(line)
                when Token::ServiceAttributes::InterfaceAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::InterfaceValueToken.new(line)
                when Token::ServiceAttributes::LibwrapAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LibwrapValueToken.new(line)
                when Token::ServiceAttributes::LogOnFailureAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LogOnFailureValueToken.new(line)
                when Token::ServiceAttributes::LogOnSuccessAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LogOnSuccessValueToken.new(line)
                when Token::ServiceAttributes::LogTypeAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LogTypeValueToken.new(line)
                when Token::ServiceAttributes::MaxLoadAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::MaxLoadValueToken.new(line)
                when Token::ServiceAttributes::MdnsAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::MdnsValueToken.new(line)
                when Token::ServiceAttributes::NiceAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::NiceValueToken.new(line)
                when Token::ServiceAttributes::NoAccessAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::NoAccessValueToken.new(line)
                when Token::ServiceAttributes::OnlyFromAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::OnlyFromValueToken.new(line)
                when Token::ServiceAttributes::PassenvAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::PassenvValueToken.new(line)
                when Token::ServiceAttributes::PerSourceAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::PerSourceValueToken.new(line)
                when Token::ServiceAttributes::PortAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::PortValueToken.new(line)
                when Token::ServiceAttributes::ProtocolAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::ProtocolValueToken.new(line)
                when Token::ServiceAttributes::RedirectAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RedirectValueToken.new(line)
                when Token::ServiceAttributes::RLimitAsAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RLimitAsValueToken.new(line)
                when Token::ServiceAttributes::RLimitCpuAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RLimitCpuValueToken.new(line)
                when Token::ServiceAttributes::RLimitDataAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RLimitDataValueToken.new(line)
                when Token::ServiceAttributes::RLimitRssAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RLimitRssValueToken.new(line)
                when Token::ServiceAttributes::RLimitStackAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RLimitStackValueToken.new(line)
                when Token::ServiceAttributes::RpcNumberAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RpcNumberValueToken.new(line)
                when Token::ServiceAttributes::RpcVersionAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RpcVersionValueToken.new(line)
                when Token::ServiceAttributes::ServerArgsAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::ServerArgsValueToken.new(line)
                when Token::ServiceAttributes::ServerAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::ServerValueToken.new(line)
                when Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::SocketTypeValueToken.new(line)
                when Token::ServiceAttributes::TypeAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::TypeValueToken.new(line)
                when Token::ServiceAttributes::UmaskAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::UmaskValueToken.new(line)
                when Token::ServiceAttributes::UserAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::UserValueToken.new(line)
                when Token::ServiceAttributes::V6OnlyAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::V6OnlyValueToken.new(line)
                when Token::ServiceAttributes::WaitAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::WaitValueToken.new(line)
                end
              end
            end
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end

        private

        attr_writer :token_factory

      end
    end
  end
end

