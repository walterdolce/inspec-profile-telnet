module XinetdConfig
  module Token
    module Parser
      class InternalBlockStatementParser < BaseParser

        attr_reader :token_factory

        def initialize(chained_parser=nil, token_factory=nil)
          super(chained_parser)
          if token_factory && !(token_factory.kind_of? Token::ServiceAttributes::TokenFactory)
            raise TypeError,
                  'Token factory must be an instance of XinetdConfig::Token::ServiceAttributes::TokenFactory'
          end
          @token_factory = token_factory || Token::ServiceAttributes::TokenFactory.new
        end

        def tokenize(line, tokens_list=[])
          split_line = line.split(' ')
          first_line_word = split_line.shift
          assignment_operator = second_line_word = split_line.shift
          service_attribute_value = split_line.shift
          last_available_token = tokens_list.last.class
          if last_available_token == Token::EntryBeginToken && !(Token::FIRST_LEVEL_TOKENS.include? line.split(' ').shift)
            tokens_list << @token_factory.create(first_line_word)
            if assignment_operator
              tokens_list << @token_factory.create(assignment_operator)
            end
            if service_attribute_value
              if (Token::SERVICE_ATTRIBUTE_TOKENS.include? first_line_word) && (%w(type id).include? first_line_word)
                if first_line_word == 'type'
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::RpcValueToken.new(line)
                elsif first_line_word == 'id'
                  tokens_list << Token::ServiceAttributes::ServiceAttributeValues::TypeAttributeValues::IdValueToken.new(line)
                end
              end
            end
            tokens_list
          elsif chained_parser
            chained_parser.tokenize(line, tokens_list)
          end
        end

        private

        attr_writer :token_factory

      end
    end
  end
end

