require 'sinatra/base'
require 'sinatra/json'
require 'yaml'

require File.join(File.dirname(__FILE__), 'utils/string_util')
require File.join(File.dirname(__FILE__), 'model/fyber_parameter')
require File.join(File.dirname(__FILE__), 'service/offer_service')

# Fyber Offers App Base class
class FyberOffersApp < Sinatra::Base
  set :views, proc { File.join(root, '../templates') }

  configure do
    set :config, YAML.load_file('config.yml')
  end

  get '/' do
    erb :home
  end

  before '/offers' do
    if params[:uid].blank? || params[:pub0].blank? || params[:page].blank?
      status 400
    end
  end

  get '/offers' do
    fyber_param = FyberParameter.new(params).config(settings.config)
    ::OfferService.fetch(fyber_param)
    obj = { foo: 'bar' }
    json obj
  end
end
