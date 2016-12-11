
describe XinetdConfig::Token::Parser::ServiceAttributeStatementParser do

  let(:parser) {
    parser = XinetdConfig::Token::Parser::ServiceAttributeStatementParser.new
  }
  let (:tokens_list) {
    [XinetdConfig::Token::EntryBeginToken.new('')]
  }

  it 'is of type XinetdConfig::Token::Parser::BaseParser' do
    expect(parser).to be_kind_of XinetdConfig::Token::Parser::BaseParser
  end

  it 'tokenizes instances of XinetdConfig::Token::ServiceAttributes::UnrecognisedAttributeToken by default when unsupported tokens are parsed' do
    expect(
      parser.tokenize('foo', tokens_list)
    ).to include XinetdConfig::Token::ServiceAttributes::UnrecognisedAttributeToken
  end

  describe 'Tokenizing service attribute values' do
    describe 'Tokenizing invalid values' do
      it 'tokenizes not supported values assigned to the "type" service attribute as invalid' do
        tokens = parser.tokenize('type = FOO', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::TypeAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)

        tokens = parser.tokenize('type = RPC FOO INTERNAL', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::TypeAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::TypeValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::TypeValueToken,
        ]
        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "flags" service attribute as invalid' do
        tokens = parser.tokenize('flags = FOO', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::FlagsAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)

        tokens = parser.tokenize('flags = INTERCEPT FOO NORETRY', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::FlagsAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::FlagsValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::FlagsValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "disable" service attribute as invalid' do
        tokens = parser.tokenize('disable = foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::DisableAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)

        tokens = parser.tokenize('disable = yes foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::DisableAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::DisableValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "socket_type" service attribute as invalid' do
        tokens = parser.tokenize('socket_type = foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)

        tokens = parser.tokenize('socket_type = stream foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::SocketTypeValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "protocol" service attribute as invalid' do
        tokens = parser.tokenize('protocol = tcp foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::ProtocolAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::ProtocolValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "wait" service attribute as invalid' do
        tokens = parser.tokenize('wait = yes foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::WaitAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::WaitValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "user" service attribute as invalid' do
        tokens = parser.tokenize('user = root foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::UserAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::UserValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "group" service attribute as invalid' do
        tokens = parser.tokenize('group = root foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::GroupAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::GroupValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "instances" service attribute as invalid' do
        tokens = parser.tokenize('instances = foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::InstancesAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)

        tokens = parser.tokenize('instances = 1 foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::InstancesAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::InstancesValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "nice" service attribute as invalid' do
        tokens = parser.tokenize('nice = foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::NiceAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)

        tokens = parser.tokenize('nice = -10 foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::NiceAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::NiceValueToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "access_times" service attribute as invalid' do
        tokens = parser.tokenize('access_times = foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::AccessTimesAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "log_type" service attribute as invalid' do
        tokens = parser.tokenize('log_type = foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::LogTypeAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "log_on_success" service attribute as invalid' do
        tokens = parser.tokenize('log_on_success = foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::LogOnSuccessAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "log_on_failure" service attribute as invalid' do
        tokens = parser.tokenize('log_on_failure = foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::LogOnFailureAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
      it 'tokenizes not supported values assigned to the "rpc_version" service attribute as invalid' do
        tokens = parser.tokenize('rpc_version = foo', tokens_list)
        expected_tokens = [
          XinetdConfig::Token::EntryBeginToken,
          XinetdConfig::Token::ServiceAttributes::RpcVersionAttributeToken,
          XinetdConfig::Token::Operators::AssignmentToken,
          XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::InvalidValueToken,
        ]

        assert_tokens_match(expected_tokens, tokens)
      end
    end
  end

  it 'returns an instance of XinetdConfig::Token::ServiceAttributes::TokenFactory as default token factory' do
    expect(parser.token_factory).to be_kind_of XinetdConfig::Token::ServiceAttributes::TokenFactory
  end

  it 'raises an error if an attempt to write the token factory is made' do
    expect { parser.token_factory = 'foo' }.to raise_error
  end

  it 'raises an error if the wrong type of factory is injected' do
    expect {
      XinetdConfig::Token::Parser::ServiceAttributeStatementParser.new(nil, WrongFactory.new)
    }.to raise_error TypeError
  end

  it 'returns an instance of the supported tokens' do
    #TODO assert each supported attribute translate to the correct type
    expect(
      parser.tokenize(
        XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN,
        tokens_list
      )
    ).to include XinetdConfig::Token::ServiceAttributes::SocketTypeAttributeToken
  end

  it 'returns the expected combination of tokenized tokens' do
    tokens = parser.tokenize('id = telnet', tokens_list)
    expected_tokens = [
      XinetdConfig::Token::EntryBeginToken,
      XinetdConfig::Token::ServiceAttributes::IdAttributeToken,
      XinetdConfig::Token::Operators::AssignmentToken,
      XinetdConfig::Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::IdValueToken,
    ]

    assert_tokens_match(expected_tokens, tokens)
  end

  it 'calls the chained parser if available when it cannot tokenize on its own' do
    chained_parser = ChainedParser.new
    expect(chained_parser).to receive(:tokenize).with('foo', [])
    parser = XinetdConfig::Token::Parser::ServiceAttributeStatementParser.new(chained_parser)
    parser.tokenize('foo')
  end
end
