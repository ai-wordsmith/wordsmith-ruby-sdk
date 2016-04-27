class Wordsmith::Project
  attr_reader :name, :slug, :templates

  def self.all
    projects_attributes = Wordsmith.client.get 'projects'
    projects_attributes.map {|p| new(**p)}
  end

  def self.find(slug)
    project = all.find { |p| p.slug == slug }
    project or fail %Q(Project not found with slug: "#{slug}")
  end

  def schema
    @_schema ||=
      begin
        body = Wordsmith.client.get "projects/#{slug}"
        body[:schema]
      end
  end

  private

  def initialize(name: nil, slug: nil, templates: nil)
    raise "Missing required kword arguments" unless [name, slug, templates].all?
    @name = name
    @slug = slug
    @templates = Wordsmith::TemplateCollection.new(
      templates.map {|t| Wordsmith::Template.new project: self, **t})
  end
end
