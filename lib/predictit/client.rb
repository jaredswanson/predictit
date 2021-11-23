require 'active_support/core_ext/hash'
require 'faraday'
require 'faraday_middleware'
require 'json'

module PredictIt
  class Client
    BASE_URL = 'https://www.predictit.org/api/'

    attr_reader :adapter

    def initialize(adapter: Faraday.default_adapter, stubs: nil)
      @adapter = adapter
      @stubs = stubs
    end


    def connection
       @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.request :json

        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end

  end
end
