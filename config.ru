# This file is used by Rack-based servers to start the application.
# require "rack-timeout"
# use Rack::Timeout
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
