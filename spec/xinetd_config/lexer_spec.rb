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
      it 'tokenizes the wait attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  wait
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::WaitAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the user attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  user
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::UserAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the group attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  group
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::GroupAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the server attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  server
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::ServerAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the server args attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  server_args
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::ServerArgsAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the instances attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  instances
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::InstancesAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the log_on_success attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  log_on_success
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::LogOnSuccessAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the log_on_failure attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  log_on_failure
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::LogOnFailureAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the only_from attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  only_from
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::OnlyFromAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the no_access attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  no_access
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::NoAccessAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the access_times attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  access_times
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::AccessTimesAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the type attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  type
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::TypeAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the rpc_version attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  rpc_version
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::RpcVersionAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the rpc_number attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  rpc_number
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::RpcNumberAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the id attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  id
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::IdAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the env attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  env
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::EnvAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the port attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  port
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::PortAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end

      it 'tokenizes the passenv attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  passenv
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::PassenvAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the flags attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  flags
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::FlagsAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the nice attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  nice
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::NiceAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the redirect attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  redirect
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::RedirectAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the banner attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  banner
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::BannerAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the bind attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  bind
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::BindAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the interface attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  interface
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::InterfaceAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the per_source attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  per_source
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::PerSourceAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the groups attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  groups
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::GroupsAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the banner_success attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  banner_success
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::BannerSuccessAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the banner_fail attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  banner_fail
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::BannerFailAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the cps attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  cps
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::CpsAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the disable attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  disable
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::DisableAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the max_load attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  max_load
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::MaxLoadAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the rlimit_as attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  rlimit_as
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::RLimitAsAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the rlimit_cpu attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  rlimit_cpu
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::RLimitCpuAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the rlimit_data attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  rlimit_data
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::RLimitDataAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the rlimit_rss attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  rlimit_rss
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::RLimitRssAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the rlimit_stack attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  rlimit_stack
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::RLimitStackAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the v6only attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  v6only
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::V6OnlyAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the deny_time attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  deny_time
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::DenyTimeAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the umask attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  umask
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::UmaskAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the mdns attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  mdns
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::MdnsAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
      it 'tokenizes the libwrap attribute' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  libwrap
}
CONTENT
        ).produces [
                     XinetdConfig::Token::ServiceToken,
                     XinetdConfig::Token::ServiceNameToken,
                     XinetdConfig::Token::EntryBeginToken,
                     XinetdConfig::Token::ServiceAttributes::LibwrapAttributeToken,
                     XinetdConfig::Token::EntryEndToken,
                   ]
      end
    end

    describe 'Tokenizing service block attribute operators' do
      it 'tokenizes the assignment operator (=)' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  id =
}
CONTENT
        ).produces [
          XinetdConfig::Token::ServiceToken,
          XinetdConfig::Token::ServiceNameToken,
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::IdAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::EntryEndToken,
        ]
      end

      it 'tokenizes the add assignment operator (+=)' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  id +=
}
CONTENT
        ).produces [
          XinetdConfig::Token::ServiceToken,
          XinetdConfig::Token::ServiceNameToken,
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::IdAttributeToken,
          XinetdConfig::Token::Operators::AddAssignmentToken,
          XinetdConfig::Token::EntryEndToken,
        ]
      end

      it 'tokenizes the subtract assignment operator (-=)' do
        assert_tokenization_of(<<CONTENT
service telnet
{
  id -=
}
CONTENT
        ).produces [
          XinetdConfig::Token::ServiceToken,
          XinetdConfig::Token::ServiceNameToken,
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::IdAttributeToken,
          XinetdConfig::Token::Operators::SubtractAssignmentToken,
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
