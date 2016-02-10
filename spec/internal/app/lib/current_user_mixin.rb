module CurrentUserMixin
  def current_user
    User.current_user
  end
end
