module XinetdConfig
  module Token
    module Parser
      class DefaultsStatementParser < BaseParser
        def tokenize(line, tokens_list=[])
          if line.split(' ').shift == Token::DefaultsToken::TOKEN
            tokens_list << Token::DefaultsToken.new(line)
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end
      end
    end
  end
end

