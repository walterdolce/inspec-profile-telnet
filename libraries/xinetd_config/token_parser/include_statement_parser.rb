module XinetdConfig
  module Token
    module Parser
      class IncludeStatementParser < BaseParser
        def tokenize(line, tokens_list=[])
          split_line = line.split(' ')
          first_word = split_line.shift
          second_word = split_line.shift
          if first_word == Token::IncludeToken::TOKEN
            tokens_list << Token::IncludeToken.new(line)
            tokens_list << Token::IncludePathToken.new(line) if second_word
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end
      end
    end
  end
end

