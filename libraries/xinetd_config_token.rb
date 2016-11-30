
class XinetdConfigToken

  attr_reader :raw_token

  def initialize(raw_token)
    @raw_token = raw_token
  end

  private
    attr_writer :raw_token
end
