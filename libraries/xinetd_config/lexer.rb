require 'rspec'
require_relative './token'
require_relative '../xinetd_config/token/comment_begin_token'
require_relative '../xinetd_config/token/service_token'
require_relative '../xinetd_config/token/service_name_token'
require_relative '../xinetd_config/token/entry_begin_token'
require_relative '../xinetd_config/token/entry_end_token'

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
          if line[0] == Token::CommentBeginToken::TOKEN
            @tokens << Token::CommentBeginToken.new(line)
          elsif line.match(/^(#{Token::ServiceToken::TOKEN})(\s+)(\S*)$/)
            @tokens << Token::ServiceToken.new(line)
            @tokens << Token::ServiceNameToken.new(line)
          elsif line.match(/^#{Token::ServiceToken::TOKEN}/)
            @tokens << Token::ServiceToken.new(line)
          elsif line.match(/^#{Token::EntryBeginToken::TOKEN}/)
            @tokens << Token::EntryBeginToken.new(line)
          elsif line.match(/^#{Token::EntryEndToken::TOKEN}/)
            @tokens << Token::EntryEndToken.new(line)
          else
            @tokens << Token::Base.new(line)
          end
        end
      end
      @tokens
    end

    private
    attr_writer :tokens, :raw_configuration
  end
end
