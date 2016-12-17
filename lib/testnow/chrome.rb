class Chrome

	@private
	def post_config(driver)
		driver.manage.timeouts.implicit_wait = 30
		driver.manage.timeouts.page_load = 120
		driver.manage.window.maximize
	end

	# Chrome Browser
	def launch_driver_chrome
		driver = Selenium::WebDriver.for :chrome
		self.post_config(driver)
		return driver
	end

	def launch_watir_chrome
		browser = Watir::Browser.new :chrome
		self.post_config(browser.driver)
		return browser
	end

  def launch_driver_chrome_mobile
    device_name = ENV['DEVICE'].gsub("_"," ")
    mobile_emulation = { "deviceName" => device_name }
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
        "chromeOptions" => { "mobileEmulation" => mobile_emulation })
    driver = Selenium::WebDriver.for(:chrome,
																		 :desired_capabilities => caps)
    self.post_config(driver)
    driver
	end

	def launch_watir_chrome_mobile
		device_name = ENV['DEVICE'].gsub("_"," ")
		mobile_emulation = { "deviceName" => device_name }
		caps = Selenium::WebDriver::Remote::Capabilities.chrome(
				"chromeOptions" => { "mobileEmulation" => mobile_emulation })
		driver = Watir::Browser.new(:chrome,
																:desired_capabilities => caps)
		self.post_config(driver)
		driver
	end

end