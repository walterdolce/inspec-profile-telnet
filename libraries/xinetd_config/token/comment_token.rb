module XinetdConfig
  module Token
    class CommentToken < XinetdConfig::Token::Base
      TOKEN = '#'
      def token
        raw_token.sub(/^(#)/, '').strip
      end
    end
  end
end
