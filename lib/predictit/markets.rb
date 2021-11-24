module PredictIt
  class Markets
    def initialize(markets_raw = nil)
      @markets_raw = markets_raw || request
    end

    def self.all
      self.new.markets
    end

    def markets
      @markets ||= @markets_raw.collect { |market| market_builder(market) }
    end

    private

    def contract_builder(contract_hash)
      to_struct(contract_hash)
    end

    def market_builder(market_hash)
      market_hash['contracts'] = market_hash['contracts'].collect { |contract| 
        contract_builder(contract)
      }
      to_struct(market_hash)
    end

    def request
      client = PredictIt::Client.new
      PredictIt::MarketsResource.new(client).call
    end

    def to_struct(hash)
      keys = hash.keys.collect(&:to_sym)
      values = hash.values
      struct = Struct.new(*keys)
      struct.new(*values)
    end

  end
end
