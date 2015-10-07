# String utils methods
class String
  def blank?
    self.nil? || self.empty?
  end
end

# NilClass utils methods
class NilClass
  def blank?
    self.nil? || self.empty?
  end
end
