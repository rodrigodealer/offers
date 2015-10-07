require 'app.rb'
require 'rack/test'

describe 'Sinatra App' do
  include Rack::Test::Methods

  def app
    FyberOffersApp.new
  end

  it "displays home page" do
    get '/'
    expect(last_response.body).to include("Foo")
  end
end
