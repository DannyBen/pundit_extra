module TestSupport
  include CurrentUserMixin

  def sign_in_as_admin
    User.current_user = User.new admin: true
  end

  def sign_in_as_user
    User.current_user = User.new
  end
end