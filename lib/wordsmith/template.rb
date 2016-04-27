class Wordsmith::Template
  attr_reader :name, :slug, :project

  def initialize(name: nil, slug: nil, project: nil)
    raise "Missing required kword arguments" unless [name, slug, project].all?
    @name = name
    @slug = slug
    @project = project
  end

  def generate(data)
    Wordsmith.client.post "projects/#{project.slug}/templates/#{slug}/outputs", data
  end
end
