require 'rspec'
require 'selenium-webdriver'
require 'rake'
require 'testnow'

include RSpec::Matchers
include TestNow

require File.dirname(__FILE__) + "/../pages/github_page"

RSpec.configure do |config|
  config.before(:all) do
    ENV['TEST_URL'] = "https://github.com" if ENV['TEST_URL'].nil?
    @driver = TestNow.init
  end

  config.after(:all) do
    @driver.quit
  end
end
