class IE

  @private
  def ie_config
    @client = Selenium::WebDriver::Remote::Http::Default.new
    @client.read_timeout = 120
    @caps = Selenium::WebDriver::Remote::Capabilities.ie('ie.ensureCleanSession' => true,
                                                         :javascript_enabled => true,
                                                         :http_client => @client,
                                                         :native_events => false,
                                                         :acceptSslCerts => true)
  end

  @private
  def set_ie_config(driver)
    driver.manage.timeouts.implicit_wait = 90
    driver.manage.timeouts.page_load = 120
    if ENV['RESOLUTION'].nil?
      driver.manage.window.size = Selenium::WebDriver::Dimension.new(1366,768)
    elsif ENV['RESOLUTION'].downcase == "max"
      driver.manage.window.maximize
    else
      res = ENV['RESOLUTION'].split('x')
      driver.manage.window.size = Selenium::WebDriver::Dimension.new(res.first.to_i, res.last.to_i)
    end
  end

  def launch_driver_ie
    self.ie_config
    driver = Selenium::WebDriver.for(:ie,
                                     :desired_capabilities => @caps,
                                     :http_client => @client)
    self.set_ie_config(driver)
    return driver
  end

  def launch_watir_ie
    self.ie_config
    browser = Watir::Browser.new(:ie,
                                 :desired_capabilities => @caps,
                                 :http_client => @client)
    self.set_ie_config(browser.driver)
    return browser
  end

end