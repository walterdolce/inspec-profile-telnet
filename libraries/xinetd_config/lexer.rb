module XinetdConfig
  class Lexer

    attr_reader :tokens, :raw_configuration

    def initialize(raw_configuration='')
      @raw_configuration = raw_configuration
      @tokens = []
    end

    def tokenize
      @raw_configuration.each_line do |line|
        line = line.strip.chomp
        if line != ''
          first_line_char = line.chars.shift
          first_line_word = line.split(' ').first

          if @tokens.length &&
            @tokens.last.class == Token::EntryBeginToken &&
            !(Token::FIRST_LEVEL_TOKENS.include? first_line_word)
              if Token::SERVICE_ATTRIBUTE_TOKENS.include? first_line_word
                @tokens << Token::ServiceAttributes::SocketTypeAttributeToken.new(line)
              else
                @tokens << Token::ServiceAttributes::UnrecognisedAttributeToken.new(line)
              end
          elsif first_line_char == Token::CommentBeginToken::TOKEN
            @tokens << Token::CommentBeginToken.new(line)
          elsif first_line_char == Token::EntryBeginToken::TOKEN
            @tokens << Token::EntryBeginToken.new(line)
          elsif first_line_char == Token::EntryEndToken::TOKEN
            @tokens << Token::EntryEndToken.new(line)
          elsif first_line_char == 's'
            tokens = line.split(' ')
            (0...tokens.length).each { |i|
              if tokens[i] == Token::ServiceToken::TOKEN
                @tokens << Token::ServiceToken.new(line)
              elsif tokens[i].match(/\S*/)
                @tokens << Token::ServiceNameToken.new(line)
              end
            } if tokens
          elsif first_line_char == 'd' && line.match(/^#{Token::DefaultsToken::TOKEN}/)
            @tokens << Token::DefaultsToken.new(line)
          elsif first_line_char == 'i'
            if line.match(/^#{Token::IncludeDirToken::TOKEN}/)
              @tokens << Token::IncludeDirToken.new(line)
              if line.match(/^(#{Token::IncludeDirToken::TOKEN}[\s+])(\/\S*)/)
                @tokens << Token::IncludePathToken.new(line)
              end
            elsif line.match(/^#{Token::IncludeToken::TOKEN}/)
              @tokens << Token::IncludeToken.new(line)
              if line.match(/^(#{Token::IncludeToken::TOKEN}[\s+])(\/\S*)/)
                @tokens << Token::IncludePathToken.new(line)
              end
            end
          end
        end
      end
      @tokens
    end

    private
    attr_writer :tokens, :raw_configuration
  end
end
