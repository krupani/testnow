class AndroidChrome

	@private
	def android_chrome_config
		@client = Selenium::WebDriver::Remote::Http::Default.new
    	@client.timeout = 120
    	@service = Selenium::WebDriver::Chrome::Service.new("/usr/local/bin/chromedriver")
		@service.start
	end

  	def launch_driver_android_chrome
  		self.android_chrome_config
    	caps = {'chromeOptions'=> {'androidPackage' => 'com.android.chrome'}}
    	driver = Selenium::WebDriver.for(:remote, :http_client => client, :url => service.uri, :desired_capabilities => caps)
    	driver.manage.timeouts.implicit_wait = 60
    	return driver
  	end

  	def launch_watir_android_chrome
  		self.android_chrome_config
    	caps = {'chromeOptions'=> {'androidPackage' => 'com.android.chrome'}}
    	browser = Watir::Browser.new(:remote, :url => @service.uri, :desired_capabilities => @cap, :http_client => @client)
    	browser.driver.manage.timeouts.implicit_wait = 60
    	return browser
  	end

end