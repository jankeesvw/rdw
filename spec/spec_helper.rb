Dir.glob(File.join(Dir.pwd, '/lib/*.rb')).each do |file|
  require file
end

RSpec.configure do |config|
end
