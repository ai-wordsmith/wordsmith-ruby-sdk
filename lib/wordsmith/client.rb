require 'faraday'
require 'json'
require 'hashie'

module Wordsmith
  class Client

    def get(uri)
      response = onnection.get(uri)
      parse_response(response)
    end

    def post(uri, data)
      response = connection.post uri, {data: data}.to_json
      parse_response(response)
    end

    private

    def connection
      return @_connection if connection_valid?
      @_connection = Faraday.new(url: Wordsmith.configuration.url, headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{Wordsmith.configuration.token}",
        'User-Agent' => Wordsmith.configuration.user_agent
      })
    end

    def connection_valid?
      return false unless @_connection
      url = @_connection.url_prefix.to_s
      authorization = @_connection.headers['Authorization']

      url == Wordsmith.configuration.url &&
        authorization == "Bearer #{Wordsmith.configuration.token}"
    end

    def parse_response(response)
      body = JSON.parse(response.body)
      Hashie.symbolize_keys!(body)
      case response.status
      when 200, 201 then body[:data]
      when 400 then fail %Q(Bad Request: "#{body[:errors]}")
      when 401 then fail 'API authorization error.'
      when 404 then fail 'Incorrect url set in wordsmith.rb'
      when 429 then fail body[:error]
      else fail 'API error'
      end
    end
  end

  module_function

  def client
    @_client ||= Client.new
  end
end
