require 'spec_helper'


describe "Test TestNow" do
  it "should start chrome" do
    ENV['BROWSER']='chrome'
    driver = TestNow.init
    expect(driver).to be_an_instance_of Selenium::WebDriver::Driver
    expect(driver.inspect.to_s.downcase).to include("chrome")
    driver.quit
  end

  it "should start opera" do
    ENV['BROWSER']='opera'
    driver = TestNow.init
    expect(driver).to be_an_instance_of Selenium::WebDriver::Driver
    expect(driver.inspect.to_s.downcase).to include("chrome")
    driver.quit
  end

  it "should start firefox when BROWSER is set" do
    ENV['BROWSER']='firefox'
    driver = TestNow.init
    expect(driver).to be_an_instance_of Selenium::WebDriver::Driver
    expect(driver.inspect.to_s.downcase).to include("firefox")
    driver.quit
  end

  it "should start firefox as default when BROWSER is not set" do
    driver = TestNow.init
    expect(driver).to be_an_instance_of Selenium::WebDriver::Driver
    expect(driver.inspect.to_s.downcase).to include("firefox")
    driver.quit
  end

  it "should start firefox with UPA config when HAR_DIR is set" do
    ENV['HAR_DIR']="/Users/KaushalRupani/Downloads/"
    ENV['IS_UPA']="true"
    `rm -f $HAR_DIR*.har`
    driver = TestNow.init
    expect(driver).to be_an_instance_of Selenium::WebDriver::Driver
    expect(driver.inspect.to_s.downcase).to include("firefox")
    sleep(5)
    driver.get("http://google.com")
    expect(`ls $HAR_DIR*.har`).to_not be_nil
    driver.quit
  end
end