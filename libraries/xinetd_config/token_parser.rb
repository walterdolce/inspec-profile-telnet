module XinetdConfig
  module Token
    module Parser
      class BaseParser

        def initialize(chained_parser=nil)
          if chained_parser && !(chained_parser.kind_of? BaseParser)
            raise TypeError, '%s must be of type %s' % [chained_parser.class, BaseParser]
          end
          @chained_parser = chained_parser
        end

        def tokenize(line, tokens_list=[])
          raise NotImplementedError, 'Method "%s" must be implemented by concrete classes' % __method__
        end

        protected

        attr_reader :chained_parser

        private

        attr_writer :chained_parser
      end
    end
  end
end

Dir.glob(
  File.join(File.dirname(__FILE__), 'token_parser', '**', '*.rb')
).each do |file|
  require file
end
