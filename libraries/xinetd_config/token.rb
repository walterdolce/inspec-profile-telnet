Dir.glob(
  File.join(File.dirname(__FILE__), 'token', '**', '*.rb')
).each do |file|
  require file
end

module XinetdConfig
  module Token
    FIRST_LEVEL_TOKENS = [
      Token::EntryBeginToken::TOKEN,
      Token::EntryEndToken::TOKEN,
      Token::ServiceToken::TOKEN,
      Token::DefaultsToken::TOKEN,
      Token::IncludeDirToken::TOKEN,
      Token::IncludeToken::TOKEN,
    ]

    SERVICE_ATTRIBUTE_TOKENS = [
      Token::ServiceAttributes::SocketTypeAttributeToken::TOKEN,
      Token::ServiceAttributes::ProtocolAttributeToken::TOKEN,
    ]
  end
end
