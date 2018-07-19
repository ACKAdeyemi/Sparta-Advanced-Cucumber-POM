require 'capybara/cucumber'
require 'rspec'
require_relative '../lib/bbc_site.rb'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
  # config.ignore_hidden_elements = false #ensure all hidden elements on the page are available
  config.default_max_wait_time = 10 #Wait time for asynchronous processes to finish
  config.match = :prefer_exact # this setting is to ensure Capybara has specific matching rather than fuzzy logic
  config.default_driver = :chrome #ensure the default driver is chrome
end
