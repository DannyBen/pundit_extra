#\ --port 3000 --host 0.0.0.0

require 'rubygems'
require 'bundler'

Bundler.require :default, :development

Combustion.initialize! :all
run Combustion::Application
