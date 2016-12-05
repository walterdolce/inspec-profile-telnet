module Helpers
  class TokenizationAssertor

    include ::RSpec::Matchers

    def assert_tokenization_of(configuration)
      @tokens = XinetdConfig::Lexer.new(
        configuration,
        nil,
        XinetdConfig::Token::Parser::BlockEntryParser.new(
          XinetdConfig::Token::Parser::CommentParser.new(
            XinetdConfig::Token::Parser::DefaultsStatementParser.new
          )
        )
      ).tokenize
      self
    end

    def produces(expected_tokens)
      if @tokens.length != expected_tokens.length
        raise "The number of tokens produced does not match the number of expected tokens.\nExpected: %s\nGot: %s" % [expected_tokens.inspect, @tokens.inspect]
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
end
