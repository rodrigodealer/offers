require File.join(File.dirname(__FILE__), '../model/fyber_token')
require 'rest-client'

# Fyber Offers Service class
class OfferService
  def self.url(params)
    "http://api.fyber.com/feed/v1/offers.json?#{params.parameters}&hashkey=" \
    "#{::FyberToken.generate(params)}"
  end

  def self.fetch(params)
    begin
      result = RestClient.get(url(params))
      json = JSON.parse(result.body)
      { status: result.code, code: json['code'], offers: json['offers'] }
    rescue Exception => e
      { status: e.http_code, code: e.message.split(' ').first, offers: [] }
    end
  end
end
