module XinetdConfig
  module Token
    module Parser
      class DefaultsStatementParser < BaseParser
        def tokenize(line)
          if line.split(' ').shift == Token::DefaultsToken::TOKEN
            Token::DefaultsToken.new(line)
          elsif chained_parser
            chained_parser.tokenize(line)
          end
        end
      end
    end
  end
end

