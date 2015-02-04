module RDW

  class Configuration

    # Configure a cache to be used. Leave nil if no cache should be used.
    attr_accessor :cache

    # If you are using the cache you can set a custom prefix for cache keys.
    # Default value: rdw_
    attr_accessor :cache_prefix

    # If set to true, Dutch values will be converted to english.
    # This applies to colors, fuel types and unregistered values
    # For example:
    #   - 'ROOD' will be converted to 'red'
    #   - 'Benzine' will be converted to 'gasoline'
    #   - 'Niet geregistreerd' will be converted to 'unregistered'
    # Default value: false
    attr_accessor :format_values

    def initialize
      @cache = nil
      @cache_prefix = 'rdw_'
      @format_values = false
    end

  end
end