module XinetdConfig
  module Token
    module Parser
      class CommentParser < BaseParser
        def tokenize(line)
          if line.chars.shift == Token::CommentBeginToken::TOKEN
            Token::CommentBeginToken.new(line)
          elsif chained_parser
            chained_parser.tokenize(line)
          end
        end
      end
    end
  end
end

