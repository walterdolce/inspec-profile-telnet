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
          if @configuration_parser
            @tokens = @configuration_parser.tokenize(line, @tokens.flatten)
          end
        end
      end
      @tokens.flatten
    end

    private

    attr_writer :tokens, :raw_configuration, :token_factory

  end
end
