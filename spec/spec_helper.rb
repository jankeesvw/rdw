require "vcr"
require "rspec/its"

Dir.glob(File.join(Dir.pwd, "/lib/*.rb")).each do |file|
  require file
end

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures"
  c.hook_into :webmock
end

RSpec.configure do |config|
end
