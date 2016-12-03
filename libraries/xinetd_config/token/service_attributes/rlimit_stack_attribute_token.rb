module XinetdConfig
  module Token
    module ServiceAttributes
      class RLimitStackAttributeToken < XinetdConfig::Token::ServiceAttributes::Base
        TOKEN = 'rlimit_stack'
      end
    end
  end
end
