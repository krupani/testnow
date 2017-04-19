class PhantomJS

  @private
  def post_config(driver)
    driver.manage.timeouts.implicit_wait = 30
    driver.manage.timeouts.page_load = 120
    driver.manage.window.maximize
  end

  def launch_driver_phantomjs
    driver = Selenium::WebDriver.for :phantomjs
    self.post_config(driver)
    return driver
  end

  def launch_watir_phantomjs
    browser = Watir::Browser.new :chrome
    self.post_config(browser.driver)
    return browser
  end

end