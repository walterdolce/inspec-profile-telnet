module XinetdConfig
  class Lexer

    attr_reader :tokens, :raw_configuration, :token_factory

    def initialize(raw_configuration='', configuration_parser=nil)
      @raw_configuration = raw_configuration
      @configuration_parser = configuration_parser
      @tokens = []
    end

    def tokenize
      @raw_configuration.each_line do |line|
        line = line.strip.chomp
        unless line.empty?
          @tokens = @configuration_parser.tokenize(line, @tokens.flatten) if @configuration_parser
        end
      end
      @tokens
    end

    private

    attr_writer :tokens, :raw_configuration, :token_factory

  end
end
