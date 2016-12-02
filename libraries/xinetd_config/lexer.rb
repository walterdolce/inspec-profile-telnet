require 'rspec'
require_relative './token'
require_relative '../xinetd_config/token/comment_begin_token'
require_relative '../xinetd_config/token/service_token'
require_relative '../xinetd_config/token/service_name_token'
require_relative '../xinetd_config/token/entry_begin_token'
require_relative '../xinetd_config/token/entry_end_token'
require_relative '../xinetd_config/token/defaults_token'

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
          elsif line[0] == Token::EntryBeginToken::TOKEN
            @tokens << Token::EntryBeginToken.new(line)
          elsif line[0] == Token::EntryEndToken::TOKEN
            @tokens << Token::EntryEndToken.new(line)
          elsif line[0] == 's'
            tokens_match = line.split(' ')
            (0...tokens_match.length).each { |i|
              if tokens_match[i] == Token::ServiceToken::TOKEN
                @tokens << Token::ServiceToken.new(line)
              elsif tokens_match[i].match(/\S*/)
                @tokens << Token::ServiceNameToken.new(line)
              end
            } if tokens_match
          elsif line[0] == 'd' && line.match(/^#{Token::DefaultsToken::TOKEN}/)
            @tokens << Token::DefaultsToken.new(line)
          end
        end
      end
      @tokens
    end

    private
    attr_writer :tokens, :raw_configuration
  end
end
