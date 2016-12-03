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
          split_line = line.split(' ')
          first_line_word = split_line.first
          last_available_token = @tokens.last.class

          if last_available_token == Token::EntryBeginToken && !(Token::FIRST_LEVEL_TOKENS.include? first_line_word)
              if Token::SERVICE_ATTRIBUTE_TOKENS.include? first_line_word
                if first_line_word == Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::SocketTypeAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::ProtocolAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::ProtocolAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::WaitAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::WaitAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::UserAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::UserAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::GroupAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::GroupAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::ServerAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::ServerAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::ServerArgsAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::ServerArgsAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::InstancesAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::InstancesAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::LogOnSuccessAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::LogOnSuccessAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::LogOnFailureAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::LogOnFailureAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::OnlyFromAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::OnlyFromAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::NoAccessAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::NoAccessAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::AccessTimesAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::AccessTimesAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::TypeAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::TypeAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::RpcVersionAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::RpcVersionAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::RpcNumberAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::RpcNumberAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::IdAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::IdAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::EnvAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::EnvAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::PortAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::PortAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::PassenvAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::PassenvAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::FlagsAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::FlagsAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::NiceAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::NiceAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::RedirectAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::RedirectAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::BannerAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::BannerAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::BindAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::BindAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::InterfaceAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::InterfaceAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::PerSourceAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::PerSourceAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::GroupsAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::GroupsAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::BannerSuccessAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::BannerSuccessAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::BannerFailAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::BannerFailAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::CpsAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::CpsAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::DisableAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::DisableAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::MaxLoadAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::MaxLoadAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::RLimitAsAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::RLimitAsAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::RLimitCpuAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::RLimitCpuAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::RLimitDataAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::RLimitDataAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::RLimitRssAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::RLimitRssAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::RLimitStackAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::RLimitStackAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::V6OnlyAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::V6OnlyAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::DenyTimeAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::DenyTimeAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::UmaskAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::UmaskAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::MdnsAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::MdnsAttributeToken.new(line)
                elsif first_line_word == Token::ServiceAttributes::LibwrapAttributeToken::TOKEN
                  @tokens << Token::ServiceAttributes::LibwrapAttributeToken.new(line)
                end
              else
                @tokens << Token::ServiceAttributes::UnrecognisedAttributeToken.new(line)
              end

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
    attr_writer :tokens, :raw_configuration
  end
end
