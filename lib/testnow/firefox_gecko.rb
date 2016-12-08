class FirefoxGecko

	@private
	def pre_config
		caps = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: true)
		caps
	end

	@private
	def post_config(driver)
		driver.manage.timeouts.implicit_wait = 10
  		driver.manage.timeouts.page_load = 15
  		driver.manage.window.maximize
  	end

	# Firefox Gecko Browser
	def launch_driver_firefox_gecko
		caps = self.pre_config
  		driver = Selenium::WebDriver.for(:firefox, :desired_capabilities => caps)
  		self.post_config(driver)
  		driver
	end

	def launch_watir_firefox_gecko
		caps = self.pre_config
  		browser = Watir::Browser.new(:firefox, :desired_capabilities => caps)
  		self.post_config(browser.driver)
  		browser
	end

end