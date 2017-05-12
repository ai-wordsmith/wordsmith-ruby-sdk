require 'test_helper'

class ProjectTest < Minitest::Test
  include SetupAndTeardown
  def test_all_contains_project
    list = Wordsmith::Project.all
    assert list.find {|p| p.slug == 'test'}
  end

  def test_find_returns_project
    project = Wordsmith::Project.find 'test'
    assert_instance_of Wordsmith::Project, project
  end

  def test_find_raises_if_not_found
    err = assert_raises RuntimeError do
      Wordsmith::Project.find 'test-sdk-nonexistent-project'
    end

    assert_equal %Q(Project not found with slug: "test-sdk-nonexistent-project"),
      err.message
  end

  def test_schema
    project = Wordsmith::Project.find 'test'
    expected = { a: 'Number', b: 'Number', c: 'Number' }
    assert_equal expected, project.schema
  end

  def test_template_collection_exists
    project = Wordsmith::Project.find('test')
    assert_instance_of Wordsmith::TemplateCollection, project.templates
  end
end
