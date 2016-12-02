require 'rspec'
require 'inspec'
require 'helpers/tokenization_assertor'
require_relative '../libraries/xinetd_config'

# require_relative '../../libraries/xinetd_config/lexer'
RSpec.configure do |c|
  c.include Helpers
end
