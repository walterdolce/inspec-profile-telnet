module XinetdConfig
  module Token
    module Parser
      class IncludeStatementParser < BaseParser
        def tokenize(line)
          split_line = line.split(' ')
          first_word = split_line.shift
          second_word = split_line.shift
          if first_word == Token::IncludeToken::TOKEN
            tokens = Token::IncludeToken.new(line)
            tokens = [tokens, Token::IncludePathToken.new(line)] if second_word
            tokens
          elsif chained_parser
            chained_parser.tokenize(line)
          end
        end
      end
    end
  end
end

