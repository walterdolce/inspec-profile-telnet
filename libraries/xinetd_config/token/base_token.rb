module XinetdConfig
  module Token
    class Base
      attr_reader :raw_token

      def initialize(raw_token)
        @raw_token = raw_token
      end

      private

      attr_writer :raw_token
    end

    module ServiceAttributes
      class Base < XinetdConfig::Token::Base
      end

      module ServiceAttributeValues
        class Base < XinetdConfig::Token::Base
        end
      end
    end
  end
end
