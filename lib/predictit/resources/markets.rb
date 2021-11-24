module PredictIt
  class MarketsResource < Resource
    def call
      response = request('marketdata/all/')
      response['markets']
    end
  end
end
