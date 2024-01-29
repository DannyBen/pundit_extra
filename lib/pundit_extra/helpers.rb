module PunditExtra
  module Helpers
    def self.included(base)
      base.helper_method :can?, :cannot? if base.respond_to? :helper_method
    end

    def can?(action, resource)
      policy(resource).send :"#{action}?"
    end

    def cannot?(*args)
      !can?(*args)
    end
  end
end
