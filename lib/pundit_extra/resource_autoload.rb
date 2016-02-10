require 'active_support/concern'

module PunditExtra
  module ResourceAutoload
    extend ActiveSupport::Concern

    module ClassMethods
      def load_resource(options={})
        before_filter :load_resource, options.dup
      end

      def authorize_resource(options={})
        before_filter :authorize_resource, options.dup
      end

      def skip_authorization(options={})
        before_filter :skip_authorization_and_scope, options.dup
      end

      def load_and_authorize_resource(options={})
        # :nocov:
        load_resource options
        authorize_resource options
        # :nocov:
      end    
    end

    def load_resource
      scope = resource_class
      action = params[:action]
      varname = resource_name
      if action == 'index'
        varname = controller_name
        resource = policy_scope resource_class
      elsif ['new', 'create'].include? action
        resource = scope.new
        resource.attributes = send("#{resource_name}_params") if action == 'create'
      elsif params[:id]
        resource = scope.find params[:id]
      else
        resource = nil
      end
      instance_variable_set "@#{varname}", resource
    end

    def authorize_resource
      resource = resource_instance || resource_class
      authorize resource
    end

    def skip_authorization_and_scope
      action = params[:action]
      skip_policy_scope if action == 'index'
      skip_authorization
    end

    def resource_name
      controller_name.singularize
    end

    def resource_class
      resource_name.classify.constantize
    end

    def resource_instance
      instance_variable_get "@#{resource_name}"
    end
  end
end
