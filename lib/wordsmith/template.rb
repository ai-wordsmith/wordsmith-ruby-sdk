module Wordsmith
  class Template
    include Wordsmith::Generator
    attr_reader :name, :slug, :project

    def initialize(name: nil, slug: nil, project: nil, **attributes)
      raise 'Missing required keyword arguments' unless [name, slug, project].all?
      @name = name
      @slug = slug
      @project = project
    end

    def generate(data, proofread: false)
      send_to_wordsmith(data, 'outputs', proofread: proofread)
    end

    def test(data, proofread: false)
      send_to_wordsmith(data, 'test', proofread: proofread)
    end

    protected

    def path(endpoint)
      "projects/#{project.slug}/templates/#{slug}/#{endpoint}"
    end
  end
end
