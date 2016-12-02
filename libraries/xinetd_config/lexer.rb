require 'rspec'
require_relative './token'
require_relative '../xinetd_config/token/comment_begin_token'
require_relative '../xinetd_config/token/service_token'
require_relative '../xinetd_config/token/service_name_token'
require_relative '../xinetd_config/token/entry_begin_token'
require_relative '../xinetd_config/token/entry_end_token'
require_relative '../xinetd_config/token/defaults_token'
require_relative '../xinetd_config/token/include_dir_token'
require_relative '../xinetd_config/token/include_token'
require_relative '../xinetd_config/token/include_path_token'

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
          if first_line_char == Token::CommentBeginToken::TOKEN
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
