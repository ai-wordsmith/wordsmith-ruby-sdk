require 'test_helper'

class ConfigurationTest < Minitest::Test
  def test_token_default_value
    assert_nil Wordsmith::Configuration.new.token
  end

  def test_set_token_value
    config = Wordsmith::Configuration.new
    config.token = 'my_token'
    assert_equal 'my_token', config.token
  end

  def test_url_default_value
    config = Wordsmith::Configuration.new
    assert_equal 'https://api.automatedinsights.com/v1', config.url
  end

  def test_set_url_value
    config = Wordsmith::Configuration.new
    config.url = 'some_url'
    assert_equal 'some_url', config.url
  end
end
