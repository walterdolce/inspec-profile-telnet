module XinetdConfig
  module Token
    module Parser
      class ServiceStatementParser < BaseParser
        def tokenize(line, tokens_list=[])
          split_line = line.split(' ')
          if split_line.shift == Token::ServiceToken::TOKEN
            tokens_list << Token::ServiceToken.new(line)
            tokens_list << Token::ServiceNameToken.new(line) if split_line.shift
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end
      end
    end
  end
end

