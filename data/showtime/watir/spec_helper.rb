require 'rspec'
require 'selenium-webdriver'
require 'rake'
require 'testnow'
require 'watir-webdriver'
require 'web-object'

include RSpec::Matchers
include TestNow::Watir

require File.dirname(__FILE__) + "/../pages/testnow_page"

RSpec.configure do |config|
  config.before(:all) do
    @browser = TestNow.init
  end

  config.after(:all) do
    @browser.quit
  end
end
