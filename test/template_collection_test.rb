require 'test_helper'

class TemplateCollectionTest < Minitest::Test
  def setup
    Wordsmith.configure do |config|
      config.token = WORDSMITH_SDK_TEST_TOKEN
    end
    @templates = Wordsmith::Project.find('test').templates
  end

  def test_raises_if_not_found
    err = assert_raises RuntimeError do
      @templates.find 'test-sdk-nonexistent-template'
    end

    assert_equal %Q(Template not found with slug: "test-sdk-nonexistent-template"),
      err.message
  end

  def test_find_template
    template = @templates.find 'test'
    assert_instance_of Wordsmith::Template, template
  end

  def test_all_returns_enumerable
    assert_kind_of Enumerable, @templates.all
  end
end
