module XinetdConfig
  module Token
    module Parser
      class ServiceStatementParser < BaseParser
        def tokenize(line, tokens_list=[])
          split_line = line.split(' ')
          first_word = split_line.shift
          second_word = split_line.shift
          if first_word == Token::ServiceToken::TOKEN
            tokens_list << Token::ServiceToken.new(line)
            tokens_list << Token::ServiceNameToken.new(line) if second_word
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end
      end
    end
  end
end

