module XinetdConfig
  module Token
    module Parser
      class CommentParser < BaseParser
        def tokenize(line, tokens_list=[])
          if line.chars.shift == Token::CommentBeginToken::TOKEN
            tokens_list << Token::CommentBeginToken.new(line)
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end
      end
    end
  end
end

