module PredictIt
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end
    
    def request(url)
      response = client.connection.get(url)
      response.body.deep_transform_keys(&:underscore)
    end
  end
  
end
