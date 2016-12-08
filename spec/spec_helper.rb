require 'rspec'
require 'inspec'
require 'helpers/tokenization_assertor'
require_relative '../libraries/xinetd_config'

RSpec.configure do |config|
  config.include Helpers
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

##
# Helper classes
##
class ChainedParser < XinetdConfig::Token::Parser::BaseParser
  def tokenize(line, tokens_list=[])
  end
end

class WrongChainedParser
end

class WrongFactory
end

