require 'spec_helper'
require 'model/fyber_parameter'

RSpec.describe FyberParameter do
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

  describe '#parameters' do
    it 'returns token parameters in single string' do
      expect(fyber_parameter.parameters).to eql('appid=157&device_id=2b6f0cc904d137be2e1730235f5664094b831186&ip=212.45.111.17&locale=de&page=1&ps_time=1312211903&pub0=campaign2&timestamp=1312211903&uid=player1')
    end
  end
end
