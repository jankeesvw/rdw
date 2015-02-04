module RDW

  class Configuration

    # Configure a cache to be used. Leave nil if no cache should be used.
    attr_accessor :cache

    # Cache key prefix
    attr_accessor :cache_prefix

    # Set to true if you want values to be returned in english.
    # Example for colors: 'ROOD' will return 'red'.
    # Example for fuel types: 'Benzine' will return 'gasoline'.
    # 'Niet geregistreerd' (which means that no value registered in the RDW database) will return 'unknown'.
    attr_accessor :format_values

    def initialize
      @cache = nil
      @cache_prefix = 'rdw_'
      @format_values = false
    end

  end
end