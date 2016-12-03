module XinetdConfig
  module Token
    module ServiceAttributes
      class RLimitCpuAttributeToken < XinetdConfig::Token::ServiceAttributes::Base
        TOKEN = 'rlimit_cpu'
      end
    end
  end
end
