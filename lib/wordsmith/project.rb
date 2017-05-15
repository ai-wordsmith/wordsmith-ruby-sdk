module Wordsmith
  class Project
    attr_reader :name, :slug, :schema, :templates

    def self.all
      projects_attributes = Wordsmith.client.get('projects')
      projects_attributes.map {|p| new(**p)}
    end

    def self.find(slug)
      project = all.find { |p| p.slug == slug }
      project || raise(%Q(Project not found with slug: "#{slug}"))
    end

    def generate_active(data, proofread: false)
      Wordsmith.client.post(path('outputs'), data, proofread: proofread)
    end

    def test_active(data, proofread: false)
      Wordsmith.client.post(path('test'), data, proofread: proofread)
    end

    private

    def path(endpoint)
      "projects/#{slug}/templates/active/#{endpoint}"
    end

    def initialize(name: nil, slug: nil, schema: nil, templates: nil, **attributes)
      raise 'Missing required keyword arguments' unless [name, slug, templates].all?
      @name = name
      @slug = slug
      @schema = schema
      @templates =
        Wordsmith::TemplateCollection.new(
          templates.map { |t| Wordsmith::Template.new(project: self, **t) }
        )
    end
  end
end
