
require_relative '../token'

module XinetdConfig
  module Token
    class DefaultsToken < XinetdConfig::Token::Base
      TOKEN = 'defaults'
    end
  end
end
