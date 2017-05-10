module Wordsmith
  class Configuration
    attr_accessor :token, :version, :user_agent
    DEFAULT_VERSION = '1'
    DEFAULT_USER_AGENT = "RubySDK/#{Wordsmith::VERSION}"
    URL_HOST = "https://api.automatedinsights.com"
    DEFAULT_URL = "#{URL_HOST}/v#{DEFAULT_VERSION}"

    def initialize
      @version = DEFAULT_VERSION
      @user_agent = DEFAULT_USER_AGENT
    end

    def url
      "#{URL_HOST}/v#{version}"
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
