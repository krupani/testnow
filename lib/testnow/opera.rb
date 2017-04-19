class Opera

	@private
	def pre_config
		@client = Selenium::WebDriver::Remote::Http::Default.new
		@client.read_timeout = 180 # seconds
		@service = Selenium::WebDriver::Chrome::Service.new("/usr/local/bin/operadriver", 48923, {})
		@service.start
		@cap = Selenium::WebDriver::Remote::Capabilities.chrome('operaOptions' => {'binary' => "#{get_binary_path}", 'args' => ["--ignore-certificate-errors"]})
	end

  @private
  def post_config(driver)
		driver.manage.timeouts.implicit_wait = 30
		driver.manage.window.maximize
		driver.manage.timeouts.page_load = 120
	end

	# Opera browser
	def launch_driver_opera
		self.pre_config
		driver = Selenium::WebDriver.for(:remote, :url => @service.uri, :desired_capabilities => @cap, :http_client => @client)
		self.post_config(driver)
		return driver
	end

	# Opera browser
	def launch_watir_opera
		self.pre_config
		browser = Watir::Browser.new(:remote, :url => @service.uri, :desired_capabilities => @cap, :http_client => @client)
		self.post_config(browser.driver)
		return browser
	end

	@private
	def get_binary_path
		case RUBY_PLATFORM
			when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
				return "NEED TO FIND WINDOWS BINARY LOCATION"
			when /darwin|mac os/
				return "/Applications/Opera.app/Contents/MacOS/Opera"
			else
				return "/usr/bin/opera"
		end
	end
end