
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
  end
end
