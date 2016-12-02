describe XinetdConfig::Lexer do
  describe 'Reading empty configuration file(s)' do
    it 'returns an empty list of tokens by default' do
      lexer = XinetdConfig::Lexer.new
      expect(lexer.tokens).to eq []
    end
    it 'returns an empty string as raw configuration by default' do
      lexer = XinetdConfig::Lexer.new
      expect(lexer.raw_configuration).to eq ''
    end
  end

  describe 'Getting configuration file(s) content' do
    it 'returns the raw configuration as-is' do
      lexer = XinetdConfig::Lexer.new('some configuration')
      expect(lexer.raw_configuration).to eq 'some configuration'
    end
  end

  describe 'Tokenizing configuration file(s)' do
    it 'returns an empty list of tokens when the configuration file(s) is/are empty' do
      assert_tokenization_of('').produces []
    end

    describe 'Tokenizing comments' do
      it 'tokenizes comments' do
        assert_tokenization_of(<<CONTENT
        # I am a comment
CONTENT
        ).produces [XinetdConfig::Token::CommentBeginToken]
      end
    end

    describe 'Tokenizing service blocks' do
      it 'tokenizes partially defined service blocks' do
        assert_tokenization_of(<<CONTENT
    service
CONTENT
        ).produces [XinetdConfig::Token::ServiceToken]
      end

      it 'tokenizes empty service blocks' do
        assert_tokenization_of(<<CONTENT
    service telnet
    {
    }
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
    end

    describe 'Tokenizing service block attributes' do
      it 'tokenizes unrecognised service block attributes' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  unsupported_attribute
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::UnrecognisedAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the socket_type attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  socket_type
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the protocol attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  protocol
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::ProtocolAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
    end

    describe 'Tokenizing defaults blocks' do
      it 'tokenizes partially defined defaults blocks' do
        assert_tokenization_of(<<CONTENT
defaults
CONTENT
        ).produces [XinetdConfig::Token::DefaultsToken]
      end

      it 'tokenizes empty defaults block(s)' do
        assert_tokenization_of(<<CONTENT
defaults
{
}
CONTENT
        ).produces [
                     XinetdConfig::Token::DefaultsToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
    end

    describe 'Tokenizing include statements' do
      it 'tokenizes empty include statements' do
        assert_tokenization_of(<<CONTENT
include
CONTENT
        ).produces [XinetdConfig::Token::IncludeToken]
      end
      it 'tokenizes include statements' do
        assert_tokenization_of(<<CONTENT
include /etc/xinetd/telnet
CONTENT
        ).produces [XinetdConfig::Token::IncludeToken, XinetdConfig::Token::IncludePathToken]
      end
      #TODO add "it tokenizes include statements whose path contain spaces. Ex: include '/etc/some file/path'"
    end

    describe 'Tokenizing includedir statements' do
      it 'tokenizes empty includedir statements' do
        assert_tokenization_of(<<CONTENT
includedir
CONTENT
        ).produces [XinetdConfig::Token::IncludeDirToken]
      end
      it 'tokenizes includedir statement(s)' do
        assert_tokenization_of(<<CONTENT
includedir /etc/xinet.d
CONTENT
        ).produces [XinetdConfig::Token::IncludeDirToken, XinetdConfig::Token::IncludePathToken]
      end
      #TODO add "it tokenizes includedir statements whose path contain spaces. Ex: include '/etc/some file/path'"
    end
  end
end
