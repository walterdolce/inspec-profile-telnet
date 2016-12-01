
require_relative '../token'

module XinetdConfig
  module Token
    class IncludeToken < XinetdConfig::Token::Base
      TOKEN = 'include'
    end
  end
end
