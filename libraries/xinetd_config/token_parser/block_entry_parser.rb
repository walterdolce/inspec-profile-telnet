module XinetdConfig
  module Token
    module Parser
      class BlockEntryParser < BaseParser
        def tokenize(line, tokens_list=[])
          if [Token::EntryBeginToken::TOKEN, Token::EntryEndToken::TOKEN].include? line.split(' ').shift
            case line.split(' ').shift
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
      end
    end
  end
end

