require 'sinatra/base'

class FyberOffersApp < Sinatra::Base

  set :views, Proc.new { File.join(root, "../templates") }
  
  get '/' do
    erb :home
  end

  get '/offers' do
  end
end
