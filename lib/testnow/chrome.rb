class Chrome

	@private
	def post_chrome_config(driver)
		driver.manage.timeouts.implicit_wait = 30
		driver.manage.timeouts.page_load = 120
		driver.manage.window.maximize
	end

	# Chrome Browser
	def launch_driver_chrome
		driver = Selenium::WebDriver.for :chrome
		self.post_chrome_config(driver)
		return driver
	end

	def launch_watir_chrome
		browser = Watir::Browser.new :chrome
		self.post_chrome_config(browser.driver)
		return browser
	end

	def launch_capybara_chrome
		Capybara.default_driver = :selenium
  		Capybara.register_driver :chrome do |app|
    		Capybara::Selenium::Driver.new(app, :browser => :chrome)
  		end
  		Capybara.current_driver = :chrome
  		Capybara.default_selector = :css
  		Capybara.default_max_wait_time = 10
	end

end