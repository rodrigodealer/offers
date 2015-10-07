require 'sinatra/base'
require 'sinatra/json'
require 'utils/string_util'

# Fyber Offers App Base class
class FyberOffersApp < Sinatra::Base
  set :views, proc { File.join(root, '../templates') }

  get '/' do
    erb :home
  end

  before '/offers' do
    if params[:uid].blank? || params[:pub0].blank? || params[:page].blank?
      status 400
    end
  end

  get '/offers' do
    obj = { foo: 'bar' }
    json obj
  end
end
