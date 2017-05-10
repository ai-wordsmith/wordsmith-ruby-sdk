class Wordsmith::TemplateCollection

  def initialize(templates)
    @templates = templates
  end

  def find(slug)
    template = @templates.find {|t| t.slug == slug }
    template || fail %Q(Template not found with slug: "#{slug}")
  end

  def all
    @templates.dup
  end
end
