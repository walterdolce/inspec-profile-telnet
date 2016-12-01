
require_relative '../token'

module XinetdConfig
  module Token
    class EntryEndToken < XinetdConfig::Token::Base
      TOKEN = '}'
    end
  end
end
