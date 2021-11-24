require 'ostruct'

module PredictIt
  # class Object < OpenStruct
  class Object
    def initialize(attributes)
      # super to_ostruct(attributes)
      to_ostruct(attributes)
    end

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.map { |key, val| [key, to_ostruct(val)] }.to_h)
      elsif obj.is_a?(Array)
        # binding.pry
        # all = obj.map { |o| to_ostruct(o) }
        # OpenStruct.new({ all: all })
        obj.map { |o| to_ostruct(o) }
      else
        obj
      end
    end
  end
end
