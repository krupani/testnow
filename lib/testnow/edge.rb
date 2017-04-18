class MicrosoftEdge

  @private
  def pre_config
    @client = Selenium::WebDriver::Remote::Http::Default.new
    @client.read_timeout = 120
    @caps = Selenium::WebDriver::Remote::Capabilities.edge(:native_events => false,
                                                           :acceptSslCerts => true)
  end

  @private
  def post_config(driver)
    driver.manage.timeouts.implicit_wait = 30
    driver.manage.timeouts.page_load = 120
  end

  def launch_driver_edge
    self.pre_config
    driver = Selenium::WebDriver.for(:edge,
                                      :desired_capabilities => @caps,
                                      :http_client => @client)
    self.post_config(driver)
    return driver
  end

  def launch_watir_edge
    self.pre_config
    browser = Watir::Browser.new(:edge,
                                 :desired_capabilities => @caps,
                                 :http_client => @client)
    self.post_config(browser.driver)
    return browser
  end

end