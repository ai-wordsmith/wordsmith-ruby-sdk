module Wordsmith
  module Generator

    def generate(data, endpoint, proofread = false)
      Wordsmith.client.post(path(endpoint), data, proofread)
    end

    # protected

    # def path
    #   "projects/#{project.slug}/templates/#{slug}/#{endpoint}"
    # end
  end
end
