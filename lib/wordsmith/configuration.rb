module Wordsmith
  class Configuration
    attr_accessor :token, :url, :user_agent
    DEFAULT_URL = 'https://api.automatedinsights.com/v1'
    DEFAULT_USER_AGENT = "RubySDK/#{Wordsmith::VERSION}"

    def initialize
      @url = DEFAULT_URL
      @user_agent = DEFAULT_USER_AGENT
    end
  end

  module_function

  def configuration
    @_configuration ||= Configuration.new
  end

  def configure
    yield configuration
  end

  def reset
    @_configuration = Configuration.new
  end
end
