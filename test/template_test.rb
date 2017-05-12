require 'test_helper'

class TemplateTest < Minitest::Test
  include SetupAndTeardown
  def setup
    super
    templates = Wordsmith::Project.find('test').templates
    @template = templates.find('test')
  end

  def test_generate_invalid
    ['test', 'generate'].each do |endpoint|
      err = assert_raises RuntimeError do
        @template.send(endpoint, {} )
      end

      assert_match(/^Bad Request/, err.message)
    end
  end

  def test_generate
    #skip 'Fix encoding issues.'
    output = @template.generate({a: 1, b: 1, c: 1}, proofread: true)
    assert_equal 'The value of A is 1.', output[:content]
    refute_nil output[:proofread_results]
  end

  def test_generate_test
    output = @template.test({a: 1, b: 1, c: 1})
    assert_nil output
  end
end
