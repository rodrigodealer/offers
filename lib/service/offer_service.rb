# Fyber Offers Service class
class OfferService
  def self.url(params)
    "http://api.fyber.com/feed/v1/offers.json?#{params.parameters}&hashkey=" \
    "#{FyberToken.generate(params)}"
  end

  def fetch
  end
end
