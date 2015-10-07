class String
  def blank?
    self.nil? || self.empty?
  end
end

class NilClass
  def blank?
    self.nil? || self.empty?
  end
end
