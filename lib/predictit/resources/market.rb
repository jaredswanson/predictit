module PredictIt
  class MarketResource < Resource
    def call(id)
      request("marketdata/markets/#{id}")
    end
  end
end
