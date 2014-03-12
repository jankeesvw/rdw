# Free RDW vehicle information [![Build Status](https://travis-ci.org/jankeesvw/rdw.png)](https://travis-ci.org/jankeesvw/rdw) [![Code Climate](https://codeclimate.com/github/jankeesvw/rdw.png)](https://codeclimate.com/github/jankeesvw/rdw) [![Dependency Status](https://gemnasium.com/jankeesvw/rdw.png)](https://gemnasium.com/jankeesvw/rdw)

This project gets the public available vehicle information from the Dutch RDW.
It makes the following attributes available:

* `brand`
* `color`
* `number_of_cylinders`
* `cylinder_capacity`
* `number_of_seats`
* `fuel_efficiency_main_road`
* `fuel_efficiency_city`
* `fuel_efficiency_combined`
* `energy_label`
* `BPM`
* `co2_combined`
* `fuel_type`

# Usage
``` ruby
require "RDW"
@vehicle = RDW::CarInfo.new("9KJT45")
@vehicle.brand #=> FERRARI
@vehicle.energy_label #=> G
@vehicle.color #=> ROOD
@vehicle.BPM #=> 82168
@vehicle.number_of_cylinders #=> 12
```

# Notice
There is a rate limit on this api (50,000 per month), more information can be found here: [rdw.nl](http://www.rdw.nl/Zakelijk/Paginas/Open-data.aspx).

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rdw/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
