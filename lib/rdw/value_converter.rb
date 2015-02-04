module RDW

  class ValueConverter

    # Colors as expected from the RDW api converted to english names.
    @colors = {
        'oranje' => 'orange',
        'roze' => 'pink',
        'rood' => 'red',
        'wit' => 'white',
        'blauw' => 'blue',
        'groen' => 'green',
        'geel' => 'yellow',
        'grijs' => 'gray',
        'bruin' => 'brown',
        'creme' => 'cream',
        'paars' => 'purple',
        'zwart' => 'black',
        'diversen' => 'miscellaneous'
    }

    # Fuel types as expected from the RDW api converted to english names.
    @fuel_types = {
        'benzine' => 'gasoline',
        'liquified natural gas' => 'lng',
        'lng' => 'lng',
        'diesel' => 'diesel',
        'elektriciteit' => 'electric',
        'liquified petrol gas' => 'lpg',
        'lpg' => 'lpg',
        'compressed natural gas' => 'cng',
        'cng' => 'cng',
        'waterstof' => 'hydrogen',
        'alcohol' => 'alcohol'
    }


    # Return the given +fuel_type+ in english. If no fuel_type is found, the original fuel_type will be returned.
    def self.convert_fuel_type(fuel_type)
      return nil if @fuel_types[fuel_type.downcase].nil?
      new_fuel_type = @fuel_types[fuel_type.downcase]
      new_fuel_type ? new_fuel_type : fuel_type
    end

    # Return the given +color+ in english. If no color is found, the original color will be returned.
    def self.convert_color(color)
      return nil if @colors[color.downcase].nil?
      new_color = @colors[color.downcase]
      new_color ? new_color : color
    end

    # Returns 'unregistered' instead of 'Niet geregistreerd'
    def self.convert_unregistered(value)
      if value.downcase == 'niet geregistreerd'
        return 'unregistered'
      end
      value
    end

  end





end