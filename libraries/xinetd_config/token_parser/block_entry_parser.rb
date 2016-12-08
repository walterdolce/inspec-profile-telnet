module XinetdConfig
  module Token
    module Parser
      class BlockEntryParser < BaseParser
        def tokenize(line, tokens_list=[])
          first_line_word = line.split(' ').shift
          if is_entry(first_line_word)
            case first_line_word
              when Token::EntryBeginToken::TOKEN
                tokens_list << Token::EntryBeginToken.new(line)
              when Token::EntryEndToken::TOKEN
                tokens_list << Token::EntryEndToken.new(line)
            end
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end

        private

        def is_entry(first_line_word)
          [Token::EntryBeginToken::TOKEN, Token::EntryEndToken::TOKEN].include? first_line_word
        end
      end
    end
  end
end

