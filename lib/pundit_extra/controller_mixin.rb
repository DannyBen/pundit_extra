module PunditExtra
  def self.included(_base)
    if defined? ActionController::Base
      ActionController::Base.class_eval do
        include PunditExtra::Helpers
        include PunditExtra::ResourceAutoload
      end
    end
  end
end
