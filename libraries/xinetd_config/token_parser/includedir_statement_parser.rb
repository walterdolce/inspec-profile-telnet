module XinetdConfig
  module Token
    module Parser
      class IncludeDirStatementParser < BaseParser
        def tokenize(line, tokens_list=[])
          split_line = line.split(' ')
          first_word = split_line.shift
          second_word = split_line.shift
          if first_word == Token::IncludeDirToken::TOKEN
            tokens_list << Token::IncludeDirToken.new(line)
            tokens_list << Token::IncludedPathToken.new(line) if second_word
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end
      end
    end
  end
end

