module XinetdConfig
  module Token
    module ServiceAttributes
      class RLimitAsAttributeToken < XinetdConfig::Token::ServiceAttributes::Base
        TOKEN = 'rlimit_as'
      end
    end
  end
end
