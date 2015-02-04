require 'rdw/version'
require 'rdw/value_converter'
require 'rdw/configuration'
require 'rdw/car_info'
require 'open-uri'
require 'nokogiri'

module RDW

  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.reset
    @configuration = Configuration.new
  end

end
