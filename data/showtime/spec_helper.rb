require 'rspec'
require 'selenium-webdriver'
require 'rake'
require 'testnow'
require 'web-object'

include RSpec::Matchers
include TestNow

require File.dirname(__FILE__) + "/../pages/testnow_page"

RSpec.configure do |config|
  config.before(:all) do
    @driver = TestNow.init
  end

  config.after(:all) do
    @driver.quit
  end
end
