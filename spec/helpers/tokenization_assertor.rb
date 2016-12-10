module Helpers
  class TokenizationAssertor

    include ::RSpec::Matchers

    def assert_tokenization_of(configuration)
      @configuration = configuration
      @tokens = XinetdConfig::Lexer.new(
        @configuration,
        XinetdConfig::Token::Parser::BlockEntryParser.new(
          XinetdConfig::Token::Parser::CommentParser.new(
            XinetdConfig::Token::Parser::DefaultsStatementParser.new(
              XinetdConfig::Token::Parser::ServiceStatementParser.new(
                XinetdConfig::Token::Parser::IncludeStatementParser.new(
                  XinetdConfig::Token::Parser::IncludeDirStatementParser.new(
                    XinetdConfig::Token::Parser::ServiceAttributeStatementParser.new(
                    )
                  )
                )
              )
            )
          )
        )
      ).tokenize
      self
    end

    def produces(expected_tokens)
      if @tokens.length != expected_tokens.length
        raise "The number of tokens produced does not match the number of expected tokens.\nExpected: %s\nGot: %s\nConfiguration parsed:\n%s\n" % [expected_tokens.inspect, @tokens.inspect, @configuration]
      end
      (0...@tokens.length).each { |i|
        expect(@tokens[i]).to be_kind_of expected_tokens[i]
      }
      @tokens = []
    end

    private

    attr_writer :tokens

  end

  def assert_tokenization_of(configuration)
    TokenizationAssertor.new.assert_tokenization_of(configuration)
  end

  def assert_tokens_match(expected_tokens, tokens)
    expect(tokens.length).to eq(expected_tokens.length)
  
    tokens.each_with_index { |token, i|
      expect(token).to be_kind_of expected_tokens.at(i)
    }
  end
end
