module XinetdConfig
  class Lexer

    attr_reader :tokens, :raw_configuration, :token_factory

    def initialize(raw_configuration='', token_factory=nil, configuration_parser=nil)
      @raw_configuration = raw_configuration
      @tokens = []
      if token_factory && !(token_factory.kind_of? Token::ServiceAttributes::TokenFactory)
        raise TypeError,
              'Token factory must be an instance of XinetdConfig::Token::ServiceAttributes::TokenFactory'
      end
      @token_factory = token_factory || Token::ServiceAttributes::TokenFactory.new
      @configuration_parser = configuration_parser
    end

    def tokenize
      @raw_configuration.each_line do |line|
        line = line.strip.chomp
        unless line.empty?
          split_line = line.split(' ')
          first_line_word = split_line.shift
          assignment_operator = second_line_word = split_line.shift
          service_attribute_value = split_line.shift
          last_available_token = @tokens.last.class


          if @configuration_parser
            token = @configuration_parser.tokenize(line)
            @tokens << token if token
          end

          if last_available_token == Token::EntryBeginToken && !(Token::FIRST_LEVEL_TOKENS.include? first_line_word)
            @tokens << @token_factory.create(first_line_word)
            if assignment_operator
              @tokens << @token_factory.create(assignment_operator)
            end
            if service_attribute_value
              if (Token::SERVICE_ATTRIBUTE_TOKENS.include? first_line_word) && first_line_word == 'type'
                @tokens << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RpcValueToken.new(line)
              else
                @tokens << Token::ServiceNameToken.new(line)
              end
            end
          elsif first_line_word == Token::ServiceToken::TOKEN
            @tokens << Token::ServiceToken.new(line)
            if second_line_word
              @tokens << Token::ServiceNameToken.new(line)
            end
          elsif first_line_word == Token::DefaultsToken::TOKEN
            @tokens << Token::DefaultsToken.new(line)
          elsif first_line_word == Token::IncludeDirToken::TOKEN
            @tokens << Token::IncludeDirToken.new(line)
            if second_line_word
              @tokens << Token::IncludePathToken.new(line)
            end
          elsif first_line_word == Token::IncludeToken::TOKEN
            @tokens << Token::IncludeToken.new(line)
            if second_line_word
              @tokens << Token::IncludePathToken.new(line)
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
