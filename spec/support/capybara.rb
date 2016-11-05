require "capybara/poltergeist"

Capybara.asset_host = "http://localhost:3000" unless ENV["CI"]

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new app, js_errors: true
end

Capybara.javascript_driver = :poltergeist
