require 'rspec'
require_relative './token'

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
          if line[0] == '#'
            token = Token::CommentToken.new(line)
          else
            token = Token::Base.new(line)
          end
          @tokens << token
        end
      end
      @tokens
    end

    private
    attr_writer :tokens, :raw_configuration
  end
end
