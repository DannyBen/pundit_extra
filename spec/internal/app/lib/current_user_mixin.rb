module CurrentUserMixin
  def current_user
    User.current_user
  end

  def current_user=(user)
    User.current_user = user
  end
end
