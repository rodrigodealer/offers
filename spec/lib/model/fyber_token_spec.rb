require 'spec_helper'
require 'model/fyber_token'

RSpec.describe FyberToken do
  let(:fyber_parameter) {
    param = FyberParameter.new
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
  }

  describe '#generate' do
    it 'returns the token' do
      expect(FyberToken.generate(fyber_parameter)).to eql('2ca194d21a3c87da92e928806687d7dd16f607e3')
    end
  end
end
