require 'rspec'
require 'selenium-webdriver'
require 'rake'
require 'testnow'
require 'watir-webdriver'

include RSpec::Matchers
include TestNow::Watir

require File.dirname(__FILE__) + "/../pages/github_page"

RSpec.configure do |config|
  config.before(:all) do
    ENV['TEST_URL'] = "https://github.com" if ENV['TEST_URL'].nil?
    @browser = TestNow.init
  end

  config.after(:all) do
    @browser.quit
  end
end
