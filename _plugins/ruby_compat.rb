# Compatibility for Liquid 4 on Ruby 3.2+, where object taint APIs were
# removed. Older Ruby versions already provide these methods.
class Object
  def tainted?
    false
  end unless method_defined?(:tainted?)

  def taint
    self
  end unless method_defined?(:taint)

  def untaint
    self
  end unless method_defined?(:untaint)
end
