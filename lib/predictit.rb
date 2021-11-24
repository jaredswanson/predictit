# frozen_string_literal: true

require_relative "predictit/version"

module PredictIt
  autoload :Client, 'predictit/client'
  autoload :Error, 'predictit/error'
  autoload :Object, 'predictit/object'
  autoload :Resource, 'predictit/resource'
  autoload :Markets, 'predictit/markets'

  autoload :MarketResource, 'predictit/resources/market'
  autoload :MarketsResource, 'predictit/resources/markets'

  class Error < StandardError; end
end
