module XinetdConfig
  module Token
    module ServiceAttributes
      class OnlyFromAttributeToken < XinetdConfig::Token::ServiceAttributes::Base
        TOKEN = 'only_from'
      end
    end
  end
end
