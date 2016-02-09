class User
  def initialize(attrs={})
    @attrs = attrs
  end

  def admin?
    @attrs[:admin]
  end

  def admin=(value)
    @attrs[:admin] = value
  end

  def self.current_user
    @@current_user ||= User.new
  end

  def self.current_user=(user)
    @@current_user = user
  end
end

