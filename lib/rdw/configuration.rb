module RDW

  class Configuration

    # Configure a cache to be used. Leave nil if no cache should be used.
    attr_accessor :cache

    # If you are using the cache you can set a custom prefix for cache keys.
    # Default value: rdw_
    attr_accessor :cache_prefix

    # If set to true, Dutch values will be translated to english.
    # This applies to colors, fuel types and unregistered values
    # For example:
    #   - 'ROOD' will be translated to 'red'
    #   - 'Benzine' will be translated to 'gasoline'
    #   - 'Niet geregistreerd' will be translated to 'unregistered'
    # Default value: false
    attr_accessor :translate_values

    def initialize
      @cache = nil
      @cache_prefix = 'rdw_'
      @translate_values = false
    end

  end
end