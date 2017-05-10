require 'test_helper'

class ClientTest < Minitest::Test
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
    begin
      Wordsmith.client.get('projects')
    rescue RuntimeError => e
      assert_equal 'API authorization error.', e.message
      return
    end

    fail 'Did not catch error'
  end

  def test_incorrect_url
    Wordsmith.configure { |config| config.version = '1.99999' }
    begin
      Wordsmith.client.get('projects')
    rescue RuntimeError => e
      assert_equal 'Incorrect url set in wordsmith.rb', e.message
      return
    end

    fail 'Did not catch error'
  end

  private

  def connection
    Wordsmith.client.send :connection
  end

  def authorization
    connection.headers['Authorization']
  end
end
