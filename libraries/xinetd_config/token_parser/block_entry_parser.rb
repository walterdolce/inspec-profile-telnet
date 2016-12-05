module XinetdConfig
  module Token
    module Parser
      class BlockEntryParser < BaseParser
        def tokenize(line)
          if [Token::EntryBeginToken::TOKEN, Token::EntryEndToken::TOKEN].include? line.split(' ').shift
            case line.split(' ').shift
              when Token::EntryBeginToken::TOKEN
                Token::EntryBeginToken.new(line)
              when Token::EntryEndToken::TOKEN
                Token::EntryEndToken.new(line)
            end
          elsif chained_parser
            chained_parser.tokenize(line)
          end
        end
      end
    end
  end
end

