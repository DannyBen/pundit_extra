unless ENV['NOCOV']
  require 'simplecov'

  SimpleCov.start do
    enable_coverage :branch
    coverage_dir 'spec/coverage'
  end
end

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

require 'capybara/rspec'

# Combustion.initialize! :all
Combustion.initialize! :action_controller, :action_view

require 'rspec/rails'
require 'capybara/rails'
require_relative 'support'
include TestSupport

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end
