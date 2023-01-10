class User
  class << self
    attr_writer :current_user

    def current_user
      @current_user ||= User.new
    end
  end

  def initialize(attrs = {})
    @attrs = attrs
  end

  def admin?
    @attrs[:admin]
  end

  # def admin=(value)
  #   @attrs[:admin] = value
  # end
end
