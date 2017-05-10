require 'test_helper'

class ClientTest < Minitest::Test
  def setup
    Wordsmith.configure do |config|
      config.token = 'some_token'
    end
  end

  def test_default_url
    assert_equal 'https://api.automatedinsights.com/v1', connection.url_prefix.to_s
  end

  def test_url_configuration_change
    Wordsmith.configure do |config|
      config.url = 'http://www.some-other-url.com/api'
    end

    assert_equal 'http://www.some-other-url.com/api', connection.url_prefix.to_s
  end

  def test_authorization_header
    authorization = connection.headers['Authorization']
    assert_equal 'Bearer some_token', authorization
  end

  def test_token_configuration_change
    Wordsmith.configure do |config|
      config.token = 'some_other_token'
    end

    assert_equal 'Bearer some_other_token', connection.headers['Authorization']
  end

  def test_content_type_header_is_json
    content_type = connection.headers['Content-Type']
    assert_equal 'application/json', content_type
  end

  def test_authorization
    # Wordsmith.configure do |config|
    #   config.url
    # result = Wordsmith.client.get('projects')
    # assert_nil result
  end

  private

  def connection
    Wordsmith.client.send :connection
  end
end
