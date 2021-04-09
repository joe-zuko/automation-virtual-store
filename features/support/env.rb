require "capybara"
require "capybara/cucumber"
require "os"
require "selenium-webdriver"
require "site_prism"

@browser = ENV["BROWSER"]

Capybara.configure do |config|
  case @browser
  when "chrome"
    @driver = :selenium_chrome
  when "firefox"
    @driver = :selenium
  when "chrome_headless"
    @driver = :selenium_chrome_headless
  when "firefox_headless"
    @driver = :selenium_headless
  end

  config.default_driver = @driver
  config.app_host = "https://mercador.4infoit.com.br"
  config.default_max_wait_time = 15
end
