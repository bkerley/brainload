require 'multi_json'
if MultiJson.respond_to?(:adapter)
  MultiJson.adapter
else
  MultiJson.engine # Force loading of an engine
end
require 'riak/core_ext/json'

module Riak
  class << self
    # Options that will be passed to the JSON parser and encoder.
    # Defaults to {:max_nesting => 20}
    attr_accessor :json_options
  end
  self.json_options = {:max_nesting => 20}

  # JSON module for internal use inside riak-client
  module JSON
    class << self
      if MultiJson.respond_to?(:dump) # MultiJson 1.2 or later
        # Parse a JSON string
        # @param [String] str a JSON payload
        # @return [Array,Hash] a Ruby object decoded from the JSON payload
        def parse(str)
          MultiJson.load(str, Riak.json_options)
        end

        # Generate a JSON string
        # @param [Array, Hash] obj an object to JSON-encode
        # @return [String] a JSON payload
        def encode(obj)
          MultiJson.dump(obj)
        end
      else
        # Parse a JSON string
        # @param [String] str a JSON payload
        # @return [Array,Hash] a Ruby object decoded from the JSON payload
        def parse(str)
          MultiJson.decode(str, Riak.json_options)
        end

        # Generate a JSON string
        # @param [Array, Hash] obj an object to JSON-encode
        # @return [String] a JSON payload
        def encode(obj)
          MultiJson.encode(obj)
        end
      end
      alias :dump :encode
    end
  end
end
