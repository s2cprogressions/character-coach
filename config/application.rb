require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Progressions
  class Application < Rails::Application
    config.app_generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
      g.performance_tool :rspec
      g.javascript_engine :js
    end
  end
end
