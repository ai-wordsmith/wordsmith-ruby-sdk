module Wordsmith
  module Generator

    def send_to_wordsmith(data, endpoint, proofread: false)
      Wordsmith.client.post(path(endpoint), data, proofread: proofread)
    end
  end
end
