require 'test_helper'

class TemplateTest < Minitest::Test
  def setup
    Wordsmith.configure do |config|
      config.token = WORDSMITH_SDK_TEST_TOKEN
    end
    templates = Wordsmith::Project.find('test').templates
    @template = templates.find('test')
  end

  def teardown
    Wordsmith.reset
  end

  def test_generate_invalid
    err = assert_raises RuntimeError do
      @template.generate({})
    end

    assert_match(/^Bad Request/, err.message)
  end

  def test_generate
    #skip 'Fix encoding issues.'
    text = @template.generate({a: 1, b: 1, c: 1})[:content]
    assert_equal 'The value of A is 1.', text
  end
end
