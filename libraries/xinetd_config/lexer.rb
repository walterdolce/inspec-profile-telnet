module XinetdConfig
  class Lexer

    attr_reader :tokens, :raw_configuration, :token_factory

    def initialize(raw_configuration='', token_factory=nil)
      @raw_configuration = raw_configuration
      @tokens = []
      if token_factory && !(token_factory.kind_of? Token::ServiceAttributes::TokenFactory)
        raise TypeError,
          'Token factory must be an instance of XinetdConfig::Token::ServiceAttributes::TokenFactory'
      end
      @token_factory = token_factory || Token::ServiceAttributes::TokenFactory.new
    end

    def tokenize
      
      @raw_configuration.each_line do |line|
        line = line.strip.chomp
        if line != ''
          first_line_char = line.chars.shift
          split_line = line.split(' ')
          first_line_word = split_line.first
          last_available_token = @tokens.last.class

          if last_available_token == Token::EntryBeginToken && !(Token::FIRST_LEVEL_TOKENS.include? first_line_word)
            @tokens << @token_factory.create(first_line_word)
            assignment_operator = split_line[1]
            if assignment_operator
              if assignment_operator == Token::Operators::AssignmentToken::TOKEN
                @tokens << Token::Operators::AssignmentToken.new(line)
              elsif assignment_operator == Token::Operators::AddAssignmentToken::TOKEN
                @tokens << Token::Operators::AddAssignmentToken.new(line)
              elsif assignment_operator == Token::Operators::SubtractAssignmentToken::TOKEN
                @tokens << Token::Operators::SubtractAssignmentToken.new(line)
              end
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
      
    attr_writer :tokens, :raw_configuration, :token_factory

  end
end
