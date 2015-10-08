require 'app.rb'
require 'rack/test'

describe 'Sinatra App' do
  include Rack::Test::Methods

  def app
    FyberOffersApp.new({})
  end

  it 'displays home page' do
    get '/'
    expect(last_response.body).to include('Foo')
  end

  describe 'GET /offers' do
    describe 'with errors' do
      it 'without parameters' do
        get '/offers'
        expect(last_response.status).to eq(400)
      end

      it 'with uid' do
        get '/offers', uid: '10'
        expect(last_response.status).to eq(400)
      end

      it 'with page' do
        get '/offers', page: '10'
        expect(last_response.status).to eq(400)
      end

      it 'with pub0' do
        get '/offers', pub0: '10'
        expect(last_response.status).to eq(400)
      end
    end

    describe 'with success' do
      it 'with all parameters' do
        get '/offers', uid: '10', page: '10', pub0: '10'
        expect(last_response.status).to eq(200)
      end
    end
  end
end
