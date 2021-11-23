module PredictIt
  class MarketsResource < Resource
    def call
      response = request('marketdata/all/')
    end
  end
end
