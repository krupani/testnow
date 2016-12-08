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

end