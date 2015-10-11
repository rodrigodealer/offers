require 'spec_helper'
require 'service/offer_service'
require 'model/fyber_parameter'

RSpec.describe OfferService do
  describe '#url' do
    let(:param) do
      param = FyberParameter.new({})
      param.app_id = '157'
      param.device_id = '2b6f0cc904d137be2e1730235f5664094b831186'
      param.ip = '212.45.111.17'
      param.locale = 'de'
      param.page = '1'
      param.ps_time = '1312211903'
      param.timestamp = '1312211903'
      param.pub0 = 'campaign2'
      param.uid = 'player1'
      param
    end

    it 'generates an url based in parameters' do
      expect(OfferService.url(param)).to eql('http://api.fyber.com/feed' \
      '/v1/offers.json?appid=157&device_id=' \
      '2b6f0cc904d137be2e1730235f5664094b831186&ip=212.45.111.17&locale=de' \
      '&page=1&ps_time=1312211903&pub0=campaign2&timestamp=1312211903' \
      '&uid=player1&hashkey=2ca194d21a3c87da92e928806687d7dd16f607e3')
    end
  end

  describe '#fetch' do
    let(:response) { double }
    let(:body) { '{"code": "OK","message": "Ok","offers": []}' }
    let(:param) do
      param = FyberParameter.new({})
      param.app_id = '157'
      param.device_id = '2b6f0cc904d137be2e1730235f5664094b831186'
      param.ip = '212.45.111.17'
      param.locale = 'de'
      param.page = '1'
      param.ps_time = '1312211903'
      param.timestamp = '1312211903'
      param.pub0 = 'campaign2'
      param.uid = 'player1'
      param
    end

    it 'returns a 200 as status in success object' do
      allow(response).to receive(:code) { 200 }
      allow(response).to receive(:body) { body }
      allow(RestClient).to receive(:get) { response }

      json = OfferService.fetch(param)
      expect(json[:status]).to eq(200)
    end

    it 'returns a OK as code in success object' do
      allow(response).to receive(:code) { 200 }
      allow(response).to receive(:body) { body }
      allow(RestClient).to receive(:get) { response }

      json = OfferService.fetch(param)
      expect(json[:code]).to eq("OK")
    end

    it 'returns a empty array as offers in success object' do
      allow(response).to receive(:code) { 200 }
      allow(response).to receive(:body) { body }
      allow(RestClient).to receive(:get) { response }

      json = OfferService.fetch(param)
      expect(json[:offers]).to eq([])
    end

    it 'returns a empty array as offers in failure object' do
      json = OfferService.fetch(param)
      expect(json[:offers]).to eq([])
    end

    it 'returns a 400 code in failure object' do
      json = OfferService.fetch(param)
      expect(json[:code]).to eq("400")
    end

    it 'returns a 400 status in failure object' do
      json = OfferService.fetch(param)
      expect(json[:status]).to eq(400)
    end
  end
end
