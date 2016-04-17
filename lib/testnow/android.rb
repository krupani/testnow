module TestNow

  def launch_driver_android
    @driver = Selenium::WebDriver.for :remote, :desired_capabilities => :android
    @driver
  end

end