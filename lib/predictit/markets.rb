module PredictIt
  class Markets

    def self.all
      self.new.markets
    end

    def self.market(id)
      self.new.market(id)
    end

    def initialize(**params)
      @markets_raw = params.dig(:markets_raw)
      @market_raw = params.dig(:market_raw)
    end

    def market(id)
      @market ||= fetch_market(id)
    end

    def markets
      @markets ||= collect_markets
    end

    private

    def collect_markets
      response = @markets_raw || MarketsResource.new(klient).call
      response.collect { |market| market_builder(market) }
    end

    def contract_builder(contract_hash)
      to_struct(contract_hash)
    end

    def fetch_market(id)
      response = @market_raw || MarketResource.new(klient).call(id)
      market_builder(response)
    end

    def klient
      @klient ||= Client.new
    end

    def market_builder(market_hash)
      market_hash['contracts'] = market_hash['contracts'].collect { |contract| 
        contract_builder(contract)
      }
      to_struct(market_hash)
    end

    def to_struct(hash)
      keys = hash.keys.collect(&:to_sym)
      values = hash.values
      struct = Struct.new(*keys)
      struct.new(*values)
    end
  end
end
