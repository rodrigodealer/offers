class FyberToken
  def self.generate(params)
    require 'digest/sha1'
    Digest::SHA1.hexdigest "#{params.parameters}&#{params.app_key}"
  end
end
