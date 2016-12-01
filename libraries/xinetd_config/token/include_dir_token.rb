
require_relative '../token'

module XinetdConfig
  module Token
    class IncludeDirToken < XinetdConfig::Token::Base
      TOKEN = 'includedir'
    end
  end
end
