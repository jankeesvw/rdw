module RDW
  class CarInfo

    def initialize(license_plate)
      @license_plate = license_plate
      perform_request!
    end

    def number_of_cylinders
      parse('Aantalcilinders').to_i
    end

    def number_of_seats
      parse('Aantalzitplaatsen').to_i
    end

    def bpm
      parse('BPM').to_i
    end

    alias_method :BPM, :bpm

    def fuel_efficiency_main_road
      parse('Brandstofverbruikbuitenweg').to_f
    end

    def fuel_efficiency_city
      parse('Brandstofverbruikstad').to_f
    end

    def fuel_efficiency_combined
      parse('Brandstofverbruikgecombineerd').to_f
    end

    def cylinder_capacity
      parse('Cilinderinhoud').to_f
    end

    def co2_combined
      parse('CO2uitstootgecombineerd').to_f
    end

    def first_color
      color = parse('Eerstekleur')
      RDW.configuration.format_values && color != 'unknown'  ? ValueConverter.convert_color(color) : color
    end

    alias_method :color, :first_color

    def second_color
      color = parse('Tweedekleur')
      RDW.configuration.format_values && color != 'unknown' ? ValueConverter.convert_color(color) : color
    end

    def fuel_type
      fuel_type = parse('Hoofdbrandstof')
      RDW.configuration.format_values && fuel_type != 'unknown' ? ValueConverter.convert_fuel_type(fuel_type) : fuel_type
    end

    def brand
      parse('Merk')
    end

    def trade_name
      parse('Handelsbenaming')
    end

    def energy_label
      parse('Zuinigheidslabel')
    end

    def stock_price
      parse('Catalogusprijs')
    end

    def engine_power
      parse('Vermogen')
    end

    def inspect
      "<RDW::CarInfo license_plate:'#{@license_plate}' brand:'#{brand}' fuel_type:'#{fuel_type}'>"
    end

    def raw_data_field(attribute_name)
      parse(attribute_name)
    end

    private

    def parse(attribute_name)
      begin
        value = @xml.xpath("//d:#{attribute_name.to_s}").text
        RDW.configuration.format_values ? ValueConverter.convert_unknown(value) : value
      rescue
        nil
      end
    end


    def perform_request!
      api_url = "https://api.datamarket.azure.com/Data.ashx/opendata.rdw/VRTG.Open.Data/v1/KENT_VRTG_O_DAT('#{@license_plate}')"
      if RDW.configuration.cache.nil?
        response = URI.parse(api_url).read
      else
        response = RDW.configuration.cache.fetch(RDW.configuration.cache_prefix.to_s + @license_plate.to_s.upcase) do
          URI.parse(api_url).read
        end
      end
      @xml = Nokogiri::XML(response)
    end
  end
end