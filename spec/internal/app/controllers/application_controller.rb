class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include PunditExtra
  include CurrentUserMixin

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  after_action :verify_authorized
  after_action :verify_policy_scoped, only: :index

  protected

  def unauthorized
    return if response_body
    redirect_to root_url, :alert => "You are not authorized to perform this action." 
  end

end
