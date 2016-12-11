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
          tokens_list = tokens_list.clone
          split_line = line.split(' ')
          service_attribute = split_line.shift
          
          if is_service_attribute(tokens_list.last.class, service_attribute)
            tokens_list << @token_factory.create(service_attribute)
            
            assignment_operator = split_line.shift
            if assignment_operator
              tokens_list << @token_factory.create(assignment_operator)
            end
            
            unless split_line.empty?
              service_attribute_value = split_line.first
              if Token::SERVICE_ATTRIBUTE_TOKENS.include? service_attribute
                case service_attribute
                when Token::ServiceAttributes::AccessTimesAttributeToken::TOKEN
                  if service_attribute_value.match(/^(([0-9]|0[0-9]|1[0-9]|2[0-3]):([0-5][0-9]))-(([0-9]|0[0-9]|1[0-9]|2[0-3]):([0-5][0-9]))$/)
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::AccessTimesValueToken.new(line)
                  else
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                  end
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
                  split_line.each do |flags_value|
                    if %w(yes no).include? flags_value
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::DisableValueToken.new(line)
                    else
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                    end
                  end
                when Token::ServiceAttributes::EnvAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::EnvValueToken.new(line)
                when Token::ServiceAttributes::FlagsAttributeToken::TOKEN
                  split_line.each do |flags_value|
                    if %w(INTERCEPT NORETRY IDONLY NAMEINARGS NODELAY KEEPALIVE NOLIBWRAP SENSOR IPv4 IPv6 LABELED REUSE).include? flags_value
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::FlagsValueToken.new(line)
                    else
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                    end
                  end
                when Token::ServiceAttributes::GroupAttributeToken::TOKEN
                  if split_line.shift
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::GroupValueToken.new(line)
                    split_line.each do
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                    end
                  end
                when Token::ServiceAttributes::GroupsAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::GroupsValueToken.new(line)
                when Token::ServiceAttributes::IdAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::IdValueToken.new(line)
                when Token::ServiceAttributes::InstancesAttributeToken::TOKEN
                  service_attribute_value = split_line.shift
                  if service_attribute_value
                    if service_attribute_value == 'UNLIMITED' || is_numeric?(service_attribute_value)
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::InstancesValueToken.new(line)
                    else
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                    end
                    split_line.each do
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                    end
                  end
                when Token::ServiceAttributes::InterfaceAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::InterfaceValueToken.new(line)
                when Token::ServiceAttributes::LibwrapAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LibwrapValueToken.new(line)
                when Token::ServiceAttributes::LogOnFailureAttributeToken::TOKEN
                  if %w(HOST USERID ATTEMPT).include? service_attribute_value
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LogOnFailureValueToken.new(line)
                  else
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                  end
                when Token::ServiceAttributes::LogOnSuccessAttributeToken::TOKEN
                  if %w(PID HOST USERID EXIT DURATION TRAFFIC).include? service_attribute_value
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LogOnSuccessValueToken.new(line)
                  else
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                  end
                when Token::ServiceAttributes::LogTypeAttributeToken::TOKEN
                  if %w(SYSLOG FILE).include? service_attribute_value
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::LogTypeValueToken.new(line)
                  else
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                  end
                when Token::ServiceAttributes::MaxLoadAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::MaxLoadValueToken.new(line)
                when Token::ServiceAttributes::MdnsAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::MdnsValueToken.new(line)
                when Token::ServiceAttributes::NiceAttributeToken::TOKEN
                  service_attribute_value = split_line.shift
                  if service_attribute_value
                    if is_numeric?(service_attribute_value)
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::NiceValueToken.new(line)
                    else
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                    end
                    split_line.each do
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                    end
                  end
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
                  split_line.shift
                  split_line.each do
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                  end
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
                  if is_numeric?(service_attribute_value) || service_attribute_value.match(/^[0-9]+-[0-9]+$/)
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RpcVersionValueToken.new(line)
                  else
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                  end
                when Token::ServiceAttributes::ServerArgsAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::ServerArgsValueToken.new(line)
                when Token::ServiceAttributes::ServerAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::ServerValueToken.new(line)
                when Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN
                  if %w(stream dgram raw seqpacket).include? service_attribute_value
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::SocketTypeValueToken.new(line)
                  else
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                  end
                  split_line.shift
                  split_line.each do
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                  end
                when Token::ServiceAttributes::TypeAttributeToken::TOKEN
                  split_line.each do |type_value|
                    if %w(RPC INTERNAL TCPMUX TCPMUXPLUS UNLISTED).include? type_value
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::TypeValueToken.new(line)
                    else
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                    end
                  end
                when Token::ServiceAttributes::UmaskAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::UmaskValueToken.new(line)
                when Token::ServiceAttributes::UserAttributeToken::TOKEN
                  if split_line.shift
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::UserValueToken.new(line)
                    split_line.each do
                      tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                    end
                  end
                when Token::ServiceAttributes::V6OnlyAttributeToken::TOKEN
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::V6OnlyValueToken.new(line)
                when Token::ServiceAttributes::WaitAttributeToken::TOKEN
                  if %w(yes no).include? service_attribute_value
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::WaitValueToken.new(line)
                  else
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                  end
                  split_line.shift
                  split_line.each do
                    tokens_list << Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken.new(line)
                  end
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
        
        def is_numeric?(attribute_value)
          true if Float(attribute_value) rescue false
        end
        
        def is_service_attribute(last_available_token, service_attribute)
          last_available_token == Token::EntryBeginToken && !(Token::FIRST_LEVEL_TOKENS.include? service_attribute)
        end
      end
    end
  end
end

