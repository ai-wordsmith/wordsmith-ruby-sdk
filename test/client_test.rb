require 'test_helper'

class ClientTest < Minitest::Test
  include SetupAndTeardown
  def test_default_url
    assert_equal 'https://api.automatedinsights.com/v1', connection.url_prefix.to_s
  end

  def test_authorization_header
    assert_equal "Bearer #{WORDSMITH_SDK_TEST_TOKEN}", authorization
  end

  def test_configuration_change
    Wordsmith.configure do |config|
      config.token = 'some_other_token'
      config.version = '666'
    end

    assert_equal 'Bearer some_other_token', authorization
    assert_equal "#{Wordsmith::Configuration::URL_HOST}/v666", connection.url_prefix.to_s
  end

  def test_content_type_header_is_json
    content_type = connection.headers['Content-Type']
    assert_equal 'application/json', content_type
  end

  def test_authorization
    Wordsmith.configure { |config| config.token = 'some_other_token' }

    assert_equal 'API authorization error.', bad_request_message
  end

  def test_incorrect_url
    Wordsmith.configure { |config| config.version = '1.99999' }

    assert_equal 'Incorrect version set in wordsmith.rb', bad_request_message
  end

  private

  def connection
    Wordsmith.client.send :connection
  end

  def authorization
    connection.headers['Authorization']
  end

  def bad_request_message
    Wordsmith.client.get('projects')
    fail 'Did not catch error'
  rescue RuntimeError => e
    return e.message
  end
end
