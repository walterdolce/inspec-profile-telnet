module XinetdConfig
  module Token
    module Parser
      class ServiceStatementParser < BaseParser
        def tokenize(line)
          split_line = line.split(' ')
          first_word = split_line.shift
          second_word = split_line.shift
          if first_word == Token::ServiceToken::TOKEN
            tokens = Token::ServiceToken.new(line)
            tokens = [tokens, Token::ServiceNameToken.new(line)] if second_word
            tokens
          elsif chained_parser
            chained_parser.tokenize(line)
          end
        end
      end
    end
  end
end

