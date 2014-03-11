require "rdw/version"
require "net/http"
require "nokogiri"

module RDW
  def self.car_info_for(license_plate)
    CarInfo.new(license_plate)
  end

  class CarInfo
    AVAILABLE_METHODS = %w{Aantalcilinders}
    def initialize(license_plate)
      response = Net::HTTP.get_response(URI("https://api.datamarket.azure.com/Data.ashx/opendata.rdw/VRTG.Open.Data/v1/KENT_VRTG_O_DAT('#{license_plate}')"))
      @xml = Nokogiri::XML(response.body)
    end

    def method_missing(method, *args, &block)
      if AVAILABLE_METHODS.include?(method.to_s)
        @xml.xpath("//d:#{method.to_s}").text
      else
        super
      end
    end
  end
end
