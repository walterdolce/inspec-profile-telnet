module XinetdConfig
  module Token
    module ServiceAttributes
      class TypeAttributeToken < XinetdConfig::Token::ServiceAttributes::Base
        TOKEN = 'type'
      end

      module ServiceAttributeValues
        module TypeAttributeValues
          class RpcValueToken < XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::Base
          end
        end
      end
    end
  end
end
