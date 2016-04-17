module TestNow

  def launch_driver_ie
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 120
    caps = Selenium::WebDriver::Remote::Capabilities.ie('ie.ensureCleanSession' => true, :javascript_enabled => true, :http_client => client,  :native_events => false, :acceptSslCerts => true)
    @driver = Selenium::WebDriver.for(:ie, :desired_capabilities => caps)
    @driver.manage.timeouts.implicit_wait = 90
    @driver.manage.timeouts.page_load = 120
    if ENV['RESOLUTION'].nil?
      @driver.manage.window.size = Selenium::WebDriver::Dimension.new(1366,768)
    elsif ENV['RESOLUTION'].downcase == "max"
      @driver.manage.window.maximize
    else
      res = ENV['RESOLUTION'].split('x')
      @driver.manage.window.size = Selenium::WebDriver::Dimension.new(res.first.to_i, res.last.to_i)
    end
    @driver
  end

end