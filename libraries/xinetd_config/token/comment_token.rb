
require_relative '../token'

module XinetdConfig
  module Token
    class CommentToken < XinetdConfig::Token::Base
      def token
        raw_token.sub(/^(#)/, '').strip
      end
      private
        attr_writer :token
    end
  end
end
