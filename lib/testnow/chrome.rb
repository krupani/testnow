class Chrome

	# Chrome Browser
	def launch_driver_chrome
  		@driver = Selenium::WebDriver.for :chrome
  		@driver.manage.timeouts.implicit_wait = 30
  		@driver.manage.timeouts.page_load = 120
  		@driver.manage.window.maximize
  		return @driver
	end

	def launch_watir_chrome
		browser = Watir::Browser.new :chrome
		browser.driver.manage.timeouts.implicit_wait = 30
  		browser.driver.manage.timeouts.page_load = 120
  		browser.driver.manage.window.maximize
  		return browser
	end
	
end