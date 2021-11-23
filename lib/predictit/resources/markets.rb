module PredictIt
  class MarketsResource < Resource
    def call
      response = request('marketdata/all/')
      Object.new(response['markets'])
    end
  end
end
