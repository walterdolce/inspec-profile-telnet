module XinetdConfig
  module Token
    module Parser
      class IncludeStatementParser < BaseParser
        def tokenize(line, tokens_list=[])
          split_line = line.split(' ')
          if split_line.shift == Token::IncludeToken::TOKEN
            tokens_list << Token::IncludeToken.new(line)
            tokens_list << Token::IncludedPathToken.new(line) if split_line.shift
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end
      end
    end
  end
end

