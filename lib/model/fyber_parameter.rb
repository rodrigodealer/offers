class FyberParameter
  attr_accessor :app_id, :device_id, :ip, :locale,
                :page, :ps_time, :pub0, :timestamp, :uid, :app_key

  def parameters
    "appid=#{app_id}&device_id=#{device_id}" +
      "&ip=#{ip}&locale=#{locale}&page=#{page}&ps_time=#{ps_time}" +
      "&pub0=#{pub0}&timestamp=#{timestamp}&uid=#{uid}"
  end
end
