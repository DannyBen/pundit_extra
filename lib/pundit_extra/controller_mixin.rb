require 'pundit_extra/helpers'
require 'pundit_extra/resource_autoload'

module PunditExtra
  def self.included(base)
    if defined? ActionController::Base
      ActionController::Base.class_eval do
        include PunditExtra::Helpers
        include PunditExtra::ResourceAutoload
      end
    end
  end
end
