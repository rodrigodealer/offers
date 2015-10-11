# Fyber Service Parameters class
class FyberParameter
  attr_accessor :app_id, :device_id, :ip, :locale, :format,
                :page, :ps_time, :pub0, :timestamp, :uid, :api_key
  def initialize(params)
    self.pub0 = params[:pub0]
    self.page = params[:page]
    self.uid = params[:uid]
  end

  def config(config)
    self.format = config['format']
    self.app_id = config['app_id']
    self.device_id = config['device_id']
    self.ip = config['ip']
    self.locale = config['locale']
    self.api_key = config['api_key']
    self.ps_time = Time.now.to_i
    self.timestamp = Time.now.to_i
    self
  end

  def parameters
    "appid=#{app_id}&device_id=#{device_id}" \
      "&ip=#{ip}&locale=#{locale}&page=#{page}&ps_time=#{ps_time}" \
      "&pub0=#{pub0}&timestamp=#{timestamp}&uid=#{uid}"
  end
end
