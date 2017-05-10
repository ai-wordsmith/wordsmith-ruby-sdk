module Wordsmith
  class Template
    attr_reader :name, :slug, :project

    def initialize(name: nil, slug: nil, project: nil, **attributes)
      raise 'Missing required keyword arguments' unless [name, slug, project].all?
      @name = name
      @slug = slug
      @project = project
    end

    def generate(data, proofread: false)
      send_to_wordsmith(data, proofread: proofread, endpoint: 'outputs')
      Wordsmith.client.post("projects/#{project.slug}/templates/#{slug}/outputs", data, proofread)
    end

    def test(data)
      send_to_wordsmith(data, endpoint: 'test')
      Wordsmith.client.post("projects/#{project.slug}/templates/#{slug}/test", data)
    end

    private

    def send_to_wordsmith(data, proofread:, endpoint:)
      Wordsmith.client.post("projects/#{project.slug}/templates/#{slug}/#{endpoint}", data, proofread)
    end
  end
end
