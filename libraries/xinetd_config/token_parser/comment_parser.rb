module XinetdConfig
  module Token
    module Parser
      class CommentParser < BaseParser
        def tokenize(line, tokens_list=[])
          if line.chars.shift == Token::CommentToken::TOKEN
            tokens_list << Token::CommentToken.new(line)
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end
      end
    end
  end
end

