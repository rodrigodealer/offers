require File.join(File.dirname(__FILE__), 'lib/app')

map '/' do
  run FyberOffersApp.new
end
