
require_relative '../token'

module XinetdConfig
  module Token
    class EntryBeginToken < XinetdConfig::Token::Base
      TOKEN = '{'
    end
  end
end