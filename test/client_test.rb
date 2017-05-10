require 'test_helper'

class ClientTest < Minitest::Test
#  def test_get
#    skip
#  end
#
#  def test_post
#    skip
#  end
end

class ClientTest::ParseResponseTest < Minitest::Test
end

class ClientTest::ConnectionTest < Minitest::Test
  def setup
    Wordsmith.configure do |config|
      config.token = 'some_token'
      config.url = 'http://www.some-url.com/api'
    end
    super
  end

  def test_url_configuration_change
    connection = Wordsmith.client.send :connection
    assert_equal 'http://www.some-url.com/api',
      connection.url_prefix.to_s

    Wordsmith.configure do |config|
      config.url = 'http://www.some-other-url.com/api'
    end

    connection = Wordsmith.client.send :connection
    assert_equal 'http://www.some-other-url.com/api',
      connection.url_prefix.to_s
  end

  def test_token_configuration_change
    connection = Wordsmith.client.send :connection
    assert_equal 'Bearer some_token', connection.headers['Authorization']

    Wordsmith.configure do |config|
      config.token = 'some_other_token'
    end

    connection = Wordsmith.client.send :connection
    assert_equal 'Bearer some_other_token', connection.headers['Authorization']
  end

  def test_content_type_header_is_json
    connection = Wordsmith.client.send :connection
    content_type = connection.headers['Content-Type']
    assert_equal 'application/json', content_type
  end

  def test_authorization_header
    connection = Wordsmith.client.send :connection
    authorization = connection.headers['Authorization']
    assert_equal 'Bearer some_token', authorization
  end
end
