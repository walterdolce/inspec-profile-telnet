libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'xinetd_config/token'
require 'xinetd_config/token_parser'
require 'xinetd_config/lexer'

module XinetdConfig
  class XinetdConfig < Inspec.resource(1)
  end
end

