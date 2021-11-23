# frozen_string_literal: true

require_relative "predictit/version"

module Predictit
  autoload :Client, 'predictit/client'
  autoload :Error, 'predictit/error'
  autoload :Object, 'predictit/object'
  autoload :Resource, 'predictit/resource'

  class Error < StandardError; end
end
