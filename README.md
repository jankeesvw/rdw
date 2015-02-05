# Free RDW vehicle information 
[![Build Status](https://travis-ci.org/jankeesvw/rdw.png)](https://travis-ci.org/jankeesvw/rdw) [![Code Climate](https://codeclimate.com/github/jankeesvw/rdw.png)](https://codeclimate.com/github/jankeesvw/rdw) [![Dependency Status](https://gemnasium.com/jankeesvw/rdw.png)](https://gemnasium.com/jankeesvw/rdw) [![Dependency Status](https://gemnasium.com/jankeesvw/rdw.png)](https://gemnasium.com/jankeesvw/rdw)

This project gets the public available vehicle information from the Dutch RDW.
It makes the following attributes available:

* `brand`
* `first_color` (alias: `color`)
* `second_color`
* `number_of_cylinders`
* `cylinder_capacity`
* `number_of_seats`
* `fuel_efficiency_main_road`
* `fuel_efficiency_city`
* `fuel_efficiency_combined`
* `energy_label`
* `bpm` (alias: `BPM`)
* `co2_combined`
* `fuel_type`
* `stock_price`

# Configuration (optional)
A configuration is optional, here is an example configuration with explanation in the comments:
``` ruby
RDW.configure do |config|
  # Leave this out of the configuration to not use the cache.
  # This must be a cache object (with read, write and fetch methods).
  config.cache = Rails.cache
  
  # If you are using the cache you can set a custom prefix for cache keys.
  # Default value: rdw_
  config.cache_prefix = 'rdw_data_'
  
  # If set to true, Dutch values will be translated to english.
  # This applies to colors, fuel types and unregistered values
  # For example:
  #   - 'ROOD' will be translated to 'red'
  #   - 'Benzine' will be translated to 'gasoline'
  #   - 'Niet geregistreerd' will be translated to 'unregistered'
  #
  # Default value: false
  config.format_values = true
end
```
Add the configuration in the `config/initializers` folder, name the file `rdw.rb` (any name will work).

# Usage
``` ruby
require "RDW"
@vehicle = RDW::CarInfo.new("9KJT45")
@vehicle.brand #=> FERRARI
@vehicle.energy_label #=> G
@vehicle.first_color #=> ROOD
@vehicle.bpm #=> 82168
@vehicle.number_of_cylinders #=> 12
```

# Notice
There is a rate limit on this api (50,000 per month), more information can be found here: [rdw.nl](http://www.rdw.nl/Zakelijk/Paginas/Open-data.aspx).
More details for the service can be found here: [http://www.rdw.nl/SiteCollectionDocuments/Over%20RDW/Naslagwerk/Beschrijving%20dataset%20Voertuigen.pdf].

## Contributing

1. Fork it ( `http://github.com/<my-github-username>/rdw/fork` )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
