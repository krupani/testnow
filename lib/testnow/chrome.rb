module TestNow


	# Chrome Browser
	def launch_driver_chrome
  		@driver = Selenium::WebDriver.for :chrome
  		@driver.manage.timeouts.implicit_wait = 30
  		@driver.manage.timeouts.page_load = 120
  		@driver.manage.window.maximize
  		return @driver
	end
	
end