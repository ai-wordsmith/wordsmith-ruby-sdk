module Wordsmith
  class Template
    attr_reader :name, :slug, :project
    #include Wordsmith::Generator

    def initialize(name: nil, slug: nil, project: nil, **attributes)
      raise 'Missing required keyword arguments' unless [name, slug, project].all?
      @name = name
      @slug = slug
      @project = project
    end

    def generate(data, proofread: false)
      Wordsmith.client.post(path('outputs'), data, proofread)
    end

    def test(data, proofread: false)
      Wordsmith.client.post(path('test'), data, proofread)
    end

    private

    def path(endpoint)
      "projects/#{project.slug}/templates/#{slug}/#{endpoint}"
    end
  end
end
