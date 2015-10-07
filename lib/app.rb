require 'sinatra/base'
require 'sinatra/json'
require 'utils/string_util'

class FyberOffersApp < Sinatra::Base

  set :views, Proc.new { File.join(root, "../templates") }

  get '/' do
    erb :home
  end

  before '/offers' do
    status 400 if params[:uid].blank? || params[:pub0].blank? || params[:page].blank?
  end

  get '/offers' do
    obj = { foo: 'bar' }
    json obj
  end
end
