module XinetdConfig
  module Token
    module ServiceAttributes
      class RLimitRssAttributeToken < XinetdConfig::Token::ServiceAttributes::Base
        TOKEN = 'rlimit_rss'
      end
    end
  end
end
